.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching GTE_RotTrans2G4, 0x88

glabel GTE_RotTrans2G4
    /* 2AC 800102AC 0000A0C8 */  lwc2       $0, 0x0($a1)
    /* 2B0 800102B0 0400A1C8 */  lwc2       $1, 0x4($a1)
    /* 2B4 800102B4 38001924 */  addiu      $t9, $zero, 0x38
    /* 2B8 800102B8 08001824 */  addiu      $t8, $zero, 0x8
    /* 2BC 800102BC 1200484A */  mvmva      1, 0, 0, 0, 0
    /* 2C0 800102C0 0800A2C8 */  lwc2       $2, 0x8($a1)
    /* 2C4 800102C4 0C00A3C8 */  lwc2       $3, 0xC($a1)
    /* 2C8 800102C8 030098A0 */  sb         $t8, 0x3($a0)
    /* 2CC 800102CC 050099A0 */  sb         $t9, 0x5($a0)
    /* 2D0 800102D0 00C80848 */  mfc2       $t0, $25 /* handwritten instruction */
    /* 2D4 800102D4 00D00948 */  mfc2       $t1, $26 /* handwritten instruction */
    /* 2D8 800102D8 1280484A */  mvmva      1, 0, 1, 0, 0
    /* 2DC 800102DC 080088A4 */  sh         $t0, 0x8($a0)
    /* 2E0 800102E0 0A0089A4 */  sh         $t1, 0xA($a0)
    /* 2E4 800102E4 1000A4C8 */  lwc2       $4, 0x10($a1)
    /* 2E8 800102E8 1400A5C8 */  lwc2       $5, 0x14($a1)
    /* 2EC 800102EC 00C80A48 */  mfc2       $t2, $25 /* handwritten instruction */
    /* 2F0 800102F0 00D00B48 */  mfc2       $t3, $26 /* handwritten instruction */
    /* 2F4 800102F4 1200494A */  mvmva      1, 0, 2, 0, 0
    /* 2F8 800102F8 14008AA4 */  sh         $t2, 0x14($a0)
    /* 2FC 800102FC 16008BA4 */  sh         $t3, 0x16($a0)
    /* 300 80010300 1800A0C8 */  lwc2       $0, 0x18($a1)
    /* 304 80010304 1C00A1C8 */  lwc2       $1, 0x1C($a1)
    /* 308 80010308 00C80C48 */  mfc2       $t4, $25 /* handwritten instruction */
    /* 30C 8001030C 00D00D48 */  mfc2       $t5, $26 /* handwritten instruction */
    /* 310 80010310 1200484A */  mvmva      1, 0, 0, 0, 0
    /* 314 80010314 20008CA4 */  sh         $t4, 0x20($a0)
    /* 318 80010318 22008DA4 */  sh         $t5, 0x22($a0)
    /* 31C 8001031C 00C80E48 */  mfc2       $t6, $25 /* handwritten instruction */
    /* 320 80010320 00D00F48 */  mfc2       $t7, $26 /* handwritten instruction */
    /* 324 80010324 2C008EA4 */  sh         $t6, 0x2C($a0)
    /* 328 80010328 2E008FA4 */  sh         $t7, 0x2E($a0)
    /* 32C 8001032C 0800E003 */  jr         $ra
    /* 330 80010330 00000000 */   nop
endlabel GTE_RotTrans2G4
