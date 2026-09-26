.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartRAttack__Fiii, 0x120

glabel M_StartRAttack__Fiii
    /* 11068 8014AC60 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1106C 8014AC64 1400B1AF */  sw         $s1, 0x14($sp)
    /* 11070 8014AC68 21888000 */  addu       $s1, $a0, $zero
    /* 11074 8014AC6C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 11078 8014AC70 2198A000 */  addu       $s3, $a1, $zero
    /* 1107C 8014AC74 2000B4AF */  sw         $s4, 0x20($sp)
    /* 11080 8014AC78 21A0C000 */  addu       $s4, $a2, $zero
    /* 11084 8014AC7C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 11088 8014AC80 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1108C 8014AC84 EB2A050C */  jal        M_GetDir__Fi
    /* 11090 8014AC88 1000B0AF */   sw        $s0, 0x10($sp)
    /* 11094 8014AC8C 21202002 */  addu       $a0, $s1, $zero
    /* 11098 8014AC90 40801100 */  sll        $s0, $s1, 1
    /* 1109C 8014AC94 21801102 */  addu       $s0, $s0, $s1
    /* 110A0 8014AC98 80801000 */  sll        $s0, $s0, 2
    /* 110A4 8014AC9C 21801102 */  addu       $s0, $s0, $s1
    /* 110A8 8014ACA0 C0801000 */  sll        $s0, $s0, 3
    /* 110AC 8014ACA4 21904000 */  addu       $s2, $v0, $zero
    /* 110B0 8014ACA8 21304002 */  addu       $a2, $s2, $zero
    /* 110B4 8014ACAC 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 110B8 8014ACB0 21083000 */  addu       $at, $at, $s0
    /* 110BC 8014ACB4 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 110C0 8014ACB8 02000724 */  addiu      $a3, $zero, 0x2
    /* 110C4 8014ACBC 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 110C8 8014ACC0 0800A524 */   addiu     $a1, $a1, 0x8
    /* 110CC 8014ACC4 1080023C */  lui        $v0, %hi(monster)
    /* 110D0 8014ACC8 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 110D4 8014ACCC 21100202 */  addu       $v0, $s0, $v0
    /* 110D8 8014ACD0 34004380 */  lb         $v1, 0x34($v0)
    /* 110DC 8014ACD4 35004580 */  lb         $a1, 0x35($v0)
    /* 110E0 8014ACD8 0A000224 */  addiu      $v0, $zero, 0xA
    /* 110E4 8014ACDC 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 110E8 8014ACE0 21083000 */  addu       $at, $at, $s0
    /* 110EC 8014ACE4 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 110F0 8014ACE8 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 110F4 8014ACEC 21083000 */  addu       $at, $at, $s0
    /* 110F8 8014ACF0 AC5333A4 */  sh         $s3, %lo(monster + 0x18)($at)
    /* 110FC 8014ACF4 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 11100 8014ACF8 21083000 */  addu       $at, $at, $s0
    /* 11104 8014ACFC AE5334A4 */  sh         $s4, %lo(monster + 0x1A)($at)
    /* 11108 8014AD00 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 1110C 8014AD04 21083000 */  addu       $at, $at, $s0
    /* 11110 8014AD08 CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 11114 8014AD0C 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 11118 8014AD10 21083000 */  addu       $at, $at, $s0
    /* 1111C 8014AD14 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 11120 8014AD18 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 11124 8014AD1C 21083000 */  addu       $at, $at, $s0
    /* 11128 8014AD20 D05332A0 */  sb         $s2, %lo(monster + 0x3C)($at)
    /* 1112C 8014AD24 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 11130 8014AD28 21083000 */  addu       $at, $at, $s0
    /* 11134 8014AD2C CA5323A0 */  sb         $v1, %lo(monster + 0x36)($at)
    /* 11138 8014AD30 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 1113C 8014AD34 21083000 */  addu       $at, $at, $s0
    /* 11140 8014AD38 CB5325A0 */  sb         $a1, %lo(monster + 0x37)($at)
    /* 11144 8014AD3C 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 11148 8014AD40 21083000 */  addu       $at, $at, $s0
    /* 1114C 8014AD44 CC5323A0 */  sb         $v1, %lo(monster + 0x38)($at)
    /* 11150 8014AD48 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 11154 8014AD4C 21083000 */  addu       $at, $at, $s0
    /* 11158 8014AD50 CD5325A0 */  sb         $a1, %lo(monster + 0x39)($at)
    /* 1115C 8014AD54 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 11160 8014AD58 21202002 */   addu      $a0, $s1, $zero
    /* 11164 8014AD5C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 11168 8014AD60 2000B48F */  lw         $s4, 0x20($sp)
    /* 1116C 8014AD64 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 11170 8014AD68 1800B28F */  lw         $s2, 0x18($sp)
    /* 11174 8014AD6C 1400B18F */  lw         $s1, 0x14($sp)
    /* 11178 8014AD70 1000B08F */  lw         $s0, 0x10($sp)
    /* 1117C 8014AD74 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 11180 8014AD78 0800E003 */  jr         $ra
    /* 11184 8014AD7C 00000000 */   nop
endlabel M_StartRAttack__Fiii
