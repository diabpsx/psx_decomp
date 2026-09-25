.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawDurIcon4Item__FPC10ItemStructii, 0x84

glabel DrawDurIcon4Item__FPC10ItemStructii
    /* 26074 80036074 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 26078 80036078 2C008384 */  lh         $v1, 0x2C($a0)
    /* 2607C 8003607C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 26080 80036080 06006210 */  beq        $v1, $v0, .L8003609C
    /* 26084 80036084 21386000 */   addu      $a3, $v1, $zero
    /* 26088 80036088 3E008284 */  lh         $v0, 0x3E($a0)
    /* 2608C 8003608C 00000000 */  nop
    /* 26090 80036090 06004228 */  slti       $v0, $v0, 0x6
    /* 26094 80036094 03004014 */  bnez       $v0, .L800360A4
    /* 26098 80036098 00000000 */   nop
  .L8003609C:
    /* 2609C 8003609C 3BD80008 */  j          .L800360EC
    /* 260A0 800360A0 2110A000 */   addu      $v0, $a1, $zero
  .L800360A4:
    /* 260A4 800360A4 1100C014 */  bnez       $a2, .L800360EC
    /* 260A8 800360A8 D8FFA224 */   addiu     $v0, $a1, -0x28
    /* 260AC 800360AC 55008380 */  lb         $v1, 0x55($a0)
    /* 260B0 800360B0 01000224 */  addiu      $v0, $zero, 0x1
    /* 260B4 800360B4 0D006214 */  bne        $v1, $v0, .L800360EC
    /* 260B8 800360B8 D8FFA224 */   addiu     $v0, $a1, -0x28
    /* 260BC 800360BC FFFFE224 */  addiu      $v0, $a3, -0x1
    /* 260C0 800360C0 00140200 */  sll        $v0, $v0, 16
    /* 260C4 800360C4 031C0200 */  sra        $v1, $v0, 16
    /* 260C8 800360C8 0A00622C */  sltiu      $v0, $v1, 0xA
    /* 260CC 800360CC 06004010 */  beqz       $v0, .L800360E8
    /* 260D0 800360D0 80100300 */   sll       $v0, $v1, 2
    /* 260D4 800360D4 1180013C */  lui        $at, %hi(D_801110FC)
    /* 260D8 800360D8 21082200 */  addu       $at, $at, $v0
    /* 260DC 800360DC FC10228C */  lw         $v0, %lo(D_801110FC)($at)
    /* 260E0 800360E0 3BD80008 */  j          .L800360EC
    /* 260E4 800360E4 D8FFA224 */   addiu     $v0, $a1, -0x28
  .L800360E8:
    /* 260E8 800360E8 D8FFA224 */  addiu      $v0, $a1, -0x28
  .L800360EC:
    /* 260EC 800360EC 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 260F0 800360F0 0800E003 */  jr         $ra
    /* 260F4 800360F4 00000000 */   nop
endlabel DrawDurIcon4Item__FPC10ItemStructii
