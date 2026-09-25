.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching strupr__FPc, 0x54

glabel strupr__FPc
    /* 78474 80088474 2B210208 */  j          .L800884AC
    /* 78478 80088478 F0FFBD27 */   addiu     $sp, $sp, -0x10
  .L8008847C:
    /* 7847C 8008847C 0B80013C */  lui        $at, %hi(D_800B5DBD)
    /* 78480 80088480 21082200 */  addu       $at, $at, $v0
    /* 78484 80088484 BD5D2290 */  lbu        $v0, %lo(D_800B5DBD)($at)
    /* 78488 80088488 00000000 */  nop
    /* 7848C 8008848C 03004230 */  andi       $v0, $v0, 0x3
    /* 78490 80088490 05004010 */  beqz       $v0, .L800884A8
    /* 78494 80088494 9FFF6224 */   addiu     $v0, $v1, -0x61
    /* 78498 80088498 1A00422C */  sltiu      $v0, $v0, 0x1A
    /* 7849C 8008849C 02004010 */  beqz       $v0, .L800884A8
    /* 784A0 800884A0 E0006224 */   addiu     $v0, $v1, 0xE0
    /* 784A4 800884A4 000082A0 */  sb         $v0, 0x0($a0)
  .L800884A8:
    /* 784A8 800884A8 01008424 */  addiu      $a0, $a0, 0x1
  .L800884AC:
    /* 784AC 800884AC 00008280 */  lb         $v0, 0x0($a0)
    /* 784B0 800884B0 00008390 */  lbu        $v1, 0x0($a0)
    /* 784B4 800884B4 F1FF4014 */  bnez       $v0, .L8008847C
    /* 784B8 800884B8 FF006230 */   andi      $v0, $v1, 0xFF
    /* 784BC 800884BC 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 784C0 800884C0 0800E003 */  jr         $ra
    /* 784C4 800884C4 00000000 */   nop
endlabel strupr__FPc
