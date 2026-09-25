.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog, 0x80

glabel __6Dialog
    /* 2766C 8003766C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27670 80037670 1000B0AF */  sw         $s0, 0x10($sp)
    /* 27674 80037674 21808000 */  addu       $s0, $a0, $zero
    /* 27678 80037678 94000224 */  addiu      $v0, $zero, 0x94
    /* 2767C 8003767C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 27680 80037680 080002AE */  sw         $v0, 0x8($s0)
    /* 27684 80037684 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 27688 80037688 000002AE */  sw         $v0, 0x0($s0)
    /* 2768C 8003768C 040002AE */  sw         $v0, 0x4($s0)
    /* 27690 80037690 80000224 */  addiu      $v0, $zero, 0x80
    /* 27694 80037694 1280013C */  lui        $at, %hi(DialogRed)
    /* 27698 80037698 FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 2769C 8003769C 1280013C */  lui        $at, %hi(DialogGreen)
    /* 276A0 800376A0 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 276A4 800376A4 1280013C */  lui        $at, %hi(DialogBlue)
    /* 276A8 800376A8 FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 276AC 800376AC 20000224 */  addiu      $v0, $zero, 0x20
    /* 276B0 800376B0 1280013C */  lui        $at, %hi(DialogTRed)
    /* 276B4 800376B4 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 276B8 800376B8 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 276BC 800376BC 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 276C0 800376C0 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 276C4 800376C4 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 276C8 800376C8 BBDD000C */  jal        GetOverlayOtBase__7CBlocks
    /* 276CC 800376CC 00000000 */   nop
    /* 276D0 800376D0 0C0002AE */  sw         $v0, 0xC($s0)
    /* 276D4 800376D4 21100002 */  addu       $v0, $s0, $zero
    /* 276D8 800376D8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 276DC 800376DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 276E0 800376E0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 276E4 800376E4 0800E003 */  jr         $ra
    /* 276E8 800376E8 00000000 */   nop
endlabel __6Dialog
