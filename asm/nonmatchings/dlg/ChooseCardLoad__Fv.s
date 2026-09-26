.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChooseCardLoad__Fv, 0x9C

glabel ChooseCardLoad__Fv
    /* 1FD74 8015996C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1FD78 80159970 21200000 */  addu       $a0, $zero, $zero
    /* 1FD7C 80159974 21280000 */  addu       $a1, $zero, $zero
    /* 1FD80 80159978 01000624 */  addiu      $a2, $zero, 0x1
    /* 1FD84 8015997C B7030724 */  addiu      $a3, $zero, 0x3B7
    /* 1FD88 80159980 01000224 */  addiu      $v0, $zero, 0x1
    /* 1FD8C 80159984 A80C82AF */  sw         $v0, %gp_rel(fileinfoflag)($gp)
    /* 1FD90 80159988 0C80023C */  lui        $v0, %hi(LargeFont)
    /* 1FD94 8015998C F4844224 */  addiu      $v0, $v0, %lo(LargeFont)
    /* 1FD98 80159990 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1FD9C 80159994 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1FDA0 80159998 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1FDA4 8015999C 14E7040C */  jal        FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont
    /* 1FDA8 801599A0 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1FDAC 801599A4 21200000 */  addu       $a0, $zero, $zero
    /* 1FDB0 801599A8 0C000524 */  addiu      $a1, $zero, 0xC
    /* 1FDB4 801599AC 01000624 */  addiu      $a2, $zero, 0x1
    /* 1FDB8 801599B0 88020724 */  addiu      $a3, $zero, 0x288
    /* 1FDBC 801599B4 1480023C */  lui        $v0, %hi(McLoadCard1Menu)
    /* 1FDC0 801599B8 68364224 */  addiu      $v0, $v0, %lo(McLoadCard1Menu)
    /* 1FDC4 801599BC 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 1FDC8 801599C0 D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 1FDCC 801599C4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1FDD0 801599C8 14E7040C */  jal        FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont
    /* 1FDD4 801599CC 1400B0AF */   sw        $s0, 0x14($sp)
    /* 1FDD8 801599D0 21200000 */  addu       $a0, $zero, $zero
    /* 1FDDC 801599D4 30000524 */  addiu      $a1, $zero, 0x30
    /* 1FDE0 801599D8 01000624 */  addiu      $a2, $zero, 0x1
    /* 1FDE4 801599DC 89020724 */  addiu      $a3, $zero, 0x289
    /* 1FDE8 801599E0 1480023C */  lui        $v0, %hi(McLoadCard2Menu)
    /* 1FDEC 801599E4 84364224 */  addiu      $v0, $v0, %lo(McLoadCard2Menu)
    /* 1FDF0 801599E8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1FDF4 801599EC 14E7040C */  jal        FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont
    /* 1FDF8 801599F0 1400B0AF */   sw        $s0, 0x14($sp)
    /* 1FDFC 801599F4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1FE00 801599F8 1800B08F */  lw         $s0, 0x18($sp)
    /* 1FE04 801599FC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1FE08 80159A00 0800E003 */  jr         $ra
    /* 1FE0C 80159A04 00000000 */   nop
endlabel ChooseCardLoad__Fv
