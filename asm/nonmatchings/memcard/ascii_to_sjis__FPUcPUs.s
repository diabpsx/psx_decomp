.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ascii_to_sjis__FPUcPUs, 0x88

glabel ascii_to_sjis__FPUcPUs
    /* 8C84 8014287C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8C88 80142880 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8C8C 80142884 21888000 */  addu       $s1, $a0, $zero
    /* 8C90 80142888 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8C94 8014288C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8C98 80142890 00002492 */  lbu        $a0, 0x0($s1)
    /* 8C9C 80142894 00000000 */  nop
    /* 8CA0 80142898 12008010 */  beqz       $a0, .L801428E4
    /* 8CA4 8014289C 2180A000 */   addu      $s0, $a1, $zero
  .L801428A0:
    /* 8CA8 801428A0 80008230 */  andi       $v0, $a0, 0x80
    /* 8CAC 801428A4 06004010 */  beqz       $v0, .L801428C0
    /* 8CB0 801428A8 00120400 */   sll       $v0, $a0, 8
    /* 8CB4 801428AC 01002392 */  lbu        $v1, 0x1($s1)
    /* 8CB8 801428B0 02003126 */  addiu      $s1, $s1, 0x2
    /* 8CBC 801428B4 25186200 */  or         $v1, $v1, $v0
    /* 8CC0 801428B8 350A0508 */  j          .L801428D4
    /* 8CC4 801428BC 000003A6 */   sh        $v1, 0x0($s0)
  .L801428C0:
    /* 8CC8 801428C0 01003126 */  addiu      $s1, $s1, 0x1
    /* 8CCC 801428C4 00260400 */  sll        $a0, $a0, 24
    /* 8CD0 801428C8 DD09050C */  jal        to_sjis__Fc
    /* 8CD4 801428CC 03260400 */   sra       $a0, $a0, 24
    /* 8CD8 801428D0 000002A6 */  sh         $v0, 0x0($s0)
  .L801428D4:
    /* 8CDC 801428D4 00002492 */  lbu        $a0, 0x0($s1)
    /* 8CE0 801428D8 00000000 */  nop
    /* 8CE4 801428DC F0FF8014 */  bnez       $a0, .L801428A0
    /* 8CE8 801428E0 02001026 */   addiu     $s0, $s0, 0x2
  .L801428E4:
    /* 8CEC 801428E4 000000A6 */  sh         $zero, 0x0($s0)
    /* 8CF0 801428E8 020000A6 */  sh         $zero, 0x2($s0)
    /* 8CF4 801428EC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8CF8 801428F0 1400B18F */  lw         $s1, 0x14($sp)
    /* 8CFC 801428F4 1000B08F */  lw         $s0, 0x10($sp)
    /* 8D00 801428F8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8D04 801428FC 0800E003 */  jr         $ra
    /* 8D08 80142900 00000000 */   nop
endlabel ascii_to_sjis__FPUcPUs
