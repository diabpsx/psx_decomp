.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeleteMonsterList__Fv, 0x124

glabel DeleteMonsterList__Fv
    /* 1ACC8 801548C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1ACCC 801548C4 21200000 */  addu       $a0, $zero, $zero
    /* 1ACD0 801548C8 01000624 */  addiu      $a2, $zero, 0x1
    /* 1ACD4 801548CC 1080053C */  lui        $a1, %hi(monster + 0x5B)
    /* 1ACD8 801548D0 EF53A524 */  addiu      $a1, $a1, %lo(monster + 0x5B)
    /* 1ACDC 801548D4 21180000 */  addu       $v1, $zero, $zero
    /* 1ACE0 801548D8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1ACE4 801548DC 1000B0AF */  sw         $s0, 0x10($sp)
  .L801548E0:
    /* 1ACE8 801548E0 0000A280 */  lb         $v0, 0x0($a1)
    /* 1ACEC 801548E4 00000000 */  nop
    /* 1ACF0 801548E8 14004010 */  beqz       $v0, .L8015493C
    /* 1ACF4 801548EC 00000000 */   nop
    /* 1ACF8 801548F0 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 1ACFC 801548F4 21082300 */  addu       $at, $at, $v1
    /* 1AD00 801548F8 C85326A0 */  sb         $a2, %lo(monster + 0x34)($at)
    /* 1AD04 801548FC 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1AD08 80154900 21082300 */  addu       $at, $at, $v1
    /* 1AD0C 80154904 C95320A0 */  sb         $zero, %lo(monster + 0x35)($at)
    /* 1AD10 80154908 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 1AD14 8015490C 21082300 */  addu       $at, $at, $v1
    /* 1AD18 80154910 CA5320A0 */  sb         $zero, %lo(monster + 0x36)($at)
    /* 1AD1C 80154914 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 1AD20 80154918 21082300 */  addu       $at, $at, $v1
    /* 1AD24 8015491C CB5320A0 */  sb         $zero, %lo(monster + 0x37)($at)
    /* 1AD28 80154920 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 1AD2C 80154924 21082300 */  addu       $at, $at, $v1
    /* 1AD30 80154928 CC5320A0 */  sb         $zero, %lo(monster + 0x38)($at)
    /* 1AD34 8015492C 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 1AD38 80154930 21082300 */  addu       $at, $at, $v1
    /* 1AD3C 80154934 CD5320A0 */  sb         $zero, %lo(monster + 0x39)($at)
    /* 1AD40 80154938 0000A0A0 */  sb         $zero, 0x0($a1)
  .L8015493C:
    /* 1AD44 8015493C 6800A524 */  addiu      $a1, $a1, 0x68
    /* 1AD48 80154940 01008424 */  addiu      $a0, $a0, 0x1
    /* 1AD4C 80154944 04008228 */  slti       $v0, $a0, 0x4
    /* 1AD50 80154948 E5FF4014 */  bnez       $v0, .L801548E0
    /* 1AD54 8015494C 68006324 */   addiu     $v1, $v1, 0x68
    /* 1AD58 80154950 4C1B828F */  lw         $v0, %gp_rel(nummonsters)($gp)
    /* 1AD5C 80154954 04000424 */  addiu      $a0, $zero, 0x4
    /* 1AD60 80154958 2A108200 */  slt        $v0, $a0, $v0
    /* 1AD64 8015495C 1C004010 */  beqz       $v0, .L801549D0
    /* 1AD68 80154960 00000000 */   nop
    /* 1AD6C 80154964 1180103C */  lui        $s0, %hi(monstactive)
    /* 1AD70 80154968 C4A01026 */  addiu      $s0, $s0, %lo(monstactive)
    /* 1AD74 8015496C 08000526 */  addiu      $a1, $s0, 0x8
  .L80154970:
    /* 1AD78 80154970 0000A284 */  lh         $v0, 0x0($a1)
    /* 1AD7C 80154974 00000000 */  nop
    /* 1AD80 80154978 40180200 */  sll        $v1, $v0, 1
    /* 1AD84 8015497C 21186200 */  addu       $v1, $v1, $v0
    /* 1AD88 80154980 80180300 */  sll        $v1, $v1, 2
    /* 1AD8C 80154984 21186200 */  addu       $v1, $v1, $v0
    /* 1AD90 80154988 C0180300 */  sll        $v1, $v1, 3
    /* 1AD94 8015498C 1080013C */  lui        $at, %hi(monster + 0x5B)
    /* 1AD98 80154990 21082300 */  addu       $at, $at, $v1
    /* 1AD9C 80154994 EF532280 */  lb         $v0, %lo(monster + 0x5B)($at)
    /* 1ADA0 80154998 00000000 */  nop
    /* 1ADA4 8015499C 06004010 */  beqz       $v0, .L801549B8
    /* 1ADA8 801549A0 0200A524 */   addiu     $a1, $a1, 0x2
    /* 1ADAC 801549A4 DD2A050C */  jal        DeleteMonster__Fi
    /* 1ADB0 801549A8 00000000 */   nop
    /* 1ADB4 801549AC 21280002 */  addu       $a1, $s0, $zero
    /* 1ADB8 801549B0 6F520508 */  j          .L801549BC
    /* 1ADBC 801549B4 21200000 */   addu      $a0, $zero, $zero
  .L801549B8:
    /* 1ADC0 801549B8 01008424 */  addiu      $a0, $a0, 0x1
  .L801549BC:
    /* 1ADC4 801549BC 4C1B828F */  lw         $v0, %gp_rel(nummonsters)($gp)
    /* 1ADC8 801549C0 00000000 */  nop
    /* 1ADCC 801549C4 2A108200 */  slt        $v0, $a0, $v0
    /* 1ADD0 801549C8 E9FF4014 */  bnez       $v0, .L80154970
    /* 1ADD4 801549CC 00000000 */   nop
  .L801549D0:
    /* 1ADD8 801549D0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1ADDC 801549D4 1000B08F */  lw         $s0, 0x10($sp)
    /* 1ADE0 801549D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1ADE4 801549DC 0800E003 */  jr         $ra
    /* 1ADE8 801549E0 00000000 */   nop
endlabel DeleteMonsterList__Fv
