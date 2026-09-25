.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CountdownLoad__Fi, 0x210

glabel CountdownLoad__Fi
    /* 95B6C 800A5B6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 95B70 800A5B70 1000B0AF */  sw         $s0, 0x10($sp)
    /* 95B74 800A5B74 FFFF9024 */  addiu      $s0, $a0, -0x1
    /* 95B78 800A5B78 7A00001E */  bgtz       $s0, .L800A5D64
    /* 95B7C 800A5B7C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 95B80 800A5B80 8C0A848F */  lw         $a0, %gp_rel(Loadfilename)($gp)
    /* 95B84 800A5B84 7269050C */  jal        func_8015A5C8
    /* 95B88 800A5B88 00000000 */   nop
    /* 95B8C 800A5B8C 01004238 */  xori       $v0, $v0, 0x1
    /* 95B90 800A5B90 0E004010 */  beqz       $v0, .L800A5BCC
    /* 95B94 800A5B94 00000000 */   nop
    /* 95B98 800A5B98 8C0A838F */  lw         $v1, %gp_rel(Loadfilename)($gp)
    /* 95B9C 800A5B9C 1280023C */  lui        $v0, %hi(DiabloGameFile)
    /* 95BA0 800A5BA0 10B4428C */  lw         $v0, %lo(DiabloGameFile)($v0)
    /* 95BA4 800A5BA4 00000000 */  nop
    /* 95BA8 800A5BA8 03006214 */  bne        $v1, $v0, .L800A5BB8
    /* 95BAC 800A5BAC 00000000 */   nop
    /* 95BB0 800A5BB0 EF960208 */  j          .L800A5BBC
    /* 95BB4 800A5BB4 BE020224 */   addiu     $v0, $zero, 0x2BE
  .L800A5BB8:
    /* 95BB8 800A5BB8 C0020224 */  addiu      $v0, $zero, 0x2C0
  .L800A5BBC:
    /* 95BBC 800A5BBC 1280013C */  lui        $at, %hi(AlertTxt)
    /* 95BC0 800A5BC0 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 95BC4 800A5BC4 5A970208 */  j          .L800A5D68
    /* 95BC8 800A5BC8 21100000 */   addu      $v0, $zero, $zero
  .L800A5BCC:
    /* 95BCC 800A5BCC 8C0A858F */  lw         $a1, %gp_rel(Loadfilename)($gp)
    /* 95BD0 800A5BD0 1280023C */  lui        $v0, %hi(DiabloGameFile)
    /* 95BD4 800A5BD4 10B4428C */  lw         $v0, %lo(DiabloGameFile)($v0)
    /* 95BD8 800A5BD8 00000000 */  nop
    /* 95BDC 800A5BDC 3F00A214 */  bne        $a1, $v0, .L800A5CDC
    /* 95BE0 800A5BE0 00000000 */   nop
    /* 95BE4 800A5BE4 1280043C */  lui        $a0, %hi(current_card)
    /* 95BE8 800A5BE8 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 95BEC 800A5BEC 6465050C */  jal        func_80159590
    /* 95BF0 800A5BF0 00000000 */   nop
    /* 95BF4 800A5BF4 01000424 */  addiu      $a0, $zero, 0x1
    /* 95BF8 800A5BF8 1280053C */  lui        $a1, %hi(current_card)
    /* 95BFC 800A5BFC 60B4A58C */  lw         $a1, %lo(current_card)($a1)
    /* 95C00 800A5C00 6F70050C */  jal        func_8015C1BC
    /* 95C04 800A5C04 21304000 */   addu      $a2, $v0, $zero
    /* 95C08 800A5C08 21184000 */  addu       $v1, $v0, $zero
    /* 95C0C 800A5C0C 08006010 */  beqz       $v1, .L800A5C30
    /* 95C10 800A5C10 FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 95C14 800A5C14 48006214 */  bne        $v1, $v0, .L800A5D38
    /* 95C18 800A5C18 5D020224 */   addiu     $v0, $zero, 0x25D
    /* 95C1C 800A5C1C 5C020224 */  addiu      $v0, $zero, 0x25C
    /* 95C20 800A5C20 1280013C */  lui        $at, %hi(AlertTxt)
    /* 95C24 800A5C24 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 95C28 800A5C28 5A970208 */  j          .L800A5D68
    /* 95C2C 800A5C2C 21100002 */   addu      $v0, $s0, $zero
  .L800A5C30:
    /* 95C30 800A5C30 5695020C */  jal        MemcardOFF__Fv
    /* 95C34 800A5C34 00000000 */   nop
    /* 95C38 800A5C38 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 95C3C 800A5C3C 21200000 */   addu      $a0, $zero, $zero
    /* 95C40 800A5C40 BEFC010C */  jal        PaletteFadeOut__Fi
    /* 95C44 800A5C44 08000424 */   addiu     $a0, $zero, 0x8
  .L800A5C48:
    /* 95C48 800A5C48 ABFB010C */  jal        GetFadeState__Fv
    /* 95C4C 800A5C4C 00000000 */   nop
    /* 95C50 800A5C50 05004010 */  beqz       $v0, .L800A5C68
    /* 95C54 800A5C54 4B000524 */   addiu     $a1, $zero, 0x4B
    /* 95C58 800A5C58 EE80000C */  jal        TSK_Sleep
    /* 95C5C 800A5C5C 01000424 */   addiu     $a0, $zero, 0x1
    /* 95C60 800A5C60 12970208 */  j          .L800A5C48
    /* 95C64 800A5C64 00000000 */   nop
  .L800A5C68:
    /* 95C68 800A5C68 21300000 */  addu       $a2, $zero, $zero
    /* 95C6C 800A5C6C 01000224 */  addiu      $v0, $zero, 0x1
    /* 95C70 800A5C70 1280043C */  lui        $a0, %hi(ghMainWnd)
    /* 95C74 800A5C74 88B7848C */  lw         $a0, %lo(ghMainWnd)($a0)
    /* 95C78 800A5C78 1280013C */  lui        $at, %hi(gbActivePlayers)
    /* 95C7C 800A5C7C A3B920A0 */  sb         $zero, %lo(gbActivePlayers)($at)
    /* 95C80 800A5C80 1280013C */  lui        $at, %hi(gbRunGame)
    /* 95C84 800A5C84 02B822A0 */  sb         $v0, %lo(gbRunGame)($at)
    /* 95C88 800A5C88 95EC010C */  jal        GRL_PostMessage__FUlUilUl
    /* 95C8C 800A5C8C 21380000 */   addu      $a3, $zero, $zero
    /* 95C90 800A5C90 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 95C94 800A5C94 00000000 */   nop
    /* 95C98 800A5C98 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 95C9C 800A5C9C 01000424 */   addiu     $a0, $zero, 0x1
    /* 95CA0 800A5CA0 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 95CA4 800A5CA4 01000424 */   addiu     $a0, $zero, 0x1
    /* 95CA8 800A5CA8 1280043C */  lui        $a0, %hi(DrawOptionsTask)
    /* 95CAC 800A5CAC 64B2848C */  lw         $a0, %lo(DrawOptionsTask)($a0)
    /* 95CB0 800A5CB0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 95CB4 800A5CB4 1280013C */  lui        $at, %hi(optionsflag)
    /* 95CB8 800A5CB8 48B220AC */  sw         $zero, %lo(optionsflag)($at)
    /* 95CBC 800A5CBC 1280013C */  lui        $at, %hi(PauseMode)
    /* 95CC0 800A5CC0 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 95CC4 800A5CC4 1280013C */  lui        $at, %hi(options_pad)
    /* 95CC8 800A5CC8 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 95CCC 800A5CCC 5281000C */  jal        TSK_Kill
    /* 95CD0 800A5CD0 00000000 */   nop
    /* 95CD4 800A5CD4 5A970208 */  j          .L800A5D68
    /* 95CD8 800A5CD8 21100002 */   addu      $v0, $s0, $zero
  .L800A5CDC:
    /* 95CDC 800A5CDC 1280043C */  lui        $a0, %hi(current_card)
    /* 95CE0 800A5CE0 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 95CE4 800A5CE4 1280053C */  lui        $a1, %hi(DiabloOptionFile)
    /* 95CE8 800A5CE8 14B4A58C */  lw         $a1, %lo(DiabloOptionFile)($a1)
    /* 95CEC 800A5CEC 6465050C */  jal        func_80159590
    /* 95CF0 800A5CF0 00000000 */   nop
    /* 95CF4 800A5CF4 21284000 */  addu       $a1, $v0, $zero
    /* 95CF8 800A5CF8 1280043C */  lui        $a0, %hi(current_card)
    /* 95CFC 800A5CFC 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 95D00 800A5D00 B571050C */  jal        func_8015C6D4
    /* 95D04 800A5D04 01000624 */   addiu     $a2, $zero, 0x1
    /* 95D08 800A5D08 21184000 */  addu       $v1, $v0, $zero
    /* 95D0C 800A5D0C 0E006010 */  beqz       $v1, .L800A5D48
    /* 95D10 800A5D10 FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 95D14 800A5D14 08006214 */  bne        $v1, $v0, .L800A5D38
    /* 95D18 800A5D18 5D020224 */   addiu     $v0, $zero, 0x25D
    /* 95D1C 800A5D1C 5C020224 */  addiu      $v0, $zero, 0x25C
    /* 95D20 800A5D20 1280013C */  lui        $at, %hi(gbRunGame)
    /* 95D24 800A5D24 02B820A0 */  sb         $zero, %lo(gbRunGame)($at)
    /* 95D28 800A5D28 1280013C */  lui        $at, %hi(AlertTxt)
    /* 95D2C 800A5D2C 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 95D30 800A5D30 5A970208 */  j          .L800A5D68
    /* 95D34 800A5D34 21100002 */   addu      $v0, $s0, $zero
  .L800A5D38:
    /* 95D38 800A5D38 1280013C */  lui        $at, %hi(AlertTxt)
    /* 95D3C 800A5D3C 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 95D40 800A5D40 5A970208 */  j          .L800A5D68
    /* 95D44 800A5D44 21100002 */   addu      $v0, $s0, $zero
  .L800A5D48:
    /* 95D48 800A5D48 F6020224 */  addiu      $v0, $zero, 0x2F6
    /* 95D4C 800A5D4C 1280013C */  lui        $at, %hi(AlertTxt)
    /* 95D50 800A5D50 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 95D54 800A5D54 2EA8020C */  jal        GetVolumes__Fv
    /* 95D58 800A5D58 00000000 */   nop
    /* 95D5C 800A5D5C ABA7020C */  jal        CalcVolumes__Fv
    /* 95D60 800A5D60 00000000 */   nop
  .L800A5D64:
    /* 95D64 800A5D64 21100002 */  addu       $v0, $s0, $zero
  .L800A5D68:
    /* 95D68 800A5D68 1400BF8F */  lw         $ra, 0x14($sp)
    /* 95D6C 800A5D6C 1000B08F */  lw         $s0, 0x10($sp)
    /* 95D70 800A5D70 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 95D74 800A5D74 0800E003 */  jr         $ra
    /* 95D78 800A5D78 00000000 */   nop
endlabel CountdownLoad__Fi
