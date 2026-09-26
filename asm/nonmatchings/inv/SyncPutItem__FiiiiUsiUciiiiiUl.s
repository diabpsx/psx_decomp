.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncPutItem__FiiiiUsiUciiiiiUl, 0x560

glabel SyncPutItem__FiiiiUsiUciiiiiUl
    /* 2590C 8015F504 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 25910 8015F508 1280023C */  lui        $v0, %hi(numitems)
    /* 25914 8015F50C 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 25918 8015F510 8800A897 */  lhu        $t0, 0x88($sp)
    /* 2591C 8015F514 6C00B7AF */  sw         $s7, 0x6C($sp)
    /* 25920 8015F518 21B88000 */  addu       $s7, $a0, $zero
    /* 25924 8015F51C 7000BEAF */  sw         $fp, 0x70($sp)
    /* 25928 8015F520 21F0A000 */  addu       $fp, $a1, $zero
    /* 2592C 8015F524 7400BFAF */  sw         $ra, 0x74($sp)
    /* 25930 8015F528 6800B6AF */  sw         $s6, 0x68($sp)
    /* 25934 8015F52C 6400B5AF */  sw         $s5, 0x64($sp)
    /* 25938 8015F530 6000B4AF */  sw         $s4, 0x60($sp)
    /* 2593C 8015F534 5C00B3AF */  sw         $s3, 0x5C($sp)
    /* 25940 8015F538 5800B2AF */  sw         $s2, 0x58($sp)
    /* 25944 8015F53C 5400B1AF */  sw         $s1, 0x54($sp)
    /* 25948 8015F540 5000B0AF */  sw         $s0, 0x50($sp)
    /* 2594C 8015F544 2800A6AF */  sw         $a2, 0x28($sp)
    /* 25950 8015F548 3000A7AF */  sw         $a3, 0x30($sp)
    /* 25954 8015F54C 3800A8A7 */  sh         $t0, 0x38($sp)
    /* 25958 8015F550 9000A893 */  lbu        $t0, 0x90($sp)
    /* 2595C 8015F554 7A004228 */  slti       $v0, $v0, 0x7A
    /* 25960 8015F558 05004014 */  bnez       $v0, .L8015F570
    /* 25964 8015F55C 4000A8A3 */   sb        $t0, 0x40($sp)
    /* 25968 8015F560 C6F5000C */  jal        PlaySFX__Fi
    /* 2596C 8015F564 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 25970 8015F568 8C7E0508 */  j          .L8015FA30
    /* 25974 8015F56C FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8015F570:
    /* 25978 8015F570 3000A48F */  lw         $a0, 0x30($sp)
    /* 2597C 8015F574 3800B097 */  lhu        $s0, 0x38($sp)
    /* 25980 8015F578 8C00A68F */  lw         $a2, 0x8C($sp)
    /* 25984 8015F57C C709020C */  jal        FindGetItem__FiUsi
    /* 25988 8015F580 21280002 */   addu      $a1, $s0, $zero
    /* 2598C 8015F584 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 25990 8015F588 07004310 */  beq        $v0, $v1, .L8015F5A8
    /* 25994 8015F58C 2120C003 */   addu      $a0, $fp, $zero
    /* 25998 8015F590 8C00A88F */  lw         $t0, 0x8C($sp)
    /* 2599C 8015F594 2800A58F */  lw         $a1, 0x28($sp)
    /* 259A0 8015F598 3000A68F */  lw         $a2, 0x30($sp)
    /* 259A4 8015F59C 21380002 */  addu       $a3, $s0, $zero
    /* 259A8 8015F5A0 AE7B050C */  jal        SyncGetItem__FiiiUsi
    /* 259AC 8015F5A4 1000A8AF */   sw        $t0, 0x10($sp)
  .L8015F5A8:
    /* 259B0 8015F5A8 2130C003 */  addu       $a2, $fp, $zero
    /* 259B4 8015F5AC 40801700 */  sll        $s0, $s7, 1
    /* 259B8 8015F5B0 21801702 */  addu       $s0, $s0, $s7
    /* 259BC 8015F5B4 80801000 */  sll        $s0, $s0, 2
    /* 259C0 8015F5B8 21801702 */  addu       $s0, $s0, $s7
    /* 259C4 8015F5BC 00811000 */  sll        $s0, $s0, 4
    /* 259C8 8015F5C0 23801702 */  subu       $s0, $s0, $s7
    /* 259CC 8015F5C4 80801000 */  sll        $s0, $s0, 2
    /* 259D0 8015F5C8 21801702 */  addu       $s0, $s0, $s7
    /* 259D4 8015F5CC C0801000 */  sll        $s0, $s0, 3
    /* 259D8 8015F5D0 2800A78F */  lw         $a3, 0x28($sp)
    /* 259DC 8015F5D4 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 259E0 8015F5D8 21083000 */  addu       $at, $at, $s0
    /* 259E4 8015F5DC 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 259E8 8015F5E0 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 259EC 8015F5E4 21083000 */  addu       $at, $at, $s0
    /* 259F0 8015F5E8 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 259F4 8015F5EC 8AF6000C */  jal        GetDirection__Fiiii
    /* 259F8 8015F5F0 21900000 */   addu      $s2, $zero, $zero
    /* 259FC 8015F5F4 21884000 */  addu       $s1, $v0, $zero
    /* 25A00 8015F5F8 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 25A04 8015F5FC 21083000 */  addu       $at, $at, $s0
    /* 25A08 8015F600 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 25A0C 8015F604 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 25A10 8015F608 21083000 */  addu       $at, $at, $s0
    /* 25A14 8015F60C 6AA52284 */  lh         $v0, %lo(plr + 0x32)($at)
    /* 25A18 8015F610 2800A88F */  lw         $t0, 0x28($sp)
    /* 25A1C 8015F614 2320C403 */  subu       $a0, $fp, $a0
    /* 25A20 8015F618 6D41000C */  jal        abs
    /* 25A24 8015F61C 23800201 */   subu      $s0, $t0, $v0
    /* 25A28 8015F620 02004228 */  slti       $v0, $v0, 0x2
    /* 25A2C 8015F624 06004010 */  beqz       $v0, .L8015F640
    /* 25A30 8015F628 00000000 */   nop
    /* 25A34 8015F62C 6D41000C */  jal        abs
    /* 25A38 8015F630 21200002 */   addu      $a0, $s0, $zero
    /* 25A3C 8015F634 02004228 */  slti       $v0, $v0, 0x2
    /* 25A40 8015F638 02004014 */  bnez       $v0, .L8015F644
    /* 25A44 8015F63C 00000000 */   nop
  .L8015F640:
    /* 25A48 8015F640 01001224 */  addiu      $s2, $zero, 0x1
  .L8015F644:
    /* 25A4C 8015F644 18004012 */  beqz       $s2, .L8015F6A8
    /* 25A50 8015F648 40101700 */   sll       $v0, $s7, 1
    /* 25A54 8015F64C 21105700 */  addu       $v0, $v0, $s7
    /* 25A58 8015F650 80100200 */  sll        $v0, $v0, 2
    /* 25A5C 8015F654 21105700 */  addu       $v0, $v0, $s7
    /* 25A60 8015F658 00110200 */  sll        $v0, $v0, 4
    /* 25A64 8015F65C 23105700 */  subu       $v0, $v0, $s7
    /* 25A68 8015F660 80100200 */  sll        $v0, $v0, 2
    /* 25A6C 8015F664 21105700 */  addu       $v0, $v0, $s7
    /* 25A70 8015F668 C0100200 */  sll        $v0, $v0, 3
    /* 25A74 8015F66C 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 25A78 8015F670 21082200 */  addu       $at, $at, $v0
    /* 25A7C 8015F674 68A52584 */  lh         $a1, %lo(plr + 0x30)($at)
    /* 25A80 8015F678 1280013C */  lui        $at, %hi(offset_x)
    /* 25A84 8015F67C 21083100 */  addu       $at, $at, $s1
    /* 25A88 8015F680 A8C22380 */  lb         $v1, %lo(offset_x)($at)
    /* 25A8C 8015F684 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 25A90 8015F688 21082200 */  addu       $at, $at, $v0
    /* 25A94 8015F68C 6AA52484 */  lh         $a0, %lo(plr + 0x32)($at)
    /* 25A98 8015F690 1280013C */  lui        $at, %hi(offset_y)
    /* 25A9C 8015F694 21083100 */  addu       $at, $at, $s1
    /* 25AA0 8015F698 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 25AA4 8015F69C 21F0A300 */  addu       $fp, $a1, $v1
    /* 25AA8 8015F6A0 21208200 */  addu       $a0, $a0, $v0
    /* 25AAC 8015F6A4 2800A4AF */  sw         $a0, 0x28($sp)
  .L8015F6A8:
    /* 25AB0 8015F6A8 2800A58F */  lw         $a1, 0x28($sp)
    /* 25AB4 8015F6AC B001020C */  jal        CanPut__Fii
    /* 25AB8 8015F6B0 2120C003 */   addu      $a0, $fp, $zero
    /* 25ABC 8015F6B4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 25AC0 8015F6B8 68004014 */  bnez       $v0, .L8015F85C
    /* 25AC4 8015F6BC FFFF2226 */   addiu     $v0, $s1, -0x1
    /* 25AC8 8015F6C0 07005130 */  andi       $s1, $v0, 0x7
    /* 25ACC 8015F6C4 40101700 */  sll        $v0, $s7, 1
    /* 25AD0 8015F6C8 21105700 */  addu       $v0, $v0, $s7
    /* 25AD4 8015F6CC 80100200 */  sll        $v0, $v0, 2
    /* 25AD8 8015F6D0 21985700 */  addu       $s3, $v0, $s7
    /* 25ADC 8015F6D4 00111300 */  sll        $v0, $s3, 4
    /* 25AE0 8015F6D8 23105700 */  subu       $v0, $v0, $s7
    /* 25AE4 8015F6DC 80100200 */  sll        $v0, $v0, 2
    /* 25AE8 8015F6E0 21105700 */  addu       $v0, $v0, $s7
    /* 25AEC 8015F6E4 C0800200 */  sll        $s0, $v0, 3
    /* 25AF0 8015F6E8 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 25AF4 8015F6EC 21083000 */  addu       $at, $at, $s0
    /* 25AF8 8015F6F0 68A52584 */  lh         $a1, %lo(plr + 0x30)($at)
    /* 25AFC 8015F6F4 1280013C */  lui        $at, %hi(offset_x)
    /* 25B00 8015F6F8 21083100 */  addu       $at, $at, $s1
    /* 25B04 8015F6FC A8C22380 */  lb         $v1, %lo(offset_x)($at)
    /* 25B08 8015F700 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 25B0C 8015F704 21083000 */  addu       $at, $at, $s0
    /* 25B10 8015F708 6AA52484 */  lh         $a0, %lo(plr + 0x32)($at)
    /* 25B14 8015F70C 1280013C */  lui        $at, %hi(offset_y)
    /* 25B18 8015F710 21083100 */  addu       $at, $at, $s1
    /* 25B1C 8015F714 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 25B20 8015F718 21F0A300 */  addu       $fp, $a1, $v1
    /* 25B24 8015F71C 21208200 */  addu       $a0, $a0, $v0
    /* 25B28 8015F720 2800A4AF */  sw         $a0, 0x28($sp)
    /* 25B2C 8015F724 2800A58F */  lw         $a1, 0x28($sp)
    /* 25B30 8015F728 B001020C */  jal        CanPut__Fii
    /* 25B34 8015F72C 2120C003 */   addu      $a0, $fp, $zero
    /* 25B38 8015F730 FF004230 */  andi       $v0, $v0, 0xFF
    /* 25B3C 8015F734 49004014 */  bnez       $v0, .L8015F85C
    /* 25B40 8015F738 02002226 */   addiu     $v0, $s1, 0x2
    /* 25B44 8015F73C 07005130 */  andi       $s1, $v0, 0x7
    /* 25B48 8015F740 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 25B4C 8015F744 21083000 */  addu       $at, $at, $s0
    /* 25B50 8015F748 68A52584 */  lh         $a1, %lo(plr + 0x30)($at)
    /* 25B54 8015F74C 1280013C */  lui        $at, %hi(offset_x)
    /* 25B58 8015F750 21083100 */  addu       $at, $at, $s1
    /* 25B5C 8015F754 A8C22380 */  lb         $v1, %lo(offset_x)($at)
    /* 25B60 8015F758 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 25B64 8015F75C 21083000 */  addu       $at, $at, $s0
    /* 25B68 8015F760 6AA52484 */  lh         $a0, %lo(plr + 0x32)($at)
    /* 25B6C 8015F764 1280013C */  lui        $at, %hi(offset_y)
    /* 25B70 8015F768 21083100 */  addu       $at, $at, $s1
    /* 25B74 8015F76C B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 25B78 8015F770 21F0A300 */  addu       $fp, $a1, $v1
    /* 25B7C 8015F774 21208200 */  addu       $a0, $a0, $v0
    /* 25B80 8015F778 2800A4AF */  sw         $a0, 0x28($sp)
    /* 25B84 8015F77C 2800A58F */  lw         $a1, 0x28($sp)
    /* 25B88 8015F780 B001020C */  jal        CanPut__Fii
    /* 25B8C 8015F784 2120C003 */   addu      $a0, $fp, $zero
    /* 25B90 8015F788 FF004230 */  andi       $v0, $v0, 0xFF
    /* 25B94 8015F78C 33004014 */  bnez       $v0, .L8015F85C
    /* 25B98 8015F790 21A80000 */   addu      $s5, $zero, $zero
    /* 25B9C 8015F794 01001224 */  addiu      $s2, $zero, 0x1
    /* 25BA0 8015F798 4800B3AF */  sw         $s3, 0x48($sp)
  .L8015F79C:
    /* 25BA4 8015F79C 3200422A */  slti       $v0, $s2, 0x32
    /* 25BA8 8015F7A0 2C004010 */  beqz       $v0, .L8015F854
    /* 25BAC 8015F7A4 FF00A232 */   andi      $v0, $s5, 0xFF
    /* 25BB0 8015F7A8 2C004014 */  bnez       $v0, .L8015F85C
    /* 25BB4 8015F7AC 23A01200 */   negu      $s4, $s2
    /* 25BB8 8015F7B0 4800A88F */  lw         $t0, 0x48($sp)
    /* 25BBC 8015F7B4 00000000 */  nop
    /* 25BC0 8015F7B8 00110800 */  sll        $v0, $t0, 4
    /* 25BC4 8015F7BC 23105700 */  subu       $v0, $v0, $s7
    /* 25BC8 8015F7C0 80100200 */  sll        $v0, $v0, 2
    /* 25BCC 8015F7C4 21105700 */  addu       $v0, $v0, $s7
    /* 25BD0 8015F7C8 C0B00200 */  sll        $s6, $v0, 3
  .L8015F7CC:
    /* 25BD4 8015F7CC 2A105402 */  slt        $v0, $s2, $s4
    /* 25BD8 8015F7D0 1E004014 */  bnez       $v0, .L8015F84C
    /* 25BDC 8015F7D4 FF00A232 */   andi      $v0, $s5, 0xFF
    /* 25BE0 8015F7D8 1C004014 */  bnez       $v0, .L8015F84C
    /* 25BE4 8015F7DC 23881200 */   negu      $s1, $s2
    /* 25BE8 8015F7E0 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 25BEC 8015F7E4 21083600 */  addu       $at, $at, $s6
    /* 25BF0 8015F7E8 6AA52284 */  lh         $v0, %lo(plr + 0x32)($at)
    /* 25BF4 8015F7EC 00000000 */  nop
    /* 25BF8 8015F7F0 21985400 */  addu       $s3, $v0, $s4
  .L8015F7F4:
    /* 25BFC 8015F7F4 2A105102 */  slt        $v0, $s2, $s1
    /* 25C00 8015F7F8 12004014 */  bnez       $v0, .L8015F844
    /* 25C04 8015F7FC FF00A232 */   andi      $v0, $s5, 0xFF
    /* 25C08 8015F800 10004014 */  bnez       $v0, .L8015F844
    /* 25C0C 8015F804 21286002 */   addu      $a1, $s3, $zero
    /* 25C10 8015F808 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 25C14 8015F80C 21083600 */  addu       $at, $at, $s6
    /* 25C18 8015F810 68A52284 */  lh         $v0, %lo(plr + 0x30)($at)
    /* 25C1C 8015F814 00000000 */  nop
    /* 25C20 8015F818 21805100 */  addu       $s0, $v0, $s1
    /* 25C24 8015F81C B001020C */  jal        CanPut__Fii
    /* 25C28 8015F820 21200002 */   addu      $a0, $s0, $zero
    /* 25C2C 8015F824 FF004230 */  andi       $v0, $v0, 0xFF
    /* 25C30 8015F828 04004010 */  beqz       $v0, .L8015F83C
    /* 25C34 8015F82C 00000000 */   nop
    /* 25C38 8015F830 01001524 */  addiu      $s5, $zero, 0x1
    /* 25C3C 8015F834 21F00002 */  addu       $fp, $s0, $zero
    /* 25C40 8015F838 2800B3AF */  sw         $s3, 0x28($sp)
  .L8015F83C:
    /* 25C44 8015F83C FD7D0508 */  j          .L8015F7F4
    /* 25C48 8015F840 01003126 */   addiu     $s1, $s1, 0x1
  .L8015F844:
    /* 25C4C 8015F844 F37D0508 */  j          .L8015F7CC
    /* 25C50 8015F848 01009426 */   addiu     $s4, $s4, 0x1
  .L8015F84C:
    /* 25C54 8015F84C E77D0508 */  j          .L8015F79C
    /* 25C58 8015F850 01005226 */   addiu     $s2, $s2, 0x1
  .L8015F854:
    /* 25C5C 8015F854 76004010 */  beqz       $v0, .L8015FA30
    /* 25C60 8015F858 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8015F85C:
    /* 25C64 8015F85C 0D80043C */  lui        $a0, %hi(itemavail)
    /* 25C68 8015F860 D4538424 */  addiu      $a0, $a0, %lo(itemavail)
    /* 25C6C 8015F864 C0101E00 */  sll        $v0, $fp, 3
    /* 25C70 8015F868 23105E00 */  subu       $v0, $v0, $fp
    /* 25C74 8015F86C C0110200 */  sll        $v0, $v0, 7
    /* 25C78 8015F870 2800A88F */  lw         $t0, 0x28($sp)
    /* 25C7C 8015F874 00009080 */  lb         $s0, 0x0($a0)
    /* 25C80 8015F878 C0180800 */  sll        $v1, $t0, 3
    /* 25C84 8015F87C 21186200 */  addu       $v1, $v1, $v0
    /* 25C88 8015F880 01000226 */  addiu      $v0, $s0, 0x1
    /* 25C8C 8015F884 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 25C90 8015F888 21082300 */  addu       $at, $at, $v1
    /* 25C94 8015F88C 2C7A22A0 */  sb         $v0, %lo(dung_map + 0x4)($at)
    /* 25C98 8015F890 1280033C */  lui        $v1, %hi(numitems)
    /* 25C9C 8015F894 88B8638C */  lw         $v1, %lo(numitems)($v1)
    /* 25CA0 8015F898 7E008224 */  addiu      $v0, $a0, 0x7E
    /* 25CA4 8015F89C 23104300 */  subu       $v0, $v0, $v1
    /* 25CA8 8015F8A0 00004290 */  lbu        $v0, 0x0($v0)
    /* 25CAC 8015F8A4 00000000 */  nop
    /* 25CB0 8015F8A8 000082A0 */  sb         $v0, 0x0($a0)
    /* 25CB4 8015F8AC 0D80013C */  lui        $at, %hi(itemactive)
    /* 25CB8 8015F8B0 21082300 */  addu       $at, $at, $v1
    /* 25CBC 8015F8B4 545330A0 */  sb         $s0, %lo(itemactive)($at)
    /* 25CC0 8015F8B8 3000A88F */  lw         $t0, 0x30($sp)
    /* 25CC4 8015F8BC 17000224 */  addiu      $v0, $zero, 0x17
    /* 25CC8 8015F8C0 1B000215 */  bne        $t0, $v0, .L8015F930
    /* 25CCC 8015F8C4 21200002 */   addu      $a0, $s0, $zero
    /* 25CD0 8015F8C8 3800A897 */  lhu        $t0, 0x38($sp)
    /* 25CD4 8015F8CC 00000000 */  nop
    /* 25CD8 8015F8D0 21280001 */  addu       $a1, $t0, $zero
    /* 25CDC 8015F8D4 4000A893 */  lbu        $t0, 0x40($sp)
    /* 25CE0 8015F8D8 8C00A68F */  lw         $a2, 0x8C($sp)
    /* 25CE4 8015F8DC 21380001 */  addu       $a3, $t0, $zero
    /* 25CE8 8015F8E0 9400A88F */  lw         $t0, 0x94($sp)
    /* 25CEC 8015F8E4 00000000 */  nop
    /* 25CF0 8015F8E8 1000A8AF */  sw         $t0, 0x10($sp)
    /* 25CF4 8015F8EC 9800A88F */  lw         $t0, 0x98($sp)
    /* 25CF8 8015F8F0 00000000 */  nop
    /* 25CFC 8015F8F4 1400A8AF */  sw         $t0, 0x14($sp)
    /* 25D00 8015F8F8 9C00A88F */  lw         $t0, 0x9C($sp)
    /* 25D04 8015F8FC 00000000 */  nop
    /* 25D08 8015F900 1800A8AF */  sw         $t0, 0x18($sp)
    /* 25D0C 8015F904 A000A88F */  lw         $t0, 0xA0($sp)
    /* 25D10 8015F908 00000000 */  nop
    /* 25D14 8015F90C 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 25D18 8015F910 A400A88F */  lw         $t0, 0xA4($sp)
    /* 25D1C 8015F914 00000000 */  nop
    /* 25D20 8015F918 2000A8AF */  sw         $t0, 0x20($sp)
    /* 25D24 8015F91C A800A88F */  lw         $t0, 0xA8($sp)
    /* 25D28 8015F920 0214010C */  jal        RecreateEar__FiUsiUciiiiii
    /* 25D2C 8015F924 2400A8AF */   sw        $t0, 0x24($sp)
    /* 25D30 8015F928 787E0508 */  j          .L8015F9E0
    /* 25D34 8015F92C 21200002 */   addu      $a0, $s0, $zero
  .L8015F930:
    /* 25D38 8015F930 3000A58F */  lw         $a1, 0x30($sp)
    /* 25D3C 8015F934 3800A897 */  lhu        $t0, 0x38($sp)
    /* 25D40 8015F938 8C00A78F */  lw         $a3, 0x8C($sp)
    /* 25D44 8015F93C 21300001 */  addu       $a2, $t0, $zero
    /* 25D48 8015F940 A400A88F */  lw         $t0, 0xA4($sp)
    /* 25D4C 8015F944 00000000 */  nop
    /* 25D50 8015F948 1000A8AF */  sw         $t0, 0x10($sp)
    /* 25D54 8015F94C A800A88F */  lw         $t0, 0xA8($sp)
    /* 25D58 8015F950 852E010C */  jal        RecreateItem__FiiUsiii
    /* 25D5C 8015F954 1400A8AF */   sw        $t0, 0x14($sp)
    /* 25D60 8015F958 4000A893 */  lbu        $t0, 0x40($sp)
    /* 25D64 8015F95C 00000000 */  nop
    /* 25D68 8015F960 09000011 */  beqz       $t0, .L8015F988
    /* 25D6C 8015F964 C0101000 */   sll       $v0, $s0, 3
    /* 25D70 8015F968 23105000 */  subu       $v0, $v0, $s0
    /* 25D74 8015F96C 80100200 */  sll        $v0, $v0, 2
    /* 25D78 8015F970 23105000 */  subu       $v0, $v0, $s0
    /* 25D7C 8015F974 80100200 */  sll        $v0, $v0, 2
    /* 25D80 8015F978 01000324 */  addiu      $v1, $zero, 0x1
    /* 25D84 8015F97C 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 25D88 8015F980 21082200 */  addu       $at, $at, $v0
    /* 25D8C 8015F984 BD1D23A0 */  sb         $v1, %lo(item + 0x69)($at)
  .L8015F988:
    /* 25D90 8015F988 C0101000 */  sll        $v0, $s0, 3
    /* 25D94 8015F98C 23105000 */  subu       $v0, $v0, $s0
    /* 25D98 8015F990 80100200 */  sll        $v0, $v0, 2
    /* 25D9C 8015F994 23105000 */  subu       $v0, $v0, $s0
    /* 25DA0 8015F998 80100200 */  sll        $v0, $v0, 2
    /* 25DA4 8015F99C 9400A897 */  lhu        $t0, 0x94($sp)
    /* 25DA8 8015F9A0 0D80013C */  lui        $at, %hi(item + 0x3E)
    /* 25DAC 8015F9A4 21082200 */  addu       $at, $at, $v0
    /* 25DB0 8015F9A8 921D28A4 */  sh         $t0, %lo(item + 0x3E)($at)
    /* 25DB4 8015F9AC 9800A897 */  lhu        $t0, 0x98($sp)
    /* 25DB8 8015F9B0 0D80013C */  lui        $at, %hi(item + 0x40)
    /* 25DBC 8015F9B4 21082200 */  addu       $at, $at, $v0
    /* 25DC0 8015F9B8 941D28A4 */  sh         $t0, %lo(item + 0x40)($at)
    /* 25DC4 8015F9BC 9C00A893 */  lbu        $t0, 0x9C($sp)
    /* 25DC8 8015F9C0 0D80013C */  lui        $at, %hi(item + 0x49)
    /* 25DCC 8015F9C4 21082200 */  addu       $at, $at, $v0
    /* 25DD0 8015F9C8 9D1D28A0 */  sb         $t0, %lo(item + 0x49)($at)
    /* 25DD4 8015F9CC A000A893 */  lbu        $t0, 0xA0($sp)
    /* 25DD8 8015F9D0 0D80013C */  lui        $at, %hi(item + 0x4B)
    /* 25DDC 8015F9D4 21082200 */  addu       $at, $at, $v0
    /* 25DE0 8015F9D8 9F1D28A0 */  sb         $t0, %lo(item + 0x4B)($at)
    /* 25DE4 8015F9DC 21200002 */  addu       $a0, $s0, $zero
  .L8015F9E0:
    /* 25DE8 8015F9E0 C0101000 */  sll        $v0, $s0, 3
    /* 25DEC 8015F9E4 23105000 */  subu       $v0, $v0, $s0
    /* 25DF0 8015F9E8 80100200 */  sll        $v0, $v0, 2
    /* 25DF4 8015F9EC 23105000 */  subu       $v0, $v0, $s0
    /* 25DF8 8015F9F0 80100200 */  sll        $v0, $v0, 2
    /* 25DFC 8015F9F4 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 25E00 8015F9F8 21082200 */  addu       $at, $at, $v0
    /* 25E04 8015F9FC A61D3EA0 */  sb         $fp, %lo(item + 0x52)($at)
    /* 25E08 8015FA00 2800A893 */  lbu        $t0, 0x28($sp)
    /* 25E0C 8015FA04 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 25E10 8015FA08 21082200 */  addu       $at, $at, $v0
    /* 25E14 8015FA0C A71D28A0 */  sb         $t0, %lo(item + 0x53)($at)
    /* 25E18 8015FA10 8015010C */  jal        RespawnItem__FiUc
    /* 25E1C 8015FA14 01000524 */   addiu     $a1, $zero, 0x1
    /* 25E20 8015FA18 1280033C */  lui        $v1, %hi(numitems)
    /* 25E24 8015FA1C 88B8638C */  lw         $v1, %lo(numitems)($v1)
    /* 25E28 8015FA20 21100002 */  addu       $v0, $s0, $zero
    /* 25E2C 8015FA24 01006324 */  addiu      $v1, $v1, 0x1
    /* 25E30 8015FA28 1280013C */  lui        $at, %hi(numitems)
    /* 25E34 8015FA2C 88B823AC */  sw         $v1, %lo(numitems)($at)
  .L8015FA30:
    /* 25E38 8015FA30 7400BF8F */  lw         $ra, 0x74($sp)
    /* 25E3C 8015FA34 7000BE8F */  lw         $fp, 0x70($sp)
    /* 25E40 8015FA38 6C00B78F */  lw         $s7, 0x6C($sp)
    /* 25E44 8015FA3C 6800B68F */  lw         $s6, 0x68($sp)
    /* 25E48 8015FA40 6400B58F */  lw         $s5, 0x64($sp)
    /* 25E4C 8015FA44 6000B48F */  lw         $s4, 0x60($sp)
    /* 25E50 8015FA48 5C00B38F */  lw         $s3, 0x5C($sp)
    /* 25E54 8015FA4C 5800B28F */  lw         $s2, 0x58($sp)
    /* 25E58 8015FA50 5400B18F */  lw         $s1, 0x54($sp)
    /* 25E5C 8015FA54 5000B08F */  lw         $s0, 0x50($sp)
    /* 25E60 8015FA58 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 25E64 8015FA5C 0800E003 */  jr         $ra
    /* 25E68 8015FA60 00000000 */   nop
endlabel SyncPutItem__FiiiiUsiUciiiiiUl
