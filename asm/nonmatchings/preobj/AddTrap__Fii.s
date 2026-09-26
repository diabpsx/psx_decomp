.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddTrap__Fii, 0xF4

glabel AddTrap__Fii
    /* 1CA3C 80156634 1280033C */  lui        $v1, %hi(currlevel)
    /* 1CA40 80156638 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1CA44 8015663C AAAA023C */  lui        $v0, (0xAAAAAAAB >> 16)
    /* 1CA48 80156640 ABAA4234 */  ori        $v0, $v0, (0xAAAAAAAB & 0xFFFF)
    /* 1CA4C 80156644 19006200 */  multu      $v1, $v0
    /* 1CA50 80156648 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CA54 8015664C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CA58 80156650 21808000 */  addu       $s0, $a0, $zero
    /* 1CA5C 80156654 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1CA60 80156658 10280000 */  mfhi       $a1
    /* 1CA64 8015665C 42200500 */  srl        $a0, $a1, 1
    /* 1CA68 80156660 FF008430 */  andi       $a0, $a0, 0xFF
    /* 1CA6C 80156664 C9F6000C */  jal        ENG_random__Fl
    /* 1CA70 80156668 01008424 */   addiu     $a0, $a0, 0x1
    /* 1CA74 8015666C 21204000 */  addu       $a0, $v0, $zero
    /* 1CA78 80156670 0A008014 */  bnez       $a0, .L8015669C
    /* 1CA7C 80156674 01000224 */   addiu     $v0, $zero, 0x1
    /* 1CA80 80156678 40101000 */  sll        $v0, $s0, 1
    /* 1CA84 8015667C 21105000 */  addu       $v0, $v0, $s0
    /* 1CA88 80156680 80100200 */  sll        $v0, $v0, 2
    /* 1CA8C 80156684 23105000 */  subu       $v0, $v0, $s0
    /* 1CA90 80156688 80100200 */  sll        $v0, $v0, 2
    /* 1CA94 8015668C 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 1CA98 80156690 21082200 */  addu       $at, $at, $v0
    /* 1CA9C 80156694 5E8C20A4 */  sh         $zero, %lo(object + 0x12)($at)
    /* 1CAA0 80156698 01000224 */  addiu      $v0, $zero, 0x1
  .L8015669C:
    /* 1CAA4 8015669C 0B008214 */  bne        $a0, $v0, .L801566CC
    /* 1CAA8 801566A0 02000224 */   addiu     $v0, $zero, 0x2
    /* 1CAAC 801566A4 40101000 */  sll        $v0, $s0, 1
    /* 1CAB0 801566A8 21105000 */  addu       $v0, $v0, $s0
    /* 1CAB4 801566AC 80100200 */  sll        $v0, $v0, 2
    /* 1CAB8 801566B0 23105000 */  subu       $v0, $v0, $s0
    /* 1CABC 801566B4 80100200 */  sll        $v0, $v0, 2
    /* 1CAC0 801566B8 01000324 */  addiu      $v1, $zero, 0x1
    /* 1CAC4 801566BC 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 1CAC8 801566C0 21082200 */  addu       $at, $at, $v0
    /* 1CACC 801566C4 5E8C23A4 */  sh         $v1, %lo(object + 0x12)($at)
    /* 1CAD0 801566C8 02000224 */  addiu      $v0, $zero, 0x2
  .L801566CC:
    /* 1CAD4 801566CC 0A008214 */  bne        $a0, $v0, .L801566F8
    /* 1CAD8 801566D0 40101000 */   sll       $v0, $s0, 1
    /* 1CADC 801566D4 21105000 */  addu       $v0, $v0, $s0
    /* 1CAE0 801566D8 80100200 */  sll        $v0, $v0, 2
    /* 1CAE4 801566DC 23105000 */  subu       $v0, $v0, $s0
    /* 1CAE8 801566E0 80100200 */  sll        $v0, $v0, 2
    /* 1CAEC 801566E4 07000324 */  addiu      $v1, $zero, 0x7
    /* 1CAF0 801566E8 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 1CAF4 801566EC 21082200 */  addu       $at, $at, $v0
    /* 1CAF8 801566F0 5E8C23A4 */  sh         $v1, %lo(object + 0x12)($at)
    /* 1CAFC 801566F4 40101000 */  sll        $v0, $s0, 1
  .L801566F8:
    /* 1CB00 801566F8 21105000 */  addu       $v0, $v0, $s0
    /* 1CB04 801566FC 80100200 */  sll        $v0, $v0, 2
    /* 1CB08 80156700 23105000 */  subu       $v0, $v0, $s0
    /* 1CB0C 80156704 80100200 */  sll        $v0, $v0, 2
    /* 1CB10 80156708 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1CB14 8015670C 21082200 */  addu       $at, $at, $v0
    /* 1CB18 80156710 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 1CB1C 80156714 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1CB20 80156718 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CB24 8015671C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CB28 80156720 0800E003 */  jr         $ra
    /* 1CB2C 80156724 00000000 */   nop
endlabel AddTrap__Fii
