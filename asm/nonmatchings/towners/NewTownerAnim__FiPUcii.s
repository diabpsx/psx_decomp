.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NewTownerAnim__FiPUcii, 0x50

glabel NewTownerAnim__FiPUcii
    /* 29FFC 80039FFC 40100400 */  sll        $v0, $a0, 1
    /* 2A000 8003A000 21104400 */  addu       $v0, $v0, $a0
    /* 2A004 8003A004 00110200 */  sll        $v0, $v0, 4
    /* 2A008 8003A008 21104400 */  addu       $v0, $v0, $a0
    /* 2A00C 8003A00C 80100200 */  sll        $v0, $v0, 2
    /* 2A010 8003A010 01000324 */  addiu      $v1, $zero, 0x1
    /* 2A014 8003A014 0D80013C */  lui        $at, %hi(towner + 0x2C)
    /* 2A018 8003A018 21082200 */  addu       $at, $at, $v0
    /* 2A01C 8003A01C ACFE26AC */  sw         $a2, %lo(towner + 0x2C)($at)
    /* 2A020 8003A020 0D80013C */  lui        $at, %hi(towner + 0x30)
    /* 2A024 8003A024 21082200 */  addu       $at, $at, $v0
    /* 2A028 8003A028 B0FE23AC */  sw         $v1, %lo(towner + 0x30)($at)
    /* 2A02C 8003A02C 0D80013C */  lui        $at, %hi(towner + 0x28)
    /* 2A030 8003A030 21082200 */  addu       $at, $at, $v0
    /* 2A034 8003A034 A8FE20AC */  sw         $zero, %lo(towner + 0x28)($at)
    /* 2A038 8003A038 0D80013C */  lui        $at, %hi(towner + 0x24)
    /* 2A03C 8003A03C 21082200 */  addu       $at, $at, $v0
    /* 2A040 8003A040 A4FE27AC */  sw         $a3, %lo(towner + 0x24)($at)
    /* 2A044 8003A044 0800E003 */  jr         $ra
    /* 2A048 8003A048 00000000 */   nop
endlabel NewTownerAnim__FiPUcii
