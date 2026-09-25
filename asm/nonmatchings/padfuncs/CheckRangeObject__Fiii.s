.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckRangeObject__Fiii, 0x378

glabel CheckRangeObject__Fiii
    /* 93724 800A3724 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 93728 800A3728 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 9372C 800A372C 21A88000 */  addu       $s5, $a0, $zero
    /* 93730 800A3730 3400B7AF */  sw         $s7, 0x34($sp)
    /* 93734 800A3734 21B8A000 */  addu       $s7, $a1, $zero
    /* 93738 800A3738 3000B6AF */  sw         $s6, 0x30($sp)
    /* 9373C 800A373C 21B0C000 */  addu       $s6, $a2, $zero
    /* 93740 800A3740 2800B4AF */  sw         $s4, 0x28($sp)
    /* 93744 800A3744 C0181500 */  sll        $v1, $s5, 3
    /* 93748 800A3748 23187500 */  subu       $v1, $v1, $s5
    /* 9374C 800A374C C0190300 */  sll        $v1, $v1, 7
    /* 93750 800A3750 C0101700 */  sll        $v0, $s7, 3
    /* 93754 800A3754 0E80043C */  lui        $a0, %hi(dung_map)
    /* 93758 800A3758 287A8424 */  addiu      $a0, $a0, %lo(dung_map)
    /* 9375C 800A375C 21104400 */  addu       $v0, $v0, $a0
    /* 93760 800A3760 21306200 */  addu       $a2, $v1, $v0
    /* 93764 800A3764 6000A22E */  sltiu      $v0, $s5, 0x60
    /* 93768 800A3768 3800BFAF */  sw         $ra, 0x38($sp)
    /* 9376C 800A376C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 93770 800A3770 2000B2AF */  sw         $s2, 0x20($sp)
    /* 93774 800A3774 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 93778 800A3778 1800B0AF */  sw         $s0, 0x18($sp)
    /* 9377C 800A377C 0400D180 */  lb         $s1, 0x4($a2)
    /* 93780 800A3780 0000D084 */  lh         $s0, 0x0($a2)
    /* 93784 800A3784 0300D380 */  lb         $s3, 0x3($a2)
    /* 93788 800A3788 04004010 */  beqz       $v0, .L800A379C
    /* 9378C 800A378C 21A00000 */   addu      $s4, $zero, $zero
    /* 93790 800A3790 6000E22E */  sltiu      $v0, $s7, 0x60
    /* 93794 800A3794 03004014 */  bnez       $v0, .L800A37A4
    /* 93798 800A3798 00000000 */   nop
  .L800A379C:
    /* 9379C 800A379C 9B8E0208 */  j          .L800A3A6C
    /* 937A0 800A37A0 21100000 */   addu      $v0, $zero, $zero
  .L800A37A4:
    /* 937A4 800A37A4 1280023C */  lui        $v0, %hi(leveltype)
    /* 937A8 800A37A8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 937AC 800A37AC 00000000 */  nop
    /* 937B0 800A37B0 57004010 */  beqz       $v0, .L800A3910
    /* 937B4 800A37B4 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 937B8 800A37B8 1280033C */  lui        $v1, %hi(myplr)
    /* 937BC 800A37BC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 937C0 800A37C0 00000000 */  nop
    /* 937C4 800A37C4 03006210 */  beq        $v1, $v0, .L800A37D4
    /* 937C8 800A37C8 01000224 */   addiu     $v0, $zero, 0x1
    /* 937CC 800A37CC F88D0208 */  j          .L800A37E0
    /* 937D0 800A37D0 04206200 */   sllv      $a0, $v0, $v1
  .L800A37D4:
    /* 937D4 800A37D4 03000424 */  addiu      $a0, $zero, 0x3
    /* 937D8 800A37D8 1280033C */  lui        $v1, %hi(myplr)
    /* 937DC 800A37DC 08BA638C */  lw         $v1, %lo(myplr)($v1)
  .L800A37E0:
    /* 937E0 800A37E0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 937E4 800A37E4 07006210 */  beq        $v1, $v0, .L800A3804
    /* 937E8 800A37E8 00000000 */   nop
    /* 937EC 800A37EC 0600C280 */  lb         $v0, 0x6($a2)
    /* 937F0 800A37F0 00000000 */  nop
    /* 937F4 800A37F4 24104400 */  and        $v0, $v0, $a0
    /* 937F8 800A37F8 02004014 */  bnez       $v0, .L800A3804
    /* 937FC 800A37FC 00000000 */   nop
    /* 93800 800A3800 21200000 */  addu       $a0, $zero, $zero
  .L800A3804:
    /* 93804 800A3804 54008010 */  beqz       $a0, .L800A3958
    /* 93808 800A3808 00000000 */   nop
    /* 9380C 800A380C 1280023C */  lui        $v0, %hi(sel_data)
    /* 93810 800A3810 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93814 800A3814 1280123C */  lui        $s2, %hi(_pcursmonst)
    /* 93818 800A3818 58B75226 */  addiu      $s2, $s2, %lo(_pcursmonst)
    /* 9381C 800A381C 80100200 */  sll        $v0, $v0, 2
    /* 93820 800A3820 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 93824 800A3824 21082200 */  addu       $at, $at, $v0
    /* 93828 800A3828 58B7238C */  lw         $v1, %lo(_pcursmonst)($at)
    /* 9382C 800A382C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 93830 800A3830 49006214 */  bne        $v1, $v0, .L800A3958
    /* 93834 800A3834 00000000 */   nop
    /* 93838 800A3838 4700001A */  blez       $s0, .L800A3958
    /* 9383C 800A383C FFFF0426 */   addiu     $a0, $s0, -0x1
    /* 93840 800A3840 40100400 */  sll        $v0, $a0, 1
    /* 93844 800A3844 21104400 */  addu       $v0, $v0, $a0
    /* 93848 800A3848 80100200 */  sll        $v0, $v0, 2
    /* 9384C 800A384C 21104400 */  addu       $v0, $v0, $a0
    /* 93850 800A3850 C0280200 */  sll        $a1, $v0, 3
    /* 93854 800A3854 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 93858 800A3858 21082500 */  addu       $at, $at, $a1
    /* 9385C 800A385C A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 93860 800A3860 00000000 */  nop
    /* 93864 800A3864 83110200 */  sra        $v0, $v0, 6
    /* 93868 800A3868 3B004018 */  blez       $v0, .L800A3958
    /* 9386C 800A386C 00000000 */   nop
    /* 93870 800A3870 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 93874 800A3874 21082500 */  addu       $at, $at, $a1
    /* 93878 800A3878 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 9387C 800A387C 00000000 */  nop
    /* 93880 800A3880 12004390 */  lbu        $v1, 0x12($v0)
    /* 93884 800A3884 6D000224 */  addiu      $v0, $zero, 0x6D
    /* 93888 800A3888 33006210 */  beq        $v1, $v0, .L800A3958
    /* 9388C 800A388C 00000000 */   nop
    /* 93890 800A3890 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 93894 800A3894 21082500 */  addu       $at, $at, $a1
    /* 93898 800A3898 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 9389C 800A389C 00000000 */  nop
    /* 938A0 800A38A0 01004230 */  andi       $v0, $v0, 0x1
    /* 938A4 800A38A4 2C004014 */  bnez       $v0, .L800A3958
    /* 938A8 800A38A8 00000000 */   nop
    /* 938AC 800A38AC 0600C290 */  lbu        $v0, 0x6($a2)
    /* 938B0 800A38B0 00000000 */  nop
    /* 938B4 800A38B4 04004230 */  andi       $v0, $v0, 0x4
    /* 938B8 800A38B8 27004010 */  beqz       $v0, .L800A3958
    /* 938BC 800A38BC 00000000 */   nop
    /* 938C0 800A38C0 01001424 */  addiu      $s4, $zero, 0x1
    /* 938C4 800A38C4 535A050C */  jal        func_8015694C
    /* 938C8 800A38C8 21808000 */   addu      $s0, $a0, $zero
    /* 938CC 800A38CC FF004230 */  andi       $v0, $v0, 0xFF
    /* 938D0 800A38D0 08004010 */  beqz       $v0, .L800A38F4
    /* 938D4 800A38D4 00000000 */   nop
    /* 938D8 800A38D8 1280023C */  lui        $v0, %hi(myplr)
    /* 938DC 800A38DC 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 938E0 800A38E0 00000000 */  nop
    /* 938E4 800A38E4 1F004004 */  bltz       $v0, .L800A3964
    /* 938E8 800A38E8 FFFF0324 */   addiu     $v1, $zero, -0x1
    /* 938EC 800A38EC 1D00C012 */  beqz       $s6, .L800A3964
    /* 938F0 800A38F0 00000000 */   nop
  .L800A38F4:
    /* 938F4 800A38F4 1280023C */  lui        $v0, %hi(sel_data)
    /* 938F8 800A38F8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 938FC 800A38FC 00000000 */  nop
    /* 93900 800A3900 80100200 */  sll        $v0, $v0, 2
    /* 93904 800A3904 21105200 */  addu       $v0, $v0, $s2
    /* 93908 800A3908 568E0208 */  j          .L800A3958
    /* 9390C 800A390C 000050AC */   sw        $s0, 0x0($v0)
  .L800A3910:
    /* 93910 800A3910 1280023C */  lui        $v0, %hi(sel_data)
    /* 93914 800A3914 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93918 800A3918 1280033C */  lui        $v1, %hi(_pcursmonst)
    /* 9391C 800A391C 58B76324 */  addiu      $v1, $v1, %lo(_pcursmonst)
    /* 93920 800A3920 80100200 */  sll        $v0, $v0, 2
    /* 93924 800A3924 21204300 */  addu       $a0, $v0, $v1
    /* 93928 800A3928 0000838C */  lw         $v1, 0x0($a0)
    /* 9392C 800A392C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 93930 800A3930 09006214 */  bne        $v1, $v0, .L800A3958
    /* 93934 800A3934 00000000 */   nop
    /* 93938 800A3938 07000012 */  beqz       $s0, .L800A3958
    /* 9393C 800A393C 00000000 */   nop
    /* 93940 800A3940 0300001A */  blez       $s0, .L800A3950
    /* 93944 800A3944 01001424 */   addiu     $s4, $zero, 0x1
    /* 93948 800A3948 558E0208 */  j          .L800A3954
    /* 9394C 800A394C FFFF0226 */   addiu     $v0, $s0, -0x1
  .L800A3950:
    /* 93950 800A3950 27101000 */  nor        $v0, $zero, $s0
  .L800A3954:
    /* 93954 800A3954 000082AC */  sw         $v0, 0x0($a0)
  .L800A3958:
    /* 93958 800A3958 1280023C */  lui        $v0, %hi(myplr)
    /* 9395C 800A395C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 93960 800A3960 FFFF0324 */  addiu      $v1, $zero, -0x1
  .L800A3964:
    /* 93964 800A3964 41004310 */  beq        $v0, $v1, .L800A3A6C
    /* 93968 800A3968 21108002 */   addu      $v0, $s4, $zero
    /* 9396C 800A396C 1280023C */  lui        $v0, %hi(sel_data)
    /* 93970 800A3970 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 93974 800A3974 1280013C */  lui        $at, %hi(_pcursobj)
    /* 93978 800A3978 21082200 */  addu       $at, $at, $v0
    /* 9397C 800A397C 60B72280 */  lb         $v0, %lo(_pcursobj)($at)
    /* 93980 800A3980 00000000 */  nop
    /* 93984 800A3984 1B004314 */  bne        $v0, $v1, .L800A39F4
    /* 93988 800A3988 00000000 */   nop
    /* 9398C 800A398C 19006012 */  beqz       $s3, .L800A39F4
    /* 93990 800A3990 00000000 */   nop
    /* 93994 800A3994 1700C012 */  beqz       $s6, .L800A39F4
    /* 93998 800A3998 00000000 */   nop
    /* 9399C 800A399C 0200601E */  bgtz       $s3, .L800A39A8
    /* 939A0 800A39A0 FFFF6426 */   addiu     $a0, $s3, -0x1
    /* 939A4 800A39A4 27201300 */  nor        $a0, $zero, $s3
  .L800A39A8:
    /* 939A8 800A39A8 00160400 */  sll        $v0, $a0, 24
    /* 939AC 800A39AC 03160200 */  sra        $v0, $v0, 24
    /* 939B0 800A39B0 40180200 */  sll        $v1, $v0, 1
    /* 939B4 800A39B4 21186200 */  addu       $v1, $v1, $v0
    /* 939B8 800A39B8 80180300 */  sll        $v1, $v1, 2
    /* 939BC 800A39BC 23186200 */  subu       $v1, $v1, $v0
    /* 939C0 800A39C0 80180300 */  sll        $v1, $v1, 2
    /* 939C4 800A39C4 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 939C8 800A39C8 21082300 */  addu       $at, $at, $v1
    /* 939CC 800A39CC 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 939D0 800A39D0 00000000 */  nop
    /* 939D4 800A39D4 07004018 */  blez       $v0, .L800A39F4
    /* 939D8 800A39D8 00000000 */   nop
    /* 939DC 800A39DC 1280023C */  lui        $v0, %hi(sel_data)
    /* 939E0 800A39E0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 939E4 800A39E4 01001424 */  addiu      $s4, $zero, 0x1
    /* 939E8 800A39E8 1280013C */  lui        $at, %hi(_pcursobj)
    /* 939EC 800A39EC 21082200 */  addu       $at, $at, $v0
    /* 939F0 800A39F0 60B724A0 */  sb         $a0, %lo(_pcursobj)($at)
  .L800A39F4:
    /* 939F4 800A39F4 1D00201A */  blez       $s1, .L800A3A6C
    /* 939F8 800A39F8 21108002 */   addu      $v0, $s4, $zero
    /* 939FC 800A39FC 1B00C012 */  beqz       $s6, .L800A3A6C
    /* 93A00 800A3A00 FFFF3126 */   addiu     $s1, $s1, -0x1
    /* 93A04 800A3A04 C0101100 */  sll        $v0, $s1, 3
    /* 93A08 800A3A08 23105100 */  subu       $v0, $v0, $s1
    /* 93A0C 800A3A0C 80100200 */  sll        $v0, $v0, 2
    /* 93A10 800A3A10 23105100 */  subu       $v0, $v0, $s1
    /* 93A14 800A3A14 80100200 */  sll        $v0, $v0, 2
    /* 93A18 800A3A18 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 93A1C 800A3A1C 21082200 */  addu       $at, $at, $v0
    /* 93A20 800A3A20 A41D2280 */  lb         $v0, %lo(item + 0x50)($at)
    /* 93A24 800A3A24 00000000 */  nop
    /* 93A28 800A3A28 0F004018 */  blez       $v0, .L800A3A68
    /* 93A2C 800A3A2C 21202002 */   addu      $a0, $s1, $zero
    /* 93A30 800A3A30 01001424 */  addiu      $s4, $zero, 0x1
    /* 93A34 800A3A34 2128A002 */  addu       $a1, $s5, $zero
    /* 93A38 800A3A38 AD8D020C */  jal        add_area_find_object__Fiii
    /* 93A3C 800A3A3C 2130E002 */   addu      $a2, $s7, $zero
    /* 93A40 800A3A40 1280033C */  lui        $v1, %hi(sel_data)
    /* 93A44 800A3A44 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 93A48 800A3A48 1280023C */  lui        $v0, %hi(_pcursitem)
    /* 93A4C 800A3A4C 64B74224 */  addiu      $v0, $v0, %lo(_pcursitem)
    /* 93A50 800A3A50 21206200 */  addu       $a0, $v1, $v0
    /* 93A54 800A3A54 00008380 */  lb         $v1, 0x0($a0)
    /* 93A58 800A3A58 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 93A5C 800A3A5C 03006214 */  bne        $v1, $v0, .L800A3A6C
    /* 93A60 800A3A60 21108002 */   addu      $v0, $s4, $zero
    /* 93A64 800A3A64 000091A0 */  sb         $s1, 0x0($a0)
  .L800A3A68:
    /* 93A68 800A3A68 21108002 */  addu       $v0, $s4, $zero
  .L800A3A6C:
    /* 93A6C 800A3A6C 3800BF8F */  lw         $ra, 0x38($sp)
    /* 93A70 800A3A70 3400B78F */  lw         $s7, 0x34($sp)
    /* 93A74 800A3A74 3000B68F */  lw         $s6, 0x30($sp)
    /* 93A78 800A3A78 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 93A7C 800A3A7C 2800B48F */  lw         $s4, 0x28($sp)
    /* 93A80 800A3A80 2400B38F */  lw         $s3, 0x24($sp)
    /* 93A84 800A3A84 2000B28F */  lw         $s2, 0x20($sp)
    /* 93A88 800A3A88 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 93A8C 800A3A8C 1800B08F */  lw         $s0, 0x18($sp)
    /* 93A90 800A3A90 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 93A94 800A3A94 0800E003 */  jr         $ra
    /* 93A98 800A3A98 00000000 */   nop
endlabel CheckRangeObject__Fiii
