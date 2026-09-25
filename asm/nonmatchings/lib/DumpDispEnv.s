.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpDispEnv, 0xA0

glabel DumpDispEnv
    /* 3654 80013654 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3658 80013658 1800B0AF */  sw         $s0, 0x18($sp)
    /* 365C 8001365C 21808000 */  addu       $s0, $a0, $zero
    /* 3660 80013660 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 3664 80013664 00000586 */  lh         $a1, 0x0($s0)
    /* 3668 80013668 02000686 */  lh         $a2, 0x2($s0)
    /* 366C 8001366C 04000786 */  lh         $a3, 0x4($s0)
    /* 3670 80013670 06000386 */  lh         $v1, 0x6($s0)
    /* 3674 80013674 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 3678 80013678 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 367C 8001367C 1180043C */  lui        $a0, %hi(D_8010DE28)
    /* 3680 80013680 28DE8424 */  addiu      $a0, $a0, %lo(D_8010DE28)
    /* 3684 80013684 09F84000 */  jalr       $v0
    /* 3688 80013688 1000A3AF */   sw        $v1, 0x10($sp)
    /* 368C 8001368C 08000586 */  lh         $a1, 0x8($s0)
    /* 3690 80013690 0A000686 */  lh         $a2, 0xA($s0)
    /* 3694 80013694 0C000786 */  lh         $a3, 0xC($s0)
    /* 3698 80013698 0E000386 */  lh         $v1, 0xE($s0)
    /* 369C 8001369C 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 36A0 800136A0 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 36A4 800136A4 1180043C */  lui        $a0, %hi(D_8010DE44)
    /* 36A8 800136A8 44DE8424 */  addiu      $a0, $a0, %lo(D_8010DE44)
    /* 36AC 800136AC 09F84000 */  jalr       $v0
    /* 36B0 800136B0 1000A3AF */   sw        $v1, 0x10($sp)
    /* 36B4 800136B4 10000592 */  lbu        $a1, 0x10($s0)
    /* 36B8 800136B8 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 36BC 800136BC A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 36C0 800136C0 1180043C */  lui        $a0, %hi(D_8010DE60)
    /* 36C4 800136C4 09F84000 */  jalr       $v0
    /* 36C8 800136C8 60DE8424 */   addiu     $a0, $a0, %lo(D_8010DE60)
    /* 36CC 800136CC 11000592 */  lbu        $a1, 0x11($s0)
    /* 36D0 800136D0 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 36D4 800136D4 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 36D8 800136D8 1180043C */  lui        $a0, %hi(D_8010DE6C)
    /* 36DC 800136DC 09F84000 */  jalr       $v0
    /* 36E0 800136E0 6CDE8424 */   addiu     $a0, $a0, %lo(D_8010DE6C)
    /* 36E4 800136E4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 36E8 800136E8 1800B08F */  lw         $s0, 0x18($sp)
    /* 36EC 800136EC 0800E003 */  jr         $ra
    /* 36F0 800136F0 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel DumpDispEnv
    /* 36F4 800136F4 00000000 */  nop
    /* 36F8 800136F8 00000000 */  nop
