.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetObjectStr__Fi, 0x4BC

glabel GetObjectStr__Fi
    /* 4F4C8 8005F4C8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 4F4CC 8005F4CC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 4F4D0 8005F4D0 21908000 */  addu       $s2, $a0, $zero
    /* 4F4D4 8005F4D4 40101200 */  sll        $v0, $s2, 1
    /* 4F4D8 8005F4D8 21105200 */  addu       $v0, $v0, $s2
    /* 4F4DC 8005F4DC 80100200 */  sll        $v0, $v0, 2
    /* 4F4E0 8005F4E0 23105200 */  subu       $v0, $v0, $s2
    /* 4F4E4 8005F4E4 80100200 */  sll        $v0, $v0, 2
    /* 4F4E8 8005F4E8 2400BFAF */  sw         $ra, 0x24($sp)
    /* 4F4EC 8005F4EC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 4F4F0 8005F4F0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 4F4F4 8005F4F4 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4F4F8 8005F4F8 21082200 */  addu       $at, $at, $v0
    /* 4F4FC 8005F4FC 6A8C2290 */  lbu        $v0, %lo(object + 0x1E)($at)
    /* 4F500 8005F500 00000000 */  nop
    /* 4F504 8005F504 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4F508 8005F508 00160200 */  sll        $v0, $v0, 24
    /* 4F50C 8005F50C 031E0200 */  sra        $v1, $v0, 24
    /* 4F510 8005F510 6100622C */  sltiu      $v0, $v1, 0x61
    /* 4F514 8005F514 DF004010 */  beqz       $v0, .L8005F894
    /* 4F518 8005F518 80100300 */   sll       $v0, $v1, 2
    /* 4F51C 8005F51C 1180013C */  lui        $at, %hi(jtbl_80117440)
    /* 4F520 8005F520 21082200 */  addu       $at, $at, $v0
    /* 4F524 8005F524 4074228C */  lw         $v0, %lo(jtbl_80117440)($at)
    /* 4F528 8005F528 00000000 */  nop
    /* 4F52C 8005F52C 08004000 */  jr         $v0
    /* 4F530 8005F530 00000000 */   nop
  jlabel .L8005F534
    /* 4F534 8005F534 1B7E0108 */  j          .L8005F86C
    /* 4F538 8005F538 DA000424 */   addiu     $a0, $zero, 0xDA
  jlabel .L8005F53C
    /* 4F53C 8005F53C 1B7E0108 */  j          .L8005F86C
    /* 4F540 8005F540 48020424 */   addiu     $a0, $zero, 0x248
  jlabel .L8005F544
    /* 4F544 8005F544 40101200 */  sll        $v0, $s2, 1
    /* 4F548 8005F548 21105200 */  addu       $v0, $v0, $s2
    /* 4F54C 8005F54C 80100200 */  sll        $v0, $v0, 2
    /* 4F550 8005F550 23105200 */  subu       $v0, $v0, $s2
    /* 4F554 8005F554 80800200 */  sll        $s0, $v0, 2
    /* 4F558 8005F558 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4F55C 8005F55C 21083000 */  addu       $at, $at, $s0
    /* 4F560 8005F560 608C2384 */  lh         $v1, %lo(object + 0x14)($at)
    /* 4F564 8005F564 01000224 */  addiu      $v0, $zero, 0x1
    /* 4F568 8005F568 0B006214 */  bne        $v1, $v0, .L8005F598
    /* 4F56C 8005F56C 00000000 */   nop
    /* 4F570 8005F570 4AED010C */  jal        GetStr__Fi
    /* 4F574 8005F574 F3020424 */   addiu     $a0, $zero, 0x2F3
    /* 4F578 8005F578 1280043C */  lui        $a0, %hi(sel_data)
    /* 4F57C 8005F57C 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 4F580 8005F580 21284000 */  addu       $a1, $v0, $zero
    /* 4F584 8005F584 0D80023C */  lui        $v0, %hi(_infostr)
    /* 4F588 8005F588 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 4F58C 8005F58C 00220400 */  sll        $a0, $a0, 8
    /* 4F590 8005F590 F240000C */  jal        strcpy
    /* 4F594 8005F594 21208200 */   addu      $a0, $a0, $v0
  .L8005F598:
    /* 4F598 8005F598 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4F59C 8005F59C 21083000 */  addu       $at, $at, $s0
    /* 4F5A0 8005F5A0 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 4F5A4 8005F5A4 00000000 */  nop
    /* 4F5A8 8005F5A8 0B004014 */  bnez       $v0, .L8005F5D8
    /* 4F5AC 8005F5AC 00000000 */   nop
    /* 4F5B0 8005F5B0 4AED010C */  jal        GetStr__Fi
    /* 4F5B4 8005F5B4 BD000424 */   addiu     $a0, $zero, 0xBD
    /* 4F5B8 8005F5B8 1280043C */  lui        $a0, %hi(sel_data)
    /* 4F5BC 8005F5BC 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 4F5C0 8005F5C0 21284000 */  addu       $a1, $v0, $zero
    /* 4F5C4 8005F5C4 0D80023C */  lui        $v0, %hi(_infostr)
    /* 4F5C8 8005F5C8 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 4F5CC 8005F5CC 00220400 */  sll        $a0, $a0, 8
    /* 4F5D0 8005F5D0 F240000C */  jal        strcpy
    /* 4F5D4 8005F5D4 21208200 */   addu      $a0, $a0, $v0
  .L8005F5D8:
    /* 4F5D8 8005F5D8 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4F5DC 8005F5DC 21083000 */  addu       $at, $at, $s0
    /* 4F5E0 8005F5E0 608C2384 */  lh         $v1, %lo(object + 0x14)($at)
    /* 4F5E4 8005F5E4 02000224 */  addiu      $v0, $zero, 0x2
    /* 4F5E8 8005F5E8 AA006214 */  bne        $v1, $v0, .L8005F894
    /* 4F5EC 8005F5EC 00000000 */   nop
    /* 4F5F0 8005F5F0 1B7E0108 */  j          .L8005F86C
    /* 4F5F4 8005F5F4 5E000424 */   addiu     $a0, $zero, 0x5E
  jlabel .L8005F5F8
    /* 4F5F8 8005F5F8 1280023C */  lui        $v0, %hi(setlevel)
    /* 4F5FC 8005F5FC 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 4F600 8005F600 00000000 */  nop
    /* 4F604 8005F604 A3004010 */  beqz       $v0, .L8005F894
    /* 4F608 8005F608 02000224 */   addiu     $v0, $zero, 0x2
    /* 4F60C 8005F60C 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 4F610 8005F610 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 4F614 8005F614 00000000 */  nop
    /* 4F618 8005F618 03006214 */  bne        $v1, $v0, .L8005F628
    /* 4F61C 8005F61C 05000224 */   addiu     $v0, $zero, 0x5
    /* 4F620 8005F620 1B7E0108 */  j          .L8005F86C
    /* 4F624 8005F624 17000424 */   addiu     $a0, $zero, 0x17
  .L8005F628:
    /* 4F628 8005F628 9A006214 */  bne        $v1, $v0, .L8005F894
    /* 4F62C 8005F62C 00000000 */   nop
    /* 4F630 8005F630 1B7E0108 */  j          .L8005F86C
    /* 4F634 8005F634 7B000424 */   addiu     $a0, $zero, 0x7B
  jlabel .L8005F638
    /* 4F638 8005F638 1B7E0108 */  j          .L8005F86C
    /* 4F63C 8005F63C D8030424 */   addiu     $a0, $zero, 0x3D8
  jlabel .L8005F640
    /* 4F640 8005F640 1B7E0108 */  j          .L8005F86C
    /* 4F644 8005F644 AE020424 */   addiu     $a0, $zero, 0x2AE
  jlabel .L8005F648
    /* 4F648 8005F648 1B7E0108 */  j          .L8005F86C
    /* 4F64C 8005F64C DF030424 */   addiu     $a0, $zero, 0x3DF
  jlabel .L8005F650
    /* 4F650 8005F650 1B7E0108 */  j          .L8005F86C
    /* 4F654 8005F654 B5000424 */   addiu     $a0, $zero, 0xB5
  jlabel .L8005F658
    /* 4F658 8005F658 1B7E0108 */  j          .L8005F86C
    /* 4F65C 8005F65C 39020424 */   addiu     $a0, $zero, 0x239
  jlabel .L8005F660
    /* 4F660 8005F660 1B7E0108 */  j          .L8005F86C
    /* 4F664 8005F664 83030424 */   addiu     $a0, $zero, 0x383
  jlabel .L8005F668
    /* 4F668 8005F668 1B7E0108 */  j          .L8005F86C
    /* 4F66C 8005F66C 78000424 */   addiu     $a0, $zero, 0x78
  jlabel .L8005F670
    /* 4F670 8005F670 1B7E0108 */  j          .L8005F86C
    /* 4F674 8005F674 77000424 */   addiu     $a0, $zero, 0x77
  jlabel .L8005F678
    /* 4F678 8005F678 1B7E0108 */  j          .L8005F86C
    /* 4F67C 8005F67C 40000424 */   addiu     $a0, $zero, 0x40
  jlabel .L8005F680
    /* 4F680 8005F680 40101200 */  sll        $v0, $s2, 1
    /* 4F684 8005F684 21105200 */  addu       $v0, $v0, $s2
    /* 4F688 8005F688 80100200 */  sll        $v0, $v0, 2
    /* 4F68C 8005F68C 23105200 */  subu       $v0, $v0, $s2
    /* 4F690 8005F690 80880200 */  sll        $s1, $v0, 2
    /* 4F694 8005F694 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4F698 8005F698 21083100 */  addu       $at, $at, $s1
    /* 4F69C 8005F69C 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 4F6A0 8005F6A0 0E80103C */  lui        $s0, %hi(shrinestrs)
    /* 4F6A4 8005F6A4 E88B1026 */  addiu      $s0, $s0, %lo(shrinestrs)
    /* 4F6A8 8005F6A8 40100200 */  sll        $v0, $v0, 1
    /* 4F6AC 8005F6AC 0E80013C */  lui        $at, %hi(shrinestrs)
    /* 4F6B0 8005F6B0 21082200 */  addu       $at, $at, $v0
    /* 4F6B4 8005F6B4 E88B2394 */  lhu        $v1, %lo(shrinestrs)($at)
    /* 4F6B8 8005F6B8 ED010224 */  addiu      $v0, $zero, 0x1ED
    /* 4F6BC 8005F6BC 09006214 */  bne        $v1, $v0, .L8005F6E4
    /* 4F6C0 8005F6C0 FA010224 */   addiu     $v0, $zero, 0x1FA
    /* 4F6C4 8005F6C4 4AED010C */  jal        GetStr__Fi
    /* 4F6C8 8005F6C8 EE010424 */   addiu     $a0, $zero, 0x1EE
    /* 4F6CC 8005F6CC 0D80043C */  lui        $a0, %hi(tempstr)
    /* 4F6D0 8005F6D0 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 4F6D4 8005F6D4 1280053C */  lui        $a1, %hi(D_8011B9C8)
    /* 4F6D8 8005F6D8 C8B9A524 */  addiu      $a1, $a1, %lo(D_8011B9C8)
    /* 4F6DC 8005F6DC DB7D0108 */  j          .L8005F76C
    /* 4F6E0 8005F6E0 00000000 */   nop
  .L8005F6E4:
    /* 4F6E4 8005F6E4 09006214 */  bne        $v1, $v0, .L8005F70C
    /* 4F6E8 8005F6E8 C7040224 */   addiu     $v0, $zero, 0x4C7
    /* 4F6EC 8005F6EC 4AED010C */  jal        GetStr__Fi
    /* 4F6F0 8005F6F0 FD010424 */   addiu     $a0, $zero, 0x1FD
    /* 4F6F4 8005F6F4 0D80043C */  lui        $a0, %hi(tempstr)
    /* 4F6F8 8005F6F8 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 4F6FC 8005F6FC 1280053C */  lui        $a1, %hi(D_8011B9C8)
    /* 4F700 8005F700 C8B9A524 */  addiu      $a1, $a1, %lo(D_8011B9C8)
    /* 4F704 8005F704 DB7D0108 */  j          .L8005F76C
    /* 4F708 8005F708 00000000 */   nop
  .L8005F70C:
    /* 4F70C 8005F70C 09006214 */  bne        $v1, $v0, .L8005F734
    /* 4F710 8005F710 00000000 */   nop
    /* 4F714 8005F714 4AED010C */  jal        GetStr__Fi
    /* 4F718 8005F718 C8040424 */   addiu     $a0, $zero, 0x4C8
    /* 4F71C 8005F71C 0D80043C */  lui        $a0, %hi(tempstr)
    /* 4F720 8005F720 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 4F724 8005F724 1280053C */  lui        $a1, %hi(D_8011B9C8)
    /* 4F728 8005F728 C8B9A524 */  addiu      $a1, $a1, %lo(D_8011B9C8)
    /* 4F72C 8005F72C DB7D0108 */  j          .L8005F76C
    /* 4F730 8005F730 00000000 */   nop
  .L8005F734:
    /* 4F734 8005F734 4AED010C */  jal        GetStr__Fi
    /* 4F738 8005F738 17050424 */   addiu     $a0, $zero, 0x517
    /* 4F73C 8005F73C 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4F740 8005F740 21083100 */  addu       $at, $at, $s1
    /* 4F744 8005F744 5A8C2384 */  lh         $v1, %lo(object + 0xE)($at)
    /* 4F748 8005F748 00000000 */  nop
    /* 4F74C 8005F74C 40180300 */  sll        $v1, $v1, 1
    /* 4F750 8005F750 21187000 */  addu       $v1, $v1, $s0
    /* 4F754 8005F754 00006494 */  lhu        $a0, 0x0($v1)
    /* 4F758 8005F758 4AED010C */  jal        GetStr__Fi
    /* 4F75C 8005F75C 21804000 */   addu      $s0, $v0, $zero
    /* 4F760 8005F760 0D80043C */  lui        $a0, %hi(tempstr)
    /* 4F764 8005F764 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 4F768 8005F768 21280002 */  addu       $a1, $s0, $zero
  .L8005F76C:
    /* 4F76C 8005F76C 9767000C */  jal        sprintf
    /* 4F770 8005F770 21304000 */   addu      $a2, $v0, $zero
    /* 4F774 8005F774 1280043C */  lui        $a0, %hi(sel_data)
    /* 4F778 8005F778 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 4F77C 8005F77C 0D80053C */  lui        $a1, %hi(tempstr)
    /* 4F780 8005F780 10EAA524 */  addiu      $a1, $a1, %lo(tempstr)
    /* 4F784 8005F784 207E0108 */  j          .L8005F880
    /* 4F788 8005F788 00000000 */   nop
  jlabel .L8005F78C
    /* 4F78C 8005F78C 1B7E0108 */  j          .L8005F86C
    /* 4F790 8005F790 D3030424 */   addiu     $a0, $zero, 0x3D3
  jlabel .L8005F794
    /* 4F794 8005F794 1B7E0108 */  j          .L8005F86C
    /* 4F798 8005F798 4B020424 */   addiu     $a0, $zero, 0x24B
  jlabel .L8005F79C
    /* 4F79C 8005F79C 1B7E0108 */  j          .L8005F86C
    /* 4F7A0 8005F7A0 68000424 */   addiu     $a0, $zero, 0x68
  jlabel .L8005F7A4
    /* 4F7A4 8005F7A4 1B7E0108 */  j          .L8005F86C
    /* 4F7A8 8005F7A8 EF000424 */   addiu     $a0, $zero, 0xEF
  jlabel .L8005F7AC
    /* 4F7AC 8005F7AC 1B7E0108 */  j          .L8005F86C
    /* 4F7B0 8005F7B0 7A000424 */   addiu     $a0, $zero, 0x7A
  jlabel .L8005F7B4
    /* 4F7B4 8005F7B4 1B7E0108 */  j          .L8005F86C
    /* 4F7B8 8005F7B8 0D040424 */   addiu     $a0, $zero, 0x40D
  jlabel .L8005F7BC
    /* 4F7BC 8005F7BC 1B7E0108 */  j          .L8005F86C
    /* 4F7C0 8005F7C0 79000424 */   addiu     $a0, $zero, 0x79
  jlabel .L8005F7C4
    /* 4F7C4 8005F7C4 1B7E0108 */  j          .L8005F86C
    /* 4F7C8 8005F7C8 37030424 */   addiu     $a0, $zero, 0x337
  jlabel .L8005F7CC
    /* 4F7CC 8005F7CC 1B7E0108 */  j          .L8005F86C
    /* 4F7D0 8005F7D0 28000424 */   addiu     $a0, $zero, 0x28
  jlabel .L8005F7D4
    /* 4F7D4 8005F7D4 1B7E0108 */  j          .L8005F86C
    /* 4F7D8 8005F7D8 C4040424 */   addiu     $a0, $zero, 0x4C4
  jlabel .L8005F7DC
    /* 4F7DC 8005F7DC 1B7E0108 */  j          .L8005F86C
    /* 4F7E0 8005F7E0 8C010424 */   addiu     $a0, $zero, 0x18C
  jlabel .L8005F7E4
    /* 4F7E4 8005F7E4 1B7E0108 */  j          .L8005F86C
    /* 4F7E8 8005F7E8 A3000424 */   addiu     $a0, $zero, 0xA3
  jlabel .L8005F7EC
    /* 4F7EC 8005F7EC 1B7E0108 */  j          .L8005F86C
    /* 4F7F0 8005F7F0 A9020424 */   addiu     $a0, $zero, 0x2A9
  jlabel .L8005F7F4
    /* 4F7F4 8005F7F4 1B7E0108 */  j          .L8005F86C
    /* 4F7F8 8005F7F8 69010424 */   addiu     $a0, $zero, 0x169
  jlabel .L8005F7FC
    /* 4F7FC 8005F7FC 1B7E0108 */  j          .L8005F86C
    /* 4F800 8005F800 04030424 */   addiu     $a0, $zero, 0x304
  jlabel .L8005F804
    /* 4F804 8005F804 40101200 */  sll        $v0, $s2, 1
    /* 4F808 8005F808 21105200 */  addu       $v0, $v0, $s2
    /* 4F80C 8005F80C 80100200 */  sll        $v0, $v0, 2
    /* 4F810 8005F810 23105200 */  subu       $v0, $v0, $s2
    /* 4F814 8005F814 80100200 */  sll        $v0, $v0, 2
    /* 4F818 8005F818 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 4F81C 8005F81C 21082200 */  addu       $at, $at, $v0
    /* 4F820 8005F820 5E8C2284 */  lh         $v0, %lo(object + 0x12)($at)
    /* 4F824 8005F824 00000000 */  nop
    /* 4F828 8005F828 40100200 */  sll        $v0, $v0, 1
    /* 4F82C 8005F82C 0E80013C */  lui        $at, %hi(StoryBookName)
    /* 4F830 8005F830 21082200 */  addu       $at, $at, $v0
    /* 4F834 8005F834 388C2494 */  lhu        $a0, %lo(StoryBookName)($at)
    /* 4F838 8005F838 4AED010C */  jal        GetStr__Fi
    /* 4F83C 8005F83C 00000000 */   nop
    /* 4F840 8005F840 1280043C */  lui        $a0, %hi(sel_data)
    /* 4F844 8005F844 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 4F848 8005F848 207E0108 */  j          .L8005F880
    /* 4F84C 8005F84C 21284000 */   addu      $a1, $v0, $zero
  jlabel .L8005F850
    /* 4F850 8005F850 1B7E0108 */  j          .L8005F86C
    /* 4F854 8005F854 C4040424 */   addiu     $a0, $zero, 0x4C4
  jlabel .L8005F858
    /* 4F858 8005F858 1B7E0108 */  j          .L8005F86C
    /* 4F85C 8005F85C AA020424 */   addiu     $a0, $zero, 0x2AA
  jlabel .L8005F860
    /* 4F860 8005F860 1B7E0108 */  j          .L8005F86C
    /* 4F864 8005F864 B3040424 */   addiu     $a0, $zero, 0x4B3
  jlabel .L8005F868
    /* 4F868 8005F868 D9030424 */  addiu      $a0, $zero, 0x3D9
  .L8005F86C:
    /* 4F86C 8005F86C 4AED010C */  jal        GetStr__Fi
    /* 4F870 8005F870 00000000 */   nop
    /* 4F874 8005F874 1280043C */  lui        $a0, %hi(sel_data)
    /* 4F878 8005F878 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 4F87C 8005F87C 21284000 */  addu       $a1, $v0, $zero
  .L8005F880:
    /* 4F880 8005F880 0D80023C */  lui        $v0, %hi(_infostr)
    /* 4F884 8005F884 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 4F888 8005F888 00220400 */  sll        $a0, $a0, 8
    /* 4F88C 8005F88C F240000C */  jal        strcpy
    /* 4F890 8005F890 21208200 */   addu      $a0, $a0, $v0
  jlabel .L8005F894
    /* 4F894 8005F894 1280033C */  lui        $v1, %hi(sel_data)
    /* 4F898 8005F898 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 4F89C 8005F89C 00000000 */  nop
    /* 4F8A0 8005F8A0 40100300 */  sll        $v0, $v1, 1
    /* 4F8A4 8005F8A4 21104300 */  addu       $v0, $v0, $v1
    /* 4F8A8 8005F8A8 80100200 */  sll        $v0, $v0, 2
    /* 4F8AC 8005F8AC 21104300 */  addu       $v0, $v0, $v1
    /* 4F8B0 8005F8B0 00110200 */  sll        $v0, $v0, 4
    /* 4F8B4 8005F8B4 23104300 */  subu       $v0, $v0, $v1
    /* 4F8B8 8005F8B8 80100200 */  sll        $v0, $v0, 2
    /* 4F8BC 8005F8BC 21104300 */  addu       $v0, $v0, $v1
    /* 4F8C0 8005F8C0 C0100200 */  sll        $v0, $v0, 3
    /* 4F8C4 8005F8C4 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 4F8C8 8005F8C8 21082200 */  addu       $at, $at, $v0
    /* 4F8CC 8005F8CC 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 4F8D0 8005F8D0 01000224 */  addiu      $v0, $zero, 0x1
    /* 4F8D4 8005F8D4 24006214 */  bne        $v1, $v0, .L8005F968
    /* 4F8D8 8005F8D8 40101200 */   sll       $v0, $s2, 1
    /* 4F8DC 8005F8DC 21105200 */  addu       $v0, $v0, $s2
    /* 4F8E0 8005F8E0 80100200 */  sll        $v0, $v0, 2
    /* 4F8E4 8005F8E4 23105200 */  subu       $v0, $v0, $s2
    /* 4F8E8 8005F8E8 80100200 */  sll        $v0, $v0, 2
    /* 4F8EC 8005F8EC 0E80013C */  lui        $at, %hi(object + 0x2A)
    /* 4F8F0 8005F8F0 21082200 */  addu       $at, $at, $v0
    /* 4F8F4 8005F8F4 768C2290 */  lbu        $v0, %lo(object + 0x2A)($at)
    /* 4F8F8 8005F8F8 00000000 */  nop
    /* 4F8FC 8005F8FC 1A004010 */  beqz       $v0, .L8005F968
    /* 4F900 8005F900 00000000 */   nop
    /* 4F904 8005F904 4AED010C */  jal        GetStr__Fi
    /* 4F908 8005F908 99040424 */   addiu     $a0, $zero, 0x499
    /* 4F90C 8005F90C 0D80113C */  lui        $s1, %hi(tempstr)
    /* 4F910 8005F910 10EA3126 */  addiu      $s1, $s1, %lo(tempstr)
    /* 4F914 8005F914 21202002 */  addu       $a0, $s1, $zero
    /* 4F918 8005F918 21284000 */  addu       $a1, $v0, $zero
    /* 4F91C 8005F91C 1280063C */  lui        $a2, %hi(sel_data)
    /* 4F920 8005F920 2CB7C68C */  lw         $a2, %lo(sel_data)($a2)
    /* 4F924 8005F924 0D80103C */  lui        $s0, %hi(_infostr)
    /* 4F928 8005F928 10E81026 */  addiu      $s0, $s0, %lo(_infostr)
    /* 4F92C 8005F92C 00320600 */  sll        $a2, $a2, 8
    /* 4F930 8005F930 9767000C */  jal        sprintf
    /* 4F934 8005F934 2130D000 */   addu      $a2, $a2, $s0
    /* 4F938 8005F938 1280043C */  lui        $a0, %hi(sel_data)
    /* 4F93C 8005F93C 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 4F940 8005F940 21282002 */  addu       $a1, $s1, $zero
    /* 4F944 8005F944 00220400 */  sll        $a0, $a0, 8
    /* 4F948 8005F948 F240000C */  jal        strcpy
    /* 4F94C 8005F94C 21209000 */   addu      $a0, $a0, $s0
    /* 4F950 8005F950 1280033C */  lui        $v1, %hi(sel_data)
    /* 4F954 8005F954 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 4F958 8005F958 02000224 */  addiu      $v0, $zero, 0x2
    /* 4F95C 8005F95C 1280013C */  lui        $at, %hi(_infoclr)
    /* 4F960 8005F960 21082300 */  addu       $at, $at, $v1
    /* 4F964 8005F964 BCB622A0 */  sb         $v0, %lo(_infoclr)($at)
  .L8005F968:
    /* 4F968 8005F968 2400BF8F */  lw         $ra, 0x24($sp)
    /* 4F96C 8005F96C 2000B28F */  lw         $s2, 0x20($sp)
    /* 4F970 8005F970 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 4F974 8005F974 1800B08F */  lw         $s0, 0x18($sp)
    /* 4F978 8005F978 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 4F97C 8005F97C 0800E003 */  jr         $ra
    /* 4F980 8005F980 00000000 */   nop
endlabel GetObjectStr__Fi
