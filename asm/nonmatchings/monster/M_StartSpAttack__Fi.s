.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartSpAttack__Fi, 0xF0

glabel M_StartSpAttack__Fi
    /* 112FC 8014AEF4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 11300 8014AEF8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 11304 8014AEFC 21888000 */  addu       $s1, $a0, $zero
    /* 11308 8014AF00 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1130C 8014AF04 1800B2AF */  sw         $s2, 0x18($sp)
    /* 11310 8014AF08 EB2A050C */  jal        M_GetDir__Fi
    /* 11314 8014AF0C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 11318 8014AF10 21202002 */  addu       $a0, $s1, $zero
    /* 1131C 8014AF14 40801100 */  sll        $s0, $s1, 1
    /* 11320 8014AF18 21801102 */  addu       $s0, $s0, $s1
    /* 11324 8014AF1C 80801000 */  sll        $s0, $s0, 2
    /* 11328 8014AF20 21801102 */  addu       $s0, $s0, $s1
    /* 1132C 8014AF24 C0801000 */  sll        $s0, $s0, 3
    /* 11330 8014AF28 21904000 */  addu       $s2, $v0, $zero
    /* 11334 8014AF2C 21304002 */  addu       $a2, $s2, $zero
    /* 11338 8014AF30 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 1133C 8014AF34 21083000 */  addu       $at, $at, $s0
    /* 11340 8014AF38 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 11344 8014AF3C 05000724 */  addiu      $a3, $zero, 0x5
    /* 11348 8014AF40 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 1134C 8014AF44 0E00A524 */   addiu     $a1, $a1, 0xE
    /* 11350 8014AF48 1080023C */  lui        $v0, %hi(monster)
    /* 11354 8014AF4C 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 11358 8014AF50 21100202 */  addu       $v0, $s0, $v0
    /* 1135C 8014AF54 34004380 */  lb         $v1, 0x34($v0)
    /* 11360 8014AF58 35004580 */  lb         $a1, 0x35($v0)
    /* 11364 8014AF5C 07000224 */  addiu      $v0, $zero, 0x7
    /* 11368 8014AF60 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1136C 8014AF64 21083000 */  addu       $at, $at, $s0
    /* 11370 8014AF68 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 11374 8014AF6C 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 11378 8014AF70 21083000 */  addu       $at, $at, $s0
    /* 1137C 8014AF74 CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 11380 8014AF78 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 11384 8014AF7C 21083000 */  addu       $at, $at, $s0
    /* 11388 8014AF80 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 1138C 8014AF84 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 11390 8014AF88 21083000 */  addu       $at, $at, $s0
    /* 11394 8014AF8C D05332A0 */  sb         $s2, %lo(monster + 0x3C)($at)
    /* 11398 8014AF90 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 1139C 8014AF94 21083000 */  addu       $at, $at, $s0
    /* 113A0 8014AF98 CA5323A0 */  sb         $v1, %lo(monster + 0x36)($at)
    /* 113A4 8014AF9C 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 113A8 8014AFA0 21083000 */  addu       $at, $at, $s0
    /* 113AC 8014AFA4 CB5325A0 */  sb         $a1, %lo(monster + 0x37)($at)
    /* 113B0 8014AFA8 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 113B4 8014AFAC 21083000 */  addu       $at, $at, $s0
    /* 113B8 8014AFB0 CC5323A0 */  sb         $v1, %lo(monster + 0x38)($at)
    /* 113BC 8014AFB4 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 113C0 8014AFB8 21083000 */  addu       $at, $at, $s0
    /* 113C4 8014AFBC CD5325A0 */  sb         $a1, %lo(monster + 0x39)($at)
    /* 113C8 8014AFC0 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 113CC 8014AFC4 21202002 */   addu      $a0, $s1, $zero
    /* 113D0 8014AFC8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 113D4 8014AFCC 1800B28F */  lw         $s2, 0x18($sp)
    /* 113D8 8014AFD0 1400B18F */  lw         $s1, 0x14($sp)
    /* 113DC 8014AFD4 1000B08F */  lw         $s0, 0x10($sp)
    /* 113E0 8014AFD8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 113E4 8014AFDC 0800E003 */  jr         $ra
    /* 113E8 8014AFE0 00000000 */   nop
endlabel M_StartSpAttack__Fi
