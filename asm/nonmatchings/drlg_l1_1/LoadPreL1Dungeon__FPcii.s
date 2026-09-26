.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadPreL1Dungeon__FPcii, 0x68

glabel LoadPreL1Dungeon__FPcii
    /* 3540 8013D138 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3544 8013D13C 10000224 */  addiu      $v0, $zero, 0x10
    /* 3548 8013D140 1280013C */  lui        $at, %hi(dminx)
    /* 354C 8013D144 F8C022AC */  sw         $v0, %lo(dminx)($at)
    /* 3550 8013D148 1280013C */  lui        $at, %hi(dminy)
    /* 3554 8013D14C FCC022AC */  sw         $v0, %lo(dminy)($at)
    /* 3558 8013D150 50000224 */  addiu      $v0, $zero, 0x50
    /* 355C 8013D154 2400BFAF */  sw         $ra, 0x24($sp)
    /* 3560 8013D158 2000B0AF */  sw         $s0, 0x20($sp)
    /* 3564 8013D15C 1280013C */  lui        $at, %hi(dmaxx)
    /* 3568 8013D160 00C122AC */  sw         $v0, %lo(dmaxx)($at)
    /* 356C 8013D164 1280013C */  lui        $at, %hi(dmaxy)
    /* 3570 8013D168 04C122AC */  sw         $v0, %lo(dmaxy)($at)
    /* 3574 8013D16C A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 3578 8013D170 21280000 */   addu      $a1, $zero, $zero
    /* 357C 8013D174 21804000 */  addu       $s0, $v0, $zero
    /* 3580 8013D178 21400002 */  addu       $t0, $s0, $zero
    /* 3584 8013D17C 21380000 */  addu       $a3, $zero, $zero
    /* 3588 8013D180 0E800D3C */  lui        $t5, %hi(dungeon)
    /* 358C 8013D184 C440AD25 */  addiu      $t5, $t5, %lo(dungeon)
    /* 3590 8013D188 16000C24 */  addiu      $t4, $zero, 0x16
    /* 3594 8013D18C 21580000 */  addu       $t3, $zero, $zero
    /* 3598 8013D190 21280000 */  addu       $a1, $zero, $zero
    /* 359C 8013D194 40500700 */  sll        $t2, $a3, 1
    /* 35A0 8013D198 21486001 */  addu       $t1, $t3, $zero
    /* 35A4 8013D19C 2130A001 */  addu       $a2, $t5, $zero
endlabel LoadPreL1Dungeon__FPcii
