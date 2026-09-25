.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FileNotFound__6FileIOPCc, 0x20

glabel FileNotFound__6FileIOPCc
    /* 75AF4 80085AF4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 75AF8 80085AF8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 75AFC 80085AFC 9983000C */  jal        DBG_Halt
    /* 75B00 80085B00 00000000 */   nop
    /* 75B04 80085B04 1000BF8F */  lw         $ra, 0x10($sp)
    /* 75B08 80085B08 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 75B0C 80085B0C 0800E003 */  jr         $ra
    /* 75B10 80085B10 00000000 */   nop
endlabel FileNotFound__6FileIOPCc
