.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TalktoMonster__Fi, 0x140

glabel TalktoMonster__Fi
    /* 1C9E4 801565DC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1C9E8 801565E0 40100400 */  sll        $v0, $a0, 1
    /* 1C9EC 801565E4 21104400 */  addu       $v0, $v0, $a0
    /* 1C9F0 801565E8 80100200 */  sll        $v0, $v0, 2
    /* 1C9F4 801565EC 21104400 */  addu       $v0, $v0, $a0
    /* 1C9F8 801565F0 C0100200 */  sll        $v0, $v0, 3
    /* 1C9FC 801565F4 1080033C */  lui        $v1, %hi(monster)
    /* 1CA00 801565F8 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 1CA04 801565FC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1CA08 80156600 21804300 */  addu       $s0, $v0, $v1
    /* 1CA0C 80156604 11000324 */  addiu      $v1, $zero, 0x11
    /* 1CA10 80156608 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1CA14 8015660C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1CA18 80156610 33000282 */  lb         $v0, 0x33($s0)
    /* 1CA1C 80156614 3D001192 */  lbu        $s1, 0x3D($s0)
    /* 1CA20 80156618 3A004310 */  beq        $v0, $v1, .L80156704
    /* 1CA24 8015661C 11000224 */   addiu     $v0, $zero, 0x11
    /* 1CA28 80156620 4C000392 */  lbu        $v1, 0x4C($s0)
    /* 1CA2C 80156624 330002A2 */  sb         $v0, 0x33($s0)
    /* 1CA30 80156628 17000224 */  addiu      $v0, $zero, 0x17
    /* 1CA34 8015662C 03006210 */  beq        $v1, $v0, .L8015663C
    /* 1CA38 80156630 1E000224 */   addiu     $v0, $zero, 0x1E
    /* 1CA3C 80156634 33006214 */  bne        $v1, $v0, .L80156704
    /* 1CA40 80156638 00000000 */   nop
  .L8015663C:
    /* 1CA44 8015663C DC9E010C */  jal        QuestStatus__Fi
    /* 1CA48 80156640 07000424 */   addiu     $a0, $zero, 0x7
    /* 1CA4C 80156644 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1CA50 80156648 18004010 */  beqz       $v0, .L801566AC
    /* 1CA54 8015664C 02000224 */   addiu     $v0, $zero, 0x2
    /* 1CA58 80156650 0E80033C */  lui        $v1, %hi(quests + 0x9B)
    /* 1CA5C 80156654 DBDA6390 */  lbu        $v1, %lo(quests + 0x9B)($v1)
    /* 1CA60 80156658 00000000 */  nop
    /* 1CA64 8015665C 13006214 */  bne        $v1, $v0, .L801566AC
    /* 1CA68 80156660 21202002 */   addu      $a0, $s1, $zero
    /* 1CA6C 80156664 0C000524 */  addiu      $a1, $zero, 0xC
    /* 1CA70 80156668 DAED000C */  jal        PlrHasItem__FiiRi
    /* 1CA74 8015666C 1000A627 */   addiu     $a2, $sp, 0x10
    /* 1CA78 80156670 0E004010 */  beqz       $v0, .L801566AC
    /* 1CA7C 80156674 00000000 */   nop
    /* 1CA80 80156678 1000A58F */  lw         $a1, 0x10($sp)
    /* 1CA84 8015667C BF75050C */  jal        RemoveInvItem__Fii
    /* 1CA88 80156680 21202002 */   addu      $a0, $s1, $zero
    /* 1CA8C 80156684 01000424 */  addiu      $a0, $zero, 0x1
    /* 1CA90 80156688 07000524 */  addiu      $a1, $zero, 0x7
    /* 1CA94 8015668C 03000224 */  addiu      $v0, $zero, 0x3
    /* 1CA98 80156690 0E80013C */  lui        $at, %hi(quests + 0x8E)
    /* 1CA9C 80156694 CEDA22A0 */  sb         $v0, %lo(quests + 0x8E)($at)
    /* 1CAA0 80156698 16000224 */  addiu      $v0, $zero, 0x16
    /* 1CAA4 8015669C 000002AE */  sw         $v0, 0x0($s0)
    /* 1CAA8 801566A0 06000224 */  addiu      $v0, $zero, 0x6
    /* 1CAAC 801566A4 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 1CAB0 801566A8 490002A2 */   sb        $v0, 0x49($s0)
  .L801566AC:
    /* 1CAB4 801566AC DC9E010C */  jal        QuestStatus__Fi
    /* 1CAB8 801566B0 04000424 */   addiu     $a0, $zero, 0x4
    /* 1CABC 801566B4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1CAC0 801566B8 12004010 */  beqz       $v0, .L80156704
    /* 1CAC4 801566BC 00000000 */   nop
    /* 1CAC8 801566C0 0000028E */  lw         $v0, 0x0($s0)
    /* 1CACC 801566C4 00000000 */  nop
    /* 1CAD0 801566C8 51004228 */  slti       $v0, $v0, 0x51
    /* 1CAD4 801566CC 0D004014 */  bnez       $v0, .L80156704
    /* 1CAD8 801566D0 21202002 */   addu      $a0, $s1, $zero
    /* 1CADC 801566D4 0F000524 */  addiu      $a1, $zero, 0xF
    /* 1CAE0 801566D8 DAED000C */  jal        PlrHasItem__FiiRi
    /* 1CAE4 801566DC 1000A627 */   addiu     $a2, $sp, 0x10
    /* 1CAE8 801566E0 08004010 */  beqz       $v0, .L80156704
    /* 1CAEC 801566E4 00000000 */   nop
    /* 1CAF0 801566E8 1000A58F */  lw         $a1, 0x10($sp)
    /* 1CAF4 801566EC BF75050C */  jal        RemoveInvItem__Fii
    /* 1CAF8 801566F0 21202002 */   addu      $a0, $s1, $zero
    /* 1CAFC 801566F4 53000224 */  addiu      $v0, $zero, 0x53
    /* 1CB00 801566F8 000002AE */  sw         $v0, 0x0($s0)
    /* 1CB04 801566FC 06000224 */  addiu      $v0, $zero, 0x6
    /* 1CB08 80156700 490002A2 */  sb         $v0, 0x49($s0)
  .L80156704:
    /* 1CB0C 80156704 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1CB10 80156708 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1CB14 8015670C 1800B08F */  lw         $s0, 0x18($sp)
    /* 1CB18 80156710 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1CB1C 80156714 0800E003 */  jr         $ra
    /* 1CB20 80156718 00000000 */   nop
endlabel TalktoMonster__Fi
