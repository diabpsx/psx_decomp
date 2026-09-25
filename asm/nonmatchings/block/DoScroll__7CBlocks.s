.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoScroll__7CBlocks, 0xEC

glabel DoScroll__7CBlocks
    /* 816D0 800916D0 5555093C */  lui        $t1, (0x55555556 >> 16)
    /* 816D4 800916D4 56552935 */  ori        $t1, $t1, (0x55555556 & 0xFFFF)
    /* 816D8 800916D8 C800838C */  lw         $v1, 0xC8($a0)
    /* 816DC 800916DC D000828C */  lw         $v0, 0xD0($a0)
    /* 816E0 800916E0 12800A3C */  lui        $t2, %hi(D_8011CBE4)
    /* 816E4 800916E4 E4CB4A8D */  lw         $t2, %lo(D_8011CBE4)($t2)
    /* 816E8 800916E8 12800B3C */  lui        $t3, %hi(D_8011CBE8)
    /* 816EC 800916EC E8CB6B8D */  lw         $t3, %lo(D_8011CBE8)($t3)
    /* 816F0 800916F0 23606200 */  subu       $t4, $v1, $v0
    /* 816F4 800916F4 21104B01 */  addu       $v0, $t2, $t3
    /* 816F8 800916F8 21104C00 */  addu       $v0, $v0, $t4
    /* 816FC 800916FC 18004900 */  mult       $v0, $t1
    /* 81700 80091700 10000524 */  addiu      $a1, $zero, 0x10
    /* 81704 80091704 CC00888C */  lw         $t0, 0xCC($a0)
    /* 81708 80091708 C3170200 */  sra        $v0, $v0, 31
    /* 8170C 8009170C D400838C */  lw         $v1, 0xD4($a0)
    /* 81710 80091710 10680000 */  mfhi       $t5
    /* 81714 80091714 1280013C */  lui        $at, %hi(D_8011CBE8)
    /* 81718 80091718 E8CB2CAC */  sw         $t4, %lo(D_8011CBE8)($at)
    /* 8171C 8009171C 2360A201 */  subu       $t4, $t5, $v0
    /* 81720 80091720 1A008501 */  div        $zero, $t4, $a1
    /* 81724 80091724 12600000 */  mflo       $t4
    /* 81728 80091728 1280063C */  lui        $a2, %hi(D_8011CBF4)
    /* 8172C 8009172C F4CBC68C */  lw         $a2, %lo(D_8011CBF4)($a2)
    /* 81730 80091730 1280073C */  lui        $a3, %hi(D_8011CBF8)
    /* 81734 80091734 F8CBE78C */  lw         $a3, %lo(D_8011CBF8)($a3)
    /* 81738 80091738 23400301 */  subu       $t0, $t0, $v1
    /* 8173C 8009173C 2110C700 */  addu       $v0, $a2, $a3
    /* 81740 80091740 21104800 */  addu       $v0, $v0, $t0
    /* 81744 80091744 18004900 */  mult       $v0, $t1
    /* 81748 80091748 1280013C */  lui        $at, %hi(D_8011CBF8)
    /* 8174C 8009174C F8CB28AC */  sw         $t0, %lo(D_8011CBF8)($at)
    /* 81750 80091750 10680000 */  mfhi       $t5
    /* 81754 80091754 C3170200 */  sra        $v0, $v0, 31
    /* 81758 80091758 2340A201 */  subu       $t0, $t5, $v0
    /* 8175C 8009175C 1A000501 */  div        $zero, $t0, $a1
    /* 81760 80091760 12280000 */  mflo       $a1
    /* 81764 80091764 1280013C */  lui        $at, %hi(D_8011CBE0)
    /* 81768 80091768 E0CB2AAC */  sw         $t2, %lo(D_8011CBE0)($at)
    /* 8176C 8009176C 1280013C */  lui        $at, %hi(D_8011CBE4)
    /* 81770 80091770 E4CB2BAC */  sw         $t3, %lo(D_8011CBE4)($at)
    /* 81774 80091774 1280013C */  lui        $at, %hi(D_8011CBF0)
    /* 81778 80091778 F0CB26AC */  sw         $a2, %lo(D_8011CBF0)($at)
    /* 8177C 8009177C 1280013C */  lui        $at, %hi(D_8011CBF4)
    /* 81780 80091780 F4CB27AC */  sw         $a3, %lo(D_8011CBF4)($at)
    /* 81784 80091784 D000828C */  lw         $v0, 0xD0($a0)
    /* 81788 80091788 D400838C */  lw         $v1, 0xD4($a0)
    /* 8178C 8009178C 21104C00 */  addu       $v0, $v0, $t4
    /* 81790 80091790 D00082AC */  sw         $v0, 0xD0($a0)
    /* 81794 80091794 D000828C */  lw         $v0, 0xD0($a0)
    /* 81798 80091798 21186500 */  addu       $v1, $v1, $a1
    /* 8179C 8009179C D40083AC */  sw         $v1, 0xD4($a0)
    /* 817A0 800917A0 D400838C */  lw         $v1, 0xD4($a0)
    /* 817A4 800917A4 1280013C */  lui        $at, %hi(gr_scrxoff)
    /* 817A8 800917A8 98B022AC */  sw         $v0, %lo(gr_scrxoff)($at)
    /* 817AC 800917AC 1280013C */  lui        $at, %hi(gr_scryoff)
    /* 817B0 800917B0 9CB023AC */  sw         $v1, %lo(gr_scryoff)($at)
    /* 817B4 800917B4 0800E003 */  jr         $ra
    /* 817B8 800917B8 00000000 */   nop
endlabel DoScroll__7CBlocks
