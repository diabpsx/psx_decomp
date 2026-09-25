.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_8009dc28, 0x80

glabel __6Dialog_8009dc28
    /* 8DC28 8009DC28 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8DC2C 8009DC2C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8DC30 8009DC30 21808000 */  addu       $s0, $a0, $zero
    /* 8DC34 8009DC34 94000224 */  addiu      $v0, $zero, 0x94
    /* 8DC38 8009DC38 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8DC3C 8009DC3C 080002AE */  sw         $v0, 0x8($s0)
    /* 8DC40 8009DC40 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 8DC44 8009DC44 000002AE */  sw         $v0, 0x0($s0)
    /* 8DC48 8009DC48 040002AE */  sw         $v0, 0x4($s0)
    /* 8DC4C 8009DC4C 80000224 */  addiu      $v0, $zero, 0x80
    /* 8DC50 8009DC50 1280013C */  lui        $at, %hi(DialogRed)
    /* 8DC54 8009DC54 FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 8DC58 8009DC58 1280013C */  lui        $at, %hi(DialogGreen)
    /* 8DC5C 8009DC5C FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 8DC60 8009DC60 1280013C */  lui        $at, %hi(DialogBlue)
    /* 8DC64 8009DC64 FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 8DC68 8009DC68 20000224 */  addiu      $v0, $zero, 0x20
    /* 8DC6C 8009DC6C 1280013C */  lui        $at, %hi(DialogTRed)
    /* 8DC70 8009DC70 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 8DC74 8009DC74 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 8DC78 8009DC78 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 8DC7C 8009DC7C 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 8DC80 8009DC80 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 8DC84 8009DC84 2A77020C */  jal        GetOverlayOtBase__7CBlocks_8009dca8
    /* 8DC88 8009DC88 00000000 */   nop
    /* 8DC8C 8009DC8C 0C0002AE */  sw         $v0, 0xC($s0)
    /* 8DC90 8009DC90 21100002 */  addu       $v0, $s0, $zero
    /* 8DC94 8009DC94 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8DC98 8009DC98 1000B08F */  lw         $s0, 0x10($sp)
    /* 8DC9C 8009DC9C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8DCA0 8009DCA0 0800E003 */  jr         $ra
    /* 8DCA4 8009DCA4 00000000 */   nop
endlabel __6Dialog_8009dc28
