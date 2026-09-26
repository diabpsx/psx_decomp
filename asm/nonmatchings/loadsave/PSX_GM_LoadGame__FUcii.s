.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PSX_GM_LoadGame__FUcii, 0x12C

glabel PSX_GM_LoadGame__FUcii
    /* 225C4 8015C1BC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 225C8 8015C1C0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 225CC 8015C1C4 2180A000 */  addu       $s0, $a1, $zero
    /* 225D0 8015C1C8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 225D4 8015C1CC 2188C000 */  addu       $s1, $a2, $zero
    /* 225D8 8015C1D0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 225DC 8015C1D4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 225E0 8015C1D8 1480133C */  lui        $s3, %hi(save_buffer)
    /* 225E4 8015C1DC EC367326 */  addiu      $s3, $s3, %lo(save_buffer)
    /* 225E8 8015C1E0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 225EC 8015C1E4 542193AF */  sw         $s3, %gp_rel(D_8011C8D4)($gp)
    /* 225F0 8015C1E8 EBDF000C */  jal        FreeGameMem__Fv
    /* 225F4 8015C1EC 21908000 */   addu      $s2, $a0, $zero
    /* 225F8 8015C1F0 21200002 */  addu       $a0, $s0, $zero
    /* 225FC 8015C1F4 21282002 */  addu       $a1, $s1, $zero
    /* 22600 8015C1F8 5421878F */  lw         $a3, %gp_rel(D_8011C8D4)($gp)
    /* 22604 8015C1FC 860B050C */  jal        read_card_file__FiiiPc
    /* 22608 8015C200 01300624 */   addiu     $a2, $zero, 0x3001
    /* 2260C 8015C204 30004014 */  bnez       $v0, .L8015C2C8
    /* 22610 8015C208 00000000 */   nop
    /* 22614 8015C20C 1280013C */  lui        $at, %hi(gbRunGame)
    /* 22618 8015C210 02B820A0 */  sb         $zero, %lo(gbRunGame)($at)
    /* 2261C 8015C214 A73A010C */  jal        delta_init__Fv
    /* 22620 8015C218 00000000 */   nop
    /* 22624 8015C21C E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 22628 8015C220 21200000 */   addu      $a0, $zero, $zero
    /* 2262C 8015C224 FF004432 */  andi       $a0, $s2, 0xFF
    /* 22630 8015C228 7372050C */  jal        RestoreLoadedData__Fb
    /* 22634 8015C22C 2B200400 */   sltu      $a0, $zero, $a0
    /* 22638 8015C230 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 2263C 8015C234 00000000 */  nop
    /* 22640 8015C238 23187300 */  subu       $v1, $v1, $s3
    /* 22644 8015C23C 1F004314 */  bne        $v0, $v1, .L8015C2BC
    /* 22648 8015C240 21200000 */   addu      $a0, $zero, $zero
    /* 2264C 8015C244 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 22650 8015C248 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 22654 8015C24C 00000000 */  nop
    /* 22658 8015C250 01004224 */  addiu      $v0, $v0, 0x1
    /* 2265C 8015C254 1280013C */  lui        $at, %hi(gbMaxPlayers)
    /* 22660 8015C258 A2B922A0 */  sb         $v0, %lo(gbMaxPlayers)($at)
    /* 22664 8015C25C 73A0010C */  jal        SetReturnLvlPos__Fv
    /* 22668 8015C260 00000000 */   nop
    /* 2266C 8015C264 CCA0010C */  jal        ResyncQuests__Fv
    /* 22670 8015C268 00000000 */   nop
    /* 22674 8015C26C 02A8020C */  jal        SetLoadedVolumes__Fv
    /* 22678 8015C270 00000000 */   nop
    /* 2267C 8015C274 ABA7020C */  jal        CalcVolumes__Fv
    /* 22680 8015C278 00000000 */   nop
    /* 22684 8015C27C FE15020C */  jal        ClearQuestFlags__Fv
    /* 22688 8015C280 00000000 */   nop
    /* 2268C 8015C284 01000324 */  addiu      $v1, $zero, 0x1
    /* 22690 8015C288 1280013C */  lui        $at, %hi(gbProcessPlayers)
    /* 22694 8015C28C 00B823A0 */  sb         $v1, %lo(gbProcessPlayers)($at)
    /* 22698 8015C290 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 2269C 8015C294 0E80013C */  lui        $at, %hi(plr + 0x64)
    /* 226A0 8015C298 9CA523AC */  sw         $v1, %lo(plr + 0x64)($at)
    /* 226A4 8015C29C 0E80013C */  lui        $at, %hi(plr + 0x1A4C)
    /* 226A8 8015C2A0 84BF23AC */  sw         $v1, %lo(plr + 0x1A4C)($at)
    /* 226AC 8015C2A4 1280013C */  lui        $at, %hi(options_pad)
    /* 226B0 8015C2A8 50B223AC */  sw         $v1, %lo(options_pad)($at)
    /* 226B4 8015C2AC 1280013C */  lui        $at, %hi(deathflag)
    /* 226B8 8015C2B0 0CBA20A0 */  sb         $zero, %lo(deathflag)($at)
    /* 226BC 8015C2B4 B2700508 */  j          .L8015C2C8
    /* 226C0 8015C2B8 21100000 */   addu      $v0, $zero, $zero
  .L8015C2BC:
    /* 226C4 8015C2BC 5710020C */  jal        VID_SetXYOff__Fii
    /* 226C8 8015C2C0 21280000 */   addu      $a1, $zero, $zero
    /* 226CC 8015C2C4 FEFF0224 */  addiu      $v0, $zero, -0x2
  .L8015C2C8:
    /* 226D0 8015C2C8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 226D4 8015C2CC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 226D8 8015C2D0 1800B28F */  lw         $s2, 0x18($sp)
    /* 226DC 8015C2D4 1400B18F */  lw         $s1, 0x14($sp)
    /* 226E0 8015C2D8 1000B08F */  lw         $s0, 0x10($sp)
    /* 226E4 8015C2DC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 226E8 8015C2E0 0800E003 */  jr         $ra
    /* 226EC 8015C2E4 00000000 */   nop
endlabel PSX_GM_LoadGame__FUcii
