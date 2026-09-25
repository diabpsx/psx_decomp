.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncloadfile, 0x20

glabel asyncloadfile
    /* 13C2C 80023C2C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 13C30 80023C30 1000BFAF */  sw         $ra, 0x10($sp)
    /* 13C34 80023C34 BE8E000C */  jal        asyncloadfilecallback
    /* 13C38 80023C38 21300000 */   addu      $a2, $zero, $zero
    /* 13C3C 80023C3C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 13C40 80023C40 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13C44 80023C44 0800E003 */  jr         $ra
    /* 13C48 80023C48 00000000 */   nop
endlabel asyncloadfile
