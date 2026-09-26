.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitDifficultyMenu__Fv, 0xA4

glabel FeInitDifficultyMenu__Fv
    /* 2150 8013BD48 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2154 8013BD4C 0D80043C */  lui        $a0, %hi(FeDifficultyMenuTable)
    /* 2158 8013BD50 B0D98424 */  addiu      $a0, $a0, %lo(FeDifficultyMenuTable)
    /* 215C 8013BD54 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2160 8013BD58 35E7040C */  jal        FeAddTable__FP11FeMenuTablei
    /* 2164 8013BD5C 04000524 */   addiu     $a1, $zero, 0x4
    /* 2168 8013BD60 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 216C 8013BD64 0E80043C */  lui        $a0, %hi(plr + 0x13C)
    /* 2170 8013BD68 74A68480 */  lb         $a0, %lo(plr + 0x13C)($a0)
    /* 2174 8013BD6C 08004010 */  beqz       $v0, .L8013BD90
    /* 2178 8013BD70 00000000 */   nop
    /* 217C 8013BD74 0E80033C */  lui        $v1, %hi(plr + 0x1B24)
    /* 2180 8013BD78 5CC06380 */  lb         $v1, %lo(plr + 0x1B24)($v1)
    /* 2184 8013BD7C 00000000 */  nop
    /* 2188 8013BD80 2A106400 */  slt        $v0, $v1, $a0
    /* 218C 8013BD84 02004010 */  beqz       $v0, .L8013BD90
    /* 2190 8013BD88 00000000 */   nop
    /* 2194 8013BD8C 21206000 */  addu       $a0, $v1, $zero
  .L8013BD90:
    /* 2198 8013BD90 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 219C 8013BD94 01000324 */  addiu      $v1, $zero, 0x1
    /* 21A0 8013BD98 040043AC */  sw         $v1, 0x4($v0)
    /* 21A4 8013BD9C 14008228 */  slti       $v0, $a0, 0x14
    /* 21A8 8013BDA0 05004014 */  bnez       $v0, .L8013BDB8
    /* 21AC 8013BDA4 02000224 */   addiu     $v0, $zero, 0x2
    /* 21B0 8013BDA8 1E008228 */  slti       $v0, $a0, 0x1E
    /* 21B4 8013BDAC 02004014 */  bnez       $v0, .L8013BDB8
    /* 21B8 8013BDB0 03000224 */   addiu     $v0, $zero, 0x3
    /* 21BC 8013BDB4 04000224 */  addiu      $v0, $zero, 0x4
  .L8013BDB8:
    /* 21C0 8013BDB8 FC0B82AF */  sw         $v0, %gp_rel(FeBufferCount)($gp)
    /* 21C4 8013BDBC 0C000224 */  addiu      $v0, $zero, 0xC
    /* 21C8 8013BDC0 E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* 21CC 8013BDC4 20000224 */  addiu      $v0, $zero, 0x20
    /* 21D0 8013BDC8 E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 21D4 8013BDCC A0000224 */  addiu      $v0, $zero, 0xA0
    /* 21D8 8013BDD0 EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 21DC 8013BDD4 80000224 */  addiu      $v0, $zero, 0x80
    /* 21E0 8013BDD8 F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 21E4 8013BDDC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 21E8 8013BDE0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 21EC 8013BDE4 0800E003 */  jr         $ra
    /* 21F0 8013BDE8 00000000 */   nop
endlabel FeInitDifficultyMenu__Fv
