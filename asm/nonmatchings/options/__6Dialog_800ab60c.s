.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_800ab60c, 0x80

glabel __6Dialog_800ab60c
    /* 9B60C 800AB60C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9B610 800AB610 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9B614 800AB614 21808000 */  addu       $s0, $a0, $zero
    /* 9B618 800AB618 94000224 */  addiu      $v0, $zero, 0x94
    /* 9B61C 800AB61C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9B620 800AB620 080002AE */  sw         $v0, 0x8($s0)
    /* 9B624 800AB624 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 9B628 800AB628 000002AE */  sw         $v0, 0x0($s0)
    /* 9B62C 800AB62C 040002AE */  sw         $v0, 0x4($s0)
    /* 9B630 800AB630 80000224 */  addiu      $v0, $zero, 0x80
    /* 9B634 800AB634 1280013C */  lui        $at, %hi(DialogRed)
    /* 9B638 800AB638 FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 9B63C 800AB63C 1280013C */  lui        $at, %hi(DialogGreen)
    /* 9B640 800AB640 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 9B644 800AB644 1280013C */  lui        $at, %hi(DialogBlue)
    /* 9B648 800AB648 FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 9B64C 800AB64C 20000224 */  addiu      $v0, $zero, 0x20
    /* 9B650 800AB650 1280013C */  lui        $at, %hi(DialogTRed)
    /* 9B654 800AB654 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 9B658 800AB658 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 9B65C 800AB65C 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 9B660 800AB660 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 9B664 800AB664 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 9B668 800AB668 A3AD020C */  jal        GetOverlayOtBase__7CBlocks_800ab68c
    /* 9B66C 800AB66C 00000000 */   nop
    /* 9B670 800AB670 0C0002AE */  sw         $v0, 0xC($s0)
    /* 9B674 800AB674 21100002 */  addu       $v0, $s0, $zero
    /* 9B678 800AB678 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9B67C 800AB67C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9B680 800AB680 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9B684 800AB684 0800E003 */  jr         $ra
    /* 9B688 800AB688 00000000 */   nop
endlabel __6Dialog_800ab60c
