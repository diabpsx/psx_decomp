.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_800a42a0, 0x80

glabel __6Dialog_800a42a0
    /* 942A0 800A42A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 942A4 800A42A4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 942A8 800A42A8 21808000 */  addu       $s0, $a0, $zero
    /* 942AC 800A42AC 94000224 */  addiu      $v0, $zero, 0x94
    /* 942B0 800A42B0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 942B4 800A42B4 080002AE */  sw         $v0, 0x8($s0)
    /* 942B8 800A42B8 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 942BC 800A42BC 000002AE */  sw         $v0, 0x0($s0)
    /* 942C0 800A42C0 040002AE */  sw         $v0, 0x4($s0)
    /* 942C4 800A42C4 80000224 */  addiu      $v0, $zero, 0x80
    /* 942C8 800A42C8 1280013C */  lui        $at, %hi(DialogRed)
    /* 942CC 800A42CC FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 942D0 800A42D0 1280013C */  lui        $at, %hi(DialogGreen)
    /* 942D4 800A42D4 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 942D8 800A42D8 1280013C */  lui        $at, %hi(DialogBlue)
    /* 942DC 800A42DC FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 942E0 800A42E0 20000224 */  addiu      $v0, $zero, 0x20
    /* 942E4 800A42E4 1280013C */  lui        $at, %hi(DialogTRed)
    /* 942E8 800A42E8 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 942EC 800A42EC 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 942F0 800A42F0 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 942F4 800A42F4 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 942F8 800A42F8 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 942FC 800A42FC CB90020C */  jal        GetOverlayOtBase__7CBlocks_800a432c
    /* 94300 800A4300 00000000 */   nop
    /* 94304 800A4304 0C0002AE */  sw         $v0, 0xC($s0)
    /* 94308 800A4308 21100002 */  addu       $v0, $s0, $zero
    /* 9430C 800A430C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 94310 800A4310 1000B08F */  lw         $s0, 0x10($sp)
    /* 94314 800A4314 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94318 800A4318 0800E003 */  jr         $ra
    /* 9431C 800A431C 00000000 */   nop
endlabel __6Dialog_800a42a0
