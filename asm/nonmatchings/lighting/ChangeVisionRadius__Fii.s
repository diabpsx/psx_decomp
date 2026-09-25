.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChangeVisionRadius__Fii, 0xB4

glabel ChangeVisionRadius__Fii
    /* 3D61C 8004D61C F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 3D620 8004D620 9C11828F */  lw         $v0, %gp_rel(numvision)($gp)
    /* 3D624 8004D624 00000000 */  nop
    /* 3D628 8004D628 26004018 */  blez       $v0, .L8004D6C4
    /* 3D62C 8004D62C 21400000 */   addu      $t0, $zero, $zero
    /* 3D630 8004D630 01000924 */  addiu      $t1, $zero, 0x1
    /* 3D634 8004D634 0D80073C */  lui        $a3, %hi(VisionList + 0x2)
    /* 3D638 8004D638 D265E724 */  addiu      $a3, $a3, %lo(VisionList + 0x2)
    /* 3D63C 8004D63C 21300000 */  addu       $a2, $zero, $zero
  .L8004D640:
    /* 3D640 8004D640 0D80013C */  lui        $at, %hi(VisionList + 0x4)
    /* 3D644 8004D644 21082600 */  addu       $at, $at, $a2
    /* 3D648 8004D648 D4652280 */  lb         $v0, %lo(VisionList + 0x4)($at)
    /* 3D64C 8004D64C 00000000 */  nop
    /* 3D650 8004D650 16004414 */  bne        $v0, $a0, .L8004D6AC
    /* 3D654 8004D654 00000000 */   nop
    /* 3D658 8004D658 0D80013C */  lui        $at, %hi(VisionList)
    /* 3D65C 8004D65C 21082600 */  addu       $at, $at, $a2
    /* 3D660 8004D660 D0652290 */  lbu        $v0, %lo(VisionList)($at)
    /* 3D664 8004D664 0D80013C */  lui        $at, %hi(VisionList + 0x1)
    /* 3D668 8004D668 21082600 */  addu       $at, $at, $a2
    /* 3D66C 8004D66C D1652390 */  lbu        $v1, %lo(VisionList + 0x1)($at)
    /* 3D670 8004D670 0D80013C */  lui        $at, %hi(VisionList + 0x6)
    /* 3D674 8004D674 21082600 */  addu       $at, $at, $a2
    /* 3D678 8004D678 D66529A0 */  sb         $t1, %lo(VisionList + 0x6)($at)
    /* 3D67C 8004D67C 0D80013C */  lui        $at, %hi(VisionList + 0x7)
    /* 3D680 8004D680 21082600 */  addu       $at, $at, $a2
    /* 3D684 8004D684 D76522A0 */  sb         $v0, %lo(VisionList + 0x7)($at)
    /* 3D688 8004D688 0D80013C */  lui        $at, %hi(VisionList + 0x8)
    /* 3D68C 8004D68C 21082600 */  addu       $at, $at, $a2
    /* 3D690 8004D690 D86523A0 */  sb         $v1, %lo(VisionList + 0x8)($at)
    /* 3D694 8004D694 0000E294 */  lhu        $v0, 0x0($a3)
    /* 3D698 8004D698 0D80013C */  lui        $at, %hi(VisionList + 0x9)
    /* 3D69C 8004D69C 21082600 */  addu       $at, $at, $a2
    /* 3D6A0 8004D6A0 D96522A0 */  sb         $v0, %lo(VisionList + 0x9)($at)
    /* 3D6A4 8004D6A4 0000E5A4 */  sh         $a1, 0x0($a3)
    /* 3D6A8 8004D6A8 A01189A3 */  sb         $t1, %gp_rel(dovision)($gp)
  .L8004D6AC:
    /* 3D6AC 8004D6AC 0E00E724 */  addiu      $a3, $a3, 0xE
    /* 3D6B0 8004D6B0 9C11828F */  lw         $v0, %gp_rel(numvision)($gp)
    /* 3D6B4 8004D6B4 01000825 */  addiu      $t0, $t0, 0x1
    /* 3D6B8 8004D6B8 2A100201 */  slt        $v0, $t0, $v0
    /* 3D6BC 8004D6BC E0FF4014 */  bnez       $v0, .L8004D640
    /* 3D6C0 8004D6C0 0E00C624 */   addiu     $a2, $a2, 0xE
  .L8004D6C4:
    /* 3D6C4 8004D6C4 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 3D6C8 8004D6C8 0800E003 */  jr         $ra
    /* 3D6CC 8004D6CC 00000000 */   nop
endlabel ChangeVisionRadius__Fii
