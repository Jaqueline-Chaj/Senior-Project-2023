/*******************************************************************************
* File Name: OUT_BYTE_PM.c
* Version 1.80
*
* Description:
*  This file contains the setup, control, and status commands to support 
*  the component operation in the low power mode. 
*
* Note:
*
********************************************************************************
* Copyright 2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#include "OUT_BYTE.h"

/* Check for removal by optimization */
#if !defined(OUT_BYTE_Sync_ctrl_reg__REMOVED)

static OUT_BYTE_BACKUP_STRUCT  OUT_BYTE_backup = {0u};

    
/*******************************************************************************
* Function Name: OUT_BYTE_SaveConfig
********************************************************************************
*
* Summary:
*  Saves the control register value.
*
* Parameters:
*  None
*
* Return:
*  None
*
*******************************************************************************/
void OUT_BYTE_SaveConfig(void) 
{
    OUT_BYTE_backup.controlState = OUT_BYTE_Control;
}


/*******************************************************************************
* Function Name: OUT_BYTE_RestoreConfig
********************************************************************************
*
* Summary:
*  Restores the control register value.
*
* Parameters:
*  None
*
* Return:
*  None
*
*
*******************************************************************************/
void OUT_BYTE_RestoreConfig(void) 
{
     OUT_BYTE_Control = OUT_BYTE_backup.controlState;
}


/*******************************************************************************
* Function Name: OUT_BYTE_Sleep
********************************************************************************
*
* Summary:
*  Prepares the component for entering the low power mode.
*
* Parameters:
*  None
*
* Return:
*  None
*
*******************************************************************************/
void OUT_BYTE_Sleep(void) 
{
    OUT_BYTE_SaveConfig();
}


/*******************************************************************************
* Function Name: OUT_BYTE_Wakeup
********************************************************************************
*
* Summary:
*  Restores the component after waking up from the low power mode.
*
* Parameters:
*  None
*
* Return:
*  None
*
*******************************************************************************/
void OUT_BYTE_Wakeup(void)  
{
    OUT_BYTE_RestoreConfig();
}

#endif /* End check for removal by optimization */


/* [] END OF FILE */
