.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __13CompLevelMapsRC9CompClass, 0x6C

glabel __13CompLevelMapsRC9CompClass
    /* 71608 80081608 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 7160C 8008160C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 71610 80081610 21908000 */  addu       $s2, $a0, $zero
    /* 71614 80081614 1400B1AF */  sw         $s1, 0x14($sp)
    /* 71618 80081618 04005126 */  addiu      $s1, $s2, 0x4
    /* 7161C 8008161C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 71620 80081620 15001024 */  addiu      $s0, $zero, 0x15
    /* 71624 80081624 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 71628 80081628 FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 7162C 8008162C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 71630 80081630 000045AE */  sw         $a1, 0x0($s2)
  .L80081634:
    /* 71634 80081634 6A08020C */  jal        __4AMap
    /* 71638 80081638 21202002 */   addu      $a0, $s1, $zero
    /* 7163C 8008163C FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 71640 80081640 FCFF1316 */  bne        $s0, $s3, .L80081634
    /* 71644 80081644 10003126 */   addiu     $s1, $s1, 0x10
    /* 71648 80081648 C105020C */  jal        Init__13CompLevelMaps
    /* 7164C 8008164C 21204002 */   addu      $a0, $s2, $zero
    /* 71650 80081650 21104002 */  addu       $v0, $s2, $zero
    /* 71654 80081654 2000BF8F */  lw         $ra, 0x20($sp)
    /* 71658 80081658 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 7165C 8008165C 1800B28F */  lw         $s2, 0x18($sp)
    /* 71660 80081660 1400B18F */  lw         $s1, 0x14($sp)
    /* 71664 80081664 1000B08F */  lw         $s0, 0x10($sp)
    /* 71668 80081668 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 7166C 8008166C 0800E003 */  jr         $ra
    /* 71670 80081670 00000000 */   nop
endlabel __13CompLevelMapsRC9CompClass
