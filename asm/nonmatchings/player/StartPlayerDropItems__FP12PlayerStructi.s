.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartPlayerDropItems__FP12PlayerStructi, 0x60

glabel StartPlayerDropItems__FP12PlayerStructi
    /* 517AC 800617AC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 517B0 800617B0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 517B4 800617B4 21808000 */  addu       $s0, $a0, $zero
    /* 517B8 800617B8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 517BC 800617BC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 517C0 800617C0 787F010C */  jal        plrind__FP12PlayerStruct
    /* 517C4 800617C4 2188A000 */   addu      $s1, $a1, $zero
    /* 517C8 800617C8 80100200 */  sll        $v0, $v0, 2
    /* 517CC 800617CC 05000324 */  addiu      $v1, $zero, 0x5
    /* 517D0 800617D0 1280013C */  lui        $at, %hi(PlayerDeathCount)
    /* 517D4 800617D4 21082200 */  addu       $at, $at, $v0
    /* 517D8 800617D8 10BA23AC */  sw         $v1, %lo(PlayerDeathCount)($at)
    /* 517DC 800617DC 787F010C */  jal        plrind__FP12PlayerStruct
    /* 517E0 800617E0 21200002 */   addu      $a0, $s0, $zero
    /* 517E4 800617E4 80100200 */  sll        $v0, $v0, 2
    /* 517E8 800617E8 1280013C */  lui        $at, %hi(PlayerEar)
    /* 517EC 800617EC 21082200 */  addu       $at, $at, $v0
    /* 517F0 800617F0 18BA31AC */  sw         $s1, %lo(PlayerEar)($at)
    /* 517F4 800617F4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 517F8 800617F8 1400B18F */  lw         $s1, 0x14($sp)
    /* 517FC 800617FC 1000B08F */  lw         $s0, 0x10($sp)
    /* 51800 80061800 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 51804 80061804 0800E003 */  jr         $ra
    /* 51808 80061808 00000000 */   nop
endlabel StartPlayerDropItems__FP12PlayerStructi
