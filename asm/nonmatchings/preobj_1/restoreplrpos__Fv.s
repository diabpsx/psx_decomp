.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching restoreplrpos__Fv, 0x70

glabel restoreplrpos__Fv
    /* 1F96C 80159564 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1F970 80159568 21200000 */  addu       $a0, $zero, $zero
    /* 1F974 8015956C 0E80053C */  lui        $a1, %hi(plr + 0x15A)
    /* 1F978 80159570 92A6A584 */  lh         $a1, %lo(plr + 0x15A)($a1)
    /* 1F97C 80159574 0E80063C */  lui        $a2, %hi(plr + 0x15C)
    /* 1F980 80159578 94A6C684 */  lh         $a2, %lo(plr + 0x15C)($a2)
    /* 1F984 8015957C 0E80023C */  lui        $v0, %hi(plr + 0x156)
    /* 1F988 80159580 8EA64284 */  lh         $v0, %lo(plr + 0x156)($v0)
    /* 1F98C 80159584 0E80033C */  lui        $v1, %hi(plr + 0x158)
    /* 1F990 80159588 90A66384 */  lh         $v1, %lo(plr + 0x158)($v1)
    /* 1F994 8015958C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1F998 80159590 1280013C */  lui        $at, %hi(ViewX)
    /* 1F99C 80159594 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 1F9A0 80159598 1280013C */  lui        $at, %hi(ViewY)
    /* 1F9A4 8015959C 18C123AC */  sw         $v1, %lo(ViewY)($at)
    /* 1F9A8 801595A0 2090020C */  jal        PlacePlayer__FiiiUc
    /* 1F9AC 801595A4 21380000 */   addu      $a3, $zero, $zero
    /* 1F9B0 801595A8 01000424 */  addiu      $a0, $zero, 0x1
    /* 1F9B4 801595AC 0E80053C */  lui        $a1, %hi(plr + 0x15E)
    /* 1F9B8 801595B0 96A6A584 */  lh         $a1, %lo(plr + 0x15E)($a1)
    /* 1F9BC 801595B4 0E80063C */  lui        $a2, %hi(plr + 0x160)
    /* 1F9C0 801595B8 98A6C684 */  lh         $a2, %lo(plr + 0x160)($a2)
    /* 1F9C4 801595BC 2090020C */  jal        PlacePlayer__FiiiUc
    /* 1F9C8 801595C0 21380000 */   addu      $a3, $zero, $zero
    /* 1F9CC 801595C4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1F9D0 801595C8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1F9D4 801595CC 0800E003 */  jr         $ra
    /* 1F9D8 801595D0 00000000 */   nop
endlabel restoreplrpos__Fv
