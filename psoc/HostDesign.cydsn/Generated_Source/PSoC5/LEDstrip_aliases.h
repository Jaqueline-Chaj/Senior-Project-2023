/*******************************************************************************
* File Name: LEDstrip.h  
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

#if !defined(CY_PINS_LEDstrip_ALIASES_H) /* Pins LEDstrip_ALIASES_H */
#define CY_PINS_LEDstrip_ALIASES_H

#include "cytypes.h"
#include "cyfitter.h"


/***************************************
*              Constants        
***************************************/
#define LEDstrip_0			(LEDstrip__0__PC)
#define LEDstrip_0_INTR	((uint16)((uint16)0x0001u << LEDstrip__0__SHIFT))

#define LEDstrip_1			(LEDstrip__1__PC)
#define LEDstrip_1_INTR	((uint16)((uint16)0x0001u << LEDstrip__1__SHIFT))

#define LEDstrip_2			(LEDstrip__2__PC)
#define LEDstrip_2_INTR	((uint16)((uint16)0x0001u << LEDstrip__2__SHIFT))

#define LEDstrip_3			(LEDstrip__3__PC)
#define LEDstrip_3_INTR	((uint16)((uint16)0x0001u << LEDstrip__3__SHIFT))

#define LEDstrip_INTR_ALL	 ((uint16)(LEDstrip_0_INTR| LEDstrip_1_INTR| LEDstrip_2_INTR| LEDstrip_3_INTR))

#endif /* End Pins LEDstrip_ALIASES_H */


/* [] END OF FILE */
