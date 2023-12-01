/*******************************************************************************
* File Name: OUT_PINS.h  
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

#if !defined(CY_PINS_OUT_PINS_H) /* Pins OUT_PINS_H */
#define CY_PINS_OUT_PINS_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "OUT_PINS_aliases.h"

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 OUT_PINS__PORT == 15 && ((OUT_PINS__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

/**
* \addtogroup group_general
* @{
*/
void    OUT_PINS_Write(uint8 value);
void    OUT_PINS_SetDriveMode(uint8 mode);
uint8   OUT_PINS_ReadDataReg(void);
uint8   OUT_PINS_Read(void);
void    OUT_PINS_SetInterruptMode(uint16 position, uint16 mode);
uint8   OUT_PINS_ClearInterrupt(void);
/** @} general */

/***************************************
*           API Constants        
***************************************/
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup driveMode Drive mode constants
     * \brief Constants to be passed as "mode" parameter in the OUT_PINS_SetDriveMode() function.
     *  @{
     */
        #define OUT_PINS_DM_ALG_HIZ         PIN_DM_ALG_HIZ
        #define OUT_PINS_DM_DIG_HIZ         PIN_DM_DIG_HIZ
        #define OUT_PINS_DM_RES_UP          PIN_DM_RES_UP
        #define OUT_PINS_DM_RES_DWN         PIN_DM_RES_DWN
        #define OUT_PINS_DM_OD_LO           PIN_DM_OD_LO
        #define OUT_PINS_DM_OD_HI           PIN_DM_OD_HI
        #define OUT_PINS_DM_STRONG          PIN_DM_STRONG
        #define OUT_PINS_DM_RES_UPDWN       PIN_DM_RES_UPDWN
    /** @} driveMode */
/** @} group_constants */
    
/* Digital Port Constants */
#define OUT_PINS_MASK               OUT_PINS__MASK
#define OUT_PINS_SHIFT              OUT_PINS__SHIFT
#define OUT_PINS_WIDTH              8u

/* Interrupt constants */
#if defined(OUT_PINS__INTSTAT)
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup intrMode Interrupt constants
     * \brief Constants to be passed as "mode" parameter in OUT_PINS_SetInterruptMode() function.
     *  @{
     */
        #define OUT_PINS_INTR_NONE      (uint16)(0x0000u)
        #define OUT_PINS_INTR_RISING    (uint16)(0x0001u)
        #define OUT_PINS_INTR_FALLING   (uint16)(0x0002u)
        #define OUT_PINS_INTR_BOTH      (uint16)(0x0003u) 
    /** @} intrMode */
/** @} group_constants */

    #define OUT_PINS_INTR_MASK      (0x01u) 
#endif /* (OUT_PINS__INTSTAT) */


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define OUT_PINS_PS                     (* (reg8 *) OUT_PINS__PS)
/* Data Register */
#define OUT_PINS_DR                     (* (reg8 *) OUT_PINS__DR)
/* Port Number */
#define OUT_PINS_PRT_NUM                (* (reg8 *) OUT_PINS__PRT) 
/* Connect to Analog Globals */                                                  
#define OUT_PINS_AG                     (* (reg8 *) OUT_PINS__AG)                       
/* Analog MUX bux enable */
#define OUT_PINS_AMUX                   (* (reg8 *) OUT_PINS__AMUX) 
/* Bidirectional Enable */                                                        
#define OUT_PINS_BIE                    (* (reg8 *) OUT_PINS__BIE)
/* Bit-mask for Aliased Register Access */
#define OUT_PINS_BIT_MASK               (* (reg8 *) OUT_PINS__BIT_MASK)
/* Bypass Enable */
#define OUT_PINS_BYP                    (* (reg8 *) OUT_PINS__BYP)
/* Port wide control signals */                                                   
#define OUT_PINS_CTL                    (* (reg8 *) OUT_PINS__CTL)
/* Drive Modes */
#define OUT_PINS_DM0                    (* (reg8 *) OUT_PINS__DM0) 
#define OUT_PINS_DM1                    (* (reg8 *) OUT_PINS__DM1)
#define OUT_PINS_DM2                    (* (reg8 *) OUT_PINS__DM2) 
/* Input Buffer Disable Override */
#define OUT_PINS_INP_DIS                (* (reg8 *) OUT_PINS__INP_DIS)
/* LCD Common or Segment Drive */
#define OUT_PINS_LCD_COM_SEG            (* (reg8 *) OUT_PINS__LCD_COM_SEG)
/* Enable Segment LCD */
#define OUT_PINS_LCD_EN                 (* (reg8 *) OUT_PINS__LCD_EN)
/* Slew Rate Control */
#define OUT_PINS_SLW                    (* (reg8 *) OUT_PINS__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define OUT_PINS_PRTDSI__CAPS_SEL       (* (reg8 *) OUT_PINS__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define OUT_PINS_PRTDSI__DBL_SYNC_IN    (* (reg8 *) OUT_PINS__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define OUT_PINS_PRTDSI__OE_SEL0        (* (reg8 *) OUT_PINS__PRTDSI__OE_SEL0) 
#define OUT_PINS_PRTDSI__OE_SEL1        (* (reg8 *) OUT_PINS__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define OUT_PINS_PRTDSI__OUT_SEL0       (* (reg8 *) OUT_PINS__PRTDSI__OUT_SEL0) 
#define OUT_PINS_PRTDSI__OUT_SEL1       (* (reg8 *) OUT_PINS__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define OUT_PINS_PRTDSI__SYNC_OUT       (* (reg8 *) OUT_PINS__PRTDSI__SYNC_OUT) 

/* SIO registers */
#if defined(OUT_PINS__SIO_CFG)
    #define OUT_PINS_SIO_HYST_EN        (* (reg8 *) OUT_PINS__SIO_HYST_EN)
    #define OUT_PINS_SIO_REG_HIFREQ     (* (reg8 *) OUT_PINS__SIO_REG_HIFREQ)
    #define OUT_PINS_SIO_CFG            (* (reg8 *) OUT_PINS__SIO_CFG)
    #define OUT_PINS_SIO_DIFF           (* (reg8 *) OUT_PINS__SIO_DIFF)
#endif /* (OUT_PINS__SIO_CFG) */

/* Interrupt Registers */
#if defined(OUT_PINS__INTSTAT)
    #define OUT_PINS_INTSTAT            (* (reg8 *) OUT_PINS__INTSTAT)
    #define OUT_PINS_SNAP               (* (reg8 *) OUT_PINS__SNAP)
    
	#define OUT_PINS_0_INTTYPE_REG 		(* (reg8 *) OUT_PINS__0__INTTYPE)
	#define OUT_PINS_1_INTTYPE_REG 		(* (reg8 *) OUT_PINS__1__INTTYPE)
	#define OUT_PINS_2_INTTYPE_REG 		(* (reg8 *) OUT_PINS__2__INTTYPE)
	#define OUT_PINS_3_INTTYPE_REG 		(* (reg8 *) OUT_PINS__3__INTTYPE)
	#define OUT_PINS_4_INTTYPE_REG 		(* (reg8 *) OUT_PINS__4__INTTYPE)
	#define OUT_PINS_5_INTTYPE_REG 		(* (reg8 *) OUT_PINS__5__INTTYPE)
	#define OUT_PINS_6_INTTYPE_REG 		(* (reg8 *) OUT_PINS__6__INTTYPE)
	#define OUT_PINS_7_INTTYPE_REG 		(* (reg8 *) OUT_PINS__7__INTTYPE)
#endif /* (OUT_PINS__INTSTAT) */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_OUT_PINS_H */


/* [] END OF FILE */
