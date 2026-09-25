.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_8004e9dc, 0x80

glabel __6Dialog_8004e9dc
    /* 3E9DC 8004E9DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3E9E0 8004E9E0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3E9E4 8004E9E4 21808000 */  addu       $s0, $a0, $zero
    /* 3E9E8 8004E9E8 94000224 */  addiu      $v0, $zero, 0x94
    /* 3E9EC 8004E9EC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 3E9F0 8004E9F0 080002AE */  sw         $v0, 0x8($s0)
    /* 3E9F4 8004E9F4 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 3E9F8 8004E9F8 000002AE */  sw         $v0, 0x0($s0)
    /* 3E9FC 8004E9FC 040002AE */  sw         $v0, 0x4($s0)
    /* 3EA00 8004EA00 80000224 */  addiu      $v0, $zero, 0x80
    /* 3EA04 8004EA04 1280013C */  lui        $at, %hi(DialogRed)
    /* 3EA08 8004EA08 FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 3EA0C 8004EA0C 1280013C */  lui        $at, %hi(DialogGreen)
    /* 3EA10 8004EA10 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 3EA14 8004EA14 1280013C */  lui        $at, %hi(DialogBlue)
    /* 3EA18 8004EA18 FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 3EA1C 8004EA1C 20000224 */  addiu      $v0, $zero, 0x20
    /* 3EA20 8004EA20 1280013C */  lui        $at, %hi(DialogTRed)
    /* 3EA24 8004EA24 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 3EA28 8004EA28 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 3EA2C 8004EA2C 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 3EA30 8004EA30 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 3EA34 8004EA34 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 3EA38 8004EA38 973A010C */  jal        GetOverlayOtBase__7CBlocks_8004ea5c
    /* 3EA3C 8004EA3C 00000000 */   nop
    /* 3EA40 8004EA40 0C0002AE */  sw         $v0, 0xC($s0)
    /* 3EA44 8004EA44 21100002 */  addu       $v0, $s0, $zero
    /* 3EA48 8004EA48 1400BF8F */  lw         $ra, 0x14($sp)
    /* 3EA4C 8004EA4C 1000B08F */  lw         $s0, 0x10($sp)
    /* 3EA50 8004EA50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3EA54 8004EA54 0800E003 */  jr         $ra
    /* 3EA58 8004EA58 00000000 */   nop
endlabel __6Dialog_8004e9dc
