.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RespawnItem__FiUc, 0x1B8

glabel RespawnItem__FiUc
    /* 35600 80045600 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 35604 80045604 C0100400 */  sll        $v0, $a0, 3
    /* 35608 80045608 23104400 */  subu       $v0, $v0, $a0
    /* 3560C 8004560C 80100200 */  sll        $v0, $v0, 2
    /* 35610 80045610 23104400 */  subu       $v0, $v0, $a0
    /* 35614 80045614 80300200 */  sll        $a2, $v0, 2
    /* 35618 80045618 1400BFAF */  sw         $ra, 0x14($sp)
    /* 3561C 8004561C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 35620 80045620 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 35624 80045624 21082600 */  addu       $at, $at, $a2
    /* 35628 80045628 A01D2290 */  lbu        $v0, %lo(item + 0x4C)($at)
    /* 3562C 8004562C 0D80013C */  lui        $at, %hi(ItemCAnimTbl)
    /* 35630 80045630 21082200 */  addu       $at, $at, $v0
    /* 35634 80045634 E01B2790 */  lbu        $a3, %lo(ItemCAnimTbl)($at)
    /* 35638 80045638 00000000 */  nop
    /* 3563C 8004563C 40100700 */  sll        $v0, $a3, 1
    /* 35640 80045640 1180013C */  lui        $at, %hi(D_801161F4)
    /* 35644 80045644 21082200 */  addu       $at, $at, $v0
    /* 35648 80045648 F4612294 */  lhu        $v0, %lo(D_801161F4)($at)
    /* 3564C 8004564C 0D80013C */  lui        $at, %hi(item + 0x2A)
    /* 35650 80045650 21082600 */  addu       $at, $at, $a2
    /* 35654 80045654 7E1D22A4 */  sh         $v0, %lo(item + 0x2A)($at)
    /* 35658 80045658 0D80013C */  lui        $at, %hi(ItemAnimLs)
    /* 3565C 8004565C 21082700 */  addu       $at, $at, $a3
    /* 35660 80045660 8C1C2290 */  lbu        $v0, %lo(ItemAnimLs)($at)
    /* 35664 80045664 FF00A530 */  andi       $a1, $a1, 0xFF
    /* 35668 80045668 0D80013C */  lui        $at, %hi(item + 0x67)
    /* 3566C 8004566C 21082600 */  addu       $at, $at, $a2
    /* 35670 80045670 BB1D20A0 */  sb         $zero, %lo(item + 0x67)($at)
    /* 35674 80045674 0D80013C */  lui        $at, %hi(item + 0x5E)
    /* 35678 80045678 21082600 */  addu       $at, $at, $a2
    /* 3567C 8004567C B21D20A0 */  sb         $zero, %lo(item + 0x5E)($at)
    /* 35680 80045680 0D80013C */  lui        $at, %hi(item + 0x4E)
    /* 35684 80045684 21082600 */  addu       $at, $at, $a2
    /* 35688 80045688 A21D22A0 */  sb         $v0, %lo(item + 0x4E)($at)
    /* 3568C 8004568C 0C00A010 */  beqz       $a1, .L800456C0
    /* 35690 80045690 01000224 */   addiu     $v0, $zero, 0x1
    /* 35694 80045694 0D80013C */  lui        $at, %hi(item + 0x4F)
    /* 35698 80045698 21082600 */  addu       $at, $at, $a2
    /* 3569C 8004569C A31D22A0 */  sb         $v0, %lo(item + 0x4F)($at)
    /* 356A0 800456A0 0D80013C */  lui        $at, %hi(item + 0x68)
    /* 356A4 800456A4 21082600 */  addu       $at, $at, $a2
    /* 356A8 800456A8 BC1D22A0 */  sb         $v0, %lo(item + 0x68)($at)
    /* 356AC 800456AC 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 356B0 800456B0 21082600 */  addu       $at, $at, $a2
    /* 356B4 800456B4 A41D20A0 */  sb         $zero, %lo(item + 0x50)($at)
    /* 356B8 800456B8 BD150108 */  j          .L800456F4
    /* 356BC 800456BC C0100400 */   sll       $v0, $a0, 3
  .L800456C0:
    /* 356C0 800456C0 0D80013C */  lui        $at, %hi(item + 0x4E)
    /* 356C4 800456C4 21082600 */  addu       $at, $at, $a2
    /* 356C8 800456C8 A21D2390 */  lbu        $v1, %lo(item + 0x4E)($at)
    /* 356CC 800456CC 0D80013C */  lui        $at, %hi(item + 0x68)
    /* 356D0 800456D0 21082600 */  addu       $at, $at, $a2
    /* 356D4 800456D4 BC1D20A0 */  sb         $zero, %lo(item + 0x68)($at)
    /* 356D8 800456D8 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 356DC 800456DC 21082600 */  addu       $at, $at, $a2
    /* 356E0 800456E0 A41D22A0 */  sb         $v0, %lo(item + 0x50)($at)
    /* 356E4 800456E4 0D80013C */  lui        $at, %hi(item + 0x4F)
    /* 356E8 800456E8 21082600 */  addu       $at, $at, $a2
    /* 356EC 800456EC A31D23A0 */  sb         $v1, %lo(item + 0x4F)($at)
    /* 356F0 800456F0 C0100400 */  sll        $v0, $a0, 3
  .L800456F4:
    /* 356F4 800456F4 23104400 */  subu       $v0, $v0, $a0
    /* 356F8 800456F8 80100200 */  sll        $v0, $v0, 2
    /* 356FC 800456FC 23104400 */  subu       $v0, $v0, $a0
    /* 35700 80045700 80800200 */  sll        $s0, $v0, 2
    /* 35704 80045704 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 35708 80045708 21083000 */  addu       $at, $at, $s0
    /* 3570C 8004570C A01D2390 */  lbu        $v1, %lo(item + 0x4C)($at)
    /* 35710 80045710 4C000224 */  addiu      $v0, $zero, 0x4C
    /* 35714 80045714 15006214 */  bne        $v1, $v0, .L8004576C
    /* 35718 80045718 7E000224 */   addiu     $v0, $zero, 0x7E
    /* 3571C 8004571C 01000224 */  addiu      $v0, $zero, 0x1
    /* 35720 80045720 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 35724 80045724 21083000 */  addu       $at, $at, $s0
    /* 35728 80045728 A41D22A0 */  sb         $v0, %lo(item + 0x50)($at)
    /* 3572C 8004572C 80100700 */  sll        $v0, $a3, 2
    /* 35730 80045730 1011838F */  lw         $v1, %gp_rel(ItemAnimSnds)($gp)
    /* 35734 80045734 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 35738 80045738 21083000 */  addu       $at, $at, $s0
    /* 3573C 8004573C A61D2580 */  lb         $a1, %lo(item + 0x52)($at)
    /* 35740 80045740 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 35744 80045744 21083000 */  addu       $at, $at, $s0
    /* 35748 80045748 A71D2680 */  lb         $a2, %lo(item + 0x53)($at)
    /* 3574C 8004574C 21104300 */  addu       $v0, $v0, $v1
    /* 35750 80045750 0000448C */  lw         $a0, 0x0($v0)
    /* 35754 80045754 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 35758 80045758 00000000 */   nop
    /* 3575C 8004575C 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 35760 80045760 21083000 */  addu       $at, $at, $s0
    /* 35764 80045764 A01D2390 */  lbu        $v1, %lo(item + 0x4C)($at)
    /* 35768 80045768 7E000224 */  addiu      $v0, $zero, 0x7E
  .L8004576C:
    /* 3576C 8004576C 04006214 */  bne        $v1, $v0, .L80045780
    /* 35770 80045770 01000224 */   addiu     $v0, $zero, 0x1
    /* 35774 80045774 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 35778 80045778 21083000 */  addu       $at, $at, $s0
    /* 3577C 8004577C A41D22A0 */  sb         $v0, %lo(item + 0x50)($at)
  .L80045780:
    /* 35780 80045780 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 35784 80045784 21083000 */  addu       $at, $at, $s0
    /* 35788 80045788 A01D2390 */  lbu        $v1, %lo(item + 0x4C)($at)
    /* 3578C 8004578C 8C000224 */  addiu      $v0, $zero, 0x8C
    /* 35790 80045790 04006214 */  bne        $v1, $v0, .L800457A4
    /* 35794 80045794 01000224 */   addiu     $v0, $zero, 0x1
    /* 35798 80045798 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 3579C 8004579C 21083000 */  addu       $at, $at, $s0
    /* 357A0 800457A0 A41D22A0 */  sb         $v0, %lo(item + 0x50)($at)
  .L800457A4:
    /* 357A4 800457A4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 357A8 800457A8 1000B08F */  lw         $s0, 0x10($sp)
    /* 357AC 800457AC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 357B0 800457B0 0800E003 */  jr         $ra
    /* 357B4 800457B4 00000000 */   nop
endlabel RespawnItem__FiUc
