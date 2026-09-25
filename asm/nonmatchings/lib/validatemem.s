.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching validatemem, 0x20

glabel validatemem
    /* 1C640 8002C640 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C644 8002C644 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1C648 8002C648 3CB1000C */  jal        validatemema
    /* 1C64C 8002C64C 01000424 */   addiu     $a0, $zero, 0x1
    /* 1C650 8002C650 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1C654 8002C654 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C658 8002C658 0800E003 */  jr         $ra
    /* 1C65C 8002C65C 00000000 */   nop
endlabel validatemem
