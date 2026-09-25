.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PutUpCutScreen__Fi, 0x150

glabel PutUpCutScreen__Fi
    /* 94B58 800A4B58 C409828F */  lw         $v0, %gp_rel(D_8011B144)($gp)
    /* 94B5C 800A4B5C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 94B60 800A4B60 1800B0AF */  sw         $s0, 0x18($sp)
    /* 94B64 800A4B64 21808000 */  addu       $s0, $a0, $zero
    /* 94B68 800A4B68 2000BFAF */  sw         $ra, 0x20($sp)
    /* 94B6C 800A4B6C 48004014 */  bnez       $v0, .L800A4C90
    /* 94B70 800A4B70 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 94B74 800A4B74 01000224 */  addiu      $v0, $zero, 0x1
    /* 94B78 800A4B78 C80982AF */  sw         $v0, %gp_rel(D_8011B148)($gp)
    /* 94B7C 800A4B7C 0B000224 */  addiu      $v0, $zero, 0xB
    /* 94B80 800A4B80 D00990AF */  sw         $s0, %gp_rel(D_8011B150)($gp)
    /* 94B84 800A4B84 1C000216 */  bne        $s0, $v0, .L800A4BF8
    /* 94B88 800A4B88 00000000 */   nop
    /* 94B8C 800A4B8C 6410020C */  jal        VID_SetDBuffer__Fb
    /* 94B90 800A4B90 21200000 */   addu      $a0, $zero, $zero
    /* 94B94 800A4B94 0D80043C */  lui        $a0, %hi(CutScr)
    /* 94B98 800A4B98 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 94B9C 800A4B9C 1180053C */  lui        $a1, %hi(D_80110CBE)
    /* 94BA0 800A4BA0 BE0CA594 */  lhu        $a1, %lo(D_80110CBE)($a1)
    /* 94BA4 800A4BA4 0B000624 */  addiu      $a2, $zero, 0xB
    /* 94BA8 800A4BA8 21380000 */  addu       $a3, $zero, $zero
    /* 94BAC 800A4BAC 1180113C */  lui        $s1, %hi(D_80110CBE)
    /* 94BB0 800A4BB0 BE0C3126 */  addiu      $s1, $s1, %lo(D_80110CBE)
    /* 94BB4 800A4BB4 2452020C */  jal        Load__7CScreeniii
    /* 94BB8 800A4BB8 0F001024 */   addiu     $s0, $zero, 0xF
  .L800A4BBC:
    /* 94BBC 800A4BBC 0D80043C */  lui        $a0, %hi(CutScr)
    /* 94BC0 800A4BC0 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 94BC4 800A4BC4 0B000624 */  addiu      $a2, $zero, 0xB
    /* 94BC8 800A4BC8 00002596 */  lhu        $a1, 0x0($s1)
    /* 94BCC 800A4BCC 21380000 */  addu       $a3, $zero, $zero
    /* 94BD0 800A4BD0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 94BD4 800A4BD4 F252020C */  jal        Display__7CScreeniiii
    /* 94BD8 800A4BD8 FFFF1026 */   addiu     $s0, $s0, -0x1
    /* 94BDC 800A4BDC 4991020C */  jal        MY_TSK_Sleep__Fi
    /* 94BE0 800A4BE0 01000424 */   addiu     $a0, $zero, 0x1
    /* 94BE4 800A4BE4 F5FF0106 */  bgez       $s0, .L800A4BBC
    /* 94BE8 800A4BE8 01000224 */   addiu     $v0, $zero, 0x1
    /* 94BEC 800A4BEC CC0982AF */  sw         $v0, %gp_rel(D_8011B14C)($gp)
    /* 94BF0 800A4BF0 24930208 */  j          .L800A4C90
    /* 94BF4 800A4BF4 00000000 */   nop
  .L800A4BF8:
    /* 94BF8 800A4BF8 D7F3000C */  jal        stream_stop__Fv
    /* 94BFC 800A4BFC 00000000 */   nop
    /* 94C00 800A4C00 94DF010C */  jal        music_stop__Fv
    /* 94C04 800A4C04 00000000 */   nop
    /* 94C08 800A4C08 CC0980AF */  sw         $zero, %gp_rel(D_8011B14C)($gp)
    /* 94C0C 800A4C0C 6410020C */  jal        VID_SetDBuffer__Fb
    /* 94C10 800A4C10 21200000 */   addu      $a0, $zero, $zero
    /* 94C14 800A4C14 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 94C18 800A4C18 21200000 */   addu      $a0, $zero, $zero
    /* 94C1C 800A4C1C 03400424 */  addiu      $a0, $zero, 0x4003
    /* 94C20 800A4C20 0A80053C */  lui        $a1, %hi(PutUpCutScreenTSK__FP4TASK)
    /* 94C24 800A4C24 904AA524 */  addiu      $a1, $a1, %lo(PutUpCutScreenTSK__FP4TASK)
    /* 94C28 800A4C28 00080624 */  addiu      $a2, $zero, 0x800
    /* 94C2C 800A4C2C 0480000C */  jal        TSK_AddTask
    /* 94C30 800A4C30 21380000 */   addu      $a3, $zero, $zero
    /* 94C34 800A4C34 C40982AF */  sw         $v0, %gp_rel(D_8011B144)($gp)
    /* 94C38 800A4C38 05004014 */  bnez       $v0, .L800A4C50
    /* 94C3C 800A4C3C 21200000 */   addu      $a0, $zero, $zero
    /* 94C40 800A4C40 1180053C */  lui        $a1, %hi(D_80110C80)
    /* 94C44 800A4C44 800CA524 */  addiu      $a1, $a1, %lo(D_80110C80)
    /* 94C48 800A4C48 A583000C */  jal        DBG_Error
    /* 94C4C 800A4C4C 5B010624 */   addiu     $a2, $zero, 0x15B
  .L800A4C50:
    /* 94C50 800A4C50 C409828F */  lw         $v0, %gp_rel(D_8011B144)($gp)
    /* 94C54 800A4C54 00000000 */  nop
    /* 94C58 800A4C58 1C00428C */  lw         $v0, 0x1C($v0)
    /* 94C5C 800A4C5C 08000424 */  addiu      $a0, $zero, 0x8
    /* 94C60 800A4C60 7CFC010C */  jal        PaletteFadeIn__Fi
    /* 94C64 800A4C64 000050AC */   sw        $s0, 0x0($v0)
    /* 94C68 800A4C68 09004010 */  beqz       $v0, .L800A4C90
    /* 94C6C 800A4C6C 00000000 */   nop
  .L800A4C70:
    /* 94C70 800A4C70 ABFB010C */  jal        GetFadeState__Fv
    /* 94C74 800A4C74 00000000 */   nop
    /* 94C78 800A4C78 05004010 */  beqz       $v0, .L800A4C90
    /* 94C7C 800A4C7C 00000000 */   nop
    /* 94C80 800A4C80 EE80000C */  jal        TSK_Sleep
    /* 94C84 800A4C84 01000424 */   addiu     $a0, $zero, 0x1
    /* 94C88 800A4C88 1C930208 */  j          .L800A4C70
    /* 94C8C 800A4C8C 00000000 */   nop
  .L800A4C90:
    /* 94C90 800A4C90 2000BF8F */  lw         $ra, 0x20($sp)
    /* 94C94 800A4C94 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 94C98 800A4C98 1800B08F */  lw         $s0, 0x18($sp)
    /* 94C9C 800A4C9C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 94CA0 800A4CA0 0800E003 */  jr         $ra
    /* 94CA4 800A4CA4 00000000 */   nop
endlabel PutUpCutScreen__Fi
