/* vi: set sw=4 ts=4 expandtab: */
#include <misc.h>
#include <stm32f10x.h>
#include <stm32f10x_exti.h>
#include <stm32f10x_gpio.h>
#include <stm32f10x_rcc.h>
#include <stm32f10x_usart.h>
#include <stm32f10x_adc.h>
#include <lcd.h>
#include <Touch.h>
#include <stdio.h>
#include <stdlib.h>
uint16_t pos_x,pos_y;
uint16_t pix_x,pix_y;
uint16_t jodo;

int button_pos[4][2];
int button[] = {0, 0, 0, 0};

// flash load C:\Users\USER\Desktop\week10\Debug\week10.axf

void delay(int i){
	int j;
	for(j=0; j<=i * 100000; j++);
}
void SysInit(void)
{
	/* Reset the RCC clock configuration to the default reset state(for debug purpose) */
	/* Set HSION bit */
	RCC->CR |= (uint32_t)0x00000001;

	/* Reset SW, HPRE, PPRE1, PPRE2, ADCPRE and MCO bits */
	RCC->CFGR &= (uint32_t)0xF0FF0000;

	/* Reset HSEON, CSSON and PLLON bits */
	RCC->CR &= (uint32_t)0xFEF6FFFF;

	/* Reset HSEBYP bit */
	RCC->CR &= (uint32_t)0xFFFBFFFF;

	/* Reset PLLSRC, PLLXTPRE, PLLMUL and USBPRE/OTGFSPRE bits */
	RCC->CFGR &= (uint32_t)0xFF80FFFF;

	/* Reset PLL2ON and PLL3ON bits */
	RCC->CR &= (uint32_t)0xEBFFFFFF;

	/* Disable all interrupts and clear pending bits  */
	RCC->CIR = 0x00FF0000;

	/* Reset CFGR2 register */
	RCC->CFGR2 = 0x00000000;
}

void SetSysClock(void)
{
	volatile uint32_t StartUpCounter = 0, HSEStatus = 0;

	/* SYSCLK, HCLK, PCLK2 and PCLK1 configuration ---------------------------*/
	/* Enable HSE */
	RCC->CR |= ((uint32_t)RCC_CR_HSEON);

	/* Wait till HSE is ready and if Time out is reached exit */
	do
	{
		HSEStatus = RCC->CR & RCC_CR_HSERDY;
		StartUpCounter++;
	} while((HSEStatus == 0) && (StartUpCounter != HSE_STARTUP_TIMEOUT));

	if ((RCC->CR & RCC_CR_HSERDY) != RESET)
	{
		HSEStatus = (uint32_t)0x01;
	}
	else
	{
		HSEStatus = (uint32_t)0x00;
	}

	if (HSEStatus == (uint32_t)0x01)
	{
		/* Enable Prefetch Buffer */
		FLASH->ACR |= FLASH_ACR_PRFTBE;

		/* Flash 0 wait state */
		FLASH->ACR &= (uint32_t)((uint32_t)~FLASH_ACR_LATENCY);
		FLASH->ACR |= (uint32_t)FLASH_ACR_LATENCY_0;

		/* HCLK = SYSCLK = 48MHz */
		RCC->CFGR |= (uint32_t)RCC_CFGR_HPRE_DIV1;

		/* PCLK2 = HCLK = 48MHz */
		RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE2_DIV1;

		/* PCLK1 = HCLK  = 24MHz  */
		RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE1_DIV1;

		/* Configure PLLs ------------------------------------------------------*/
		/* PLL configuration: PLLCLK = PREDIV1 * 6 = 48MHz */
		RCC->CFGR &= (uint32_t)~(RCC_CFGR_PLLXTPRE | RCC_CFGR_PLLSRC | RCC_CFGR_PLLMULL);
		RCC->CFGR |= (uint32_t)(RCC_CFGR_PLLXTPRE_PREDIV1 | RCC_CFGR_PLLSRC_PREDIV1 |
				RCC_CFGR_PLLMULL6);

		/* PLL2 configuration: PLL2CLK = HSE/5 * 8 = 40MHz  */
		/* PREDIV1 configuration: PREDIV1CLK = PLL2 / 5 = 8MHz */
		RCC->CFGR2 &= (uint32_t)~(RCC_CFGR2_PREDIV2 | RCC_CFGR2_PLL2MUL |
				RCC_CFGR2_PREDIV1 | RCC_CFGR2_PREDIV1SRC);
		RCC->CFGR2 |= (uint32_t)(RCC_CFGR2_PREDIV2_DIV5 | RCC_CFGR2_PLL2MUL8 |
				RCC_CFGR2_PREDIV1SRC_PLL2 | RCC_CFGR2_PREDIV1_DIV5);

		/* Enable PLL2 */
		RCC->CR |= RCC_CR_PLL2ON;
		/* Wait till PLL2 is ready */
		while((RCC->CR & RCC_CR_PLL2RDY) == 0)
		{
		}

		/* Enable PLL */
		RCC->CR |= RCC_CR_PLLON;

		/* Wait till PLL is ready */
		while((RCC->CR & RCC_CR_PLLRDY) == 0)
		{
		}

		/* Select PLL as system clock source */
		RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
		RCC->CFGR |= (uint32_t)RCC_CFGR_SW_PLL;

		/* Wait till PLL is used as system clock source */
		while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS) != (uint32_t)0x08)
		{
		}
	}
	else
	{ /* If HSE fails to start-up, the application will have wrong clock
         configuration. User can add here some code to deal with this error */
	}
}

void set_ENABLE(void) {
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);	 // interrupt
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOE,ENABLE);     // RCC GPIO E
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC,ENABLE);     // RCC GPIO C
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD,ENABLE);     // RCC GPIO D
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);	 // ADC1
}

void set_PC1(void) {
	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AIN;
	GPIO_Init(GPIOC, &GPIO_InitStructure);
}

void set_ADC(void) {
	ADC_InitTypeDef ADC_InitStructure;
	ADC_DeInit(ADC1);
	ADC_InitStructure.ADC_Mode = ADC_Mode_Independent;
	ADC_InitStructure.ADC_ScanConvMode = ENABLE;
	ADC_InitStructure.ADC_ContinuousConvMode = ENABLE;
	ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_None;
	ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
	ADC_InitStructure.ADC_NbrOfChannel = 1;
	ADC_RegularChannelConfig(ADC1, ADC_Channel_11, 1, ADC_SampleTime_239Cycles5);
	ADC_Init(ADC1, &ADC_InitStructure);
}

void set_NVIC(void) {
	NVIC_InitTypeDef NVIC_InitStructure;
	NVIC_InitStructure.NVIC_IRQChannel = ADC1_2_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);
	ADC_ITConfig(ADC1, ADC_IT_EOC, ENABLE);
	ADC_Cmd(ADC1, ENABLE);
}

void ADC_start(void) {
	ADC_ResetCalibration(ADC1);
	while(ADC_GetResetCalibrationStatus(ADC1));
	ADC_StartCalibration(ADC1);
	while(ADC_GetCalibrationStatus(ADC1));
	ADC_SoftwareStartConvCmd(ADC1, ENABLE);
}


void ADC1_2_IRQHandler(void) {
	uint16_t input;
	u8 str[10];
	double result;
//
////	while(ADC_GetFlagStatus(ADC1, 0x2)==RESET);
	input = ADC_GetConversionValue(ADC1);
	result = (double)input;
	jodo = result;
	ADC_ClearITPendingBit(ADC1,ADC_IT_EOC);
	//	LCD_DrawRectangle(pix_x, pix_y, pix_x+10, pix_y+10);
}

int main() {
	int rSize = 15;
	int i;
	unsigned int i2BS[] = { GPIO_BSRR_BS2, GPIO_BSRR_BS3, GPIO_BSRR_BS4,
			GPIO_BSRR_BS7 };
	unsigned int off[] = { GPIO_BRR_BR2, GPIO_BRR_BR3, GPIO_BRR_BR4,
			GPIO_BRR_BR7 };
	char str[10];
	int prevCircleX = -1, prevCircleY = -1;

	SystemInit();
	set_ENABLE();
	set_PC1();
	set_ADC();
	set_NVIC();
	LCD_Init();
	Touch_Configuration();
	Touch_Adjust();
	LCD_Clear(WHITE);
	ADC_start();
	GPIOD->CRL = (GPIO_CRL_MODE2_0 | GPIO_CRL_MODE3_0 | GPIO_CRL_MODE4_0 | GPIO_CRL_MODE7_0);

	while (1) {
		LCD_ShowString(1, 1, "Wed_team07", BLACK, WHITE);
		LCD_ShowNum(200, 1, jodo, 4, BLACK, WHITE);
//		if(!T_INT)

		Touch_GetXY(&pos_x, &pos_y, 0);
		///

		for (i = 0; i <= 3; i++) {
			button_pos[i][0] = 60 * i + 30;
			button_pos[i][1] = 280;
			LCD_DrawRectangle(60 * i + 30 - rSize, 280 - rSize,
					60 * i + 30 + rSize, 280 + rSize);
		}

		Convert_Pos(pos_x, pos_y, &pix_x, &pix_y);

		for (i = 0; i <= 3; i++) {
			if (button_pos[i][0] - rSize <= pix_x
					&& pix_x <= button_pos[i][0] + rSize
					&& button_pos[i][1] - rSize <= pix_y
					&& pix_y <= button_pos[i][1] + rSize) {
				// i
				button[i] = (button[i] + 1) % 2;
				if (button[i])
					GPIOD->BSRR = i2BS[i];
//					GPIO_SetBits()
				else {
					GPIOD->BRR = i2BS[i];
					//				GPIOD->BRR = off[i];
				}
			}
		}

		if(T_INT == 0)
		{
			if (prevCircleX != -1 && prevCircleY != -1) {
				LCD_Clear(WHITE);
//				LCD_Fill(prevCircleX - 10, prevCircleY - 10, prevCircleY + 10,
//						prevCircleY + 10, WHITE);
			}
			Draw_Circle(pix_x, pix_y, 10);
			prevCircleX = pix_x;
			prevCircleY = pix_y;

			sprintf(str, "%d, %d", pix_x, pix_y);
			LCD_ShowString(100, 2, str, BLACK, WHITE);
			delay(1);

		}

	}

}

// flash load C:\Users\USER\Desktop\week10\Debug\week10.axf
