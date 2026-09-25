.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdDItem__FUci, 0x128

glabel NetSendCmdDItem__FUci
    /* 3FDC8 8004FDC8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3FDCC 8004FDCC 34000224 */  addiu      $v0, $zero, 0x34
    /* 3FDD0 8004FDD0 1000A2A3 */  sb         $v0, 0x10($sp)
    /* 3FDD4 8004FDD4 C0100500 */  sll        $v0, $a1, 3
    /* 3FDD8 8004FDD8 23104500 */  subu       $v0, $v0, $a1
    /* 3FDDC 8004FDDC 80100200 */  sll        $v0, $v0, 2
    /* 3FDE0 8004FDE0 23104500 */  subu       $v0, $v0, $a1
    /* 3FDE4 8004FDE4 80100200 */  sll        $v0, $v0, 2
    /* 3FDE8 8004FDE8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 3FDEC 8004FDEC 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 3FDF0 8004FDF0 21082200 */  addu       $at, $at, $v0
    /* 3FDF4 8004FDF4 A61D2390 */  lbu        $v1, %lo(item + 0x52)($at)
    /* 3FDF8 8004FDF8 00000000 */  nop
    /* 3FDFC 8004FDFC 1100A3A3 */  sb         $v1, 0x11($sp)
    /* 3FE00 8004FE00 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 3FE04 8004FE04 21082200 */  addu       $at, $at, $v0
    /* 3FE08 8004FE08 A71D2390 */  lbu        $v1, %lo(item + 0x53)($at)
    /* 3FE0C 8004FE0C 00000000 */  nop
    /* 3FE10 8004FE10 1200A3A3 */  sb         $v1, 0x12($sp)
    /* 3FE14 8004FE14 0D80013C */  lui        $at, %hi(item + 0x2E)
    /* 3FE18 8004FE18 21082200 */  addu       $at, $at, $v0
    /* 3FE1C 8004FE1C 821D2394 */  lhu        $v1, %lo(item + 0x2E)($at)
    /* 3FE20 8004FE20 00000000 */  nop
    /* 3FE24 8004FE24 1A00A3A7 */  sh         $v1, 0x1A($sp)
    /* 3FE28 8004FE28 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 3FE2C 8004FE2C 21082200 */  addu       $at, $at, $v0
    /* 3FE30 8004FE30 781D2394 */  lhu        $v1, %lo(item + 0x24)($at)
    /* 3FE34 8004FE34 00000000 */  nop
    /* 3FE38 8004FE38 1C00A3A7 */  sh         $v1, 0x1C($sp)
    /* 3FE3C 8004FE3C 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 3FE40 8004FE40 21082200 */  addu       $at, $at, $v0
    /* 3FE44 8004FE44 641D238C */  lw         $v1, %lo(item + 0x10)($at)
    /* 3FE48 8004FE48 00000000 */  nop
    /* 3FE4C 8004FE4C 2000A3AF */  sw         $v1, 0x20($sp)
    /* 3FE50 8004FE50 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 3FE54 8004FE54 21082200 */  addu       $at, $at, $v0
    /* 3FE58 8004FE58 BD1D2390 */  lbu        $v1, %lo(item + 0x69)($at)
    /* 3FE5C 8004FE5C 00000000 */  nop
    /* 3FE60 8004FE60 1300A3A3 */  sb         $v1, 0x13($sp)
    /* 3FE64 8004FE64 0D80013C */  lui        $at, %hi(item + 0x3E)
    /* 3FE68 8004FE68 21082200 */  addu       $at, $at, $v0
    /* 3FE6C 8004FE6C 921D2394 */  lhu        $v1, %lo(item + 0x3E)($at)
    /* 3FE70 8004FE70 00000000 */  nop
    /* 3FE74 8004FE74 1400A3A3 */  sb         $v1, 0x14($sp)
    /* 3FE78 8004FE78 0D80013C */  lui        $at, %hi(item + 0x40)
    /* 3FE7C 8004FE7C 21082200 */  addu       $at, $at, $v0
    /* 3FE80 8004FE80 941D2394 */  lhu        $v1, %lo(item + 0x40)($at)
    /* 3FE84 8004FE84 00000000 */  nop
    /* 3FE88 8004FE88 1500A3A3 */  sb         $v1, 0x15($sp)
    /* 3FE8C 8004FE8C 0D80013C */  lui        $at, %hi(item + 0x49)
    /* 3FE90 8004FE90 21082200 */  addu       $at, $at, $v0
    /* 3FE94 8004FE94 9D1D2390 */  lbu        $v1, %lo(item + 0x49)($at)
    /* 3FE98 8004FE98 00000000 */  nop
    /* 3FE9C 8004FE9C 1600A3A3 */  sb         $v1, 0x16($sp)
    /* 3FEA0 8004FEA0 0D80013C */  lui        $at, %hi(item + 0x4B)
    /* 3FEA4 8004FEA4 21082200 */  addu       $at, $at, $v0
    /* 3FEA8 8004FEA8 9F1D2390 */  lbu        $v1, %lo(item + 0x4B)($at)
    /* 3FEAC 8004FEAC 00000000 */  nop
    /* 3FEB0 8004FEB0 1700A3A3 */  sb         $v1, 0x17($sp)
    /* 3FEB4 8004FEB4 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 3FEB8 8004FEB8 21082200 */  addu       $at, $at, $v0
    /* 3FEBC 8004FEBC 681D238C */  lw         $v1, %lo(item + 0x14)($at)
    /* 3FEC0 8004FEC0 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3FEC4 8004FEC4 1800A3A7 */  sh         $v1, 0x18($sp)
    /* 3FEC8 8004FEC8 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 3FECC 8004FECC 21082200 */  addu       $at, $at, $v0
    /* 3FED0 8004FED0 B91D2280 */  lb         $v0, %lo(item + 0x65)($at)
    /* 3FED4 8004FED4 18000524 */  addiu      $a1, $zero, 0x18
    /* 3FED8 8004FED8 E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3FEDC 8004FEDC 2400A2AF */   sw        $v0, 0x24($sp)
    /* 3FEE0 8004FEE0 2800BF8F */  lw         $ra, 0x28($sp)
    /* 3FEE4 8004FEE4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3FEE8 8004FEE8 0800E003 */  jr         $ra
    /* 3FEEC 8004FEEC 00000000 */   nop
endlabel NetSendCmdDItem__FUci
