.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_80082610, 0x80

glabel __6Dialog_80082610
    /* 72610 80082610 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 72614 80082614 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72618 80082618 21808000 */  addu       $s0, $a0, $zero
    /* 7261C 8008261C 94000224 */  addiu      $v0, $zero, 0x94
    /* 72620 80082620 1400BFAF */  sw         $ra, 0x14($sp)
    /* 72624 80082624 080002AE */  sw         $v0, 0x8($s0)
    /* 72628 80082628 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 7262C 8008262C 000002AE */  sw         $v0, 0x0($s0)
    /* 72630 80082630 040002AE */  sw         $v0, 0x4($s0)
    /* 72634 80082634 80000224 */  addiu      $v0, $zero, 0x80
    /* 72638 80082638 1280013C */  lui        $at, %hi(DialogRed)
    /* 7263C 8008263C FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 72640 80082640 1280013C */  lui        $at, %hi(DialogGreen)
    /* 72644 80082644 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 72648 80082648 1280013C */  lui        $at, %hi(DialogBlue)
    /* 7264C 8008264C FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 72650 80082650 20000224 */  addiu      $v0, $zero, 0x20
    /* 72654 80082654 1280013C */  lui        $at, %hi(DialogTRed)
    /* 72658 80082658 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 7265C 8008265C 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 72660 80082660 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 72664 80082664 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 72668 80082668 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 7266C 8008266C A409020C */  jal        GetOverlayOtBase__7CBlocks_80082690
    /* 72670 80082670 00000000 */   nop
    /* 72674 80082674 0C0002AE */  sw         $v0, 0xC($s0)
    /* 72678 80082678 21100002 */  addu       $v0, $s0, $zero
    /* 7267C 8008267C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 72680 80082680 1000B08F */  lw         $s0, 0x10($sp)
    /* 72684 80082684 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 72688 80082688 0800E003 */  jr         $ra
    /* 7268C 8008268C 00000000 */   nop
endlabel __6Dialog_80082610
