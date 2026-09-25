.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_800743f0, 0x80

glabel __6Dialog_800743f0
    /* 643F0 800743F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 643F4 800743F4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 643F8 800743F8 21808000 */  addu       $s0, $a0, $zero
    /* 643FC 800743FC 94000224 */  addiu      $v0, $zero, 0x94
    /* 64400 80074400 1400BFAF */  sw         $ra, 0x14($sp)
    /* 64404 80074404 080002AE */  sw         $v0, 0x8($s0)
    /* 64408 80074408 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 6440C 8007440C 000002AE */  sw         $v0, 0x0($s0)
    /* 64410 80074410 040002AE */  sw         $v0, 0x4($s0)
    /* 64414 80074414 80000224 */  addiu      $v0, $zero, 0x80
    /* 64418 80074418 1280013C */  lui        $at, %hi(DialogRed)
    /* 6441C 8007441C FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 64420 80074420 1280013C */  lui        $at, %hi(DialogGreen)
    /* 64424 80074424 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 64428 80074428 1280013C */  lui        $at, %hi(DialogBlue)
    /* 6442C 8007442C FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 64430 80074430 20000224 */  addiu      $v0, $zero, 0x20
    /* 64434 80074434 1280013C */  lui        $at, %hi(DialogTRed)
    /* 64438 80074438 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 6443C 8007443C 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 64440 80074440 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 64444 80074444 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 64448 80074448 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 6444C 8007444C 1CD1010C */  jal        GetOverlayOtBase__7CBlocks_80074470
    /* 64450 80074450 00000000 */   nop
    /* 64454 80074454 0C0002AE */  sw         $v0, 0xC($s0)
    /* 64458 80074458 21100002 */  addu       $v0, $s0, $zero
    /* 6445C 8007445C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 64460 80074460 1000B08F */  lw         $s0, 0x10($sp)
    /* 64464 80074464 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 64468 80074468 0800E003 */  jr         $ra
    /* 6446C 8007446C 00000000 */   nop
endlabel __6Dialog_800743f0
