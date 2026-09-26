.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartEat__Fi, 0xD8

glabel M_StartEat__Fi
    /* 113EC 8014AFE4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 113F0 8014AFE8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 113F4 8014AFEC 21888000 */  addu       $s1, $a0, $zero
    /* 113F8 8014AFF0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 113FC 8014AFF4 40801100 */  sll        $s0, $s1, 1
    /* 11400 8014AFF8 21801102 */  addu       $s0, $s0, $s1
    /* 11404 8014AFFC 80801000 */  sll        $s0, $s0, 2
    /* 11408 8014B000 21801102 */  addu       $s0, $s0, $s1
    /* 1140C 8014B004 C0801000 */  sll        $s0, $s0, 3
    /* 11410 8014B008 05000724 */  addiu      $a3, $zero, 0x5
    /* 11414 8014B00C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 11418 8014B010 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 1141C 8014B014 21083000 */  addu       $at, $at, $s0
    /* 11420 8014B018 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 11424 8014B01C 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 11428 8014B020 21083000 */  addu       $at, $at, $s0
    /* 1142C 8014B024 D0532680 */  lb         $a2, %lo(monster + 0x3C)($at)
    /* 11430 8014B028 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 11434 8014B02C 0E00A524 */   addiu     $a1, $a1, 0xE
    /* 11438 8014B030 1080023C */  lui        $v0, %hi(monster)
    /* 1143C 8014B034 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 11440 8014B038 21100202 */  addu       $v0, $s0, $v0
    /* 11444 8014B03C 34004380 */  lb         $v1, 0x34($v0)
    /* 11448 8014B040 35004580 */  lb         $a1, 0x35($v0)
    /* 1144C 8014B044 07000224 */  addiu      $v0, $zero, 0x7
    /* 11450 8014B048 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 11454 8014B04C 21083000 */  addu       $at, $at, $s0
    /* 11458 8014B050 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 1145C 8014B054 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 11460 8014B058 21083000 */  addu       $at, $at, $s0
    /* 11464 8014B05C CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 11468 8014B060 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 1146C 8014B064 21083000 */  addu       $at, $at, $s0
    /* 11470 8014B068 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 11474 8014B06C 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 11478 8014B070 21083000 */  addu       $at, $at, $s0
    /* 1147C 8014B074 CA5323A0 */  sb         $v1, %lo(monster + 0x36)($at)
    /* 11480 8014B078 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 11484 8014B07C 21083000 */  addu       $at, $at, $s0
    /* 11488 8014B080 CB5325A0 */  sb         $a1, %lo(monster + 0x37)($at)
    /* 1148C 8014B084 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 11490 8014B088 21083000 */  addu       $at, $at, $s0
    /* 11494 8014B08C CC5323A0 */  sb         $v1, %lo(monster + 0x38)($at)
    /* 11498 8014B090 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 1149C 8014B094 21083000 */  addu       $at, $at, $s0
    /* 114A0 8014B098 CD5325A0 */  sb         $a1, %lo(monster + 0x39)($at)
    /* 114A4 8014B09C D5FC010C */  jal        M_CheckEFlag__Fi
    /* 114A8 8014B0A0 21202002 */   addu      $a0, $s1, $zero
    /* 114AC 8014B0A4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 114B0 8014B0A8 1400B18F */  lw         $s1, 0x14($sp)
    /* 114B4 8014B0AC 1000B08F */  lw         $s0, 0x10($sp)
    /* 114B8 8014B0B0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 114BC 8014B0B4 0800E003 */  jr         $ra
    /* 114C0 8014B0B8 00000000 */   nop
endlabel M_StartEat__Fi
