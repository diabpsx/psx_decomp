.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DDXputchar, 0x20

glabel DDXputchar
    /* 13710 80023710 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 13714 80023714 1000BFAF */  sw         $ra, 0x10($sp)
    /* 13718 80023718 9B8C000C */  jal        SwapByte
    /* 1371C 8002371C FF008430 */   andi      $a0, $a0, 0xFF
    /* 13720 80023720 1000BF8F */  lw         $ra, 0x10($sp)
    /* 13724 80023724 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13728 80023728 0800E003 */  jr         $ra
    /* 1372C 8002372C 00000000 */   nop
endlabel DDXputchar
