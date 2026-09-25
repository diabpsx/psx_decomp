.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_Action__Fi, 0x3B8

glabel pad_func_Action__Fi
    /* 913A0 800A13A0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 913A4 800A13A4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 913A8 800A13A8 21808000 */  addu       $s0, $a0, $zero
    /* 913AC 800A13AC 0A80043C */  lui        $a0, %hi(DrawObjTask__FP4TASK)
    /* 913B0 800A13B0 78338424 */  addiu      $a0, $a0, %lo(DrawObjTask__FP4TASK)
    /* 913B4 800A13B4 66060524 */  addiu      $a1, $zero, 0x666
    /* 913B8 800A13B8 40101000 */  sll        $v0, $s0, 1
    /* 913BC 800A13BC 21105000 */  addu       $v0, $v0, $s0
    /* 913C0 800A13C0 80100200 */  sll        $v0, $v0, 2
    /* 913C4 800A13C4 21105000 */  addu       $v0, $v0, $s0
    /* 913C8 800A13C8 00110200 */  sll        $v0, $v0, 4
    /* 913CC 800A13CC 23105000 */  subu       $v0, $v0, $s0
    /* 913D0 800A13D0 80100200 */  sll        $v0, $v0, 2
    /* 913D4 800A13D4 21105000 */  addu       $v0, $v0, $s0
    /* 913D8 800A13D8 C0100200 */  sll        $v0, $v0, 3
    /* 913DC 800A13DC 0E80033C */  lui        $v1, %hi(plr)
    /* 913E0 800A13E0 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 913E4 800A13E4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 913E8 800A13E8 21A04300 */  addu       $s4, $v0, $v1
    /* 913EC 800A13EC 3400BFAF */  sw         $ra, 0x34($sp)
    /* 913F0 800A13F0 3000B6AF */  sw         $s6, 0x30($sp)
    /* 913F4 800A13F4 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 913F8 800A13F8 2400B3AF */  sw         $s3, 0x24($sp)
    /* 913FC 800A13FC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 91400 800A1400 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 91404 800A1404 30009586 */  lh         $s5, 0x30($s4)
    /* 91408 800A1408 32009686 */  lh         $s6, 0x32($s4)
    /* 9140C 800A140C B681000C */  jal        TSK_Exist
    /* 91410 800A1410 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 91414 800A1414 C5004014 */  bnez       $v0, .L800A172C
    /* 91418 800A1418 00000000 */   nop
    /* 9141C 800A141C 1280023C */  lui        $v0, %hi(questlog)
    /* 91420 800A1420 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 91424 800A1424 1280033C */  lui        $v1, %hi(stextflag)
    /* 91428 800A1428 E0BA6380 */  lb         $v1, %lo(stextflag)($v1)
    /* 9142C 800A142C 00000000 */  nop
    /* 91430 800A1430 25104300 */  or         $v0, $v0, $v1
    /* 91434 800A1434 1280033C */  lui        $v1, %hi(qtextflag)
    /* 91438 800A1438 60B96390 */  lbu        $v1, %lo(qtextflag)($v1)
    /* 9143C 800A143C 1280043C */  lui        $a0, %hi(chrflag)
    /* 91440 800A1440 C0B68490 */  lbu        $a0, %lo(chrflag)($a0)
    /* 91444 800A1444 25104300 */  or         $v0, $v0, $v1
    /* 91448 800A1448 25104400 */  or         $v0, $v0, $a0
    /* 9144C 800A144C 1280033C */  lui        $v1, %hi(invflag)
    /* 91450 800A1450 2CC36390 */  lbu        $v1, %lo(invflag)($v1)
    /* 91454 800A1454 1280043C */  lui        $a0, %hi(optionsflag)
    /* 91458 800A1458 48B2848C */  lw         $a0, %lo(optionsflag)($a0)
    /* 9145C 800A145C 25104300 */  or         $v0, $v0, $v1
    /* 91460 800A1460 25104400 */  or         $v0, $v0, $a0
    /* 91464 800A1464 80181000 */  sll        $v1, $s0, 2
    /* 91468 800A1468 1280013C */  lui        $at, %hi(_spselflag)
    /* 9146C 800A146C 21082300 */  addu       $at, $at, $v1
    /* 91470 800A1470 50B6238C */  lw         $v1, %lo(_spselflag)($at)
    /* 91474 800A1474 1280043C */  lui        $a0, %hi(sbookflag)
    /* 91478 800A1478 C6B68490 */  lbu        $a0, %lo(sbookflag)($a0)
    /* 9147C 800A147C 25104300 */  or         $v0, $v0, $v1
    /* 91480 800A1480 25104400 */  or         $v0, $v0, $a0
    /* 91484 800A1484 A9004014 */  bnez       $v0, .L800A172C
    /* 91488 800A1488 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 9148C 800A148C 040082A2 */  sb         $v0, 0x4($s4)
    /* 91490 800A1490 1280023C */  lui        $v0, %hi(sel_data)
    /* 91494 800A1494 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 91498 800A1498 1280013C */  lui        $at, %hi(_pcursobj)
    /* 9149C 800A149C 21082200 */  addu       $at, $at, $v0
    /* 914A0 800A14A0 60B72380 */  lb         $v1, %lo(_pcursobj)($at)
    /* 914A4 800A14A4 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 914A8 800A14A8 55006410 */  beq        $v1, $a0, .L800A1600
    /* 914AC 800A14AC 00000000 */   nop
    /* 914B0 800A14B0 1280013C */  lui        $at, %hi(_pcursitem)
    /* 914B4 800A14B4 21082200 */  addu       $at, $at, $v0
    /* 914B8 800A14B8 64B72580 */  lb         $a1, %lo(_pcursitem)($at)
    /* 914BC 800A14BC 00000000 */  nop
    /* 914C0 800A14C0 0D00A410 */  beq        $a1, $a0, .L800A14F8
    /* 914C4 800A14C4 40100300 */   sll       $v0, $v1, 1
    /* 914C8 800A14C8 21104300 */  addu       $v0, $v0, $v1
    /* 914CC 800A14CC 80100200 */  sll        $v0, $v0, 2
    /* 914D0 800A14D0 23104300 */  subu       $v0, $v0, $v1
    /* 914D4 800A14D4 80100200 */  sll        $v0, $v0, 2
    /* 914D8 800A14D8 0E80013C */  lui        $at, %hi(object + 0x2B)
    /* 914DC 800A14DC 21082200 */  addu       $at, $at, $v0
    /* 914E0 800A14E0 778C2290 */  lbu        $v0, %lo(object + 0x2B)($at)
    /* 914E4 800A14E4 00000000 */  nop
    /* 914E8 800A14E8 43004010 */  beqz       $v0, .L800A15F8
    /* 914EC 800A14EC 00000000 */   nop
    /* 914F0 800A14F0 4100A004 */  bltz       $a1, .L800A15F8
    /* 914F4 800A14F4 00000000 */   nop
  .L800A14F8:
    /* 914F8 800A14F8 21980000 */  addu       $s3, $zero, $zero
    /* 914FC 800A14FC 40100300 */  sll        $v0, $v1, 1
    /* 91500 800A1500 21104300 */  addu       $v0, $v0, $v1
    /* 91504 800A1504 80100200 */  sll        $v0, $v0, 2
    /* 91508 800A1508 23104300 */  subu       $v0, $v0, $v1
    /* 9150C 800A150C 80100200 */  sll        $v0, $v0, 2
    /* 91510 800A1510 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 91514 800A1514 21082200 */  addu       $at, $at, $v0
    /* 91518 800A1518 6B8C3180 */  lb         $s1, %lo(object + 0x1F)($at)
    /* 9151C 800A151C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 91520 800A1520 21082200 */  addu       $at, $at, $v0
    /* 91524 800A1524 6C8C3280 */  lb         $s2, %lo(object + 0x20)($at)
    /* 91528 800A1528 A4BF020C */  jal        GetSpellTarget__Fi
    /* 9152C 800A152C 21200002 */   addu      $a0, $s0, $zero
    /* 91530 800A1530 C890020C */  jal        Active__11SpellTarget_800a4320
    /* 91534 800A1534 21204000 */   addu      $a0, $v0, $zero
    /* 91538 800A1538 0B004010 */  beqz       $v0, .L800A1568
    /* 9153C 800A153C 00000000 */   nop
    /* 91540 800A1540 6D41000C */  jal        abs
    /* 91544 800A1544 23203502 */   subu      $a0, $s1, $s5
    /* 91548 800A1548 02004228 */  slti       $v0, $v0, 0x2
    /* 9154C 800A154C 07004010 */  beqz       $v0, .L800A156C
    /* 91550 800A1550 00000000 */   nop
    /* 91554 800A1554 6D41000C */  jal        abs
    /* 91558 800A1558 23205602 */   subu      $a0, $s2, $s6
    /* 9155C 800A155C 02004228 */  slti       $v0, $v0, 0x2
    /* 91560 800A1560 02004010 */  beqz       $v0, .L800A156C
    /* 91564 800A1564 00000000 */   nop
  .L800A1568:
    /* 91568 800A1568 01001324 */  addiu      $s3, $zero, 0x1
  .L800A156C:
    /* 9156C 800A156C 22006012 */  beqz       $s3, .L800A15F8
    /* 91570 800A1570 21302002 */   addu      $a2, $s1, $zero
    /* 91574 800A1574 30008486 */  lh         $a0, 0x30($s4)
    /* 91578 800A1578 32008586 */  lh         $a1, 0x32($s4)
    /* 9157C 800A157C 8AF6000C */  jal        GetDirection__Fiiii
    /* 91580 800A1580 21384002 */   addu      $a3, $s2, $zero
    /* 91584 800A1584 21200002 */  addu       $a0, $s0, $zero
    /* 91588 800A1588 299B010C */  jal        StartStand__Fii
    /* 9158C 800A158C 21284000 */   addu      $a1, $v0, $zero
    /* 91590 800A1590 1280023C */  lui        $v0, %hi(myplr)
    /* 91594 800A1594 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 91598 800A1598 00000000 */  nop
    /* 9159C 800A159C 80100200 */  sll        $v0, $v0, 2
    /* 915A0 800A15A0 1280013C */  lui        $at, %hi(_pcurs)
    /* 915A4 800A15A4 21082200 */  addu       $at, $at, $v0
    /* 915A8 800A15A8 30B7238C */  lw         $v1, %lo(_pcurs)($at)
    /* 915AC 800A15AC 05000224 */  addiu      $v0, $zero, 0x5
    /* 915B0 800A15B0 02006214 */  bne        $v1, $v0, .L800A15BC
    /* 915B4 800A15B4 10000524 */   addiu     $a1, $zero, 0x10
    /* 915B8 800A15B8 11000524 */  addiu      $a1, $zero, 0x11
  .L800A15BC:
    /* 915BC 800A15BC 01000424 */  addiu      $a0, $zero, 0x1
    /* 915C0 800A15C0 1280023C */  lui        $v0, %hi(sel_data)
    /* 915C4 800A15C4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 915C8 800A15C8 FF002632 */  andi       $a2, $s1, 0xFF
    /* 915CC 800A15CC 1280013C */  lui        $at, %hi(_pcursobj)
    /* 915D0 800A15D0 21082200 */  addu       $at, $at, $v0
    /* 915D4 800A15D4 60B72290 */  lbu        $v0, %lo(_pcursobj)($at)
    /* 915D8 800A15D8 FF004732 */  andi       $a3, $s2, 0xFF
    /* 915DC 800A15DC 00160200 */  sll        $v0, $v0, 24
    /* 915E0 800A15E0 03160200 */  sra        $v0, $v0, 24
    /* 915E4 800A15E4 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 915E8 800A15E8 DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 915EC 800A15EC 1000A2AF */   sw        $v0, 0x10($sp)
    /* 915F0 800A15F0 239C010C */  jal        CheckNewPath__Fi
    /* 915F4 800A15F4 21200002 */   addu      $a0, $s0, $zero
  .L800A15F8:
    /* 915F8 800A15F8 1280023C */  lui        $v0, %hi(sel_data)
    /* 915FC 800A15FC 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
  .L800A1600:
    /* 91600 800A1600 00000000 */  nop
    /* 91604 800A1604 49005014 */  bne        $v0, $s0, .L800A172C
    /* 91608 800A1608 00000000 */   nop
    /* 9160C 800A160C 1280023C */  lui        $v0, %hi(myplr)
    /* 91610 800A1610 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 91614 800A1614 00000000 */  nop
    /* 91618 800A1618 44005014 */  bne        $v0, $s0, .L800A172C
    /* 9161C 800A161C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 91620 800A1620 1280113C */  lui        $s1, %hi(_pcursitem)
    /* 91624 800A1624 64B73126 */  addiu      $s1, $s1, %lo(_pcursitem)
    /* 91628 800A1628 21201102 */  addu       $a0, $s0, $s1
    /* 9162C 800A162C 00008380 */  lb         $v1, 0x0($a0)
    /* 91630 800A1630 00000000 */  nop
    /* 91634 800A1634 3D006210 */  beq        $v1, $v0, .L800A172C
    /* 91638 800A1638 01000224 */   addiu     $v0, $zero, 0x1
    /* 9163C 800A163C 1280013C */  lui        $at, %hi(_pfind_index)
    /* 91640 800A1640 21083000 */  addu       $at, $at, $s0
    /* 91644 800A1644 DCBB2380 */  lb         $v1, %lo(_pfind_index)($at)
    /* 91648 800A1648 00000000 */  nop
    /* 9164C 800A164C 2F006214 */  bne        $v1, $v0, .L800A170C
    /* 91650 800A1650 00100624 */   addiu     $a2, $zero, 0x1000
    /* 91654 800A1654 00111000 */  sll        $v0, $s0, 4
    /* 91658 800A1658 23105000 */  subu       $v0, $v0, $s0
    /* 9165C 800A165C 40100200 */  sll        $v0, $v0, 1
    /* 91660 800A1660 0E80013C */  lui        $at, %hi(_pfind_list)
    /* 91664 800A1664 21082200 */  addu       $at, $at, $v0
    /* 91668 800A1668 A8382290 */  lbu        $v0, %lo(_pfind_list)($at)
    /* 9166C 800A166C 00000000 */  nop
    /* 91670 800A1670 000082A0 */  sb         $v0, 0x0($a0)
    /* 91674 800A1674 1280033C */  lui        $v1, %hi(sel_data)
    /* 91678 800A1678 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 9167C 800A167C 21208002 */  addu       $a0, $s4, $zero
    /* 91680 800A1680 00110300 */  sll        $v0, $v1, 4
    /* 91684 800A1684 23104300 */  subu       $v0, $v0, $v1
    /* 91688 800A1688 40100200 */  sll        $v0, $v0, 1
    /* 9168C 800A168C 21187100 */  addu       $v1, $v1, $s1
    /* 91690 800A1690 0E80013C */  lui        $at, %hi(_pfind_list + 0x1)
    /* 91694 800A1694 21082200 */  addu       $at, $at, $v0
    /* 91698 800A1698 A9383580 */  lb         $s5, %lo(_pfind_list + 0x1)($at)
    /* 9169C 800A169C 00006380 */  lb         $v1, 0x0($v1)
    /* 916A0 800A16A0 0E80013C */  lui        $at, %hi(_pfind_list + 0x2)
    /* 916A4 800A16A4 21082200 */  addu       $at, $at, $v0
    /* 916A8 800A16A8 AA383680 */  lb         $s6, %lo(_pfind_list + 0x2)($at)
    /* 916AC 800A16AC 0D80023C */  lui        $v0, %hi(item)
    /* 916B0 800A16B0 541D4224 */  addiu      $v0, $v0, %lo(item)
    /* 916B4 800A16B4 C0280300 */  sll        $a1, $v1, 3
    /* 916B8 800A16B8 2328A300 */  subu       $a1, $a1, $v1
    /* 916BC 800A16BC 80280500 */  sll        $a1, $a1, 2
    /* 916C0 800A16C0 2328A300 */  subu       $a1, $a1, $v1
    /* 916C4 800A16C4 80280500 */  sll        $a1, $a1, 2
    /* 916C8 800A16C8 CAFD000C */  jal        SetItemMinStats__FPC12PlayerStructP10ItemStruct
    /* 916CC 800A16CC 2128A200 */   addu      $a1, $a1, $v0
    /* 916D0 800A16D0 01000424 */  addiu      $a0, $zero, 0x1
    /* 916D4 800A16D4 2A000524 */  addiu      $a1, $zero, 0x2A
    /* 916D8 800A16D8 1280023C */  lui        $v0, %hi(sel_data)
    /* 916DC 800A16DC 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 916E0 800A16E0 FF00A632 */  andi       $a2, $s5, 0xFF
    /* 916E4 800A16E4 21105100 */  addu       $v0, $v0, $s1
    /* 916E8 800A16E8 00004290 */  lbu        $v0, 0x0($v0)
    /* 916EC 800A16EC FF00C732 */  andi       $a3, $s6, 0xFF
    /* 916F0 800A16F0 00160200 */  sll        $v0, $v0, 24
    /* 916F4 800A16F4 03160200 */  sra        $v0, $v0, 24
    /* 916F8 800A16F8 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 916FC 800A16FC DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 91700 800A1700 1000A2AF */   sw        $v0, 0x10($sp)
    /* 91704 800A1704 CB850208 */  j          .L800A172C
    /* 91708 800A1708 00000000 */   nop
  .L800A170C:
    /* 9170C 800A170C 66060424 */  addiu      $a0, $zero, 0x666
    /* 91710 800A1710 0A80053C */  lui        $a1, %hi(DrawObjTask__FP4TASK)
    /* 91714 800A1714 7833A524 */  addiu      $a1, $a1, %lo(DrawObjTask__FP4TASK)
    /* 91718 800A1718 0480000C */  jal        TSK_AddTask
    /* 9171C 800A171C 10000724 */   addiu     $a3, $zero, 0x10
    /* 91720 800A1720 1C00428C */  lw         $v0, 0x1C($v0)
    /* 91724 800A1724 00000000 */  nop
    /* 91728 800A1728 000050AC */  sw         $s0, 0x0($v0)
  .L800A172C:
    /* 9172C 800A172C 3400BF8F */  lw         $ra, 0x34($sp)
    /* 91730 800A1730 3000B68F */  lw         $s6, 0x30($sp)
    /* 91734 800A1734 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 91738 800A1738 2800B48F */  lw         $s4, 0x28($sp)
    /* 9173C 800A173C 2400B38F */  lw         $s3, 0x24($sp)
    /* 91740 800A1740 2000B28F */  lw         $s2, 0x20($sp)
    /* 91744 800A1744 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 91748 800A1748 1800B08F */  lw         $s0, 0x18($sp)
    /* 9174C 800A174C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 91750 800A1750 0800E003 */  jr         $ra
    /* 91754 800A1754 00000000 */   nop
endlabel pad_func_Action__Fi
