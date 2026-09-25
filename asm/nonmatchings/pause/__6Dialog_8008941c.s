.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_8008941c, 0x80

glabel __6Dialog_8008941c
    /* 7941C 8008941C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 79420 80089420 1000B0AF */  sw         $s0, 0x10($sp)
    /* 79424 80089424 21808000 */  addu       $s0, $a0, $zero
    /* 79428 80089428 94000224 */  addiu      $v0, $zero, 0x94
    /* 7942C 8008942C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 79430 80089430 080002AE */  sw         $v0, 0x8($s0)
    /* 79434 80089434 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 79438 80089438 000002AE */  sw         $v0, 0x0($s0)
    /* 7943C 8008943C 040002AE */  sw         $v0, 0x4($s0)
    /* 79440 80089440 80000224 */  addiu      $v0, $zero, 0x80
    /* 79444 80089444 1280013C */  lui        $at, %hi(DialogRed)
    /* 79448 80089448 FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 7944C 8008944C 1280013C */  lui        $at, %hi(DialogGreen)
    /* 79450 80089450 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 79454 80089454 1280013C */  lui        $at, %hi(DialogBlue)
    /* 79458 80089458 FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 7945C 8008945C 20000224 */  addiu      $v0, $zero, 0x20
    /* 79460 80089460 1280013C */  lui        $at, %hi(DialogTRed)
    /* 79464 80089464 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 79468 80089468 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 7946C 8008946C 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 79470 80089470 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 79474 80089474 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 79478 80089478 2725020C */  jal        GetOverlayOtBase__7CBlocks_8008949c
    /* 7947C 8008947C 00000000 */   nop
    /* 79480 80089480 0C0002AE */  sw         $v0, 0xC($s0)
    /* 79484 80089484 21100002 */  addu       $v0, $s0, $zero
    /* 79488 80089488 1400BF8F */  lw         $ra, 0x14($sp)
    /* 7948C 8008948C 1000B08F */  lw         $s0, 0x10($sp)
    /* 79490 80089490 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 79494 80089494 0800E003 */  jr         $ra
    /* 79498 80089498 00000000 */   nop
endlabel __6Dialog_8008941c
