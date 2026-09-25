.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GM_Game__FUlUilUl, 0x94

glabel GM_Game__FUlUilUl
    /* 2889C 8003889C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 288A0 800388A0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 288A4 800388A4 2180A000 */  addu       $s0, $a1, $zero
    /* 288A8 800388A8 01000224 */  addiu      $v0, $zero, 0x1
    /* 288AC 800388AC 14000212 */  beq        $s0, $v0, .L80038900
    /* 288B0 800388B0 1400BFAF */   sw        $ra, 0x14($sp)
    /* 288B4 800388B4 18000012 */  beqz       $s0, .L80038918
    /* 288B8 800388B8 4A00022E */   sltiu     $v0, $s0, 0x4A
    /* 288BC 800388BC 16004010 */  beqz       $v0, .L80038918
    /* 288C0 800388C0 4200022E */   sltiu     $v0, $s0, 0x42
    /* 288C4 800388C4 15004014 */  bnez       $v0, .L8003891C
    /* 288C8 800388C8 21100000 */   addu      $v0, $zero, $zero
    /* 288CC 800388CC 0CF6000C */  jal        sound_stop__Fv
    /* 288D0 800388D0 00000000 */   nop
    /* 288D4 800388D4 94DF010C */  jal        music_stop__Fv
    /* 288D8 800388D8 00000000 */   nop
    /* 288DC 800388DC 2C1080A3 */  sb         $zero, %gp_rel(sgbMouseDown)($gp)
    /* 288E0 800388E0 90F7000C */  jal        ShowProgress__FUi
    /* 288E4 800388E4 21200002 */   addu      $a0, $s0, $zero
    /* 288E8 800388E8 FF000324 */  addiu      $v1, $zero, 0xFF
    /* 288EC 800388EC 101083AF */  sw         $v1, %gp_rel(force_redraw)($gp)
    /* 288F0 800388F0 01000324 */  addiu      $v1, $zero, 0x1
    /* 288F4 800388F4 841083A3 */  sb         $v1, %gp_rel(gbGameLoopStartup)($gp)
    /* 288F8 800388F8 47E20008 */  j          .L8003891C
    /* 288FC 800388FC 21100000 */   addu      $v0, $zero, $zero
  .L80038900:
    /* 28900 80038900 0600C014 */  bnez       $a2, .L8003891C
    /* 28904 80038904 21100000 */   addu      $v0, $zero, $zero
    /* 28908 80038908 821080A3 */  sb         $zero, %gp_rel(gbRunGame)($gp)
    /* 2890C 8003890C 831080A3 */  sb         $zero, %gp_rel(gbRunGameResult)($gp)
    /* 28910 80038910 47E20008 */  j          .L8003891C
    /* 28914 80038914 00000000 */   nop
  .L80038918:
    /* 28918 80038918 21100000 */  addu       $v0, $zero, $zero
  .L8003891C:
    /* 2891C 8003891C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 28920 80038920 1000B08F */  lw         $s0, 0x10($sp)
    /* 28924 80038924 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 28928 80038928 0800E003 */  jr         $ra
    /* 2892C 8003892C 00000000 */   nop
endlabel GM_Game__FUlUilUl
