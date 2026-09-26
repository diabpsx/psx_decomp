.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Boom__Fi, 0x104

glabel MI_Boom__Fi
    /* DF48 80147B40 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* DF4C 80147B44 2400B1AF */  sw         $s1, 0x24($sp)
    /* DF50 80147B48 21888000 */  addu       $s1, $a0, $zero
    /* DF54 80147B4C 80101100 */  sll        $v0, $s1, 2
    /* DF58 80147B50 21105100 */  addu       $v0, $v0, $s1
    /* DF5C 80147B54 80100200 */  sll        $v0, $v0, 2
    /* DF60 80147B58 23105100 */  subu       $v0, $v0, $s1
    /* DF64 80147B5C 2000B0AF */  sw         $s0, 0x20($sp)
    /* DF68 80147B60 80800200 */  sll        $s0, $v0, 2
    /* DF6C 80147B64 2800BFAF */  sw         $ra, 0x28($sp)
    /* DF70 80147B68 1080013C */  lui        $at, %hi(missile + 0x18)
    /* DF74 80147B6C 21083000 */  addu       $at, $at, $s0
    /* DF78 80147B70 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* DF7C 80147B74 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* DF80 80147B78 21083000 */  addu       $at, $at, $s0
    /* DF84 80147B7C 762C2384 */  lh         $v1, %lo(missile + 0x1E)($at)
    /* DF88 80147B80 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* DF8C 80147B84 1080013C */  lui        $at, %hi(missile + 0x18)
    /* DF90 80147B88 21083000 */  addu       $at, $at, $s0
    /* DF94 80147B8C 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* DF98 80147B90 12006014 */  bnez       $v1, .L80147BDC
    /* DF9C 80147B94 21380000 */   addu      $a3, $zero, $zero
    /* DFA0 80147B98 1080013C */  lui        $at, %hi(missile + 0x10)
    /* DFA4 80147B9C 21083000 */  addu       $at, $at, $s0
    /* DFA8 80147BA0 682C258C */  lw         $a1, %lo(missile + 0x10)($at)
    /* DFAC 80147BA4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* DFB0 80147BA8 21083000 */  addu       $at, $at, $s0
    /* DFB4 80147BAC 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* DFB8 80147BB0 00000000 */  nop
    /* DFBC 80147BB4 1000A2AF */  sw         $v0, 0x10($sp)
    /* DFC0 80147BB8 01000224 */  addiu      $v0, $zero, 0x1
    /* DFC4 80147BBC 1080013C */  lui        $at, %hi(missile + 0x32)
    /* DFC8 80147BC0 21083000 */  addu       $at, $at, $s0
    /* DFCC 80147BC4 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* DFD0 80147BC8 2130A000 */  addu       $a2, $a1, $zero
    /* DFD4 80147BCC 1800A2AF */  sw         $v0, 0x18($sp)
    /* DFD8 80147BD0 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* DFDC 80147BD4 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* DFE0 80147BD8 1400A3AF */   sw        $v1, 0x14($sp)
  .L80147BDC:
    /* DFE4 80147BDC 1080013C */  lui        $at, %hi(missile + 0x3D)
    /* DFE8 80147BE0 21083000 */  addu       $at, $at, $s0
    /* DFEC 80147BE4 952C2390 */  lbu        $v1, %lo(missile + 0x3D)($at)
    /* DFF0 80147BE8 01000224 */  addiu      $v0, $zero, 0x1
    /* DFF4 80147BEC 04006214 */  bne        $v1, $v0, .L80147C00
    /* DFF8 80147BF0 01000224 */   addiu     $v0, $zero, 0x1
    /* DFFC 80147BF4 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* E000 80147BF8 21083000 */  addu       $at, $at, $s0
    /* E004 80147BFC 762C22A4 */  sh         $v0, %lo(missile + 0x1E)($at)
  .L80147C00:
    /* E008 80147C00 1080013C */  lui        $at, %hi(missile + 0x18)
    /* E00C 80147C04 21083000 */  addu       $at, $at, $s0
    /* E010 80147C08 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* E014 80147C0C 00000000 */  nop
    /* E018 80147C10 04004014 */  bnez       $v0, .L80147C24
    /* E01C 80147C14 01000224 */   addiu     $v0, $zero, 0x1
    /* E020 80147C18 1080013C */  lui        $at, %hi(missile + 0x38)
    /* E024 80147C1C 21083000 */  addu       $at, $at, $s0
    /* E028 80147C20 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
  .L80147C24:
    /* E02C 80147C24 D1EA040C */  jal        PutMissile__Fi
    /* E030 80147C28 21202002 */   addu      $a0, $s1, $zero
    /* E034 80147C2C 2800BF8F */  lw         $ra, 0x28($sp)
    /* E038 80147C30 2400B18F */  lw         $s1, 0x24($sp)
    /* E03C 80147C34 2000B08F */  lw         $s0, 0x20($sp)
    /* E040 80147C38 3000BD27 */  addiu      $sp, $sp, 0x30
    /* E044 80147C3C 0800E003 */  jr         $ra
    /* E048 80147C40 00000000 */   nop
endlabel MI_Boom__Fi
