/*******************************************************************************
* File Name: LEDstrip.h  
* Version 2.20
*
* Description:
*  This file contains Pin function prototypes and register defines
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_LEDstrip_H) /* Pins LEDstrip_H */
#define CY_PINS_LEDstrip_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "LEDstrip_aliases.h"

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 LEDstrip__PORT == 15 && ((LEDstrip__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

/**
* \addtogroup group_general
* @{
*/
void    LEDstrip_Write(uint8 value);
void    LEDstrip_SetDriveMode(uint8 mode);
uint8   LEDstrip_ReadDataReg(void);
uint8   LEDstrip_Read(void);
void    LEDstrip_SetInterruptMode(uint16 position, uint16 mode);
uint8   LEDstrip_ClearInterrupt(void);
/** @} general */

/***************************************
*           API Constants        
***************************************/
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup driveMode Drive mode constants
     * \brief Constants to be passed as "mode" parameter in the LEDstrip_SetDriveMode() function.
     *  @{
     */
        #define LEDstrip_DM_ALG_HIZ         PIN_DM_ALG_HIZ
        #define LEDstrip_DM_DIG_HIZ         PIN_DM_DIG_HIZ
        #define LEDstrip_DM_RES_UP          PIN_DM_RES_UP
        #define LEDstrip_DM_RES_DWN         PIN_DM_RES_DWN
        #define LEDstrip_DM_OD_LO           PIN_DM_OD_LO
        #define LEDstrip_DM_OD_HI           PIN_DM_OD_HI
        #define LEDstrip_DM_STRONG          PIN_DM_STRONG
        #define LEDstrip_DM_RES_UPDWN       PIN_DM_RES_UPDWN
    /** @} driveMode */
/** @} group_constants */
    
/* Digital Port Constants */
#define LEDstrip_MASK               LEDstrip__MASK
#define LEDstrip_SHIFT              LEDstrip__SHIFT
#define LEDstrip_WIDTH              8u

/* Interrupt constants */
#if defined(LEDstrip__INTSTAT)
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup intrMode Interrupt constants
     * \brief Constants to be passed as "mode" parameter in LEDstrip_SetInterruptMode() function.
     *  @{
     */
        #define LEDstrip_INTR_NONE      (uint16)(0x0000u)
        #define LEDstrip_INTR_RISING    (uint16)(0x0001u)
        #define LEDstrip_INTR_FALLING   (uint16)(0x0002u)
        #define LEDstrip_INTR_BOTH      (uint16)(0x0003u) 
    /** @} intrMode */
/** @} group_constants */

    #define LEDstrip_INTR_MASK      (0x01u) 
#endif /* (LEDstrip__INTSTAT) */


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define LEDstrip_PS                     (* (reg8 *) LEDstrip__PS)
/* Data Register */
#define LEDstrip_DR                     (* (reg8 *) LEDstrip__DR)
/* Port Number */
#define LEDstrip_PRT_NUM                (* (reg8 *) LEDstrip__PRT) 
/* Connect to Analog Globals */                                                  
#define LEDstrip_AG                     (* (reg8 *) LEDstrip__AG)                       
/* Analog MUX bux enable */
#define LEDstrip_AMUX                   (* (reg8 *) LEDstrip__AMUX) 
/* Bidirectional Enable */                                                        
#define LEDstrip_BIE                    (* (reg8 *) LEDstrip__BIE)
/* Bit-mask for Aliased Register Access */
#define LEDstrip_BIT_MASK               (* (reg8 *) LEDstrip__BIT_MASK)
/* Bypass Enable */
#define LEDstrip_BYP                    (* (reg8 *) LEDstrip__BYP)
/* Port wide control signals */                                                   
#define LEDstrip_CTL                    (* (reg8 *) LEDstrip__CTL)
/* Drive Modes */
#define LEDstrip_DM0                    (* (reg8 *) LEDstrip__DM0) 
#define LEDstrip_DM1                    (* (reg8 *) LEDstrip__DM1)
#define LEDstrip_DM2                    (* (reg8 *) LEDstrip__DM2) 
/* Input Buffer Disable Override */
#define LEDstrip_INP_DIS                (* (reg8 *) LEDstrip__INP_DIS)
/* LCD Common or Segment Drive */
#define LEDstrip_LCD_COM_SEG            (* (reg8 *) LEDstrip__LCD_COM_SEG)
/* Enable Segment LCD */
#define LEDstrip_LCD_EN                 (* (reg8 *) LEDstrip__LCD_EN)
/* Slew Rate Control */
#define LEDstrip_SLW                    (* (reg8 *) LEDstrip__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define LEDstrip_PRTDSI__CAPS_SEL       (* (reg8 *) LEDstrip__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define LEDstrip_PRTDSI__DBL_SYNC_IN    (* (reg8 *) LEDstrip__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define LEDstrip_PRTDSI__OE_SEL0        (* (reg8 *) LEDstrip__PRTDSI__OE_SEL0) 
#define LEDstrip_PRTDSI__OE_SEL1        (* (reg8 *) LEDstrip__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define LEDstrip_PRTDSI__OUT_SEL0       (* (reg8 *) LEDstrip__PRTDSI__OUT_SEL0) 
#define LEDstrip_PRTDSI__OUT_SEL1       (* (reg8 *) LEDstrip__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define LEDstrip_PRTDSI__SYNC_OUT       (* (reg8 *) LEDstrip__PRTDSI__SYNC_OUT) 

/* SIO registers */
#if defined(LEDstrip__SIO_CFG)
    #define LEDstrip_SIO_HYST_EN        (* (reg8 *) LEDstrip__SIO_HYST_EN)
    #define LEDstrip_SIO_REG_HIFREQ     (* (reg8 *) LEDstrip__SIO_REG_HIFREQ)
    #define LEDstrip_SIO_CFG            (* (reg8 *) LEDstrip__SIO_CFG)
    #define LEDstrip_SIO_DIFF           (* (reg8 *) LEDstrip__SIO_DIFF)
#endif /* (LEDstrip__SIO_CFG) */

/* Interrupt Registers */
#if defined(LEDstrip__INTSTAT)
    #define LEDstrip_INTSTAT            (* (reg8 *) LEDstrip__INTSTAT)
    #define LEDstrip_SNAP               (* (reg8 *) LEDstrip__SNAP)
    
	#define LEDstrip_0_INTTYPE_REG 		(* (reg8 *) LEDstrip__0__INTTYPE)
	#define LEDstrip_1_INTTYPE_REG 		(* (reg8 *) LEDstrip__1__INTTYPE)
	#define LEDstrip_2_INTTYPE_REG 		(* (reg8 *) LEDstrip__2__INTTYPE)
	#define LEDstrip_3_INTTYPE_REG 		(* (reg8 *) LEDstrip__3__INTTYPE)
	#define LEDstrip_4_INTTYPE_REG 		(* (reg8 *) LEDstrip__4__INTTYPE)
	#define LEDstrip_5_INTTYPE_REG 		(* (reg8 *) LEDstrip__5__INTTYPE)
	#define LEDstrip_6_INTTYPE_REG 		(* (reg8 *) LEDstrip__6__INTTYPE)
	#define LEDstrip_7_INTTYPE_REG 		(* (reg8 *) LEDstrip__7__INTTYPE)
#endif /* (LEDstrip__INTSTAT) */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_LEDstrip_H */


/* [] END OF FILE */
