.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_800a6848, 0x80

glabel __6Dialog_800a6848
    /* 96848 800A6848 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9684C 800A684C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 96850 800A6850 21808000 */  addu       $s0, $a0, $zero
    /* 96854 800A6854 94000224 */  addiu      $v0, $zero, 0x94
    /* 96858 800A6858 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9685C 800A685C 080002AE */  sw         $v0, 0x8($s0)
    /* 96860 800A6860 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 96864 800A6864 000002AE */  sw         $v0, 0x0($s0)
    /* 96868 800A6868 040002AE */  sw         $v0, 0x4($s0)
    /* 9686C 800A686C 80000224 */  addiu      $v0, $zero, 0x80
    /* 96870 800A6870 1280013C */  lui        $at, %hi(DialogRed)
    /* 96874 800A6874 FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 96878 800A6878 1280013C */  lui        $at, %hi(DialogGreen)
    /* 9687C 800A687C FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 96880 800A6880 1280013C */  lui        $at, %hi(DialogBlue)
    /* 96884 800A6884 FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 96888 800A6888 20000224 */  addiu      $v0, $zero, 0x20
    /* 9688C 800A688C 1280013C */  lui        $at, %hi(DialogTRed)
    /* 96890 800A6890 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 96894 800A6894 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 96898 800A6898 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 9689C 800A689C 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 968A0 800A68A0 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 968A4 800A68A4 329A020C */  jal        GetOverlayOtBase__7CBlocks_800a68c8
    /* 968A8 800A68A8 00000000 */   nop
    /* 968AC 800A68AC 0C0002AE */  sw         $v0, 0xC($s0)
    /* 968B0 800A68B0 21100002 */  addu       $v0, $s0, $zero
    /* 968B4 800A68B4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 968B8 800A68B8 1000B08F */  lw         $s0, 0x10($sp)
    /* 968BC 800A68BC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 968C0 800A68C0 0800E003 */  jr         $ra
    /* 968C4 800A68C4 00000000 */   nop
endlabel __6Dialog_800a6848
