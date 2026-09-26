.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartAttack__Fi, 0xF0

glabel M_StartAttack__Fi
    /* 1D434 8015702C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D438 80157030 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1D43C 80157034 21888000 */  addu       $s1, $a0, $zero
    /* 1D440 80157038 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1D444 8015703C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1D448 80157040 EB2A050C */  jal        M_GetDir__Fi
    /* 1D44C 80157044 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1D450 80157048 21202002 */  addu       $a0, $s1, $zero
    /* 1D454 8015704C 40801100 */  sll        $s0, $s1, 1
    /* 1D458 80157050 21801102 */  addu       $s0, $s0, $s1
    /* 1D45C 80157054 80801000 */  sll        $s0, $s0, 2
    /* 1D460 80157058 21801102 */  addu       $s0, $s0, $s1
    /* 1D464 8015705C C0801000 */  sll        $s0, $s0, 3
    /* 1D468 80157060 21904000 */  addu       $s2, $v0, $zero
    /* 1D46C 80157064 21304002 */  addu       $a2, $s2, $zero
    /* 1D470 80157068 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 1D474 8015706C 21083000 */  addu       $at, $at, $s0
    /* 1D478 80157070 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 1D47C 80157074 02000724 */  addiu      $a3, $zero, 0x2
    /* 1D480 80157078 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 1D484 8015707C 0800A524 */   addiu     $a1, $a1, 0x8
    /* 1D488 80157080 1080023C */  lui        $v0, %hi(monster)
    /* 1D48C 80157084 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 1D490 80157088 21100202 */  addu       $v0, $s0, $v0
    /* 1D494 8015708C 34004380 */  lb         $v1, 0x34($v0)
    /* 1D498 80157090 35004580 */  lb         $a1, 0x35($v0)
    /* 1D49C 80157094 04000224 */  addiu      $v0, $zero, 0x4
    /* 1D4A0 80157098 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1D4A4 8015709C 21083000 */  addu       $at, $at, $s0
    /* 1D4A8 801570A0 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 1D4AC 801570A4 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 1D4B0 801570A8 21083000 */  addu       $at, $at, $s0
    /* 1D4B4 801570AC CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 1D4B8 801570B0 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 1D4BC 801570B4 21083000 */  addu       $at, $at, $s0
    /* 1D4C0 801570B8 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 1D4C4 801570BC 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1D4C8 801570C0 21083000 */  addu       $at, $at, $s0
    /* 1D4CC 801570C4 D05332A0 */  sb         $s2, %lo(monster + 0x3C)($at)
    /* 1D4D0 801570C8 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 1D4D4 801570CC 21083000 */  addu       $at, $at, $s0
    /* 1D4D8 801570D0 CA5323A0 */  sb         $v1, %lo(monster + 0x36)($at)
    /* 1D4DC 801570D4 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 1D4E0 801570D8 21083000 */  addu       $at, $at, $s0
    /* 1D4E4 801570DC CB5325A0 */  sb         $a1, %lo(monster + 0x37)($at)
    /* 1D4E8 801570E0 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 1D4EC 801570E4 21083000 */  addu       $at, $at, $s0
    /* 1D4F0 801570E8 CC5323A0 */  sb         $v1, %lo(monster + 0x38)($at)
    /* 1D4F4 801570EC 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 1D4F8 801570F0 21083000 */  addu       $at, $at, $s0
    /* 1D4FC 801570F4 CD5325A0 */  sb         $a1, %lo(monster + 0x39)($at)
    /* 1D500 801570F8 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 1D504 801570FC 21202002 */   addu      $a0, $s1, $zero
    /* 1D508 80157100 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1D50C 80157104 1800B28F */  lw         $s2, 0x18($sp)
    /* 1D510 80157108 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D514 8015710C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D518 80157110 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D51C 80157114 0800E003 */  jr         $ra
    /* 1D520 80157118 00000000 */   nop
endlabel M_StartAttack__Fi
