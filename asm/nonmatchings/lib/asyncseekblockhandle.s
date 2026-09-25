.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncseekblockhandle, 0x20

glabel asyncseekblockhandle
    /* 17074 80027074 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 17078 80027078 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1707C 8002707C F99B000C */  jal        asyncseekblockhandlea
    /* 17080 80027080 01000624 */   addiu     $a2, $zero, 0x1
    /* 17084 80027084 1000BF8F */  lw         $ra, 0x10($sp)
    /* 17088 80027088 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1708C 8002708C 0800E003 */  jr         $ra
    /* 17090 80027090 00000000 */   nop
endlabel asyncseekblockhandle
