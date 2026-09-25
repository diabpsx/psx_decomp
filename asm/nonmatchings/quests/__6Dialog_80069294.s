.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_80069294, 0x80

glabel __6Dialog_80069294
    /* 59294 80069294 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 59298 80069298 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5929C 8006929C 21808000 */  addu       $s0, $a0, $zero
    /* 592A0 800692A0 94000224 */  addiu      $v0, $zero, 0x94
    /* 592A4 800692A4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 592A8 800692A8 080002AE */  sw         $v0, 0x8($s0)
    /* 592AC 800692AC 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 592B0 800692B0 000002AE */  sw         $v0, 0x0($s0)
    /* 592B4 800692B4 040002AE */  sw         $v0, 0x4($s0)
    /* 592B8 800692B8 80000224 */  addiu      $v0, $zero, 0x80
    /* 592BC 800692BC 1280013C */  lui        $at, %hi(DialogRed)
    /* 592C0 800692C0 FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 592C4 800692C4 1280013C */  lui        $at, %hi(DialogGreen)
    /* 592C8 800692C8 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 592CC 800692CC 1280013C */  lui        $at, %hi(DialogBlue)
    /* 592D0 800692D0 FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 592D4 800692D4 20000224 */  addiu      $v0, $zero, 0x20
    /* 592D8 800692D8 1280013C */  lui        $at, %hi(DialogTRed)
    /* 592DC 800692DC 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 592E0 800692E0 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 592E4 800692E4 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 592E8 800692E8 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 592EC 800692EC 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 592F0 800692F0 C5A4010C */  jal        GetOverlayOtBase__7CBlocks_80069314
    /* 592F4 800692F4 00000000 */   nop
    /* 592F8 800692F8 0C0002AE */  sw         $v0, 0xC($s0)
    /* 592FC 800692FC 21100002 */  addu       $v0, $s0, $zero
    /* 59300 80069300 1400BF8F */  lw         $ra, 0x14($sp)
    /* 59304 80069304 1000B08F */  lw         $s0, 0x10($sp)
    /* 59308 80069308 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5930C 8006930C 0800E003 */  jr         $ra
    /* 59310 80069310 00000000 */   nop
endlabel __6Dialog_80069294
