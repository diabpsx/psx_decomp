.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendCmdGItem__FUcUcUcUcUc, 0x148

glabel NetSendCmdGItem__FUcUcUcUcUc
    /* 3F93C 8004F93C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 3F940 8004F940 4800A393 */  lbu        $v1, 0x48($sp)
    /* 3F944 8004F944 1280023C */  lui        $v0, %hi(currlevel)
    /* 3F948 8004F948 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 3F94C 8004F94C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 3F950 8004F950 1000A5A3 */  sb         $a1, 0x10($sp)
    /* 3F954 8004F954 1200A7A3 */  sb         $a3, 0x12($sp)
    /* 3F958 8004F958 1100A6A3 */  sb         $a2, 0x11($sp)
    /* 3F95C 8004F95C 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 3F960 8004F960 1300A3A3 */  sb         $v1, 0x13($sp)
    /* 3F964 8004F964 FF006330 */  andi       $v1, $v1, 0xFF
    /* 3F968 8004F968 1400A2A3 */  sb         $v0, 0x14($sp)
    /* 3F96C 8004F96C C0100300 */  sll        $v0, $v1, 3
    /* 3F970 8004F970 23104300 */  subu       $v0, $v0, $v1
    /* 3F974 8004F974 80100200 */  sll        $v0, $v0, 2
    /* 3F978 8004F978 23104300 */  subu       $v0, $v0, $v1
    /* 3F97C 8004F97C 80100200 */  sll        $v0, $v0, 2
    /* 3F980 8004F980 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 3F984 8004F984 21082200 */  addu       $at, $at, $v0
    /* 3F988 8004F988 A61D2390 */  lbu        $v1, %lo(item + 0x52)($at)
    /* 3F98C 8004F98C 00000000 */  nop
    /* 3F990 8004F990 1500A3A3 */  sb         $v1, 0x15($sp)
    /* 3F994 8004F994 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 3F998 8004F998 21082200 */  addu       $at, $at, $v0
    /* 3F99C 8004F99C A71D2390 */  lbu        $v1, %lo(item + 0x53)($at)
    /* 3F9A0 8004F9A0 00000000 */  nop
    /* 3F9A4 8004F9A4 1600A3A3 */  sb         $v1, 0x16($sp)
    /* 3F9A8 8004F9A8 0D80013C */  lui        $at, %hi(item + 0x2E)
    /* 3F9AC 8004F9AC 21082200 */  addu       $at, $at, $v0
    /* 3F9B0 8004F9B0 821D2394 */  lhu        $v1, %lo(item + 0x2E)($at)
    /* 3F9B4 8004F9B4 00000000 */  nop
    /* 3F9B8 8004F9B8 1E00A3A7 */  sh         $v1, 0x1E($sp)
    /* 3F9BC 8004F9BC 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 3F9C0 8004F9C0 21082200 */  addu       $at, $at, $v0
    /* 3F9C4 8004F9C4 781D2394 */  lhu        $v1, %lo(item + 0x24)($at)
    /* 3F9C8 8004F9C8 00000000 */  nop
    /* 3F9CC 8004F9CC 2000A3A7 */  sh         $v1, 0x20($sp)
    /* 3F9D0 8004F9D0 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 3F9D4 8004F9D4 21082200 */  addu       $at, $at, $v0
    /* 3F9D8 8004F9D8 641D238C */  lw         $v1, %lo(item + 0x10)($at)
    /* 3F9DC 8004F9DC 00000000 */  nop
    /* 3F9E0 8004F9E0 2400A3AF */  sw         $v1, 0x24($sp)
    /* 3F9E4 8004F9E4 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 3F9E8 8004F9E8 21082200 */  addu       $at, $at, $v0
    /* 3F9EC 8004F9EC BD1D2390 */  lbu        $v1, %lo(item + 0x69)($at)
    /* 3F9F0 8004F9F0 00000000 */  nop
    /* 3F9F4 8004F9F4 1700A3A3 */  sb         $v1, 0x17($sp)
    /* 3F9F8 8004F9F8 0D80013C */  lui        $at, %hi(item + 0x3E)
    /* 3F9FC 8004F9FC 21082200 */  addu       $at, $at, $v0
    /* 3FA00 8004FA00 921D2394 */  lhu        $v1, %lo(item + 0x3E)($at)
    /* 3FA04 8004FA04 00000000 */  nop
    /* 3FA08 8004FA08 1800A3A3 */  sb         $v1, 0x18($sp)
    /* 3FA0C 8004FA0C 0D80013C */  lui        $at, %hi(item + 0x40)
    /* 3FA10 8004FA10 21082200 */  addu       $at, $at, $v0
    /* 3FA14 8004FA14 941D2394 */  lhu        $v1, %lo(item + 0x40)($at)
    /* 3FA18 8004FA18 00000000 */  nop
    /* 3FA1C 8004FA1C 1900A3A3 */  sb         $v1, 0x19($sp)
    /* 3FA20 8004FA20 0D80013C */  lui        $at, %hi(item + 0x49)
    /* 3FA24 8004FA24 21082200 */  addu       $at, $at, $v0
    /* 3FA28 8004FA28 9D1D2390 */  lbu        $v1, %lo(item + 0x49)($at)
    /* 3FA2C 8004FA2C 00000000 */  nop
    /* 3FA30 8004FA30 1A00A3A3 */  sb         $v1, 0x1A($sp)
    /* 3FA34 8004FA34 0D80013C */  lui        $at, %hi(item + 0x4B)
    /* 3FA38 8004FA38 21082200 */  addu       $at, $at, $v0
    /* 3FA3C 8004FA3C 9F1D2390 */  lbu        $v1, %lo(item + 0x4B)($at)
    /* 3FA40 8004FA40 00000000 */  nop
    /* 3FA44 8004FA44 1B00A3A3 */  sb         $v1, 0x1B($sp)
    /* 3FA48 8004FA48 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 3FA4C 8004FA4C 21082200 */  addu       $at, $at, $v0
    /* 3FA50 8004FA50 681D238C */  lw         $v1, %lo(item + 0x14)($at)
    /* 3FA54 8004FA54 1000A427 */  addiu      $a0, $sp, 0x10
    /* 3FA58 8004FA58 1C00A3A7 */  sh         $v1, 0x1C($sp)
    /* 3FA5C 8004FA5C 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 3FA60 8004FA60 21082200 */  addu       $at, $at, $v0
    /* 3FA64 8004FA64 B91D2280 */  lb         $v0, %lo(item + 0x65)($at)
    /* 3FA68 8004FA68 20000524 */  addiu      $a1, $zero, 0x20
    /* 3FA6C 8004FA6C E94A010C */  jal        NetSendLoPri__FPCUcUc
    /* 3FA70 8004FA70 2800A2AF */   sw        $v0, 0x28($sp)
    /* 3FA74 8004FA74 3000BF8F */  lw         $ra, 0x30($sp)
    /* 3FA78 8004FA78 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 3FA7C 8004FA7C 0800E003 */  jr         $ra
    /* 3FA80 8004FA80 00000000 */   nop
endlabel NetSendCmdGItem__FUcUcUcUcUc
