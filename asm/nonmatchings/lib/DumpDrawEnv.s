.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpDrawEnv, 0x104

glabel DumpDrawEnv
    /* 3550 80013550 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3554 80013554 1800B0AF */  sw         $s0, 0x18($sp)
    /* 3558 80013558 21808000 */  addu       $s0, $a0, $zero
    /* 355C 8001355C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 3560 80013560 00000586 */  lh         $a1, 0x0($s0)
    /* 3564 80013564 02000686 */  lh         $a2, 0x2($s0)
    /* 3568 80013568 04000786 */  lh         $a3, 0x4($s0)
    /* 356C 8001356C 06000386 */  lh         $v1, 0x6($s0)
    /* 3570 80013570 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 3574 80013574 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 3578 80013578 1180043C */  lui        $a0, %hi(D_8010DDD0)
    /* 357C 8001357C D0DD8424 */  addiu      $a0, $a0, %lo(D_8010DDD0)
    /* 3580 80013580 09F84000 */  jalr       $v0
    /* 3584 80013584 1000A3AF */   sw        $v1, 0x10($sp)
    /* 3588 80013588 08000586 */  lh         $a1, 0x8($s0)
    /* 358C 8001358C 0A000686 */  lh         $a2, 0xA($s0)
    /* 3590 80013590 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 3594 80013594 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 3598 80013598 1180043C */  lui        $a0, %hi(D_8010DDE8)
    /* 359C 8001359C 09F84000 */  jalr       $v0
    /* 35A0 800135A0 E8DD8424 */   addiu     $a0, $a0, %lo(D_8010DDE8)
    /* 35A4 800135A4 0C000586 */  lh         $a1, 0xC($s0)
    /* 35A8 800135A8 0E000686 */  lh         $a2, 0xE($s0)
    /* 35AC 800135AC 10000786 */  lh         $a3, 0x10($s0)
    /* 35B0 800135B0 12000386 */  lh         $v1, 0x12($s0)
    /* 35B4 800135B4 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 35B8 800135B8 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 35BC 800135BC 1180043C */  lui        $a0, %hi(D_8010DDF8)
    /* 35C0 800135C0 F8DD8424 */  addiu      $a0, $a0, %lo(D_8010DDF8)
    /* 35C4 800135C4 09F84000 */  jalr       $v0
    /* 35C8 800135C8 1000A3AF */   sw        $v1, 0x10($sp)
    /* 35CC 800135CC 16000592 */  lbu        $a1, 0x16($s0)
    /* 35D0 800135D0 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 35D4 800135D4 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 35D8 800135D8 1180043C */  lui        $a0, %hi(D_8010DE10)
    /* 35DC 800135DC 09F84000 */  jalr       $v0
    /* 35E0 800135E0 10DE8424 */   addiu     $a0, $a0, %lo(D_8010DE10)
    /* 35E4 800135E4 17000592 */  lbu        $a1, 0x17($s0)
    /* 35E8 800135E8 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 35EC 800135EC A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 35F0 800135F0 1180043C */  lui        $a0, %hi(D_8010DE1C)
    /* 35F4 800135F4 09F84000 */  jalr       $v0
    /* 35F8 800135F8 1CDE8424 */   addiu     $a0, $a0, %lo(D_8010DE1C)
    /* 35FC 800135FC 1180043C */  lui        $a0, %hi(D_8010DDA8)
    /* 3600 80013600 A8DD8424 */  addiu      $a0, $a0, %lo(D_8010DDA8)
    /* 3604 80013604 14000396 */  lhu        $v1, 0x14($s0)
    /* 3608 80013608 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 360C 8001360C A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 3610 80013610 C3290300 */  sra        $a1, $v1, 7
    /* 3614 80013614 0300A530 */  andi       $a1, $a1, 0x3
    /* 3618 80013618 43310300 */  sra        $a2, $v1, 5
    /* 361C 8001361C 0300C630 */  andi       $a2, $a2, 0x3
    /* 3620 80013620 80390300 */  sll        $a3, $v1, 6
    /* 3624 80013624 C007E730 */  andi       $a3, $a3, 0x7C0
    /* 3628 80013628 00410300 */  sll        $t0, $v1, 4
    /* 362C 8001362C 00010831 */  andi       $t0, $t0, 0x100
    /* 3630 80013630 83180300 */  sra        $v1, $v1, 2
    /* 3634 80013634 00026330 */  andi       $v1, $v1, 0x200
    /* 3638 80013638 21400301 */  addu       $t0, $t0, $v1
    /* 363C 8001363C 09F84000 */  jalr       $v0
    /* 3640 80013640 1000A8AF */   sw        $t0, 0x10($sp)
    /* 3644 80013644 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 3648 80013648 1800B08F */  lw         $s0, 0x18($sp)
    /* 364C 8001364C 0800E003 */  jr         $ra
    /* 3650 80013650 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel DumpDrawEnv
