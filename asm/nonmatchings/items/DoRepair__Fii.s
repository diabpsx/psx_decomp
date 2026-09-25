.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoRepair__Fii, 0xC4

glabel DoRepair__Fii
    /* 35F0C 80045F0C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 35F10 80045F10 1400B1AF */  sw         $s1, 0x14($sp)
    /* 35F14 80045F14 21888000 */  addu       $s1, $a0, $zero
    /* 35F18 80045F18 1000B0AF */  sw         $s0, 0x10($sp)
    /* 35F1C 80045F1C 2180A000 */  addu       $s0, $a1, $zero
    /* 35F20 80045F20 40101100 */  sll        $v0, $s1, 1
    /* 35F24 80045F24 21105100 */  addu       $v0, $v0, $s1
    /* 35F28 80045F28 80100200 */  sll        $v0, $v0, 2
    /* 35F2C 80045F2C 21105100 */  addu       $v0, $v0, $s1
    /* 35F30 80045F30 00110200 */  sll        $v0, $v0, 4
    /* 35F34 80045F34 23105100 */  subu       $v0, $v0, $s1
    /* 35F38 80045F38 80100200 */  sll        $v0, $v0, 2
    /* 35F3C 80045F3C 21105100 */  addu       $v0, $v0, $s1
    /* 35F40 80045F40 C0100200 */  sll        $v0, $v0, 3
    /* 35F44 80045F44 0E80033C */  lui        $v1, %hi(plr)
    /* 35F48 80045F48 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 35F4C 80045F4C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 35F50 80045F50 21904300 */  addu       $s2, $v0, $v1
    /* 35F54 80045F54 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 35F58 80045F58 30004586 */  lh         $a1, 0x30($s2)
    /* 35F5C 80045F5C 32004686 */  lh         $a2, 0x32($s2)
    /* 35F60 80045F60 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 35F64 80045F64 42000424 */   addiu     $a0, $zero, 0x42
    /* 35F68 80045F68 C0101000 */  sll        $v0, $s0, 3
    /* 35F6C 80045F6C 23105000 */  subu       $v0, $v0, $s0
    /* 35F70 80045F70 80100200 */  sll        $v0, $v0, 2
    /* 35F74 80045F74 23105000 */  subu       $v0, $v0, $s0
    /* 35F78 80045F78 80100200 */  sll        $v0, $v0, 2
    /* 35F7C 80045F7C B0014224 */  addiu      $v0, $v0, 0x1B0
    /* 35F80 80045F80 3C014582 */  lb         $a1, 0x13C($s2)
    /* 35F84 80045F84 8717010C */  jal        RepairItem__FP10ItemStructi
    /* 35F88 80045F88 21204202 */   addu      $a0, $s2, $v0
    /* 35F8C 80045F8C 21202002 */  addu       $a0, $s1, $zero
    /* 35F90 80045F90 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 35F94 80045F94 01000524 */   addiu     $a1, $zero, 0x1
    /* 35F98 80045F98 1280023C */  lui        $v0, %hi(myplr)
    /* 35F9C 80045F9C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 35FA0 80045FA0 00000000 */  nop
    /* 35FA4 80045FA4 03002216 */  bne        $s1, $v0, .L80045FB4
    /* 35FA8 80045FA8 00000000 */   nop
    /* 35FAC 80045FAC 01DE000C */  jal        NewCursor__Fi
    /* 35FB0 80045FB0 01000424 */   addiu     $a0, $zero, 0x1
  .L80045FB4:
    /* 35FB4 80045FB4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 35FB8 80045FB8 1800B28F */  lw         $s2, 0x18($sp)
    /* 35FBC 80045FBC 1400B18F */  lw         $s1, 0x14($sp)
    /* 35FC0 80045FC0 1000B08F */  lw         $s0, 0x10($sp)
    /* 35FC4 80045FC4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 35FC8 80045FC8 0800E003 */  jr         $ra
    /* 35FCC 80045FCC 00000000 */   nop
endlabel DoRepair__Fii
