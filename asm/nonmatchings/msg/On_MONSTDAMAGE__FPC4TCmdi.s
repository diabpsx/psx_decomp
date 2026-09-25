.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_MONSTDAMAGE__FPC4TCmdi, 0xF0

glabel On_MONSTDAMAGE__FPC4TCmdi
    /* 41A40 80051A40 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 41A44 80051A44 1280023C */  lui        $v0, %hi(myplr)
    /* 41A48 80051A48 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 41A4C 80051A4C 21408000 */  addu       $t0, $a0, $zero
    /* 41A50 80051A50 3300A210 */  beq        $a1, $v0, .L80051B20
    /* 41A54 80051A54 1000BFAF */   sw        $ra, 0x10($sp)
    /* 41A58 80051A58 01000324 */  addiu      $v1, $zero, 0x1
    /* 41A5C 80051A5C 02000495 */  lhu        $a0, 0x2($t0)
    /* 41A60 80051A60 0418A300 */  sllv       $v1, $v1, $a1
    /* 41A64 80051A64 40100400 */  sll        $v0, $a0, 1
    /* 41A68 80051A68 21104400 */  addu       $v0, $v0, $a0
    /* 41A6C 80051A6C 80100200 */  sll        $v0, $v0, 2
    /* 41A70 80051A70 21104400 */  addu       $v0, $v0, $a0
    /* 41A74 80051A74 C0300200 */  sll        $a2, $v0, 3
    /* 41A78 80051A78 1080013C */  lui        $at, %hi(monster + 0x46)
    /* 41A7C 80051A7C 21082600 */  addu       $at, $at, $a2
    /* 41A80 80051A80 DA532290 */  lbu        $v0, %lo(monster + 0x46)($at)
    /* 41A84 80051A84 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 41A88 80051A88 21082600 */  addu       $at, $at, $a2
    /* 41A8C 80051A8C A453278C */  lw         $a3, %lo(monster + 0x10)($at)
    /* 41A90 80051A90 25104300 */  or         $v0, $v0, $v1
    /* 41A94 80051A94 1080013C */  lui        $at, %hi(monster + 0x46)
    /* 41A98 80051A98 21082600 */  addu       $at, $at, $a2
    /* 41A9C 80051A9C DA5322A0 */  sb         $v0, %lo(monster + 0x46)($at)
    /* 41AA0 80051AA0 1F00E010 */  beqz       $a3, .L80051B20
    /* 41AA4 80051AA4 00000000 */   nop
    /* 41AA8 80051AA8 04000295 */  lhu        $v0, 0x4($t0)
    /* 41AAC 80051AAC 00000000 */  nop
    /* 41AB0 80051AB0 2310E200 */  subu       $v0, $a3, $v0
    /* 41AB4 80051AB4 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 41AB8 80051AB8 21082600 */  addu       $at, $at, $a2
    /* 41ABC 80051ABC A45322AC */  sw         $v0, %lo(monster + 0x10)($at)
    /* 41AC0 80051AC0 83110200 */  sra        $v0, $v0, 6
    /* 41AC4 80051AC4 0600401C */  bgtz       $v0, .L80051AE0
    /* 41AC8 80051AC8 40100500 */   sll       $v0, $a1, 1
    /* 41ACC 80051ACC 40000224 */  addiu      $v0, $zero, 0x40
    /* 41AD0 80051AD0 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 41AD4 80051AD4 21082600 */  addu       $at, $at, $a2
    /* 41AD8 80051AD8 A45322AC */  sw         $v0, %lo(monster + 0x10)($at)
    /* 41ADC 80051ADC 40100500 */  sll        $v0, $a1, 1
  .L80051AE0:
    /* 41AE0 80051AE0 21104500 */  addu       $v0, $v0, $a1
    /* 41AE4 80051AE4 80100200 */  sll        $v0, $v0, 2
    /* 41AE8 80051AE8 21104500 */  addu       $v0, $v0, $a1
    /* 41AEC 80051AEC 00110200 */  sll        $v0, $v0, 4
    /* 41AF0 80051AF0 23104500 */  subu       $v0, $v0, $a1
    /* 41AF4 80051AF4 80100200 */  sll        $v0, $v0, 2
    /* 41AF8 80051AF8 21104500 */  addu       $v0, $v0, $a1
    /* 41AFC 80051AFC C0100200 */  sll        $v0, $v0, 3
    /* 41B00 80051B00 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 41B04 80051B04 21082600 */  addu       $at, $at, $a2
    /* 41B08 80051B08 A453258C */  lw         $a1, %lo(monster + 0x10)($at)
    /* 41B0C 80051B0C 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 41B10 80051B10 21082200 */  addu       $at, $at, $v0
    /* 41B14 80051B14 5CA52690 */  lbu        $a2, %lo(plr + 0x24)($at)
    /* 41B18 80051B18 E43A010C */  jal        delta_monster_hp__FilUc
    /* 41B1C 80051B1C 00000000 */   nop
  .L80051B20:
    /* 41B20 80051B20 1000BF8F */  lw         $ra, 0x10($sp)
    /* 41B24 80051B24 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 41B28 80051B28 0800E003 */  jr         $ra
    /* 41B2C 80051B2C 00000000 */   nop
endlabel On_MONSTDAMAGE__FPC4TCmdi
