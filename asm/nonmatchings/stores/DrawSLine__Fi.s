.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSLine__Fi, 0x94

glabel DrawSLine__Fi
    /* 59C44 80069C44 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 59C48 80069C48 80100400 */  sll        $v0, $a0, 2
    /* 59C4C 80069C4C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 59C50 80069C50 0E80113C */  lui        $s1, %hi(SBack)
    /* 59C54 80069C54 04E33126 */  addiu      $s1, $s1, %lo(SBack)
    /* 59C58 80069C58 2413838F */  lw         $v1, %gp_rel(SStringY)($gp)
    /* 59C5C 80069C5C 21202002 */  addu       $a0, $s1, $zero
    /* 59C60 80069C60 1800BFAF */  sw         $ra, 0x18($sp)
    /* 59C64 80069C64 1000B0AF */  sw         $s0, 0x10($sp)
    /* 59C68 80069C68 21104300 */  addu       $v0, $v0, $v1
    /* 59C6C 80069C6C 36218387 */  lh         $v1, %gp_rel(D_8011C8B6)($gp)
    /* 59C70 80069C70 0000508C */  lw         $s0, 0x0($v0)
    /* 59C74 80069C74 1A000524 */  addiu      $a1, $zero, 0x1A
    /* 59C78 80069C78 F0D0010C */  jal        SetBorder__6Dialogi_800743c0
    /* 59C7C 80069C7C 21800302 */   addu      $s0, $s0, $v1
    /* 59C80 80069C80 21202002 */  addu       $a0, $s1, $zero
    /* 59C84 80069C84 1280053C */  lui        $a1, %hi(BORDERR)
    /* 59C88 80069C88 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 59C8C 80069C8C 1280063C */  lui        $a2, %hi(BORDERG)
    /* 59C90 80069C90 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 59C94 80069C94 1280073C */  lui        $a3, %hi(BORDERB)
    /* 59C98 80069C98 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 59C9C 80069C9C 42280500 */  srl        $a1, $a1, 1
    /* 59CA0 80069CA0 42300600 */  srl        $a2, $a2, 1
    /* 59CA4 80069CA4 E8D0010C */  jal        SetRGB__6DialogUcUcUc_800743a0
    /* 59CA8 80069CA8 42380700 */   srl       $a3, $a3, 1
    /* 59CAC 80069CAC 21202002 */  addu       $a0, $s1, $zero
    /* 59CB0 80069CB0 34218587 */  lh         $a1, %gp_rel(D_8011C8B4)($gp)
    /* 59CB4 80069CB4 38218787 */  lh         $a3, %gp_rel(D_8011C8B8)($gp)
    /* 59CB8 80069CB8 FE33020C */  jal        Line__6Dialogiii
    /* 59CBC 80069CBC 21300002 */   addu      $a2, $s0, $zero
    /* 59CC0 80069CC0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 59CC4 80069CC4 1400B18F */  lw         $s1, 0x14($sp)
    /* 59CC8 80069CC8 1000B08F */  lw         $s0, 0x10($sp)
    /* 59CCC 80069CCC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 59CD0 80069CD0 0800E003 */  jr         $ra
    /* 59CD4 80069CD4 00000000 */   nop
endlabel DrawSLine__Fi
