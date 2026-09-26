.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddArmorStand__Fi, 0x88

glabel AddArmorStand__Fi
    /* 1CB30 80156728 1280023C */  lui        $v0, %hi(armorFlag)
    /* 1CB34 8015672C 94C14290 */  lbu        $v0, %lo(armorFlag)($v0)
    /* 1CB38 80156730 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CB3C 80156734 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CB40 80156738 21808000 */  addu       $s0, $a0, $zero
    /* 1CB44 8015673C 0D004014 */  bnez       $v0, .L80156774
    /* 1CB48 80156740 1400BFAF */   sw        $ra, 0x14($sp)
    /* 1CB4C 80156744 40101000 */  sll        $v0, $s0, 1
    /* 1CB50 80156748 21105000 */  addu       $v0, $v0, $s0
    /* 1CB54 8015674C 80100200 */  sll        $v0, $v0, 2
    /* 1CB58 80156750 23105000 */  subu       $v0, $v0, $s0
    /* 1CB5C 80156754 80100200 */  sll        $v0, $v0, 2
    /* 1CB60 80156758 02000324 */  addiu      $v1, $zero, 0x2
    /* 1CB64 8015675C 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 1CB68 80156760 21082200 */  addu       $at, $at, $v0
    /* 1CB6C 80156764 718C23A0 */  sb         $v1, %lo(object + 0x25)($at)
    /* 1CB70 80156768 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 1CB74 8015676C 21082200 */  addu       $at, $at, $v0
    /* 1CB78 80156770 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
  .L80156774:
    /* 1CB7C 80156774 B7F6000C */  jal        GetRndSeed__Fv
    /* 1CB80 80156778 00000000 */   nop
    /* 1CB84 8015677C 40181000 */  sll        $v1, $s0, 1
    /* 1CB88 80156780 21187000 */  addu       $v1, $v1, $s0
    /* 1CB8C 80156784 80180300 */  sll        $v1, $v1, 2
    /* 1CB90 80156788 23187000 */  subu       $v1, $v1, $s0
    /* 1CB94 8015678C 80180300 */  sll        $v1, $v1, 2
    /* 1CB98 80156790 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1CB9C 80156794 21082300 */  addu       $at, $at, $v1
    /* 1CBA0 80156798 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1CBA4 8015679C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1CBA8 801567A0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CBAC 801567A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CBB0 801567A8 0800E003 */  jr         $ra
    /* 1CBB4 801567AC 00000000 */   nop
endlabel AddArmorStand__Fi
