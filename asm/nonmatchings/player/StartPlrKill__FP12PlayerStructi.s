.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartPlrKill__FP12PlayerStructi, 0x15C

glabel StartPlrKill__FP12PlayerStructi
    /* 51C54 80061C54 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 51C58 80061C58 1800B0AF */  sw         $s0, 0x18($sp)
    /* 51C5C 80061C5C 21808000 */  addu       $s0, $a0, $zero
    /* 51C60 80061C60 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 51C64 80061C64 2000BFAF */  sw         $ra, 0x20($sp)
    /* 51C68 80061C68 787F010C */  jal        plrind__FP12PlayerStruct
    /* 51C6C 80061C6C 2188A000 */   addu      $s1, $a1, $zero
    /* 51C70 80061C70 1C01028E */  lw         $v0, 0x11C($s0)
    /* 51C74 80061C74 00000000 */  nop
    /* 51C78 80061C78 0A004014 */  bnez       $v0, .L80061CA4
    /* 51C7C 80061C7C 00000000 */   nop
    /* 51C80 80061C80 1280023C */  lui        $v0, %hi(currlevel)
    /* 51C84 80061C84 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 51C88 80061C88 00000000 */  nop
    /* 51C8C 80061C8C 05004014 */  bnez       $v0, .L80061CA4
    /* 51C90 80061C90 21200002 */   addu      $a0, $s0, $zero
    /* 51C94 80061C94 5A98010C */  jal        SetPlayerHitPoints__FP12PlayerStructi
    /* 51C98 80061C98 40000524 */   addiu     $a1, $zero, 0x40
    /* 51C9C 80061C9C 66870108 */  j          .L80061D98
    /* 51CA0 80061CA0 00000000 */   nop
  .L80061CA4:
    /* 51CA4 80061CA4 1280023C */  lui        $v0, %hi(nummissiles)
    /* 51CA8 80061CA8 88C2428C */  lw         $v0, %lo(nummissiles)($v0)
    /* 51CAC 80061CAC 00000000 */  nop
    /* 51CB0 80061CB0 33004018 */  blez       $v0, .L80061D80
    /* 51CB4 80061CB4 21280000 */   addu      $a1, $zero, $zero
    /* 51CB8 80061CB8 0D000A24 */  addiu      $t2, $zero, 0xD
    /* 51CBC 80061CBC 0E80083C */  lui        $t0, %hi(plr)
    /* 51CC0 80061CC0 38A50825 */  addiu      $t0, $t0, %lo(plr)
    /* 51CC4 80061CC4 FFFF0924 */  addiu      $t1, $zero, -0x1
    /* 51CC8 80061CC8 21384000 */  addu       $a3, $v0, $zero
    /* 51CCC 80061CCC 1080063C */  lui        $a2, %hi(missileactive)
    /* 51CD0 80061CD0 602AC624 */  addiu      $a2, $a2, %lo(missileactive)
  .L80061CD4:
    /* 51CD4 80061CD4 0000C484 */  lh         $a0, 0x0($a2)
    /* 51CD8 80061CD8 00000000 */  nop
    /* 51CDC 80061CDC 80100400 */  sll        $v0, $a0, 2
    /* 51CE0 80061CE0 21104400 */  addu       $v0, $v0, $a0
    /* 51CE4 80061CE4 80100200 */  sll        $v0, $v0, 2
    /* 51CE8 80061CE8 23104400 */  subu       $v0, $v0, $a0
    /* 51CEC 80061CEC 80180200 */  sll        $v1, $v0, 2
    /* 51CF0 80061CF0 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 51CF4 80061CF4 21082300 */  addu       $at, $at, $v1
    /* 51CF8 80061CF8 882C2280 */  lb         $v0, %lo(missile + 0x30)($at)
    /* 51CFC 80061CFC 00000000 */  nop
    /* 51D00 80061D00 1B004A14 */  bne        $v0, $t2, .L80061D70
    /* 51D04 80061D04 00000000 */   nop
    /* 51D08 80061D08 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 51D0C 80061D0C 21082300 */  addu       $at, $at, $v1
    /* 51D10 80061D10 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* 51D14 80061D14 02000812 */  beq        $s0, $t0, .L80061D20
    /* 51D18 80061D18 00000000 */   nop
    /* 51D1C 80061D1C 01004238 */  xori       $v0, $v0, 0x1
  .L80061D20:
    /* 51D20 80061D20 0100422C */  sltiu      $v0, $v0, 0x1
    /* 51D24 80061D24 12004010 */  beqz       $v0, .L80061D70
    /* 51D28 80061D28 80100400 */   sll       $v0, $a0, 2
    /* 51D2C 80061D2C 21104400 */  addu       $v0, $v0, $a0
    /* 51D30 80061D30 80100200 */  sll        $v0, $v0, 2
    /* 51D34 80061D34 23104400 */  subu       $v0, $v0, $a0
    /* 51D38 80061D38 80180200 */  sll        $v1, $v0, 2
    /* 51D3C 80061D3C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 51D40 80061D40 21082300 */  addu       $at, $at, $v1
    /* 51D44 80061D44 902C2290 */  lbu        $v0, %lo(missile + 0x38)($at)
    /* 51D48 80061D48 00000000 */  nop
    /* 51D4C 80061D4C 08004014 */  bnez       $v0, .L80061D70
    /* 51D50 80061D50 00000000 */   nop
    /* 51D54 80061D54 10002912 */  beq        $s1, $t1, .L80061D98
    /* 51D58 80061D58 00000000 */   nop
    /* 51D5C 80061D5C 1080013C */  lui        $at, %hi(missile + 0x2C)
    /* 51D60 80061D60 21082300 */  addu       $at, $at, $v1
    /* 51D64 80061D64 842C31A4 */  sh         $s1, %lo(missile + 0x2C)($at)
    /* 51D68 80061D68 66870108 */  j          .L80061D98
    /* 51D6C 80061D6C 00000000 */   nop
  .L80061D70:
    /* 51D70 80061D70 0100A524 */  addiu      $a1, $a1, 0x1
    /* 51D74 80061D74 2A10A700 */  slt        $v0, $a1, $a3
    /* 51D78 80061D78 D6FF4014 */  bnez       $v0, .L80061CD4
    /* 51D7C 80061D7C 0200C624 */   addiu     $a2, $a2, 0x2
  .L80061D80:
    /* 51D80 80061D80 21200002 */  addu       $a0, $s0, $zero
    /* 51D84 80061D84 5A98010C */  jal        SetPlayerHitPoints__FP12PlayerStructi
    /* 51D88 80061D88 21280000 */   addu      $a1, $zero, $zero
    /* 51D8C 80061D8C 21200002 */  addu       $a0, $s0, $zero
    /* 51D90 80061D90 5286010C */  jal        StartPlayerKill__FP12PlayerStructi
    /* 51D94 80061D94 21282002 */   addu      $a1, $s1, $zero
  .L80061D98:
    /* 51D98 80061D98 2000BF8F */  lw         $ra, 0x20($sp)
    /* 51D9C 80061D9C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 51DA0 80061DA0 1800B08F */  lw         $s0, 0x18($sp)
    /* 51DA4 80061DA4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 51DA8 80061DA8 0800E003 */  jr         $ra
    /* 51DAC 80061DAC 00000000 */   nop
endlabel StartPlrKill__FP12PlayerStructi
