/*******************************************************************************
* File Name: OUT_PINS.h  
* Version 2.20
*
* Description:
*  This file contains the Alias definitions for Per-Pin APIs in cypins.h. 
*  Information on using these APIs can be found in the System Reference Guide.
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_OUT_PINS_ALIASES_H) /* Pins OUT_PINS_ALIASES_H */
#define CY_PINS_OUT_PINS_ALIASES_H

#include "cytypes.h"
#include "cyfitter.h"


/***************************************
*              Constants        
***************************************/
#define OUT_PINS_0			(OUT_PINS__0__PC)
#define OUT_PINS_0_INTR	((uint16)((uint16)0x0001u << OUT_PINS__0__SHIFT))

#define OUT_PINS_1			(OUT_PINS__1__PC)
#define OUT_PINS_1_INTR	((uint16)((uint16)0x0001u << OUT_PINS__1__SHIFT))

#define OUT_PINS_2			(OUT_PINS__2__PC)
#define OUT_PINS_2_INTR	((uint16)((uint16)0x0001u << OUT_PINS__2__SHIFT))

#define OUT_PINS_3			(OUT_PINS__3__PC)
#define OUT_PINS_3_INTR	((uint16)((uint16)0x0001u << OUT_PINS__3__SHIFT))

#define OUT_PINS_4			(OUT_PINS__4__PC)
#define OUT_PINS_4_INTR	((uint16)((uint16)0x0001u << OUT_PINS__4__SHIFT))

#define OUT_PINS_5			(OUT_PINS__5__PC)
#define OUT_PINS_5_INTR	((uint16)((uint16)0x0001u << OUT_PINS__5__SHIFT))

#define OUT_PINS_6			(OUT_PINS__6__PC)
#define OUT_PINS_6_INTR	((uint16)((uint16)0x0001u << OUT_PINS__6__SHIFT))

#define OUT_PINS_7			(OUT_PINS__7__PC)
#define OUT_PINS_7_INTR	((uint16)((uint16)0x0001u << OUT_PINS__7__SHIFT))

#define OUT_PINS_INTR_ALL	 ((uint16)(OUT_PINS_0_INTR| OUT_PINS_1_INTR| OUT_PINS_2_INTR| OUT_PINS_3_INTR| OUT_PINS_4_INTR| OUT_PINS_5_INTR| OUT_PINS_6_INTR| OUT_PINS_7_INTR))

#endif /* End Pins OUT_PINS_ALIASES_H */


/* [] END OF FILE */
