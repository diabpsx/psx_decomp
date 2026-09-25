.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_PlaySFX__FP6SFXHDR, 0x10C

glabel STR_PlaySFX__FP6SFXHDR
    /* 89128 80099128 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8912C 8009912C 0D80073C */  lui        $a3, %hi(voice_attr + 0x4)
    /* 89130 80099130 ECBCE724 */  addiu      $a3, $a3, %lo(voice_attr + 0x4)
    /* 89134 80099134 1000BFAF */  sw         $ra, 0x10($sp)
    /* 89138 80099138 3C00858C */  lw         $a1, 0x3C($a0)
    /* 8913C 8009913C 93FF0234 */  ori        $v0, $zero, 0xFF93
    /* 89140 80099140 0000E2AC */  sw         $v0, 0x0($a3)
    /* 89144 80099144 1000828C */  lw         $v0, 0x10($a0)
    /* 89148 80099148 01000324 */  addiu      $v1, $zero, 0x1
    /* 8914C 8009914C 04104300 */  sllv       $v0, $v1, $v0
    /* 89150 80099150 FCFFE2AC */  sw         $v0, -0x4($a3)
    /* 89154 80099154 1400828C */  lw         $v0, 0x14($a0)
    /* 89158 80099158 F3E5063C */  lui        $a2, (0xE5F36CB1 >> 16)
    /* 8915C 8009915C 0D80013C */  lui        $at, %hi(voice_attr + 0x8)
    /* 89160 80099160 F0BC22A4 */  sh         $v0, %lo(voice_attr + 0x8)($at)
    /* 89164 80099164 1400828C */  lw         $v0, 0x14($a0)
    /* 89168 80099168 B16CC634 */  ori        $a2, $a2, (0xE5F36CB1 & 0xFFFF)
    /* 8916C 8009916C 0D80013C */  lui        $at, %hi(voice_attr + 0xA)
    /* 89170 80099170 F2BC22A4 */  sh         $v0, %lo(voice_attr + 0xA)($at)
    /* 89174 80099174 1C00828C */  lw         $v0, 0x1C($a0)
    /* 89178 80099178 1800A600 */  mult       $a1, $a2
    /* 8917C 8009917C 0D80013C */  lui        $at, %hi(voice_attr + 0x14)
    /* 89180 80099180 FCBC22A4 */  sh         $v0, %lo(voice_attr + 0x14)($at)
    /* 89184 80099184 4000848C */  lw         $a0, 0x40($a0)
    /* 89188 80099188 03000224 */  addiu      $v0, $zero, 0x3
    /* 8918C 8009918C 0D80013C */  lui        $at, %hi(voice_attr + 0x2C)
    /* 89190 80099190 14BD22AC */  sw         $v0, %lo(voice_attr + 0x2C)($at)
    /* 89194 80099194 03000224 */  addiu      $v0, $zero, 0x3
    /* 89198 80099198 0D80013C */  lui        $at, %hi(voice_attr + 0x36)
    /* 8919C 8009919C 1EBD22A4 */  sh         $v0, %lo(voice_attr + 0x36)($at)
    /* 891A0 800991A0 0F000224 */  addiu      $v0, $zero, 0xF
    /* 891A4 800991A4 0D80013C */  lui        $at, %hi(voice_attr + 0x38)
    /* 891A8 800991A8 20BD22A4 */  sh         $v0, %lo(voice_attr + 0x38)($at)
    /* 891AC 800991AC C3170500 */  sra        $v0, $a1, 31
    /* 891B0 800991B0 0D80013C */  lui        $at, %hi(voice_attr + 0x24)
    /* 891B4 800991B4 0CBD23AC */  sw         $v1, %lo(voice_attr + 0x24)($at)
    /* 891B8 800991B8 0D80013C */  lui        $at, %hi(voice_attr + 0x28)
    /* 891BC 800991BC 10BD23AC */  sw         $v1, %lo(voice_attr + 0x28)($at)
    /* 891C0 800991C0 0D80013C */  lui        $at, %hi(voice_attr + 0x30)
    /* 891C4 800991C4 18BD20A4 */  sh         $zero, %lo(voice_attr + 0x30)($at)
    /* 891C8 800991C8 0D80013C */  lui        $at, %hi(voice_attr + 0x32)
    /* 891CC 800991CC 1ABD20A4 */  sh         $zero, %lo(voice_attr + 0x32)($at)
    /* 891D0 800991D0 0D80013C */  lui        $at, %hi(voice_attr + 0x34)
    /* 891D4 800991D4 1CBD20A4 */  sh         $zero, %lo(voice_attr + 0x34)($at)
    /* 891D8 800991D8 10400000 */  mfhi       $t0
    /* 891DC 800991DC 21180501 */  addu       $v1, $t0, $a1
    /* 891E0 800991E0 C31B0300 */  sra        $v1, $v1, 15
    /* 891E4 800991E4 23186200 */  subu       $v1, $v1, $v0
    /* 891E8 800991E8 C0100300 */  sll        $v0, $v1, 3
    /* 891EC 800991EC 21104300 */  addu       $v0, $v0, $v1
    /* 891F0 800991F0 C0100200 */  sll        $v0, $v0, 3
    /* 891F4 800991F4 23104300 */  subu       $v0, $v0, $v1
    /* 891F8 800991F8 80100200 */  sll        $v0, $v0, 2
    /* 891FC 800991FC 21104300 */  addu       $v0, $v0, $v1
    /* 89200 80099200 C0110200 */  sll        $v0, $v0, 7
    /* 89204 80099204 2328A200 */  subu       $a1, $a1, $v0
    /* 89208 80099208 F0FF0224 */  addiu      $v0, $zero, -0x10
    /* 8920C 8009920C 2428A200 */  and        $a1, $a1, $v0
    /* 89210 80099210 21208500 */  addu       $a0, $a0, $a1
    /* 89214 80099214 0D80013C */  lui        $at, %hi(voice_attr + 0x1C)
    /* 89218 80099218 04BD24AC */  sw         $a0, %lo(voice_attr + 0x1C)($at)
    /* 8921C 8009921C 3363000C */  jal        SpuSetKeyOnWithAttr
    /* 89220 80099220 FCFFE424 */   addiu     $a0, $a3, -0x4
    /* 89224 80099224 1000BF8F */  lw         $ra, 0x10($sp)
    /* 89228 80099228 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8922C 8009922C 0800E003 */  jr         $ra
    /* 89230 80099230 00000000 */   nop
endlabel STR_PlaySFX__FP6SFXHDR
