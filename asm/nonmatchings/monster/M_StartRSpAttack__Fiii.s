.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartRSpAttack__Fiii, 0x174

glabel M_StartRSpAttack__Fiii
    /* 11188 8014AD80 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1118C 8014AD84 2400B1AF */  sw         $s1, 0x24($sp)
    /* 11190 8014AD88 21888000 */  addu       $s1, $a0, $zero
    /* 11194 8014AD8C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 11198 8014AD90 21A0A000 */  addu       $s4, $a1, $zero
    /* 1119C 8014AD94 3800B6AF */  sw         $s6, 0x38($sp)
    /* 111A0 8014AD98 21B0C000 */  addu       $s6, $a2, $zero
    /* 111A4 8014AD9C 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 111A8 8014ADA0 3400B5AF */  sw         $s5, 0x34($sp)
    /* 111AC 8014ADA4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 111B0 8014ADA8 2800B2AF */  sw         $s2, 0x28($sp)
    /* 111B4 8014ADAC EB2A050C */  jal        M_GetDir__Fi
    /* 111B8 8014ADB0 2000B0AF */   sw        $s0, 0x20($sp)
    /* 111BC 8014ADB4 21202002 */  addu       $a0, $s1, $zero
    /* 111C0 8014ADB8 21A84000 */  addu       $s5, $v0, $zero
    /* 111C4 8014ADBC 2130A002 */  addu       $a2, $s5, $zero
    /* 111C8 8014ADC0 40101100 */  sll        $v0, $s1, 1
    /* 111CC 8014ADC4 21105100 */  addu       $v0, $v0, $s1
    /* 111D0 8014ADC8 80100200 */  sll        $v0, $v0, 2
    /* 111D4 8014ADCC 21105100 */  addu       $v0, $v0, $s1
    /* 111D8 8014ADD0 C0800200 */  sll        $s0, $v0, 3
    /* 111DC 8014ADD4 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 111E0 8014ADD8 21083000 */  addu       $at, $at, $s0
    /* 111E4 8014ADDC F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 111E8 8014ADE0 05000724 */  addiu      $a3, $zero, 0x5
    /* 111EC 8014ADE4 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 111F0 8014ADE8 0E00A524 */   addiu     $a1, $a1, 0xE
    /* 111F4 8014ADEC 1080023C */  lui        $v0, %hi(monster)
    /* 111F8 8014ADF0 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 111FC 8014ADF4 21100202 */  addu       $v0, $s0, $v0
    /* 11200 8014ADF8 43000324 */  addiu      $v1, $zero, 0x43
    /* 11204 8014ADFC 34005280 */  lb         $s2, 0x34($v0)
    /* 11208 8014AE00 35005380 */  lb         $s3, 0x35($v0)
    /* 1120C 8014AE04 0D008316 */  bne        $s4, $v1, .L8014AE3C
    /* 11210 8014AE08 0C000224 */   addiu     $v0, $zero, 0xC
    /* 11214 8014AE0C 21204002 */  addu       $a0, $s2, $zero
    /* 11218 8014AE10 21286002 */  addu       $a1, $s3, $zero
    /* 1121C 8014AE14 000A0624 */  addiu      $a2, $zero, 0xA00
    /* 11220 8014AE18 000A0724 */  addiu      $a3, $zero, 0xA00
    /* 11224 8014AE1C 000A0224 */  addiu      $v0, $zero, 0xA00
    /* 11228 8014AE20 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1122C 8014AE24 40000224 */  addiu      $v0, $zero, 0x40
    /* 11230 8014AE28 1400A2AF */  sw         $v0, 0x14($sp)
    /* 11234 8014AE2C 1800A2AF */  sw         $v0, 0x18($sp)
    /* 11238 8014AE30 502F010C */  jal        SetLightFX__FiisssUcUcUc
    /* 1123C 8014AE34 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 11240 8014AE38 0C000224 */  addiu      $v0, $zero, 0xC
  .L8014AE3C:
    /* 11244 8014AE3C 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 11248 8014AE40 21083000 */  addu       $at, $at, $s0
    /* 1124C 8014AE44 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 11250 8014AE48 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 11254 8014AE4C 21083000 */  addu       $at, $at, $s0
    /* 11258 8014AE50 AC5334A4 */  sh         $s4, %lo(monster + 0x18)($at)
    /* 1125C 8014AE54 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 11260 8014AE58 21083000 */  addu       $at, $at, $s0
    /* 11264 8014AE5C AE5320A4 */  sh         $zero, %lo(monster + 0x1A)($at)
    /* 11268 8014AE60 1080013C */  lui        $at, %hi(monster + 0x1C)
    /* 1126C 8014AE64 21083000 */  addu       $at, $at, $s0
    /* 11270 8014AE68 B05336A4 */  sh         $s6, %lo(monster + 0x1C)($at)
    /* 11274 8014AE6C 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 11278 8014AE70 21083000 */  addu       $at, $at, $s0
    /* 1127C 8014AE74 CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 11280 8014AE78 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 11284 8014AE7C 21083000 */  addu       $at, $at, $s0
    /* 11288 8014AE80 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 1128C 8014AE84 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 11290 8014AE88 21083000 */  addu       $at, $at, $s0
    /* 11294 8014AE8C CA5332A0 */  sb         $s2, %lo(monster + 0x36)($at)
    /* 11298 8014AE90 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 1129C 8014AE94 21083000 */  addu       $at, $at, $s0
    /* 112A0 8014AE98 CB5333A0 */  sb         $s3, %lo(monster + 0x37)($at)
    /* 112A4 8014AE9C 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 112A8 8014AEA0 21083000 */  addu       $at, $at, $s0
    /* 112AC 8014AEA4 CC5332A0 */  sb         $s2, %lo(monster + 0x38)($at)
    /* 112B0 8014AEA8 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 112B4 8014AEAC 21083000 */  addu       $at, $at, $s0
    /* 112B8 8014AEB0 CD5333A0 */  sb         $s3, %lo(monster + 0x39)($at)
    /* 112BC 8014AEB4 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 112C0 8014AEB8 21083000 */  addu       $at, $at, $s0
    /* 112C4 8014AEBC D05335A0 */  sb         $s5, %lo(monster + 0x3C)($at)
    /* 112C8 8014AEC0 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 112CC 8014AEC4 21202002 */   addu      $a0, $s1, $zero
    /* 112D0 8014AEC8 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 112D4 8014AECC 3800B68F */  lw         $s6, 0x38($sp)
    /* 112D8 8014AED0 3400B58F */  lw         $s5, 0x34($sp)
    /* 112DC 8014AED4 3000B48F */  lw         $s4, 0x30($sp)
    /* 112E0 8014AED8 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 112E4 8014AEDC 2800B28F */  lw         $s2, 0x28($sp)
    /* 112E8 8014AEE0 2400B18F */  lw         $s1, 0x24($sp)
    /* 112EC 8014AEE4 2000B08F */  lw         $s0, 0x20($sp)
    /* 112F0 8014AEE8 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 112F4 8014AEEC 0800E003 */  jr         $ra
    /* 112F8 8014AEF0 00000000 */   nop
endlabel M_StartRSpAttack__Fiii
