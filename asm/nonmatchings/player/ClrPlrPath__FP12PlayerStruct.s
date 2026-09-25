.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClrPlrPath__FP12PlayerStruct, 0x28

glabel ClrPlrPath__FP12PlayerStruct
    /* 5544C 8006544C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 55450 80065450 1000BFAF */  sw         $ra, 0x10($sp)
    /* 55454 80065454 04008424 */  addiu      $a0, $a0, 0x4
    /* 55458 80065458 FF000524 */  addiu      $a1, $zero, 0xFF
    /* 5545C 8006545C E940000C */  jal        memset
    /* 55460 80065460 19000624 */   addiu     $a2, $zero, 0x19
    /* 55464 80065464 1000BF8F */  lw         $ra, 0x10($sp)
    /* 55468 80065468 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5546C 8006546C 0800E003 */  jr         $ra
    /* 55470 80065470 00000000 */   nop
endlabel ClrPlrPath__FP12PlayerStruct
