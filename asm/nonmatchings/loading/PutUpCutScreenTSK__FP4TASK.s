.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PutUpCutScreenTSK__FP4TASK, 0xC8

glabel PutUpCutScreenTSK__FP4TASK
    /* 94A90 800A4A90 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 94A94 800A4A94 2400BFAF */  sw         $ra, 0x24($sp)
    /* 94A98 800A4A98 2000B2AF */  sw         $s2, 0x20($sp)
    /* 94A9C 800A4A9C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 94AA0 800A4AA0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 94AA4 800A4AA4 1C00828C */  lw         $v0, 0x1C($a0)
    /* 94AA8 800A4AA8 00000000 */  nop
    /* 94AAC 800A4AAC 0000528C */  lw         $s2, 0x0($v0)
    /* 94AB0 800A4AB0 00000000 */  nop
    /* 94AB4 800A4AB4 0A00422A */  slti       $v0, $s2, 0xA
    /* 94AB8 800A4AB8 02004014 */  bnez       $v0, .L800A4AC4
    /* 94ABC 800A4ABC 0C001124 */   addiu     $s1, $zero, 0xC
    /* 94AC0 800A4AC0 0B001124 */  addiu      $s1, $zero, 0xB
  .L800A4AC4:
    /* 94AC4 800A4AC4 EE80000C */  jal        TSK_Sleep
    /* 94AC8 800A4AC8 01000424 */   addiu     $a0, $zero, 0x1
    /* 94ACC 800A4ACC 0D80103C */  lui        $s0, %hi(CutScr)
    /* 94AD0 800A4AD0 6CC71026 */  addiu      $s0, $s0, %lo(CutScr)
    /* 94AD4 800A4AD4 E952020C */  jal        Unload__7CScreen
    /* 94AD8 800A4AD8 21200002 */   addu      $a0, $s0, $zero
    /* 94ADC 800A4ADC 21200002 */  addu       $a0, $s0, $zero
    /* 94AE0 800A4AE0 21302002 */  addu       $a2, $s1, $zero
    /* 94AE4 800A4AE4 21380000 */  addu       $a3, $zero, $zero
    /* 94AE8 800A4AE8 1180033C */  lui        $v1, %hi(D_80110CA8)
    /* 94AEC 800A4AEC A80C6324 */  addiu      $v1, $v1, %lo(D_80110CA8)
    /* 94AF0 800A4AF0 40101200 */  sll        $v0, $s2, 1
    /* 94AF4 800A4AF4 21104300 */  addu       $v0, $v0, $v1
    /* 94AF8 800A4AF8 00004594 */  lhu        $a1, 0x0($v0)
    /* 94AFC 800A4AFC 2452020C */  jal        Load__7CScreeniii
    /* 94B00 800A4B00 21804000 */   addu      $s0, $v0, $zero
    /* 94B04 800A4B04 6C1F80A7 */  sh         $zero, %gp_rel(D_8011C6EC)($gp)
  .L800A4B08:
    /* 94B08 800A4B08 0D80043C */  lui        $a0, %hi(CutScr)
    /* 94B0C 800A4B0C 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 94B10 800A4B10 21302002 */  addu       $a2, $s1, $zero
    /* 94B14 800A4B14 00000596 */  lhu        $a1, 0x0($s0)
    /* 94B18 800A4B18 21380000 */  addu       $a3, $zero, $zero
    /* 94B1C 800A4B1C F252020C */  jal        Display__7CScreeniiii
    /* 94B20 800A4B20 1000A0AF */   sw        $zero, 0x10($sp)
    /* 94B24 800A4B24 9591020C */  jal        DrawCutScreen__Fi
    /* 94B28 800A4B28 21204002 */   addu      $a0, $s2, $zero
    /* 94B2C 800A4B2C EE80000C */  jal        TSK_Sleep
    /* 94B30 800A4B30 01000424 */   addiu     $a0, $zero, 0x1
    /* 94B34 800A4B34 C2920208 */  j          .L800A4B08
    /* 94B38 800A4B38 00000000 */   nop
    /* 94B3C 800A4B3C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 94B40 800A4B40 2000B28F */  lw         $s2, 0x20($sp)
    /* 94B44 800A4B44 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 94B48 800A4B48 1800B08F */  lw         $s0, 0x18($sp)
    /* 94B4C 800A4B4C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 94B50 800A4B50 0800E003 */  jr         $ra
    /* 94B54 800A4B54 00000000 */   nop
endlabel PutUpCutScreenTSK__FP4TASK
