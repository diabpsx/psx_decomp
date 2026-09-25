.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetIntrMask, 0xF0

glabel SetIntrMask
    /* 23F8 800123F8 0B80033C */  lui        $v1, %hi(D_800B53D4)
    /* 23FC 800123FC D453638C */  lw         $v1, %lo(D_800B53D4)($v1)
    /* 2400 80012400 00000000 */  nop
    /* 2404 80012404 00006294 */  lhu        $v0, 0x0($v1)
    /* 2408 80012408 0800E003 */  jr         $ra
    /* 240C 8001240C 000064A4 */   sh        $a0, 0x0($v1)
    /* 2410 80012410 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2414 80012414 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2418 80012418 0B80103C */  lui        $s0, %hi(D_800B4344)
    /* 241C 8001241C 44431026 */  addiu      $s0, $s0, %lo(D_800B4344)
    /* 2420 80012420 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2424 80012424 00000296 */  lhu        $v0, 0x0($s0)
    /* 2428 80012428 00000000 */  nop
    /* 242C 8001242C 2A004014 */  bnez       $v0, .L800124D8
    /* 2430 80012430 21100000 */   addu      $v0, $zero, $zero
    /* 2434 80012434 0B80033C */  lui        $v1, %hi(D_800B53D0)
    /* 2438 80012438 D053638C */  lw         $v1, %lo(D_800B53D0)($v1)
    /* 243C 8001243C 0B80023C */  lui        $v0, %hi(D_800B53D4)
    /* 2440 80012440 D453428C */  lw         $v0, %lo(D_800B53D4)($v0)
    /* 2444 80012444 3333053C */  lui        $a1, (0x33333333 >> 16)
    /* 2448 80012448 000040A4 */  sh         $zero, 0x0($v0)
    /* 244C 8001244C 00004294 */  lhu        $v0, 0x0($v0)
    /* 2450 80012450 3333A534 */  ori        $a1, $a1, (0x33333333 & 0xFFFF)
    /* 2454 80012454 000062A4 */  sh         $v0, 0x0($v1)
    /* 2458 80012458 0B80023C */  lui        $v0, %hi(D_800B53D8)
    /* 245C 8001245C D853428C */  lw         $v0, %lo(D_800B53D8)($v0)
    /* 2460 80012460 21200002 */  addu       $a0, $s0, $zero
    /* 2464 80012464 000045AC */  sw         $a1, 0x0($v0)
    /* 2468 80012468 464A000C */  jal        func_80012918
    /* 246C 8001246C 1A040524 */   addiu     $a1, $zero, 0x41A
    /* 2470 80012470 DB40000C */  jal        setjmp
    /* 2474 80012474 38000426 */   addiu     $a0, $s0, 0x38
    /* 2478 80012478 03004010 */  beqz       $v0, .L80012488
    /* 247C 8001247C 00000000 */   nop
    /* 2480 80012480 3A49000C */  jal        func_800124E8
    /* 2484 80012484 00000000 */   nop
  .L80012488:
    /* 2488 80012488 0B80103C */  lui        $s0, %hi(D_800B4380)
    /* 248C 8001248C 80431026 */  addiu      $s0, $s0, %lo(D_800B4380)
    /* 2490 80012490 FCFF0426 */  addiu      $a0, $s0, -0x4
    /* 2494 80012494 DC0F0226 */  addiu      $v0, $s0, 0xFDC
    /* 2498 80012498 5F4A000C */  jal        HookEntryInt
    /* 249C 8001249C 000002AE */   sw        $v0, 0x0($s0)
    /* 24A0 800124A0 01000224 */  addiu      $v0, $zero, 0x1
    /* 24A4 800124A4 634A000C */  jal        startIntrVSync
    /* 24A8 800124A8 C4FF02A6 */   sh        $v0, -0x3C($s0)
    /* 24AC 800124AC 0B80033C */  lui        $v1, %hi(D_800B53CC)
    /* 24B0 800124B0 CC53638C */  lw         $v1, %lo(D_800B53CC)($v1)
    /* 24B4 800124B4 AB4A000C */  jal        startIntrDMA
    /* 24B8 800124B8 140062AC */   sw        $v0, 0x14($v1)
    /* 24BC 800124BC 0B80043C */  lui        $a0, %hi(D_800B53CC)
    /* 24C0 800124C0 CC53848C */  lw         $a0, %lo(D_800B53CC)($a0)
    /* 24C4 800124C4 514A000C */  jal        _96_remove
    /* 24C8 800124C8 040082AC */   sw        $v0, 0x4($a0)
    /* 24CC 800124CC 6746000C */  jal        ExitCriticalSection
    /* 24D0 800124D0 C4FF1026 */   addiu     $s0, $s0, -0x3C
    /* 24D4 800124D4 21100002 */  addu       $v0, $s0, $zero
  .L800124D8:
    /* 24D8 800124D8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 24DC 800124DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 24E0 800124E0 0800E003 */  jr         $ra
    /* 24E4 800124E4 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel SetIntrMask
