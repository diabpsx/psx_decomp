.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddMagmaball__Fiiiiiicii, 0x11C

glabel AddMagmaball__Fiiiiiicii
    /* 42D8 8013DED0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 42DC 8013DED4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 42E0 8013DED8 21888000 */  addu       $s1, $a0, $zero
    /* 42E4 8013DEDC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 42E8 8013DEE0 2190A000 */  addu       $s2, $a1, $zero
    /* 42EC 8013DEE4 2400B3AF */  sw         $s3, 0x24($sp)
    /* 42F0 8013DEE8 2198C000 */  addu       $s3, $a2, $zero
    /* 42F4 8013DEEC 4000A38F */  lw         $v1, 0x40($sp)
    /* 42F8 8013DEF0 10000224 */  addiu      $v0, $zero, 0x10
    /* 42FC 8013DEF4 2800BFAF */  sw         $ra, 0x28($sp)
    /* 4300 8013DEF8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 4304 8013DEFC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 4308 8013DF00 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 430C 8013DF04 1000A3AF */   sw        $v1, 0x10($sp)
    /* 4310 8013DF08 80801100 */  sll        $s0, $s1, 2
    /* 4314 8013DF0C 21801102 */  addu       $s0, $s0, $s1
    /* 4318 8013DF10 80801000 */  sll        $s0, $s0, 2
    /* 431C 8013DF14 23801102 */  subu       $s0, $s0, $s1
    /* 4320 8013DF18 80801000 */  sll        $s0, $s0, 2
    /* 4324 8013DF1C 1080013C */  lui        $at, %hi(missile)
    /* 4328 8013DF20 21083000 */  addu       $at, $at, $s0
    /* 432C 8013DF24 582C228C */  lw         $v0, %lo(missile)($at)
    /* 4330 8013DF28 00000000 */  nop
    /* 4334 8013DF2C 40180200 */  sll        $v1, $v0, 1
    /* 4338 8013DF30 21186200 */  addu       $v1, $v1, $v0
    /* 433C 8013DF34 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 4340 8013DF38 21083000 */  addu       $at, $at, $s0
    /* 4344 8013DF3C 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* 4348 8013DF40 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 434C 8013DF44 21083000 */  addu       $at, $at, $s0
    /* 4350 8013DF48 5C2C258C */  lw         $a1, %lo(missile + 0x4)($at)
    /* 4354 8013DF4C 21104300 */  addu       $v0, $v0, $v1
    /* 4358 8013DF50 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 435C 8013DF54 21083000 */  addu       $at, $at, $s0
    /* 4360 8013DF58 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* 4364 8013DF5C 40100500 */  sll        $v0, $a1, 1
    /* 4368 8013DF60 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 436C 8013DF64 21083000 */  addu       $at, $at, $s0
    /* 4370 8013DF68 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* 4374 8013DF6C 21104500 */  addu       $v0, $v0, $a1
    /* 4378 8013DF70 21186200 */  addu       $v1, $v1, $v0
    /* 437C 8013DF74 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 4380 8013DF78 21083000 */  addu       $at, $at, $s0
    /* 4384 8013DF7C 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* 4388 8013DF80 68EB040C */  jal        GetMissilePos__Fi
    /* 438C 8013DF84 21202002 */   addu      $a0, $s1, $zero
    /* 4390 8013DF88 21204002 */  addu       $a0, $s2, $zero
    /* 4394 8013DF8C 21286002 */  addu       $a1, $s3, $zero
    /* 4398 8013DF90 00010224 */  addiu      $v0, $zero, 0x100
    /* 439C 8013DF94 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 43A0 8013DF98 21083000 */  addu       $at, $at, $s0
    /* 43A4 8013DF9C 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 43A8 8013DFA0 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 43AC 8013DFA4 21083000 */  addu       $at, $at, $s0
    /* 43B0 8013DFA8 762C24A4 */  sh         $a0, %lo(missile + 0x1E)($at)
    /* 43B4 8013DFAC 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 43B8 8013DFB0 21083000 */  addu       $at, $at, $s0
    /* 43BC 8013DFB4 782C25A4 */  sh         $a1, %lo(missile + 0x20)($at)
    /* 43C0 8013DFB8 BA34010C */  jal        AddLight__Fiii
    /* 43C4 8013DFBC 97000624 */   addiu     $a2, $zero, 0x97
    /* 43C8 8013DFC0 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 43CC 8013DFC4 21083000 */  addu       $at, $at, $s0
    /* 43D0 8013DFC8 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 43D4 8013DFCC 2800BF8F */  lw         $ra, 0x28($sp)
    /* 43D8 8013DFD0 2400B38F */  lw         $s3, 0x24($sp)
    /* 43DC 8013DFD4 2000B28F */  lw         $s2, 0x20($sp)
    /* 43E0 8013DFD8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 43E4 8013DFDC 1800B08F */  lw         $s0, 0x18($sp)
    /* 43E8 8013DFE0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 43EC 8013DFE4 0800E003 */  jr         $ra
    /* 43F0 8013DFE8 00000000 */   nop
endlabel AddMagmaball__Fiiiiiicii
