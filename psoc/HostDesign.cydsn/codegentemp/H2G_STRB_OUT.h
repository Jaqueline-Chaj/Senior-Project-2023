/*******************************************************************************
* File Name: H2G_STRB_OUT.h  
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

#if !defined(CY_PINS_H2G_STRB_OUT_H) /* Pins H2G_STRB_OUT_H */
#define CY_PINS_H2G_STRB_OUT_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "H2G_STRB_OUT_aliases.h"

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 H2G_STRB_OUT__PORT == 15 && ((H2G_STRB_OUT__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

/**
* \addtogroup group_general
* @{
*/
void    H2G_STRB_OUT_Write(uint8 value);
void    H2G_STRB_OUT_SetDriveMode(uint8 mode);
uint8   H2G_STRB_OUT_ReadDataReg(void);
uint8   H2G_STRB_OUT_Read(void);
void    H2G_STRB_OUT_SetInterruptMode(uint16 position, uint16 mode);
uint8   H2G_STRB_OUT_ClearInterrupt(void);
/** @} general */

/***************************************
*           API Constants        
***************************************/
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup driveMode Drive mode constants
     * \brief Constants to be passed as "mode" parameter in the H2G_STRB_OUT_SetDriveMode() function.
     *  @{
     */
        #define H2G_STRB_OUT_DM_ALG_HIZ         PIN_DM_ALG_HIZ
        #define H2G_STRB_OUT_DM_DIG_HIZ         PIN_DM_DIG_HIZ
        #define H2G_STRB_OUT_DM_RES_UP          PIN_DM_RES_UP
        #define H2G_STRB_OUT_DM_RES_DWN         PIN_DM_RES_DWN
        #define H2G_STRB_OUT_DM_OD_LO           PIN_DM_OD_LO
        #define H2G_STRB_OUT_DM_OD_HI           PIN_DM_OD_HI
        #define H2G_STRB_OUT_DM_STRONG          PIN_DM_STRONG
        #define H2G_STRB_OUT_DM_RES_UPDWN       PIN_DM_RES_UPDWN
    /** @} driveMode */
/** @} group_constants */
    
/* Digital Port Constants */
#define H2G_STRB_OUT_MASK               H2G_STRB_OUT__MASK
#define H2G_STRB_OUT_SHIFT              H2G_STRB_OUT__SHIFT
#define H2G_STRB_OUT_WIDTH              1u

/* Interrupt constants */
#if defined(H2G_STRB_OUT__INTSTAT)
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup intrMode Interrupt constants
     * \brief Constants to be passed as "mode" parameter in H2G_STRB_OUT_SetInterruptMode() function.
     *  @{
     */
        #define H2G_STRB_OUT_INTR_NONE      (uint16)(0x0000u)
        #define H2G_STRB_OUT_INTR_RISING    (uint16)(0x0001u)
        #define H2G_STRB_OUT_INTR_FALLING   (uint16)(0x0002u)
        #define H2G_STRB_OUT_INTR_BOTH      (uint16)(0x0003u) 
    /** @} intrMode */
/** @} group_constants */

    #define H2G_STRB_OUT_INTR_MASK      (0x01u) 
#endif /* (H2G_STRB_OUT__INTSTAT) */


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define H2G_STRB_OUT_PS                     (* (reg8 *) H2G_STRB_OUT__PS)
/* Data Register */
#define H2G_STRB_OUT_DR                     (* (reg8 *) H2G_STRB_OUT__DR)
/* Port Number */
#define H2G_STRB_OUT_PRT_NUM                (* (reg8 *) H2G_STRB_OUT__PRT) 
/* Connect to Analog Globals */                                                  
#define H2G_STRB_OUT_AG                     (* (reg8 *) H2G_STRB_OUT__AG)                       
/* Analog MUX bux enable */
#define H2G_STRB_OUT_AMUX                   (* (reg8 *) H2G_STRB_OUT__AMUX) 
/* Bidirectional Enable */                                                        
#define H2G_STRB_OUT_BIE                    (* (reg8 *) H2G_STRB_OUT__BIE)
/* Bit-mask for Aliased Register Access */
#define H2G_STRB_OUT_BIT_MASK               (* (reg8 *) H2G_STRB_OUT__BIT_MASK)
/* Bypass Enable */
#define H2G_STRB_OUT_BYP                    (* (reg8 *) H2G_STRB_OUT__BYP)
/* Port wide control signals */                                                   
#define H2G_STRB_OUT_CTL                    (* (reg8 *) H2G_STRB_OUT__CTL)
/* Drive Modes */
#define H2G_STRB_OUT_DM0                    (* (reg8 *) H2G_STRB_OUT__DM0) 
#define H2G_STRB_OUT_DM1                    (* (reg8 *) H2G_STRB_OUT__DM1)
#define H2G_STRB_OUT_DM2                    (* (reg8 *) H2G_STRB_OUT__DM2) 
/* Input Buffer Disable Override */
#define H2G_STRB_OUT_INP_DIS                (* (reg8 *) H2G_STRB_OUT__INP_DIS)
/* LCD Common or Segment Drive */
#define H2G_STRB_OUT_LCD_COM_SEG            (* (reg8 *) H2G_STRB_OUT__LCD_COM_SEG)
/* Enable Segment LCD */
#define H2G_STRB_OUT_LCD_EN                 (* (reg8 *) H2G_STRB_OUT__LCD_EN)
/* Slew Rate Control */
#define H2G_STRB_OUT_SLW                    (* (reg8 *) H2G_STRB_OUT__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define H2G_STRB_OUT_PRTDSI__CAPS_SEL       (* (reg8 *) H2G_STRB_OUT__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define H2G_STRB_OUT_PRTDSI__DBL_SYNC_IN    (* (reg8 *) H2G_STRB_OUT__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define H2G_STRB_OUT_PRTDSI__OE_SEL0        (* (reg8 *) H2G_STRB_OUT__PRTDSI__OE_SEL0) 
#define H2G_STRB_OUT_PRTDSI__OE_SEL1        (* (reg8 *) H2G_STRB_OUT__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define H2G_STRB_OUT_PRTDSI__OUT_SEL0       (* (reg8 *) H2G_STRB_OUT__PRTDSI__OUT_SEL0) 
#define H2G_STRB_OUT_PRTDSI__OUT_SEL1       (* (reg8 *) H2G_STRB_OUT__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define H2G_STRB_OUT_PRTDSI__SYNC_OUT       (* (reg8 *) H2G_STRB_OUT__PRTDSI__SYNC_OUT) 

/* SIO registers */
#if defined(H2G_STRB_OUT__SIO_CFG)
    #define H2G_STRB_OUT_SIO_HYST_EN        (* (reg8 *) H2G_STRB_OUT__SIO_HYST_EN)
    #define H2G_STRB_OUT_SIO_REG_HIFREQ     (* (reg8 *) H2G_STRB_OUT__SIO_REG_HIFREQ)
    #define H2G_STRB_OUT_SIO_CFG            (* (reg8 *) H2G_STRB_OUT__SIO_CFG)
    #define H2G_STRB_OUT_SIO_DIFF           (* (reg8 *) H2G_STRB_OUT__SIO_DIFF)
#endif /* (H2G_STRB_OUT__SIO_CFG) */

/* Interrupt Registers */
#if defined(H2G_STRB_OUT__INTSTAT)
    #define H2G_STRB_OUT_INTSTAT            (* (reg8 *) H2G_STRB_OUT__INTSTAT)
    #define H2G_STRB_OUT_SNAP               (* (reg8 *) H2G_STRB_OUT__SNAP)
    
	#define H2G_STRB_OUT_0_INTTYPE_REG 		(* (reg8 *) H2G_STRB_OUT__0__INTTYPE)
#endif /* (H2G_STRB_OUT__INTSTAT) */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_H2G_STRB_OUT_H */


/* [] END OF FILE */
