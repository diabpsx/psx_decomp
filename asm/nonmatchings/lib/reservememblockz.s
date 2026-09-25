.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching reservememblockz, 0x20

glabel reservememblockz
    /* 1A5B0 8002A5B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1A5B4 8002A5B4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1A5B8 8002A5B8 98A9000C */  jal        reservememblocka
    /* 1A5BC 8002A5BC 21380000 */   addu      $a3, $zero, $zero
    /* 1A5C0 8002A5C0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1A5C4 8002A5C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1A5C8 8002A5C8 0800E003 */  jr         $ra
    /* 1A5CC 8002A5CC 00000000 */   nop
endlabel reservememblockz
