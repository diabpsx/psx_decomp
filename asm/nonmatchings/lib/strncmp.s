.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching strncmp, 0x33C

glabel strncmp
    /* D50C 8001D50C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* D510 8001D510 08004001 */  jr         $t2
    /* D514 8001D514 18000924 */   addiu     $t1, $zero, 0x18
    /* D518 8001D518 00000000 */  nop
    /* D51C 8001D51C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* D520 8001D520 2400B1AF */  sw         $s1, 0x24($sp)
    /* D524 8001D524 2188A000 */  addu       $s1, $a1, $zero
    /* D528 8001D528 0B80053C */  lui        $a1, %hi(D_800B6220)
    /* D52C 8001D52C 2062A524 */  addiu      $a1, $a1, %lo(D_800B6220)
    /* D530 8001D530 FF008430 */  andi       $a0, $a0, 0xFF
    /* D534 8001D534 01000224 */  addiu      $v0, $zero, 0x1
    /* D538 8001D538 2800BFAF */  sw         $ra, 0x28($sp)
    /* D53C 8001D53C 2000B0AF */  sw         $s0, 0x20($sp)
    /* D540 8001D540 3400B1AC */  sw         $s1, 0x34($a1)
    /* D544 8001D544 4A008214 */  bne        $a0, $v0, .L8001D670
    /* D548 8001D548 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* D54C 8001D54C 1400A28C */  lw         $v0, 0x14($a1)
    /* D550 8001D550 00000000 */  nop
    /* D554 8001D554 47004018 */  blez       $v0, .L8001D674
    /* D558 8001D558 00000000 */   nop
    /* D55C 8001D55C 1000A38C */  lw         $v1, 0x10($a1)
    /* D560 8001D560 00020224 */  addiu      $v0, $zero, 0x200
    /* D564 8001D564 22006214 */  bne        $v1, $v0, .L8001D5F0
    /* D568 8001D568 00000000 */   nop
    /* D56C 8001D56C 3000A28C */  lw         $v0, 0x30($a1)
    /* D570 8001D570 00000000 */  nop
    /* D574 8001D574 01004230 */  andi       $v0, $v0, 0x1
    /* D578 8001D578 0D004010 */  beqz       $v0, .L8001D5B0
    /* D57C 8001D57C 1000A427 */   addiu     $a0, $sp, 0x10
    /* D580 8001D580 9D6C000C */  jal        CdDataCallback
    /* D584 8001D584 21200000 */   addu      $a0, $zero, $zero
    /* D588 8001D588 1000A427 */  addiu      $a0, $sp, 0x10
    /* D58C 8001D58C 956C000C */  jal        CdGetSector2
    /* D590 8001D590 03000524 */   addiu     $a1, $zero, 0x3
    /* D594 8001D594 A66C000C */  jal        CdDataSync
    /* D598 8001D598 21200000 */   addu      $a0, $zero, $zero
    /* D59C 8001D59C 0280043C */  lui        $a0, %hi(D_8001D77C)
    /* D5A0 8001D5A0 9D6C000C */  jal        CdDataCallback
    /* D5A4 8001D5A4 7CD78424 */   addiu     $a0, $a0, %lo(D_8001D77C)
    /* D5A8 8001D5A8 6E750008 */  j          .L8001D5B8
    /* D5AC 8001D5AC 00000000 */   nop
  .L8001D5B0:
    /* D5B0 8001D5B0 8D6C000C */  jal        CdGetSector
    /* D5B4 8001D5B4 03000524 */   addiu     $a1, $zero, 0x3
  .L8001D5B8:
    /* D5B8 8001D5B8 EF6C000C */  jal        CdPosToInt
    /* D5BC 8001D5BC 1000A427 */   addiu     $a0, $sp, 0x10
    /* D5C0 8001D5C0 0B80103C */  lui        $s0, %hi(D_800B6240)
    /* D5C4 8001D5C4 40621026 */  addiu      $s0, $s0, %lo(D_800B6240)
    /* D5C8 8001D5C8 0000038E */  lw         $v1, 0x0($s0)
    /* D5CC 8001D5CC 00000000 */  nop
    /* D5D0 8001D5D0 07004310 */  beq        $v0, $v1, .L8001D5F0
    /* D5D4 8001D5D4 00000000 */   nop
    /* D5D8 8001D5D8 1180043C */  lui        $a0, %hi(D_8010E6B8)
    /* D5DC 8001D5DC 7567000C */  jal        puts
    /* D5E0 8001D5E0 B8E68424 */   addiu     $a0, $a0, %lo(D_8010E6B8)
    /* D5E4 8001D5E4 E0FF0326 */  addiu      $v1, $s0, -0x20
    /* D5E8 8001D5E8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* D5EC 8001D5EC 140062AC */  sw         $v0, 0x14($v1)
  .L8001D5F0:
    /* D5F0 8001D5F0 0B80103C */  lui        $s0, %hi(D_800B6250)
    /* D5F4 8001D5F4 50621026 */  addiu      $s0, $s0, %lo(D_800B6250)
    /* D5F8 8001D5F8 0000028E */  lw         $v0, 0x0($s0)
    /* D5FC 8001D5FC 00000000 */  nop
    /* D600 8001D600 01004230 */  andi       $v0, $v0, 0x1
    /* D604 8001D604 07004010 */  beqz       $v0, .L8001D624
    /* D608 8001D608 00000000 */   nop
    /* D60C 8001D60C D8FF048E */  lw         $a0, -0x28($s0)
    /* D610 8001D610 E0FF058E */  lw         $a1, -0x20($s0)
    /* D614 8001D614 956C000C */  jal        CdGetSector2
    /* D618 8001D618 00000000 */   nop
    /* D61C 8001D61C 9D750008 */  j          .L8001D674
    /* D620 8001D620 00000000 */   nop
  .L8001D624:
    /* D624 8001D624 D8FF048E */  lw         $a0, -0x28($s0)
    /* D628 8001D628 E0FF058E */  lw         $a1, -0x20($s0)
    /* D62C 8001D62C 8D6C000C */  jal        CdGetSector
    /* D630 8001D630 00000000 */   nop
    /* D634 8001D634 D0FF0426 */  addiu      $a0, $s0, -0x30
    /* D638 8001D638 E0FF028E */  lw         $v0, -0x20($s0)
    /* D63C 8001D63C D8FF038E */  lw         $v1, -0x28($s0)
    /* D640 8001D640 80100200 */  sll        $v0, $v0, 2
    /* D644 8001D644 21186200 */  addu       $v1, $v1, $v0
    /* D648 8001D648 080083AC */  sw         $v1, 0x8($a0)
    /* D64C 8001D64C 1400828C */  lw         $v0, 0x14($a0)
    /* D650 8001D650 00000000 */  nop
    /* D654 8001D654 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* D658 8001D658 140082AC */  sw         $v0, 0x14($a0)
    /* D65C 8001D65C 2000828C */  lw         $v0, 0x20($a0)
    /* D660 8001D660 00000000 */  nop
    /* D664 8001D664 01004224 */  addiu      $v0, $v0, 0x1
    /* D668 8001D668 9D750008 */  j          .L8001D674
    /* D66C 8001D66C 200082AC */   sw        $v0, 0x20($a0)
  .L8001D670:
    /* D670 8001D670 1400A2AC */  sw         $v0, 0x14($a1)
  .L8001D674:
    /* D674 8001D674 1748000C */  jal        VSync
    /* D678 8001D678 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* D67C 8001D67C 0B80103C */  lui        $s0, %hi(D_800B6220)
    /* D680 8001D680 20621026 */  addiu      $s0, $s0, %lo(D_800B6220)
    /* D684 8001D684 180002AE */  sw         $v0, 0x18($s0)
    /* D688 8001D688 1400028E */  lw         $v0, 0x14($s0)
    /* D68C 8001D68C 00000000 */  nop
    /* D690 8001D690 03004104 */  bgez       $v0, .L8001D6A0
    /* D694 8001D694 00000000 */   nop
    /* D698 8001D698 1276000C */  jal        func_8001D848
    /* D69C 8001D69C 01000424 */   addiu     $a0, $zero, 0x1
  .L8001D6A0:
    /* D6A0 8001D6A0 1748000C */  jal        VSync
    /* D6A4 8001D6A4 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* D6A8 8001D6A8 1C00038E */  lw         $v1, 0x1C($s0)
    /* D6AC 8001D6AC 00000000 */  nop
    /* D6B0 8001D6B0 B0046324 */  addiu      $v1, $v1, 0x4B0
    /* D6B4 8001D6B4 2A186200 */  slt        $v1, $v1, $v0
    /* D6B8 8001D6B8 02006010 */  beqz       $v1, .L8001D6C4
    /* D6BC 8001D6BC FFFF0224 */   addiu     $v0, $zero, -0x1
    /* D6C0 8001D6C0 140002AE */  sw         $v0, 0x14($s0)
  .L8001D6C4:
    /* D6C4 8001D6C4 1400028E */  lw         $v0, 0x14($s0)
    /* D6C8 8001D6C8 00000000 */  nop
    /* D6CC 8001D6CC 09004010 */  beqz       $v0, .L8001D6F4
    /* D6D0 8001D6D0 00000000 */   nop
    /* D6D4 8001D6D4 1748000C */  jal        VSync
    /* D6D8 8001D6D8 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* D6DC 8001D6DC 1C00038E */  lw         $v1, 0x1C($s0)
    /* D6E0 8001D6E0 00000000 */  nop
    /* D6E4 8001D6E4 B0046324 */  addiu      $v1, $v1, 0x4B0
    /* D6E8 8001D6E8 2A186200 */  slt        $v1, $v1, $v0
    /* D6EC 8001D6EC 1E006010 */  beqz       $v1, .L8001D768
    /* D6F0 8001D6F0 00000000 */   nop
  .L8001D6F4:
    /* D6F4 8001D6F4 2400048E */  lw         $a0, 0x24($s0)
    /* D6F8 8001D6F8 8C6B000C */  jal        CdSyncCallback
    /* D6FC 8001D6FC 00000000 */   nop
    /* D700 8001D700 2800048E */  lw         $a0, 0x28($s0)
    /* D704 8001D704 916B000C */  jal        CdReadyCallback
    /* D708 8001D708 00000000 */   nop
    /* D70C 8001D70C 3000028E */  lw         $v0, 0x30($s0)
    /* D710 8001D710 00000000 */  nop
    /* D714 8001D714 01004230 */  andi       $v0, $v0, 0x1
    /* D718 8001D718 05004010 */  beqz       $v0, .L8001D730
    /* D71C 8001D71C 09000424 */   addiu     $a0, $zero, 0x9
    /* D720 8001D720 2C00048E */  lw         $a0, 0x2C($s0)
    /* D724 8001D724 9D6C000C */  jal        CdDataCallback
    /* D728 8001D728 00000000 */   nop
    /* D72C 8001D72C 09000424 */  addiu      $a0, $zero, 0x9
  .L8001D730:
    /* D730 8001D730 E56B000C */  jal        CdControlF
    /* D734 8001D734 21280000 */   addu      $a1, $zero, $zero
    /* D738 8001D738 0B80033C */  lui        $v1, %hi(D_800B621C)
    /* D73C 8001D73C 1C62638C */  lw         $v1, %lo(D_800B621C)($v1)
    /* D740 8001D740 00000000 */  nop
    /* D744 8001D744 08006010 */  beqz       $v1, .L8001D768
    /* D748 8001D748 00000000 */   nop
    /* D74C 8001D74C 1400028E */  lw         $v0, 0x14($s0)
    /* D750 8001D750 00000000 */  nop
    /* D754 8001D754 02004014 */  bnez       $v0, .L8001D760
    /* D758 8001D758 05000424 */   addiu     $a0, $zero, 0x5
    /* D75C 8001D75C 02000424 */  addiu      $a0, $zero, 0x2
  .L8001D760:
    /* D760 8001D760 09F86000 */  jalr       $v1
    /* D764 8001D764 21282002 */   addu      $a1, $s1, $zero
  .L8001D768:
    /* D768 8001D768 2800BF8F */  lw         $ra, 0x28($sp)
    /* D76C 8001D76C 2400B18F */  lw         $s1, 0x24($sp)
    /* D770 8001D770 2000B08F */  lw         $s0, 0x20($sp)
    /* D774 8001D774 0800E003 */  jr         $ra
    /* D778 8001D778 3000BD27 */   addiu     $sp, $sp, 0x30
  alabel D_8001D77C
    /* D77C 8001D77C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* D780 8001D780 1000B0AF */  sw         $s0, 0x10($sp)
    /* D784 8001D784 0B80103C */  lui        $s0, %hi(D_800B6220)
    /* D788 8001D788 20621026 */  addiu      $s0, $s0, %lo(D_800B6220)
    /* D78C 8001D78C 1400BFAF */  sw         $ra, 0x14($sp)
    /* D790 8001D790 1000028E */  lw         $v0, 0x10($s0)
    /* D794 8001D794 0800038E */  lw         $v1, 0x8($s0)
    /* D798 8001D798 80100200 */  sll        $v0, $v0, 2
    /* D79C 8001D79C 21186200 */  addu       $v1, $v1, $v0
    /* D7A0 8001D7A0 080003AE */  sw         $v1, 0x8($s0)
    /* D7A4 8001D7A4 1400028E */  lw         $v0, 0x14($s0)
    /* D7A8 8001D7A8 00000000 */  nop
    /* D7AC 8001D7AC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* D7B0 8001D7B0 140002AE */  sw         $v0, 0x14($s0)
    /* D7B4 8001D7B4 2000028E */  lw         $v0, 0x20($s0)
    /* D7B8 8001D7B8 00000000 */  nop
    /* D7BC 8001D7BC 01004224 */  addiu      $v0, $v0, 0x1
    /* D7C0 8001D7C0 200002AE */  sw         $v0, 0x20($s0)
    /* D7C4 8001D7C4 1400028E */  lw         $v0, 0x14($s0)
    /* D7C8 8001D7C8 00000000 */  nop
    /* D7CC 8001D7CC 1A004014 */  bnez       $v0, .L8001D838
    /* D7D0 8001D7D0 00000000 */   nop
    /* D7D4 8001D7D4 2400048E */  lw         $a0, 0x24($s0)
    /* D7D8 8001D7D8 8C6B000C */  jal        CdSyncCallback
    /* D7DC 8001D7DC 00000000 */   nop
    /* D7E0 8001D7E0 2800048E */  lw         $a0, 0x28($s0)
    /* D7E4 8001D7E4 916B000C */  jal        CdReadyCallback
    /* D7E8 8001D7E8 00000000 */   nop
    /* D7EC 8001D7EC 3000028E */  lw         $v0, 0x30($s0)
    /* D7F0 8001D7F0 00000000 */  nop
    /* D7F4 8001D7F4 01004230 */  andi       $v0, $v0, 0x1
    /* D7F8 8001D7F8 05004010 */  beqz       $v0, .L8001D810
    /* D7FC 8001D7FC 09000424 */   addiu     $a0, $zero, 0x9
    /* D800 8001D800 2C00048E */  lw         $a0, 0x2C($s0)
    /* D804 8001D804 9D6C000C */  jal        CdDataCallback
    /* D808 8001D808 00000000 */   nop
    /* D80C 8001D80C 09000424 */  addiu      $a0, $zero, 0x9
  .L8001D810:
    /* D810 8001D810 E56B000C */  jal        CdControlF
    /* D814 8001D814 21280000 */   addu      $a1, $zero, $zero
    /* D818 8001D818 0B80023C */  lui        $v0, %hi(D_800B621C)
    /* D81C 8001D81C 1C62428C */  lw         $v0, %lo(D_800B621C)($v0)
    /* D820 8001D820 00000000 */  nop
    /* D824 8001D824 04004010 */  beqz       $v0, .L8001D838
    /* D828 8001D828 00000000 */   nop
    /* D82C 8001D82C 3400058E */  lw         $a1, 0x34($s0)
    /* D830 8001D830 09F84000 */  jalr       $v0
    /* D834 8001D834 02000424 */   addiu     $a0, $zero, 0x2
  .L8001D838:
    /* D838 8001D838 1400BF8F */  lw         $ra, 0x14($sp)
    /* D83C 8001D83C 1000B08F */  lw         $s0, 0x10($sp)
    /* D840 8001D840 0800E003 */  jr         $ra
    /* D844 8001D844 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel strncmp
