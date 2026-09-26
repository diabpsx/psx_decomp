.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFiremove__Fiiiiiicii, 0x160

glabel AddFiremove__Fiiiiiicii
    /* 5D18 8013F910 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 5D1C 8013F914 2000B2AF */  sw         $s2, 0x20($sp)
    /* 5D20 8013F918 4800B28F */  lw         $s2, 0x48($sp)
    /* 5D24 8013F91C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5D28 8013F920 21808000 */  addu       $s0, $a0, $zero
    /* 5D2C 8013F924 2400B3AF */  sw         $s3, 0x24($sp)
    /* 5D30 8013F928 2198A000 */  addu       $s3, $a1, $zero
    /* 5D34 8013F92C 2800B4AF */  sw         $s4, 0x28($sp)
    /* 5D38 8013F930 21A0C000 */  addu       $s4, $a2, $zero
    /* 5D3C 8013F934 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 5D40 8013F938 21A8E000 */  addu       $s5, $a3, $zero
    /* 5D44 8013F93C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5D48 8013F940 5400B18F */  lw         $s1, 0x54($sp)
    /* 5D4C 8013F944 3000BFAF */  sw         $ra, 0x30($sp)
    /* 5D50 8013F948 C9F6000C */  jal        ENG_random__Fl
    /* 5D54 8013F94C 0A000424 */   addiu     $a0, $zero, 0xA
    /* 5D58 8013F950 21200002 */  addu       $a0, $s0, $zero
    /* 5D5C 8013F954 80800400 */  sll        $s0, $a0, 2
    /* 5D60 8013F958 21800402 */  addu       $s0, $s0, $a0
    /* 5D64 8013F95C 80801000 */  sll        $s0, $s0, 2
    /* 5D68 8013F960 23800402 */  subu       $s0, $s0, $a0
    /* 5D6C 8013F964 80801000 */  sll        $s0, $s0, 2
    /* 5D70 8013F968 21286002 */  addu       $a1, $s3, $zero
    /* 5D74 8013F96C 21308002 */  addu       $a2, $s4, $zero
    /* 5D78 8013F970 40181100 */  sll        $v1, $s1, 1
    /* 5D7C 8013F974 21187100 */  addu       $v1, $v1, $s1
    /* 5D80 8013F978 80180300 */  sll        $v1, $v1, 2
    /* 5D84 8013F97C 21187100 */  addu       $v1, $v1, $s1
    /* 5D88 8013F980 00190300 */  sll        $v1, $v1, 4
    /* 5D8C 8013F984 23187100 */  subu       $v1, $v1, $s1
    /* 5D90 8013F988 80180300 */  sll        $v1, $v1, 2
    /* 5D94 8013F98C 21187100 */  addu       $v1, $v1, $s1
    /* 5D98 8013F990 C0180300 */  sll        $v1, $v1, 3
    /* 5D9C 8013F994 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 5DA0 8013F998 21082300 */  addu       $at, $at, $v1
    /* 5DA4 8013F99C 74A62380 */  lb         $v1, %lo(plr + 0x13C)($at)
    /* 5DA8 8013F9A0 2138A002 */  addu       $a3, $s5, $zero
    /* 5DAC 8013F9A4 01006324 */  addiu      $v1, $v1, 0x1
    /* 5DB0 8013F9A8 21104300 */  addu       $v0, $v0, $v1
    /* 5DB4 8013F9AC 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5DB8 8013F9B0 21083000 */  addu       $at, $at, $s0
    /* 5DBC 8013F9B4 682C22AC */  sw         $v0, %lo(missile + 0x10)($at)
    /* 5DC0 8013F9B8 10000224 */  addiu      $v0, $zero, 0x10
    /* 5DC4 8013F9BC 1000B2AF */  sw         $s2, 0x10($sp)
    /* 5DC8 8013F9C0 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 5DCC 8013F9C4 1400A2AF */   sw        $v0, 0x14($sp)
    /* 5DD0 8013F9C8 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 5DD4 8013F9CC 1080033C */  lui        $v1, %hi(missile)
    /* 5DD8 8013F9D0 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* 5DDC 8013F9D4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 5DE0 8013F9D8 21083000 */  addu       $at, $at, $s0
    /* 5DE4 8013F9DC 892C2490 */  lbu        $a0, %lo(missile + 0x31)($at)
    /* 5DE8 8013F9E0 21180302 */  addu       $v1, $s0, $v1
    /* 5DEC 8013F9E4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 5DF0 8013F9E8 21083000 */  addu       $at, $at, $s0
    /* 5DF4 8013F9EC 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 5DF8 8013F9F0 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 5DFC 8013F9F4 21083000 */  addu       $at, $at, $s0
    /* 5E00 8013F9F8 762C20A4 */  sh         $zero, %lo(missile + 0x1E)($at)
    /* 5E04 8013F9FC 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 5E08 8013FA00 21083000 */  addu       $at, $at, $s0
    /* 5E0C 8013FA04 782C20A4 */  sh         $zero, %lo(missile + 0x20)($at)
    /* 5E10 8013FA08 01008424 */  addiu      $a0, $a0, 0x1
    /* 5E14 8013FA0C 310064A0 */  sb         $a0, 0x31($v1)
    /* 5E18 8013FA10 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 5E1C 8013FA14 21083000 */  addu       $at, $at, $s0
    /* 5E20 8013FA18 8A2C2290 */  lbu        $v0, %lo(missile + 0x32)($at)
    /* 5E24 8013FA1C 00000000 */  nop
    /* 5E28 8013FA20 01004224 */  addiu      $v0, $v0, 0x1
    /* 5E2C 8013FA24 320062A0 */  sb         $v0, 0x32($v1)
    /* 5E30 8013FA28 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 5E34 8013FA2C 21083000 */  addu       $at, $at, $s0
    /* 5E38 8013FA30 8C2C2290 */  lbu        $v0, %lo(missile + 0x34)($at)
    /* 5E3C 8013FA34 00000000 */  nop
    /* 5E40 8013FA38 E0FF4224 */  addiu      $v0, $v0, -0x20
    /* 5E44 8013FA3C 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 5E48 8013FA40 21083000 */  addu       $at, $at, $s0
    /* 5E4C 8013FA44 8C2C22A0 */  sb         $v0, %lo(missile + 0x34)($at)
    /* 5E50 8013FA48 3000BF8F */  lw         $ra, 0x30($sp)
    /* 5E54 8013FA4C 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 5E58 8013FA50 2800B48F */  lw         $s4, 0x28($sp)
    /* 5E5C 8013FA54 2400B38F */  lw         $s3, 0x24($sp)
    /* 5E60 8013FA58 2000B28F */  lw         $s2, 0x20($sp)
    /* 5E64 8013FA5C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5E68 8013FA60 1800B08F */  lw         $s0, 0x18($sp)
    /* 5E6C 8013FA64 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 5E70 8013FA68 0800E003 */  jr         $ra
    /* 5E74 8013FA6C 00000000 */   nop
endlabel AddFiremove__Fiiiiiicii
