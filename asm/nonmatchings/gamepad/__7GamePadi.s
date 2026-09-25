.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __7GamePadi, 0xB4

glabel __7GamePadi
    /* 6857C 8007857C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 68580 80078580 1000B0AF */  sw         $s0, 0x10($sp)
    /* 68584 80078584 21808000 */  addu       $s0, $a0, $zero
    /* 68588 80078588 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6858C 8007858C 2188A000 */  addu       $s1, $a1, $zero
    /* 68590 80078590 21200000 */  addu       $a0, $zero, $zero
    /* 68594 80078594 40101100 */  sll        $v0, $s1, 1
    /* 68598 80078598 21105100 */  addu       $v0, $v0, $s1
    /* 6859C 8007859C 80100200 */  sll        $v0, $v0, 2
    /* 685A0 800785A0 21105100 */  addu       $v0, $v0, $s1
    /* 685A4 800785A4 00110200 */  sll        $v0, $v0, 4
    /* 685A8 800785A8 23105100 */  subu       $v0, $v0, $s1
    /* 685AC 800785AC 80100200 */  sll        $v0, $v0, 2
    /* 685B0 800785B0 21105100 */  addu       $v0, $v0, $s1
    /* 685B4 800785B4 C0100200 */  sll        $v0, $v0, 3
    /* 685B8 800785B8 0E80033C */  lui        $v1, %hi(plr)
    /* 685BC 800785BC 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 685C0 800785C0 21104300 */  addu       $v0, $v0, $v1
    /* 685C4 800785C4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 685C8 800785C8 000002AE */  sw         $v0, 0x0($s0)
    /* 685CC 800785CC 01000224 */  addiu      $v0, $zero, 0x1
    /* 685D0 800785D0 500000AE */  sw         $zero, 0x50($s0)
    /* 685D4 800785D4 540000AE */  sw         $zero, 0x54($s0)
    /* 685D8 800785D8 4C0011A2 */  sb         $s1, 0x4C($s0)
    /* 685DC 800785DC 4D0002A2 */  sb         $v0, 0x4D($s0)
    /* 685E0 800785E0 5C0000AE */  sw         $zero, 0x5C($s0)
    /* 685E4 800785E4 B672020C */  jal        restore_controller_settings__F8CTRL_SET
    /* 685E8 800785E8 D00000A2 */   sb        $zero, 0xD0($s0)
    /* 685EC 800785EC 0D80053C */  lui        $a1, %hi(txt_actions)
    /* 685F0 800785F0 0CC4A524 */  addiu      $a1, $a1, %lo(txt_actions)
    /* 685F4 800785F4 B0E1010C */  jal        SetAllButtons__7GamePadP11KEY_ASSIGNS
    /* 685F8 800785F8 21200002 */   addu      $a0, $s0, $zero
    /* 685FC 800785FC E4DF010C */  jal        ClrCursor__Fi
    /* 68600 80078600 21202002 */   addu      $a0, $s1, $zero
    /* 68604 80078604 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 68608 80078608 4C000482 */  lb         $a0, 0x4C($s0)
    /* 6860C 8007860C 7782020C */  jal        SetQSpell__Fiii
    /* 68610 80078610 04000624 */   addiu     $a2, $zero, 0x4
    /* 68614 80078614 21100002 */  addu       $v0, $s0, $zero
    /* 68618 80078618 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6861C 8007861C 1400B18F */  lw         $s1, 0x14($sp)
    /* 68620 80078620 1000B08F */  lw         $s0, 0x10($sp)
    /* 68624 80078624 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 68628 80078628 0800E003 */  jr         $ra
    /* 6862C 8007862C 00000000 */   nop
endlabel __7GamePadi
