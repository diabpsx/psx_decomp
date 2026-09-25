.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RndSmithItem__Fi, 0x108

glabel RndSmithItem__Fi
    /* 3966C 8004966C D0F7BD27 */  addiu      $sp, $sp, -0x830
    /* 39670 80049670 2408B5AF */  sw         $s5, 0x824($sp)
    /* 39674 80049674 21A88000 */  addu       $s5, $a0, $zero
    /* 39678 80049678 1C08B3AF */  sw         $s3, 0x81C($sp)
    /* 3967C 8004967C 21980000 */  addu       $s3, $zero, $zero
    /* 39680 80049680 1808B2AF */  sw         $s2, 0x818($sp)
    /* 39684 80049684 01001224 */  addiu      $s2, $zero, 0x1
    /* 39688 80049688 1180033C */  lui        $v1, %hi(AllItemsList + 0x22)
    /* 3968C 8004968C C6136380 */  lb         $v1, %lo(AllItemsList + 0x22)($v1)
    /* 39690 80049690 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 39694 80049694 2808BFAF */  sw         $ra, 0x828($sp)
    /* 39698 80049698 2008B4AF */  sw         $s4, 0x820($sp)
    /* 3969C 8004969C 1408B1AF */  sw         $s1, 0x814($sp)
    /* 396A0 800496A0 23006210 */  beq        $v1, $v0, .L80049730
    /* 396A4 800496A4 1008B0AF */   sw        $s0, 0x810($sp)
    /* 396A8 800496A8 20001124 */  addiu      $s1, $zero, 0x20
    /* 396AC 800496AC 1000B027 */  addiu      $s0, $sp, 0x10
  .L800496B0:
    /* 396B0 800496B0 1180013C */  lui        $at, %hi(AllItemsList)
    /* 396B4 800496B4 21083100 */  addu       $at, $at, $s1
    /* 396B8 800496B8 A4133490 */  lbu        $s4, %lo(AllItemsList)($at)
    /* 396BC 800496BC 00000000 */  nop
    /* 396C0 800496C0 14008012 */  beqz       $s4, .L80049714
    /* 396C4 800496C4 00000000 */   nop
    /* 396C8 800496C8 8225010C */  jal        SmithItemOk__Fi
    /* 396CC 800496CC 21204002 */   addu      $a0, $s2, $zero
    /* 396D0 800496D0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 396D4 800496D4 0F004010 */  beqz       $v0, .L80049714
    /* 396D8 800496D8 00000000 */   nop
    /* 396DC 800496DC 1180013C */  lui        $at, %hi(AllItemsList + 0xA)
    /* 396E0 800496E0 21083100 */  addu       $at, $at, $s1
    /* 396E4 800496E4 AE132280 */  lb         $v0, %lo(AllItemsList + 0xA)($at)
    /* 396E8 800496E8 00000000 */  nop
    /* 396EC 800496EC 2A10A202 */  slt        $v0, $s5, $v0
    /* 396F0 800496F0 08004014 */  bnez       $v0, .L80049714
    /* 396F4 800496F4 02000224 */   addiu     $v0, $zero, 0x2
    /* 396F8 800496F8 000012AE */  sw         $s2, 0x0($s0)
    /* 396FC 800496FC 04001026 */  addiu      $s0, $s0, 0x4
    /* 39700 80049700 04008216 */  bne        $s4, $v0, .L80049714
    /* 39704 80049704 01007326 */   addiu     $s3, $s3, 0x1
    /* 39708 80049708 000012AE */  sw         $s2, 0x0($s0)
    /* 3970C 8004970C 04001026 */  addiu      $s0, $s0, 0x4
    /* 39710 80049710 01007326 */  addiu      $s3, $s3, 0x1
  .L80049714:
    /* 39714 80049714 20003126 */  addiu      $s1, $s1, 0x20
    /* 39718 80049718 1180013C */  lui        $at, %hi(AllItemsList + 0x2)
    /* 3971C 8004971C 21083100 */  addu       $at, $at, $s1
    /* 39720 80049720 A6132380 */  lb         $v1, %lo(AllItemsList + 0x2)($at)
    /* 39724 80049724 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 39728 80049728 E1FF6214 */  bne        $v1, $v0, .L800496B0
    /* 3972C 8004972C 01005226 */   addiu     $s2, $s2, 0x1
  .L80049730:
    /* 39730 80049730 C9F6000C */  jal        ENG_random__Fl
    /* 39734 80049734 21206002 */   addu      $a0, $s3, $zero
    /* 39738 80049738 80100200 */  sll        $v0, $v0, 2
    /* 3973C 8004973C 2110A203 */  addu       $v0, $sp, $v0
    /* 39740 80049740 1000428C */  lw         $v0, 0x10($v0)
    /* 39744 80049744 00000000 */  nop
    /* 39748 80049748 01004224 */  addiu      $v0, $v0, 0x1
    /* 3974C 8004974C 2808BF8F */  lw         $ra, 0x828($sp)
    /* 39750 80049750 2408B58F */  lw         $s5, 0x824($sp)
    /* 39754 80049754 2008B48F */  lw         $s4, 0x820($sp)
    /* 39758 80049758 1C08B38F */  lw         $s3, 0x81C($sp)
    /* 3975C 8004975C 1808B28F */  lw         $s2, 0x818($sp)
    /* 39760 80049760 1408B18F */  lw         $s1, 0x814($sp)
    /* 39764 80049764 1008B08F */  lw         $s0, 0x810($sp)
    /* 39768 80049768 3008BD27 */  addiu      $sp, $sp, 0x830
    /* 3976C 8004976C 0800E003 */  jr         $ra
    /* 39770 80049770 00000000 */   nop
endlabel RndSmithItem__Fi
