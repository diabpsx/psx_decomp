.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateRoom__Fiiiiiiiii, 0x670

glabel CreateRoom__Fiiiiiiiii
    /* A85C 80144454 4C17828F */  lw         $v0, %gp_rel(nRoomCnt)($gp)
    /* A860 80144458 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* A864 8014445C 7400B3AF */  sw         $s3, 0x74($sp)
    /* A868 80144460 A000B38F */  lw         $s3, 0xA0($sp)
    /* A86C 80144464 8800BEAF */  sw         $fp, 0x88($sp)
    /* A870 80144468 A800BE8F */  lw         $fp, 0xA8($sp)
    /* A874 8014446C 7000B2AF */  sw         $s2, 0x70($sp)
    /* A878 80144470 21900000 */  addu       $s2, $zero, $zero
    /* A87C 80144474 6C00B1AF */  sw         $s1, 0x6C($sp)
    /* A880 80144478 21880000 */  addu       $s1, $zero, $zero
    /* A884 8014447C 8C00BFAF */  sw         $ra, 0x8C($sp)
    /* A888 80144480 8400B7AF */  sw         $s7, 0x84($sp)
    /* A88C 80144484 8000B6AF */  sw         $s6, 0x80($sp)
    /* A890 80144488 7C00B5AF */  sw         $s5, 0x7C($sp)
    /* A894 8014448C 7800B4AF */  sw         $s4, 0x78($sp)
    /* A898 80144490 6800B0AF */  sw         $s0, 0x68($sp)
    /* A89C 80144494 2800A4AF */  sw         $a0, 0x28($sp)
    /* A8A0 80144498 3000A5AF */  sw         $a1, 0x30($sp)
    /* A8A4 8014449C 3800A6AF */  sw         $a2, 0x38($sp)
    /* A8A8 801444A0 4000A7AF */  sw         $a3, 0x40($sp)
    /* A8AC 801444A4 5800A0AF */  sw         $zero, 0x58($sp)
    /* A8B0 801444A8 50004228 */  slti       $v0, $v0, 0x50
    /* A8B4 801444AC 78014010 */  beqz       $v0, .L80144A90
    /* A8B8 801444B0 6000A0AF */   sw        $zero, 0x60($sp)
    /* A8BC 801444B4 2320C400 */  subu       $a0, $a2, $a0
    /* A8C0 801444B8 FC16838F */  lw         $v1, %gp_rel(Area_Min)($gp)
    /* A8C4 801444BC 00000000 */  nop
    /* A8C8 801444C0 2A108300 */  slt        $v0, $a0, $v1
    /* A8CC 801444C4 72014014 */  bnez       $v0, .L80144A90
    /* A8D0 801444C8 2380E500 */   subu      $s0, $a3, $a1
    /* A8D4 801444CC 2A100302 */  slt        $v0, $s0, $v1
    /* A8D8 801444D0 6F014014 */  bnez       $v0, .L80144A90
    /* A8DC 801444D4 00000000 */   nop
    /* A8E0 801444D8 0017838F */  lw         $v1, %gp_rel(Room_Max)($gp)
    /* A8E4 801444DC 00000000 */  nop
    /* A8E8 801444E0 2A106400 */  slt        $v0, $v1, $a0
    /* A8EC 801444E4 04004010 */  beqz       $v0, .L801444F8
    /* A8F0 801444E8 00000000 */   nop
    /* A8F4 801444EC 0417848F */  lw         $a0, %gp_rel(Room_Min)($gp)
    /* A8F8 801444F0 44110508 */  j          .L80144510
    /* A8FC 801444F4 23206400 */   subu      $a0, $v1, $a0
  .L801444F8:
    /* A900 801444F8 0417838F */  lw         $v1, %gp_rel(Room_Min)($gp)
    /* A904 801444FC 00000000 */  nop
    /* A908 80144500 2A106400 */  slt        $v0, $v1, $a0
    /* A90C 80144504 09004010 */  beqz       $v0, .L8014452C
    /* A910 80144508 00000000 */   nop
    /* A914 8014450C 23208300 */  subu       $a0, $a0, $v1
  .L80144510:
    /* A918 80144510 C9F6000C */  jal        ENG_random__Fl
    /* A91C 80144514 00000000 */   nop
    /* A920 80144518 0417838F */  lw         $v1, %gp_rel(Room_Min)($gp)
    /* A924 8014451C 00000000 */  nop
    /* A928 80144520 21104300 */  addu       $v0, $v0, $v1
    /* A92C 80144524 4C110508 */  j          .L80144530
    /* A930 80144528 4800A2AF */   sw        $v0, 0x48($sp)
  .L8014452C:
    /* A934 8014452C 4800A4AF */  sw         $a0, 0x48($sp)
  .L80144530:
    /* A938 80144530 0017838F */  lw         $v1, %gp_rel(Room_Max)($gp)
    /* A93C 80144534 00000000 */  nop
    /* A940 80144538 2A107000 */  slt        $v0, $v1, $s0
    /* A944 8014453C 04004010 */  beqz       $v0, .L80144550
    /* A948 80144540 00000000 */   nop
    /* A94C 80144544 0417848F */  lw         $a0, %gp_rel(Room_Min)($gp)
    /* A950 80144548 59110508 */  j          .L80144564
    /* A954 8014454C 23206400 */   subu      $a0, $v1, $a0
  .L80144550:
    /* A958 80144550 0417838F */  lw         $v1, %gp_rel(Room_Min)($gp)
    /* A95C 80144554 00000000 */  nop
    /* A960 80144558 2A107000 */  slt        $v0, $v1, $s0
    /* A964 8014455C 08004010 */  beqz       $v0, .L80144580
    /* A968 80144560 23200302 */   subu      $a0, $s0, $v1
  .L80144564:
    /* A96C 80144564 C9F6000C */  jal        ENG_random__Fl
    /* A970 80144568 00000000 */   nop
    /* A974 8014456C 0417838F */  lw         $v1, %gp_rel(Room_Min)($gp)
    /* A978 80144570 00000000 */  nop
    /* A97C 80144574 21104300 */  addu       $v0, $v0, $v1
    /* A980 80144578 61110508 */  j          .L80144584
    /* A984 8014457C 5000A2AF */   sw        $v0, 0x50($sp)
  .L80144580:
    /* A988 80144580 5000B0AF */  sw         $s0, 0x50($sp)
  .L80144584:
    /* A98C 80144584 01000224 */  addiu      $v0, $zero, 0x1
    /* A990 80144588 0500C217 */  bne        $fp, $v0, .L801445A0
    /* A994 8014458C 00000000 */   nop
    /* A998 80144590 B000A88F */  lw         $t0, 0xB0($sp)
    /* A99C 80144594 AC00A98F */  lw         $t1, 0xAC($sp)
    /* A9A0 80144598 4800A8AF */  sw         $t0, 0x48($sp)
    /* A9A4 8014459C 5000A9AF */  sw         $t1, 0x50($sp)
  .L801445A0:
    /* A9A8 801445A0 3800A88F */  lw         $t0, 0x38($sp)
    /* A9AC 801445A4 2800A98F */  lw         $t1, 0x28($sp)
    /* A9B0 801445A8 C9F6000C */  jal        ENG_random__Fl
    /* A9B4 801445AC 23200901 */   subu      $a0, $t0, $t1
    /* A9B8 801445B0 2800A88F */  lw         $t0, 0x28($sp)
    /* A9BC 801445B4 4000A98F */  lw         $t1, 0x40($sp)
    /* A9C0 801445B8 21A84800 */  addu       $s5, $v0, $t0
    /* A9C4 801445BC 3000A88F */  lw         $t0, 0x30($sp)
    /* A9C8 801445C0 C9F6000C */  jal        ENG_random__Fl
    /* A9CC 801445C4 23202801 */   subu      $a0, $t1, $t0
    /* A9D0 801445C8 3000A98F */  lw         $t1, 0x30($sp)
    /* A9D4 801445CC 4800A88F */  lw         $t0, 0x48($sp)
    /* A9D8 801445D0 21A04900 */  addu       $s4, $v0, $t1
    /* A9DC 801445D4 21B0A802 */  addu       $s6, $s5, $t0
    /* A9E0 801445D8 5000A98F */  lw         $t1, 0x50($sp)
    /* A9E4 801445DC 3800A88F */  lw         $t0, 0x38($sp)
    /* A9E8 801445E0 00000000 */  nop
    /* A9EC 801445E4 2A101601 */  slt        $v0, $t0, $s6
    /* A9F0 801445E8 05004010 */  beqz       $v0, .L80144600
    /* A9F4 801445EC 21B88902 */   addu      $s7, $s4, $t1
    /* A9F8 801445F0 3800B68F */  lw         $s6, 0x38($sp)
    /* A9FC 801445F4 4800A98F */  lw         $t1, 0x48($sp)
    /* AA00 801445F8 00000000 */  nop
    /* AA04 801445FC 23A8C902 */  subu       $s5, $s6, $t1
  .L80144600:
    /* AA08 80144600 4000A88F */  lw         $t0, 0x40($sp)
    /* AA0C 80144604 00000000 */  nop
    /* AA10 80144608 2A101701 */  slt        $v0, $t0, $s7
    /* AA14 8014460C 05004010 */  beqz       $v0, .L80144624
    /* AA18 80144610 2600A22A */   slti      $v0, $s5, 0x26
    /* AA1C 80144614 4000B78F */  lw         $s7, 0x40($sp)
    /* AA20 80144618 5000A98F */  lw         $t1, 0x50($sp)
    /* AA24 8014461C 00000000 */  nop
    /* AA28 80144620 23A0E902 */  subu       $s4, $s7, $t1
  .L80144624:
    /* AA2C 80144624 02004014 */  bnez       $v0, .L80144630
    /* AA30 80144628 2600822A */   slti      $v0, $s4, 0x26
    /* AA34 8014462C 26001524 */  addiu      $s5, $zero, 0x26
  .L80144630:
    /* AA38 80144630 02004014 */  bnez       $v0, .L8014463C
    /* AA3C 80144634 0200A22A */   slti      $v0, $s5, 0x2
    /* AA40 80144638 26001424 */  addiu      $s4, $zero, 0x26
  .L8014463C:
    /* AA44 8014463C 02004010 */  beqz       $v0, .L80144648
    /* AA48 80144640 0200822A */   slti      $v0, $s4, 0x2
    /* AA4C 80144644 01001524 */  addiu      $s5, $zero, 0x1
  .L80144648:
    /* AA50 80144648 02004010 */  beqz       $v0, .L80144654
    /* AA54 8014464C 2600C22A */   slti      $v0, $s6, 0x26
    /* AA58 80144650 01001424 */  addiu      $s4, $zero, 0x1
  .L80144654:
    /* AA5C 80144654 02004014 */  bnez       $v0, .L80144660
    /* AA60 80144658 2600E22A */   slti      $v0, $s7, 0x26
    /* AA64 8014465C 26001624 */  addiu      $s6, $zero, 0x26
  .L80144660:
    /* AA68 80144660 02004014 */  bnez       $v0, .L8014466C
    /* AA6C 80144664 0200C22A */   slti      $v0, $s6, 0x2
    /* AA70 80144668 26001724 */  addiu      $s7, $zero, 0x26
  .L8014466C:
    /* AA74 8014466C 02004010 */  beqz       $v0, .L80144678
    /* AA78 80144670 0200E22A */   slti      $v0, $s7, 0x2
    /* AA7C 80144674 01001624 */  addiu      $s6, $zero, 0x1
  .L80144678:
    /* AA80 80144678 02004010 */  beqz       $v0, .L80144684
    /* AA84 8014467C 00000000 */   nop
    /* AA88 80144680 01001724 */  addiu      $s7, $zero, 0x1
  .L80144684:
    /* AA8C 80144684 1000BEAF */  sw         $fp, 0x10($sp)
    /* AA90 80144688 2120A002 */  addu       $a0, $s5, $zero
    /* AA94 8014468C 21288002 */  addu       $a1, $s4, $zero
    /* AA98 80144690 2130C002 */  addu       $a2, $s6, $zero
    /* AA9C 80144694 1710050C */  jal        DefineRoom__Fiiiii
    /* AAA0 80144698 2138E002 */   addu      $a3, $s7, $zero
    /* AAA4 8014469C 01000324 */  addiu      $v1, $zero, 0x1
    /* AAA8 801446A0 0600C317 */  bne        $fp, $v1, .L801446BC
    /* AAAC 801446A4 0200A226 */   addiu     $v0, $s5, 0x2
    /* AAB0 801446A8 501782AF */  sw         $v0, %gp_rel(nSx1)($gp)
    /* AAB4 801446AC 02008226 */  addiu      $v0, $s4, 0x2
    /* AAB8 801446B0 541782AF */  sw         $v0, %gp_rel(nSy1)($gp)
    /* AABC 801446B4 581796AF */  sw         $s6, %gp_rel(nSx2)($gp)
    /* AAC0 801446B8 5C1797AF */  sw         $s7, %gp_rel(nSy2)($gp)
  .L801446BC:
    /* AAC4 801446BC 4C179E8F */  lw         $fp, %gp_rel(nRoomCnt)($gp)
    /* AAC8 801446C0 00000000 */  nop
    /* AACC 801446C4 80101E00 */  sll        $v0, $fp, 2
    /* AAD0 801446C8 21105E00 */  addu       $v0, $v0, $fp
    /* AAD4 801446CC 80100200 */  sll        $v0, $v0, 2
    /* AAD8 801446D0 1480013C */  lui        $at, %hi(RoomList + 0x10)
    /* AADC 801446D4 21082200 */  addu       $at, $at, $v0
    /* AAE0 801446D8 842733AC */  sw         $s3, %lo(RoomList + 0x10)($at)
    /* AAE4 801446DC 84006012 */  beqz       $s3, .L801448F0
    /* AAE8 801446E0 00000000 */   nop
    /* AAEC 801446E4 A400A88F */  lw         $t0, 0xA4($sp)
    /* AAF0 801446E8 00000000 */  nop
    /* AAF4 801446EC 1C000315 */  bne        $t0, $v1, .L80144760
    /* AAF8 801446F0 00000000 */   nop
    /* AAFC 801446F4 2320D502 */  subu       $a0, $s6, $s5
    /* AB00 801446F8 C9F6000C */  jal        ENG_random__Fl
    /* AB04 801446FC FEFF8424 */   addiu     $a0, $a0, -0x2
    /* AB08 80144700 21105500 */  addu       $v0, $v0, $s5
    /* AB0C 80144704 01004224 */  addiu      $v0, $v0, 0x1
    /* AB10 80144708 80801300 */  sll        $s0, $s3, 2
    /* AB14 8014470C 21801302 */  addu       $s0, $s0, $s3
    /* AB18 80144710 80801000 */  sll        $s0, $s0, 2
    /* AB1C 80144714 5800A2AF */  sw         $v0, 0x58($sp)
    /* AB20 80144718 1480013C */  lui        $at, %hi(RoomList + 0x8)
    /* AB24 8014471C 21083000 */  addu       $at, $at, $s0
    /* AB28 80144720 7C27248C */  lw         $a0, %lo(RoomList + 0x8)($at)
    /* AB2C 80144724 1480013C */  lui        $at, %hi(RoomList)
    /* AB30 80144728 21083000 */  addu       $at, $at, $s0
    /* AB34 8014472C 7427228C */  lw         $v0, %lo(RoomList)($at)
    /* AB38 80144730 6000B4AF */  sw         $s4, 0x60($sp)
    /* AB3C 80144734 23208200 */  subu       $a0, $a0, $v0
    /* AB40 80144738 C9F6000C */  jal        ENG_random__Fl
    /* AB44 8014473C FEFF8424 */   addiu     $a0, $a0, -0x2
    /* AB48 80144740 1480013C */  lui        $at, %hi(RoomList)
    /* AB4C 80144744 21083000 */  addu       $at, $at, $s0
    /* AB50 80144748 7427238C */  lw         $v1, %lo(RoomList)($at)
    /* AB54 8014474C 1480013C */  lui        $at, %hi(RoomList + 0xC)
    /* AB58 80144750 21083000 */  addu       $at, $at, $s0
    /* AB5C 80144754 8027318C */  lw         $s1, %lo(RoomList + 0xC)($at)
    /* AB60 80144758 21104300 */  addu       $v0, $v0, $v1
    /* AB64 8014475C 01005224 */  addiu      $s2, $v0, 0x1
  .L80144760:
    /* AB68 80144760 A400A98F */  lw         $t1, 0xA4($sp)
    /* AB6C 80144764 03000224 */  addiu      $v0, $zero, 0x3
    /* AB70 80144768 1C002215 */  bne        $t1, $v0, .L801447DC
    /* AB74 8014476C 00000000 */   nop
    /* AB78 80144770 2320D502 */  subu       $a0, $s6, $s5
    /* AB7C 80144774 C9F6000C */  jal        ENG_random__Fl
    /* AB80 80144778 FEFF8424 */   addiu     $a0, $a0, -0x2
    /* AB84 8014477C 21105500 */  addu       $v0, $v0, $s5
    /* AB88 80144780 01004224 */  addiu      $v0, $v0, 0x1
    /* AB8C 80144784 80801300 */  sll        $s0, $s3, 2
    /* AB90 80144788 21801302 */  addu       $s0, $s0, $s3
    /* AB94 8014478C 80801000 */  sll        $s0, $s0, 2
    /* AB98 80144790 5800A2AF */  sw         $v0, 0x58($sp)
    /* AB9C 80144794 1480013C */  lui        $at, %hi(RoomList + 0x8)
    /* ABA0 80144798 21083000 */  addu       $at, $at, $s0
    /* ABA4 8014479C 7C27248C */  lw         $a0, %lo(RoomList + 0x8)($at)
    /* ABA8 801447A0 1480013C */  lui        $at, %hi(RoomList)
    /* ABAC 801447A4 21083000 */  addu       $at, $at, $s0
    /* ABB0 801447A8 7427228C */  lw         $v0, %lo(RoomList)($at)
    /* ABB4 801447AC 6000B7AF */  sw         $s7, 0x60($sp)
    /* ABB8 801447B0 23208200 */  subu       $a0, $a0, $v0
    /* ABBC 801447B4 C9F6000C */  jal        ENG_random__Fl
    /* ABC0 801447B8 FEFF8424 */   addiu     $a0, $a0, -0x2
    /* ABC4 801447BC 1480013C */  lui        $at, %hi(RoomList)
    /* ABC8 801447C0 21083000 */  addu       $at, $at, $s0
    /* ABCC 801447C4 7427238C */  lw         $v1, %lo(RoomList)($at)
    /* ABD0 801447C8 1480013C */  lui        $at, %hi(RoomList + 0x4)
    /* ABD4 801447CC 21083000 */  addu       $at, $at, $s0
    /* ABD8 801447D0 7827318C */  lw         $s1, %lo(RoomList + 0x4)($at)
    /* ABDC 801447D4 21104300 */  addu       $v0, $v0, $v1
    /* ABE0 801447D8 01005224 */  addiu      $s2, $v0, 0x1
  .L801447DC:
    /* ABE4 801447DC A400A88F */  lw         $t0, 0xA4($sp)
    /* ABE8 801447E0 02000224 */  addiu      $v0, $zero, 0x2
    /* ABEC 801447E4 1C000215 */  bne        $t0, $v0, .L80144858
    /* ABF0 801447E8 00000000 */   nop
    /* ABF4 801447EC 2320F402 */  subu       $a0, $s7, $s4
    /* ABF8 801447F0 C9F6000C */  jal        ENG_random__Fl
    /* ABFC 801447F4 FEFF8424 */   addiu     $a0, $a0, -0x2
    /* AC00 801447F8 21105400 */  addu       $v0, $v0, $s4
    /* AC04 801447FC 01004224 */  addiu      $v0, $v0, 0x1
    /* AC08 80144800 80801300 */  sll        $s0, $s3, 2
    /* AC0C 80144804 21801302 */  addu       $s0, $s0, $s3
    /* AC10 80144808 80801000 */  sll        $s0, $s0, 2
    /* AC14 8014480C 6000A2AF */  sw         $v0, 0x60($sp)
    /* AC18 80144810 1480013C */  lui        $at, %hi(RoomList + 0xC)
    /* AC1C 80144814 21083000 */  addu       $at, $at, $s0
    /* AC20 80144818 8027248C */  lw         $a0, %lo(RoomList + 0xC)($at)
    /* AC24 8014481C 1480013C */  lui        $at, %hi(RoomList + 0x4)
    /* AC28 80144820 21083000 */  addu       $at, $at, $s0
    /* AC2C 80144824 7827228C */  lw         $v0, %lo(RoomList + 0x4)($at)
    /* AC30 80144828 1480013C */  lui        $at, %hi(RoomList)
    /* AC34 8014482C 21083000 */  addu       $at, $at, $s0
    /* AC38 80144830 7427328C */  lw         $s2, %lo(RoomList)($at)
    /* AC3C 80144834 23208200 */  subu       $a0, $a0, $v0
    /* AC40 80144838 C9F6000C */  jal        ENG_random__Fl
    /* AC44 8014483C FEFF8424 */   addiu     $a0, $a0, -0x2
    /* AC48 80144840 1480013C */  lui        $at, %hi(RoomList + 0x4)
    /* AC4C 80144844 21083000 */  addu       $at, $at, $s0
    /* AC50 80144848 7827238C */  lw         $v1, %lo(RoomList + 0x4)($at)
    /* AC54 8014484C 5800B6AF */  sw         $s6, 0x58($sp)
    /* AC58 80144850 21104300 */  addu       $v0, $v0, $v1
    /* AC5C 80144854 01005124 */  addiu      $s1, $v0, 0x1
  .L80144858:
    /* AC60 80144858 A400A98F */  lw         $t1, 0xA4($sp)
    /* AC64 8014485C 04000224 */  addiu      $v0, $zero, 0x4
    /* AC68 80144860 1D002215 */  bne        $t1, $v0, .L801448D8
    /* AC6C 80144864 21304002 */   addu      $a2, $s2, $zero
    /* AC70 80144868 2320F402 */  subu       $a0, $s7, $s4
    /* AC74 8014486C C9F6000C */  jal        ENG_random__Fl
    /* AC78 80144870 FEFF8424 */   addiu     $a0, $a0, -0x2
    /* AC7C 80144874 21105400 */  addu       $v0, $v0, $s4
    /* AC80 80144878 01004224 */  addiu      $v0, $v0, 0x1
    /* AC84 8014487C 80801300 */  sll        $s0, $s3, 2
    /* AC88 80144880 21801302 */  addu       $s0, $s0, $s3
    /* AC8C 80144884 80801000 */  sll        $s0, $s0, 2
    /* AC90 80144888 6000A2AF */  sw         $v0, 0x60($sp)
    /* AC94 8014488C 1480013C */  lui        $at, %hi(RoomList + 0xC)
    /* AC98 80144890 21083000 */  addu       $at, $at, $s0
    /* AC9C 80144894 8027248C */  lw         $a0, %lo(RoomList + 0xC)($at)
    /* ACA0 80144898 1480013C */  lui        $at, %hi(RoomList + 0x4)
    /* ACA4 8014489C 21083000 */  addu       $at, $at, $s0
    /* ACA8 801448A0 7827228C */  lw         $v0, %lo(RoomList + 0x4)($at)
    /* ACAC 801448A4 1480013C */  lui        $at, %hi(RoomList + 0x8)
    /* ACB0 801448A8 21083000 */  addu       $at, $at, $s0
    /* ACB4 801448AC 7C27328C */  lw         $s2, %lo(RoomList + 0x8)($at)
    /* ACB8 801448B0 23208200 */  subu       $a0, $a0, $v0
    /* ACBC 801448B4 C9F6000C */  jal        ENG_random__Fl
    /* ACC0 801448B8 FEFF8424 */   addiu     $a0, $a0, -0x2
    /* ACC4 801448BC 1480013C */  lui        $at, %hi(RoomList + 0x4)
    /* ACC8 801448C0 21083000 */  addu       $at, $at, $s0
    /* ACCC 801448C4 7827238C */  lw         $v1, %lo(RoomList + 0x4)($at)
    /* ACD0 801448C8 5800B5AF */  sw         $s5, 0x58($sp)
    /* ACD4 801448CC 21104300 */  addu       $v0, $v0, $v1
    /* ACD8 801448D0 01005124 */  addiu      $s1, $v0, 0x1
    /* ACDC 801448D4 21304002 */  addu       $a2, $s2, $zero
  .L801448D8:
    /* ACE0 801448D8 A400A88F */  lw         $t0, 0xA4($sp)
    /* ACE4 801448DC 5800A48F */  lw         $a0, 0x58($sp)
    /* ACE8 801448E0 6000A58F */  lw         $a1, 0x60($sp)
    /* ACEC 801448E4 21382002 */  addu       $a3, $s1, $zero
    /* ACF0 801448E8 DF10050C */  jal        AddHall__Fiiiii
    /* ACF4 801448EC 1000A8AF */   sw        $t0, 0x10($sp)
  .L801448F0:
    /* ACF8 801448F0 4800A98F */  lw         $t1, 0x48($sp)
    /* ACFC 801448F4 5000A88F */  lw         $t0, 0x50($sp)
    /* AD00 801448F8 00000000 */  nop
    /* AD04 801448FC 2A102801 */  slt        $v0, $t1, $t0
    /* AD08 80144900 2F004010 */  beqz       $v0, .L801449C0
    /* AD0C 80144904 FEFFA626 */   addiu     $a2, $s5, -0x2
    /* AD10 80144908 FEFFE726 */  addiu      $a3, $s7, -0x2
    /* AD14 8014490C 2800A98F */  lw         $t1, 0x28($sp)
    /* AD18 80144910 3000A88F */  lw         $t0, 0x30($sp)
    /* AD1C 80144914 02000224 */  addiu      $v0, $zero, 0x2
    /* AD20 80144918 1000BEAF */  sw         $fp, 0x10($sp)
    /* AD24 8014491C 1400A2AF */  sw         $v0, 0x14($sp)
    /* AD28 80144920 1800A0AF */  sw         $zero, 0x18($sp)
    /* AD2C 80144924 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* AD30 80144928 2000A0AF */  sw         $zero, 0x20($sp)
    /* AD34 8014492C 02003225 */  addiu      $s2, $t1, 0x2
    /* AD38 80144930 21204002 */  addu       $a0, $s2, $zero
    /* AD3C 80144934 02001325 */  addiu      $s3, $t0, 0x2
    /* AD40 80144938 1511050C */  jal        CreateRoom__Fiiiiiiiii
    /* AD44 8014493C 21286002 */   addu      $a1, $s3, $zero
    /* AD48 80144940 0200C426 */  addiu      $a0, $s6, 0x2
    /* AD4C 80144944 02008526 */  addiu      $a1, $s4, 0x2
    /* AD50 80144948 3800A98F */  lw         $t1, 0x38($sp)
    /* AD54 8014494C 4000A88F */  lw         $t0, 0x40($sp)
    /* AD58 80144950 04000224 */  addiu      $v0, $zero, 0x4
    /* AD5C 80144954 1000BEAF */  sw         $fp, 0x10($sp)
    /* AD60 80144958 1400A2AF */  sw         $v0, 0x14($sp)
    /* AD64 8014495C 1800A0AF */  sw         $zero, 0x18($sp)
    /* AD68 80144960 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* AD6C 80144964 2000A0AF */  sw         $zero, 0x20($sp)
    /* AD70 80144968 FEFF3125 */  addiu      $s1, $t1, -0x2
    /* AD74 8014496C 21302002 */  addu       $a2, $s1, $zero
    /* AD78 80144970 FEFF1025 */  addiu      $s0, $t0, -0x2
    /* AD7C 80144974 1511050C */  jal        CreateRoom__Fiiiiiiiii
    /* AD80 80144978 21380002 */   addu      $a3, $s0, $zero
    /* AD84 8014497C 21204002 */  addu       $a0, $s2, $zero
    /* AD88 80144980 0200E526 */  addiu      $a1, $s7, 0x2
    /* AD8C 80144984 FEFFC626 */  addiu      $a2, $s6, -0x2
    /* AD90 80144988 21380002 */  addu       $a3, $s0, $zero
    /* AD94 8014498C 01000224 */  addiu      $v0, $zero, 0x1
    /* AD98 80144990 1000BEAF */  sw         $fp, 0x10($sp)
    /* AD9C 80144994 1400A2AF */  sw         $v0, 0x14($sp)
    /* ADA0 80144998 1800A0AF */  sw         $zero, 0x18($sp)
    /* ADA4 8014499C 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* ADA8 801449A0 1511050C */  jal        CreateRoom__Fiiiiiiiii
    /* ADAC 801449A4 2000A0AF */   sw        $zero, 0x20($sp)
    /* ADB0 801449A8 0200A426 */  addiu      $a0, $s5, 0x2
    /* ADB4 801449AC 21286002 */  addu       $a1, $s3, $zero
    /* ADB8 801449B0 21302002 */  addu       $a2, $s1, $zero
    /* ADBC 801449B4 FEFF8726 */  addiu      $a3, $s4, -0x2
    /* ADC0 801449B8 9E120508 */  j          .L80144A78
    /* ADC4 801449BC 03000224 */   addiu     $v0, $zero, 0x3
  .L801449C0:
    /* ADC8 801449C0 FEFFC626 */  addiu      $a2, $s6, -0x2
    /* ADCC 801449C4 FEFF8726 */  addiu      $a3, $s4, -0x2
    /* ADD0 801449C8 2800A98F */  lw         $t1, 0x28($sp)
    /* ADD4 801449CC 3000A88F */  lw         $t0, 0x30($sp)
    /* ADD8 801449D0 03000224 */  addiu      $v0, $zero, 0x3
    /* ADDC 801449D4 1000BEAF */  sw         $fp, 0x10($sp)
    /* ADE0 801449D8 1400A2AF */  sw         $v0, 0x14($sp)
    /* ADE4 801449DC 1800A0AF */  sw         $zero, 0x18($sp)
    /* ADE8 801449E0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* ADEC 801449E4 2000A0AF */  sw         $zero, 0x20($sp)
    /* ADF0 801449E8 02003225 */  addiu      $s2, $t1, 0x2
    /* ADF4 801449EC 21204002 */  addu       $a0, $s2, $zero
    /* ADF8 801449F0 02001325 */  addiu      $s3, $t0, 0x2
    /* ADFC 801449F4 1511050C */  jal        CreateRoom__Fiiiiiiiii
    /* AE00 801449F8 21286002 */   addu      $a1, $s3, $zero
    /* AE04 801449FC 0200A426 */  addiu      $a0, $s5, 0x2
    /* AE08 80144A00 0200E526 */  addiu      $a1, $s7, 0x2
    /* AE0C 80144A04 3800A98F */  lw         $t1, 0x38($sp)
    /* AE10 80144A08 4000A88F */  lw         $t0, 0x40($sp)
    /* AE14 80144A0C 01000224 */  addiu      $v0, $zero, 0x1
    /* AE18 80144A10 1000BEAF */  sw         $fp, 0x10($sp)
    /* AE1C 80144A14 1400A2AF */  sw         $v0, 0x14($sp)
    /* AE20 80144A18 1800A0AF */  sw         $zero, 0x18($sp)
    /* AE24 80144A1C 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* AE28 80144A20 2000A0AF */  sw         $zero, 0x20($sp)
    /* AE2C 80144A24 FEFF3125 */  addiu      $s1, $t1, -0x2
    /* AE30 80144A28 21302002 */  addu       $a2, $s1, $zero
    /* AE34 80144A2C FEFF1025 */  addiu      $s0, $t0, -0x2
    /* AE38 80144A30 1511050C */  jal        CreateRoom__Fiiiiiiiii
    /* AE3C 80144A34 21380002 */   addu      $a3, $s0, $zero
    /* AE40 80144A38 21204002 */  addu       $a0, $s2, $zero
    /* AE44 80144A3C 02008526 */  addiu      $a1, $s4, 0x2
    /* AE48 80144A40 FEFFA626 */  addiu      $a2, $s5, -0x2
    /* AE4C 80144A44 21380002 */  addu       $a3, $s0, $zero
    /* AE50 80144A48 02000224 */  addiu      $v0, $zero, 0x2
    /* AE54 80144A4C 1000BEAF */  sw         $fp, 0x10($sp)
    /* AE58 80144A50 1400A2AF */  sw         $v0, 0x14($sp)
    /* AE5C 80144A54 1800A0AF */  sw         $zero, 0x18($sp)
    /* AE60 80144A58 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* AE64 80144A5C 1511050C */  jal        CreateRoom__Fiiiiiiiii
    /* AE68 80144A60 2000A0AF */   sw        $zero, 0x20($sp)
    /* AE6C 80144A64 0200C426 */  addiu      $a0, $s6, 0x2
    /* AE70 80144A68 21286002 */  addu       $a1, $s3, $zero
    /* AE74 80144A6C 21302002 */  addu       $a2, $s1, $zero
    /* AE78 80144A70 FEFFE726 */  addiu      $a3, $s7, -0x2
    /* AE7C 80144A74 04000224 */  addiu      $v0, $zero, 0x4
  .L80144A78:
    /* AE80 80144A78 1000BEAF */  sw         $fp, 0x10($sp)
    /* AE84 80144A7C 1400A2AF */  sw         $v0, 0x14($sp)
    /* AE88 80144A80 1800A0AF */  sw         $zero, 0x18($sp)
    /* AE8C 80144A84 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* AE90 80144A88 1511050C */  jal        CreateRoom__Fiiiiiiiii
    /* AE94 80144A8C 2000A0AF */   sw        $zero, 0x20($sp)
  .L80144A90:
    /* AE98 80144A90 8C00BF8F */  lw         $ra, 0x8C($sp)
    /* AE9C 80144A94 8800BE8F */  lw         $fp, 0x88($sp)
    /* AEA0 80144A98 8400B78F */  lw         $s7, 0x84($sp)
    /* AEA4 80144A9C 8000B68F */  lw         $s6, 0x80($sp)
    /* AEA8 80144AA0 7C00B58F */  lw         $s5, 0x7C($sp)
    /* AEAC 80144AA4 7800B48F */  lw         $s4, 0x78($sp)
    /* AEB0 80144AA8 7400B38F */  lw         $s3, 0x74($sp)
    /* AEB4 80144AAC 7000B28F */  lw         $s2, 0x70($sp)
    /* AEB8 80144AB0 6C00B18F */  lw         $s1, 0x6C($sp)
    /* AEBC 80144AB4 6800B08F */  lw         $s0, 0x68($sp)
    /* AEC0 80144AB8 9000BD27 */  addiu      $sp, $sp, 0x90
    /* AEC4 80144ABC 0800E003 */  jr         $ra
    /* AEC8 80144AC0 00000000 */   nop
endlabel CreateRoom__Fiiiiiiiii
