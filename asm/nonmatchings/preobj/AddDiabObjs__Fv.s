.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddDiabObjs__Fv, 0x154

glabel AddDiabObjs__Fv
    /* 1F1E4 80158DDC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1F1E8 80158DE0 1280043C */  lui        $a0, %hi(D_801197BC)
    /* 1F1EC 80158DE4 BC978424 */  addiu      $a0, $a0, %lo(D_801197BC)
    /* 1F1F0 80158DE8 21280000 */  addu       $a1, $zero, $zero
    /* 1F1F4 80158DEC 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1F1F8 80158DF0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 1F1FC 80158DF4 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 1F200 80158DF8 2000B0AF */   sw        $s0, 0x20($sp)
    /* 1F204 80158DFC 21884000 */  addu       $s1, $v0, $zero
    /* 1F208 80158E00 21202002 */  addu       $a0, $s1, $zero
    /* 1F20C 80158E04 1280053C */  lui        $a1, %hi(diabquad1x)
    /* 1F210 80158E08 7CBFA58C */  lw         $a1, %lo(diabquad1x)($a1)
    /* 1F214 80158E0C 1280063C */  lui        $a2, %hi(diabquad1y)
    /* 1F218 80158E10 8CBFC68C */  lw         $a2, %lo(diabquad1y)($a2)
    /* 1F21C 80158E14 1280073C */  lui        $a3, %hi(diabquad2x)
    /* 1F220 80158E18 80BFE78C */  lw         $a3, %lo(diabquad2x)($a3)
    /* 1F224 80158E1C 0C000224 */  addiu      $v0, $zero, 0xC
    /* 1F228 80158E20 1800A2AF */  sw         $v0, 0x18($sp)
    /* 1F22C 80158E24 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F230 80158E28 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 1F234 80158E2C 1280023C */  lui        $v0, %hi(diabquad2y)
    /* 1F238 80158E30 90BF428C */  lw         $v0, %lo(diabquad2y)($v0)
    /* 1F23C 80158E34 0B001024 */  addiu      $s0, $zero, 0xB
    /* 1F240 80158E38 1400B0AF */  sw         $s0, 0x14($sp)
    /* 1F244 80158E3C 40280500 */  sll        $a1, $a1, 1
    /* 1F248 80158E40 40300600 */  sll        $a2, $a2, 1
    /* 1F24C 80158E44 1C63050C */  jal        LoadMapObjects__FPUciiiiiii
    /* 1F250 80158E48 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1F254 80158E4C F7F6000C */  jal        mem_free_dbg__FPv
    /* 1F258 80158E50 21202002 */   addu      $a0, $s1, $zero
    /* 1F25C 80158E54 1280043C */  lui        $a0, %hi(D_801197C8)
    /* 1F260 80158E58 C8978424 */  addiu      $a0, $a0, %lo(D_801197C8)
    /* 1F264 80158E5C A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 1F268 80158E60 21280000 */   addu      $a1, $zero, $zero
    /* 1F26C 80158E64 21884000 */  addu       $s1, $v0, $zero
    /* 1F270 80158E68 1280053C */  lui        $a1, %hi(diabquad2x)
    /* 1F274 80158E6C 80BFA58C */  lw         $a1, %lo(diabquad2x)($a1)
    /* 1F278 80158E70 1280063C */  lui        $a2, %hi(diabquad2y)
    /* 1F27C 80158E74 90BFC68C */  lw         $a2, %lo(diabquad2y)($a2)
    /* 1F280 80158E78 1280073C */  lui        $a3, %hi(diabquad3x)
    /* 1F284 80158E7C 84BFE78C */  lw         $a3, %lo(diabquad3x)($a3)
    /* 1F288 80158E80 02000224 */  addiu      $v0, $zero, 0x2
    /* 1F28C 80158E84 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 1F290 80158E88 1280023C */  lui        $v0, %hi(diabquad3y)
    /* 1F294 80158E8C 94BF428C */  lw         $v0, %lo(diabquad3y)($v0)
    /* 1F298 80158E90 21202002 */  addu       $a0, $s1, $zero
    /* 1F29C 80158E94 1400B0AF */  sw         $s0, 0x14($sp)
    /* 1F2A0 80158E98 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1F2A4 80158E9C 40280500 */  sll        $a1, $a1, 1
    /* 1F2A8 80158EA0 40300600 */  sll        $a2, $a2, 1
    /* 1F2AC 80158EA4 1C63050C */  jal        LoadMapObjects__FPUciiiiiii
    /* 1F2B0 80158EA8 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1F2B4 80158EAC F7F6000C */  jal        mem_free_dbg__FPv
    /* 1F2B8 80158EB0 21202002 */   addu      $a0, $s1, $zero
    /* 1F2BC 80158EB4 1280043C */  lui        $a0, %hi(D_801197D4)
    /* 1F2C0 80158EB8 D4978424 */  addiu      $a0, $a0, %lo(D_801197D4)
    /* 1F2C4 80158EBC A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 1F2C8 80158EC0 21280000 */   addu      $a1, $zero, $zero
    /* 1F2CC 80158EC4 21884000 */  addu       $s1, $v0, $zero
    /* 1F2D0 80158EC8 21202002 */  addu       $a0, $s1, $zero
    /* 1F2D4 80158ECC 1280053C */  lui        $a1, %hi(diabquad3x)
    /* 1F2D8 80158ED0 84BFA58C */  lw         $a1, %lo(diabquad3x)($a1)
    /* 1F2DC 80158ED4 1280063C */  lui        $a2, %hi(diabquad3y)
    /* 1F2E0 80158ED8 94BFC68C */  lw         $a2, %lo(diabquad3y)($a2)
    /* 1F2E4 80158EDC 1280073C */  lui        $a3, %hi(diabquad4x)
    /* 1F2E8 80158EE0 88BFE78C */  lw         $a3, %lo(diabquad4x)($a3)
    /* 1F2EC 80158EE4 09000224 */  addiu      $v0, $zero, 0x9
    /* 1F2F0 80158EE8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1F2F4 80158EEC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 1F2F8 80158EF0 03000224 */  addiu      $v0, $zero, 0x3
    /* 1F2FC 80158EF4 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 1F300 80158EF8 1280023C */  lui        $v0, %hi(diabquad4y)
    /* 1F304 80158EFC 98BF428C */  lw         $v0, %lo(diabquad4y)($v0)
    /* 1F308 80158F00 40280500 */  sll        $a1, $a1, 1
    /* 1F30C 80158F04 40300600 */  sll        $a2, $a2, 1
    /* 1F310 80158F08 1C63050C */  jal        LoadMapObjects__FPUciiiiiii
    /* 1F314 80158F0C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1F318 80158F10 F7F6000C */  jal        mem_free_dbg__FPv
    /* 1F31C 80158F14 21202002 */   addu      $a0, $s1, $zero
    /* 1F320 80158F18 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1F324 80158F1C 2400B18F */  lw         $s1, 0x24($sp)
    /* 1F328 80158F20 2000B08F */  lw         $s0, 0x20($sp)
    /* 1F32C 80158F24 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1F330 80158F28 0800E003 */  jr         $ra
    /* 1F334 80158F2C 00000000 */   nop
endlabel AddDiabObjs__Fv
