.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearImage2, 0x98

glabel ClearImage2
    /* 3C8C 80013C8C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3C90 80013C90 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 3C94 80013C94 21988000 */  addu       $s3, $a0, $zero
    /* 3C98 80013C98 1180043C */  lui        $a0, %hi(D_8010DF94)
    /* 3C9C 80013C9C 94DF8424 */  addiu      $a0, $a0, %lo(D_8010DF94)
    /* 3CA0 80013CA0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3CA4 80013CA4 2190A000 */  addu       $s2, $a1, $zero
    /* 3CA8 80013CA8 21286002 */  addu       $a1, $s3, $zero
    /* 3CAC 80013CAC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3CB0 80013CB0 2180C000 */  addu       $s0, $a2, $zero
    /* 3CB4 80013CB4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3CB8 80013CB8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 3CBC 80013CBC B84E000C */  jal        func_80013AE0
    /* 3CC0 80013CC0 2188E000 */   addu      $s1, $a3, $zero
    /* 3CC4 80013CC4 21286002 */  addu       $a1, $s3, $zero
    /* 3CC8 80013CC8 FF003132 */  andi       $s1, $s1, 0xFF
    /* 3CCC 80013CCC 008C1100 */  sll        $s1, $s1, 16
    /* 3CD0 80013CD0 FF001032 */  andi       $s0, $s0, 0xFF
    /* 3CD4 80013CD4 00821000 */  sll        $s0, $s0, 8
    /* 3CD8 80013CD8 0080023C */  lui        $v0, (0x80000000 >> 16)
    /* 3CDC 80013CDC 25800202 */  or         $s0, $s0, $v0
    /* 3CE0 80013CE0 25883002 */  or         $s1, $s1, $s0
    /* 3CE4 80013CE4 FF005232 */  andi       $s2, $s2, 0xFF
    /* 3CE8 80013CE8 0B80033C */  lui        $v1, %hi(D_800B54A4)
    /* 3CEC 80013CEC A454638C */  lw         $v1, %lo(D_800B54A4)($v1)
    /* 3CF0 80013CF0 08000624 */  addiu      $a2, $zero, 0x8
    /* 3CF4 80013CF4 0C00648C */  lw         $a0, 0xC($v1)
    /* 3CF8 80013CF8 0800628C */  lw         $v0, 0x8($v1)
    /* 3CFC 80013CFC 00000000 */  nop
    /* 3D00 80013D00 09F84000 */  jalr       $v0
    /* 3D04 80013D04 25383202 */   or        $a3, $s1, $s2
    /* 3D08 80013D08 2000BF8F */  lw         $ra, 0x20($sp)
    /* 3D0C 80013D0C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 3D10 80013D10 1800B28F */  lw         $s2, 0x18($sp)
    /* 3D14 80013D14 1400B18F */  lw         $s1, 0x14($sp)
    /* 3D18 80013D18 1000B08F */  lw         $s0, 0x10($sp)
    /* 3D1C 80013D1C 0800E003 */  jr         $ra
    /* 3D20 80013D20 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel ClearImage2
