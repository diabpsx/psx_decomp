.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearImage, 0x90

glabel ClearImage
    /* 3BFC 80013BFC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3C00 80013C00 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 3C04 80013C04 21988000 */  addu       $s3, $a0, $zero
    /* 3C08 80013C08 1180043C */  lui        $a0, %hi(D_8010DF88)
    /* 3C0C 80013C0C 88DF8424 */  addiu      $a0, $a0, %lo(D_8010DF88)
    /* 3C10 80013C10 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3C14 80013C14 2190A000 */  addu       $s2, $a1, $zero
    /* 3C18 80013C18 21286002 */  addu       $a1, $s3, $zero
    /* 3C1C 80013C1C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3C20 80013C20 2188C000 */  addu       $s1, $a2, $zero
    /* 3C24 80013C24 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3C28 80013C28 2000BFAF */  sw         $ra, 0x20($sp)
    /* 3C2C 80013C2C B84E000C */  jal        func_80013AE0
    /* 3C30 80013C30 2180E000 */   addu      $s0, $a3, $zero
    /* 3C34 80013C34 21286002 */  addu       $a1, $s3, $zero
    /* 3C38 80013C38 FF001032 */  andi       $s0, $s0, 0xFF
    /* 3C3C 80013C3C 00841000 */  sll        $s0, $s0, 16
    /* 3C40 80013C40 FF003132 */  andi       $s1, $s1, 0xFF
    /* 3C44 80013C44 008A1100 */  sll        $s1, $s1, 8
    /* 3C48 80013C48 25801102 */  or         $s0, $s0, $s1
    /* 3C4C 80013C4C FF005232 */  andi       $s2, $s2, 0xFF
    /* 3C50 80013C50 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 3C54 80013C54 A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 3C58 80013C58 08000624 */  addiu      $a2, $zero, 0x8
    /* 3C5C 80013C5C 0C00448C */  lw         $a0, 0xC($v0)
    /* 3C60 80013C60 0800428C */  lw         $v0, 0x8($v0)
    /* 3C64 80013C64 00000000 */  nop
    /* 3C68 80013C68 09F84000 */  jalr       $v0
    /* 3C6C 80013C6C 25381202 */   or        $a3, $s0, $s2
    /* 3C70 80013C70 2000BF8F */  lw         $ra, 0x20($sp)
    /* 3C74 80013C74 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 3C78 80013C78 1800B28F */  lw         $s2, 0x18($sp)
    /* 3C7C 80013C7C 1400B18F */  lw         $s1, 0x14($sp)
    /* 3C80 80013C80 1000B08F */  lw         $s0, 0x10($sp)
    /* 3C84 80013C84 0800E003 */  jr         $ra
    /* 3C88 80013C88 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel ClearImage
