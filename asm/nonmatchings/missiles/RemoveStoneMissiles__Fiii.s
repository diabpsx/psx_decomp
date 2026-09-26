.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemoveStoneMissiles__Fiii, 0x88

glabel RemoveStoneMissiles__Fiii
    /* DEC0 80147AB8 21300000 */  addu       $a2, $zero, $zero
    /* DEC4 80147ABC 1080093C */  lui        $t1, %hi(missile)
    /* DEC8 80147AC0 582C2925 */  addiu      $t1, $t1, %lo(missile)
    /* DECC 80147AC4 1E000824 */  addiu      $t0, $zero, 0x1E
    /* DED0 80147AC8 01000724 */  addiu      $a3, $zero, 0x1
    /* DED4 80147ACC 1080053C */  lui        $a1, %hi(missileactive)
    /* DED8 80147AD0 602AA524 */  addiu      $a1, $a1, %lo(missileactive)
  .L80147AD4:
    /* DEDC 80147AD4 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* DEE0 80147AD8 00000000 */  nop
    /* DEE4 80147ADC 2A10C200 */  slt        $v0, $a2, $v0
    /* DEE8 80147AE0 15004010 */  beqz       $v0, .L80147B38
    /* DEEC 80147AE4 00000000 */   nop
    /* DEF0 80147AE8 0000A284 */  lh         $v0, 0x0($a1)
    /* DEF4 80147AEC 00000000 */  nop
    /* DEF8 80147AF0 80180200 */  sll        $v1, $v0, 2
    /* DEFC 80147AF4 21186200 */  addu       $v1, $v1, $v0
    /* DF00 80147AF8 80180300 */  sll        $v1, $v1, 2
    /* DF04 80147AFC 23186200 */  subu       $v1, $v1, $v0
    /* DF08 80147B00 80180300 */  sll        $v1, $v1, 2
    /* DF0C 80147B04 21186900 */  addu       $v1, $v1, $t1
    /* DF10 80147B08 30006280 */  lb         $v0, 0x30($v1)
    /* DF14 80147B0C 00000000 */  nop
    /* DF18 80147B10 06004814 */  bne        $v0, $t0, .L80147B2C
    /* DF1C 80147B14 00000000 */   nop
    /* DF20 80147B18 20006284 */  lh         $v0, 0x20($v1)
    /* DF24 80147B1C 00000000 */  nop
    /* DF28 80147B20 02004414 */  bne        $v0, $a0, .L80147B2C
    /* DF2C 80147B24 00000000 */   nop
    /* DF30 80147B28 380067A0 */  sb         $a3, 0x38($v1)
  .L80147B2C:
    /* DF34 80147B2C 0200A524 */  addiu      $a1, $a1, 0x2
    /* DF38 80147B30 B51E0508 */  j          .L80147AD4
    /* DF3C 80147B34 0100C624 */   addiu     $a2, $a2, 0x1
  .L80147B38:
    /* DF40 80147B38 0800E003 */  jr         $ra
    /* DF44 80147B3C 00000000 */   nop
endlabel RemoveStoneMissiles__Fiii
