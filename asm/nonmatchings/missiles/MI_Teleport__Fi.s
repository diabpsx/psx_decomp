.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Teleport__Fi, 0x36C

glabel MI_Teleport__Fi
    /* D978 80147570 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* D97C 80147574 1000B0AF */  sw         $s0, 0x10($sp)
    /* D980 80147578 21808000 */  addu       $s0, $a0, $zero
    /* D984 8014757C 2400BFAF */  sw         $ra, 0x24($sp)
    /* D988 80147580 2000B4AF */  sw         $s4, 0x20($sp)
    /* D98C 80147584 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* D990 80147588 1800B2AF */  sw         $s2, 0x18($sp)
    /* D994 8014758C 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* D998 80147590 1400B1AF */   sw        $s1, 0x14($sp)
    /* D99C 80147594 21984000 */  addu       $s3, $v0, $zero
    /* D9A0 80147598 07006016 */  bnez       $s3, .L801475B8
    /* D9A4 8014759C 80101000 */   sll       $v0, $s0, 2
    /* D9A8 801475A0 21200000 */  addu       $a0, $zero, $zero
    /* D9AC 801475A4 1280053C */  lui        $a1, %hi(D_8011A06C)
    /* D9B0 801475A8 6CA0A524 */  addiu      $a1, $a1, %lo(D_8011A06C)
    /* D9B4 801475AC A583000C */  jal        DBG_Error
    /* D9B8 801475B0 C2120624 */   addiu     $a2, $zero, 0x12C2
    /* D9BC 801475B4 80101000 */  sll        $v0, $s0, 2
  .L801475B8:
    /* D9C0 801475B8 21105000 */  addu       $v0, $v0, $s0
    /* D9C4 801475BC 80100200 */  sll        $v0, $v0, 2
    /* D9C8 801475C0 23105000 */  subu       $v0, $v0, $s0
    /* D9CC 801475C4 80880200 */  sll        $s1, $v0, 2
    /* D9D0 801475C8 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D9D4 801475CC 21083100 */  addu       $at, $at, $s1
    /* D9D8 801475D0 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* D9DC 801475D4 00000000 */  nop
    /* D9E0 801475D8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* D9E4 801475DC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D9E8 801475E0 21083100 */  addu       $at, $at, $s1
    /* D9EC 801475E4 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* D9F0 801475E8 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D9F4 801475EC 21083100 */  addu       $at, $at, $s1
    /* D9F8 801475F0 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* D9FC 801475F4 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* DA00 801475F8 21083100 */  addu       $at, $at, $s1
    /* DA04 801475FC 862C3284 */  lh         $s2, %lo(missile + 0x2E)($at)
    /* DA08 80147600 07004014 */  bnez       $v0, .L80147620
    /* DA0C 80147604 40101200 */   sll       $v0, $s2, 1
    /* DA10 80147608 01000224 */  addiu      $v0, $zero, 0x1
    /* DA14 8014760C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* DA18 80147610 21083100 */  addu       $at, $at, $s1
    /* DA1C 80147614 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* DA20 80147618 2E1E0508 */  j          .L801478B8
    /* DA24 8014761C 00000000 */   nop
  .L80147620:
    /* DA28 80147620 21105200 */  addu       $v0, $v0, $s2
    /* DA2C 80147624 80100200 */  sll        $v0, $v0, 2
    /* DA30 80147628 21105200 */  addu       $v0, $v0, $s2
    /* DA34 8014762C 00110200 */  sll        $v0, $v0, 4
    /* DA38 80147630 23105200 */  subu       $v0, $v0, $s2
    /* DA3C 80147634 80100200 */  sll        $v0, $v0, 2
    /* DA40 80147638 21105200 */  addu       $v0, $v0, $s2
    /* DA44 8014763C C0800200 */  sll        $s0, $v0, 3
    /* DA48 80147640 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* DA4C 80147644 21083000 */  addu       $at, $at, $s0
    /* DA50 80147648 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* DA54 8014764C 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* DA58 80147650 21083000 */  addu       $at, $at, $s0
    /* DA5C 80147654 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* DA60 80147658 1B83010C */  jal        PlrClrTrans__Fii
    /* DA64 8014765C 00000000 */   nop
    /* DA68 80147660 1080013C */  lui        $at, %hi(missile + 0x31)
    /* DA6C 80147664 21083100 */  addu       $at, $at, $s1
    /* DA70 80147668 892C2290 */  lbu        $v0, %lo(missile + 0x31)($at)
    /* DA74 8014766C 00000000 */  nop
    /* DA78 80147670 00160200 */  sll        $v0, $v0, 24
    /* DA7C 80147674 03160200 */  sra        $v0, $v0, 24
    /* DA80 80147678 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* DA84 8014767C 21083000 */  addu       $at, $at, $s0
    /* DA88 80147680 68A522A4 */  sh         $v0, %lo(plr + 0x30)($at)
    /* DA8C 80147684 1080013C */  lui        $at, %hi(missile + 0x32)
    /* DA90 80147688 21083100 */  addu       $at, $at, $s1
    /* DA94 8014768C 8A2C2290 */  lbu        $v0, %lo(missile + 0x32)($at)
    /* DA98 80147690 00000000 */  nop
    /* DA9C 80147694 00160200 */  sll        $v0, $v0, 24
    /* DAA0 80147698 03160200 */  sra        $v0, $v0, 24
    /* DAA4 8014769C 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* DAA8 801476A0 21083000 */  addu       $at, $at, $s0
    /* DAAC 801476A4 6AA522A4 */  sh         $v0, %lo(plr + 0x32)($at)
    /* DAB0 801476A8 0E80023C */  lui        $v0, %hi(plr)
    /* DAB4 801476AC 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* DAB8 801476B0 21A00202 */  addu       $s4, $s0, $v0
    /* DABC 801476B4 3D0080A2 */  sb         $zero, 0x3D($s4)
    /* DAC0 801476B8 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* DAC4 801476BC 21083000 */  addu       $at, $at, $s0
    /* DAC8 801476C0 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* DACC 801476C4 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* DAD0 801476C8 21083000 */  addu       $at, $at, $s0
    /* DAD4 801476CC 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* DAD8 801476D0 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* DADC 801476D4 21083000 */  addu       $at, $at, $s0
    /* DAE0 801476D8 68A52294 */  lhu        $v0, %lo(plr + 0x30)($at)
    /* DAE4 801476DC 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* DAE8 801476E0 21083000 */  addu       $at, $at, $s0
    /* DAEC 801476E4 6AA52394 */  lhu        $v1, %lo(plr + 0x32)($at)
    /* DAF0 801476E8 0E80013C */  lui        $at, %hi(plr + 0x3C)
    /* DAF4 801476EC 21083000 */  addu       $at, $at, $s0
    /* DAF8 801476F0 74A520A0 */  sb         $zero, %lo(plr + 0x3C)($at)
    /* DAFC 801476F4 0E80013C */  lui        $at, %hi(plr + 0x38)
    /* DB00 801476F8 21083000 */  addu       $at, $at, $s0
    /* DB04 801476FC 70A522A4 */  sh         $v0, %lo(plr + 0x38)($at)
    /* DB08 80147700 0E80013C */  lui        $at, %hi(plr + 0x3A)
    /* DB0C 80147704 21083000 */  addu       $at, $at, $s0
    /* DB10 80147708 72A523A4 */  sh         $v1, %lo(plr + 0x3A)($at)
    /* DB14 8014770C 3983010C */  jal        PlrDoTrans__Fii
    /* DB18 80147710 00000000 */   nop
    /* DB1C 80147714 01000224 */  addiu      $v0, $zero, 0x1
    /* DB20 80147718 21204002 */  addu       $a0, $s2, $zero
    /* DB24 8014771C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* DB28 80147720 21083100 */  addu       $at, $at, $s1
    /* DB2C 80147724 762C22A4 */  sh         $v0, %lo(missile + 0x1E)($at)
    /* DB30 80147728 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* DB34 8014772C 21083000 */  addu       $at, $at, $s0
    /* DB38 80147730 68A52584 */  lh         $a1, %lo(plr + 0x30)($at)
    /* DB3C 80147734 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* DB40 80147738 21083000 */  addu       $at, $at, $s0
    /* DB44 8014773C 6AA52684 */  lh         $a2, %lo(plr + 0x32)($at)
    /* DB48 80147740 C0280500 */  sll        $a1, $a1, 3
    /* DB4C 80147744 0400A534 */  ori        $a1, $a1, 0x4
    /* DB50 80147748 C0300600 */  sll        $a2, $a2, 3
    /* DB54 8014774C 10E1010C */  jal        WorldToOffset__Fiii
    /* DB58 80147750 0400C634 */   ori       $a2, $a2, 0x4
    /* DB5C 80147754 1280023C */  lui        $v0, %hi(leveltype)
    /* DB60 80147758 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* DB64 8014775C 00000000 */  nop
    /* DB68 80147760 21004010 */  beqz       $v0, .L801477E8
    /* DB6C 80147764 00000000 */   nop
    /* DB70 80147768 0E80013C */  lui        $at, %hi(plr + 0x5B)
    /* DB74 8014776C 21083000 */  addu       $at, $at, $s0
    /* DB78 80147770 93A52480 */  lb         $a0, %lo(plr + 0x5B)($at)
    /* DB7C 80147774 EC34010C */  jal        light_fix__Fi
    /* DB80 80147778 00000000 */   nop
    /* DB84 8014777C 0E80013C */  lui        $at, %hi(plr + 0x5B)
    /* DB88 80147780 21083000 */  addu       $at, $at, $s0
    /* DB8C 80147784 93A52480 */  lb         $a0, %lo(plr + 0x5B)($at)
    /* DB90 80147788 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* DB94 8014778C 21083000 */  addu       $at, $at, $s0
    /* DB98 80147790 68A52584 */  lh         $a1, %lo(plr + 0x30)($at)
    /* DB9C 80147794 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* DBA0 80147798 21083000 */  addu       $at, $at, $s0
    /* DBA4 8014779C 6AA52684 */  lh         $a2, %lo(plr + 0x32)($at)
    /* DBA8 801477A0 E134010C */  jal        ChangeLightXY__Fiii
    /* DBAC 801477A4 00000000 */   nop
    /* DBB0 801477A8 0E80013C */  lui        $at, %hi(plr + 0x5B)
    /* DBB4 801477AC 21083000 */  addu       $at, $at, $s0
    /* DBB8 801477B0 93A52480 */  lb         $a0, %lo(plr + 0x5B)($at)
    /* DBBC 801477B4 EC34010C */  jal        light_fix__Fi
    /* DBC0 801477B8 00000000 */   nop
    /* DBC4 801477BC 0E80013C */  lui        $at, %hi(plr + 0x5C)
    /* DBC8 801477C0 21083000 */  addu       $at, $at, $s0
    /* DBCC 801477C4 94A52480 */  lb         $a0, %lo(plr + 0x5C)($at)
    /* DBD0 801477C8 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* DBD4 801477CC 21083000 */  addu       $at, $at, $s0
    /* DBD8 801477D0 68A52584 */  lh         $a1, %lo(plr + 0x30)($at)
    /* DBDC 801477D4 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* DBE0 801477D8 21083000 */  addu       $at, $at, $s0
    /* DBE4 801477DC 6AA52684 */  lh         $a2, %lo(plr + 0x32)($at)
    /* DBE8 801477E0 B435010C */  jal        ChangeVisionXY__Fiii
    /* DBEC 801477E4 00000000 */   nop
  .L801477E8:
    /* DBF0 801477E8 1280023C */  lui        $v0, %hi(myplr)
    /* DBF4 801477EC 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* DBF8 801477F0 00000000 */  nop
    /* DBFC 801477F4 12004216 */  bne        $s2, $v0, .L80147840
    /* DC00 801477F8 21288002 */   addu      $a1, $s4, $zero
    /* DC04 801477FC 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* DC08 80147800 21083000 */  addu       $at, $at, $s0
    /* DC0C 80147804 68A52284 */  lh         $v0, %lo(plr + 0x30)($at)
    /* DC10 80147808 0E80043C */  lui        $a0, %hi(ScrollInfo + 0x8)
    /* DC14 8014780C 1C79848C */  lw         $a0, %lo(ScrollInfo + 0x8)($a0)
    /* DC18 80147810 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* DC1C 80147814 21083000 */  addu       $at, $at, $s0
    /* DC20 80147818 6AA52384 */  lh         $v1, %lo(plr + 0x32)($at)
    /* DC24 8014781C 0E80053C */  lui        $a1, %hi(ScrollInfo + 0xC)
    /* DC28 80147820 2079A58C */  lw         $a1, %lo(ScrollInfo + 0xC)($a1)
    /* DC2C 80147824 23104400 */  subu       $v0, $v0, $a0
    /* DC30 80147828 23186500 */  subu       $v1, $v1, $a1
    /* DC34 8014782C 1280013C */  lui        $at, %hi(ViewX)
    /* DC38 80147830 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* DC3C 80147834 1280013C */  lui        $at, %hi(ViewY)
    /* DC40 80147838 18C123AC */  sw         $v1, %lo(ViewY)($at)
    /* DC44 8014783C 21288002 */  addu       $a1, $s4, $zero
  .L80147840:
    /* DC48 80147840 1280043C */  lui        $a0, %hi(gplayer)
    /* DC4C 80147844 10B1848C */  lw         $a0, %lo(gplayer)($a0)
    /* DC50 80147848 AA56020C */  jal        SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks
    /* DC54 8014784C 21306002 */   addu      $a2, $s3, $zero
    /* DC58 80147850 D82A050C */  jal        MoveToScrollTarget__7CBlocks_8014ab60
    /* DC5C 80147854 21206002 */   addu      $a0, $s3, $zero
    /* DC60 80147858 0100443A */  xori       $a0, $s2, 0x1
    /* DC64 8014785C 40100400 */  sll        $v0, $a0, 1
    /* DC68 80147860 21104400 */  addu       $v0, $v0, $a0
    /* DC6C 80147864 80100200 */  sll        $v0, $v0, 2
    /* DC70 80147868 21104400 */  addu       $v0, $v0, $a0
    /* DC74 8014786C 00110200 */  sll        $v0, $v0, 4
    /* DC78 80147870 23104400 */  subu       $v0, $v0, $a0
    /* DC7C 80147874 80100200 */  sll        $v0, $v0, 2
    /* DC80 80147878 21104400 */  addu       $v0, $v0, $a0
    /* DC84 8014787C C0100200 */  sll        $v0, $v0, 3
    /* DC88 80147880 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* DC8C 80147884 21082200 */  addu       $at, $at, $v0
    /* DC90 80147888 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* DC94 8014788C 00000000 */  nop
    /* DC98 80147890 09004010 */  beqz       $v0, .L801478B8
    /* DC9C 80147894 00000000 */   nop
    /* DCA0 80147898 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* DCA4 8014789C 21083000 */  addu       $at, $at, $s0
    /* DCA8 801478A0 68A52584 */  lh         $a1, %lo(plr + 0x30)($at)
    /* DCAC 801478A4 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* DCB0 801478A8 21083000 */  addu       $at, $at, $s0
    /* DCB4 801478AC 6AA52684 */  lh         $a2, %lo(plr + 0x32)($at)
    /* DCB8 801478B0 2090020C */  jal        PlacePlayer__FiiiUc
    /* DCBC 801478B4 21380000 */   addu      $a3, $zero, $zero
  .L801478B8:
    /* DCC0 801478B8 2400BF8F */  lw         $ra, 0x24($sp)
    /* DCC4 801478BC 2000B48F */  lw         $s4, 0x20($sp)
    /* DCC8 801478C0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* DCCC 801478C4 1800B28F */  lw         $s2, 0x18($sp)
    /* DCD0 801478C8 1400B18F */  lw         $s1, 0x14($sp)
    /* DCD4 801478CC 1000B08F */  lw         $s0, 0x10($sp)
    /* DCD8 801478D0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* DCDC 801478D4 0800E003 */  jr         $ra
    /* DCE0 801478D8 00000000 */   nop
endlabel MI_Teleport__Fi
