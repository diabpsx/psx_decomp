.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ModifyPlrMag__Fii, 0xEC

glabel ModifyPlrMag__Fii
    /* 55EBC 80065EBC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 55EC0 80065EC0 40100400 */  sll        $v0, $a0, 1
    /* 55EC4 80065EC4 21104400 */  addu       $v0, $v0, $a0
    /* 55EC8 80065EC8 80100200 */  sll        $v0, $v0, 2
    /* 55ECC 80065ECC 21104400 */  addu       $v0, $v0, $a0
    /* 55ED0 80065ED0 00110200 */  sll        $v0, $v0, 4
    /* 55ED4 80065ED4 23104400 */  subu       $v0, $v0, $a0
    /* 55ED8 80065ED8 80100200 */  sll        $v0, $v0, 2
    /* 55EDC 80065EDC 21104400 */  addu       $v0, $v0, $a0
    /* 55EE0 80065EE0 C0100200 */  sll        $v0, $v0, 3
    /* 55EE4 80065EE4 0E80033C */  lui        $v1, %hi(plr)
    /* 55EE8 80065EE8 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 55EEC 80065EEC 21304300 */  addu       $a2, $v0, $v1
    /* 55EF0 80065EF0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 55EF4 80065EF4 F600C280 */  lb         $v0, 0xF6($a2)
    /* 55EF8 80065EF8 FE00C784 */  lh         $a3, 0xFE($a2)
    /* 55EFC 80065EFC 00110200 */  sll        $v0, $v0, 4
    /* 55F00 80065F00 0E80013C */  lui        $at, %hi(MaxStats + 0x4)
    /* 55F04 80065F04 21082200 */  addu       $at, $at, $v0
    /* 55F08 80065F08 3CA4238C */  lw         $v1, %lo(MaxStats + 0x4)($at)
    /* 55F0C 80065F0C 2110E500 */  addu       $v0, $a3, $a1
    /* 55F10 80065F10 2A106200 */  slt        $v0, $v1, $v0
    /* 55F14 80065F14 02004010 */  beqz       $v0, .L80065F20
    /* 55F18 80065F18 00000000 */   nop
    /* 55F1C 80065F1C 23286700 */  subu       $a1, $v1, $a3
  .L80065F20:
    /* 55F20 80065F20 FC00C294 */  lhu        $v0, 0xFC($a2)
    /* 55F24 80065F24 FE00C394 */  lhu        $v1, 0xFE($a2)
    /* 55F28 80065F28 21104500 */  addu       $v0, $v0, $a1
    /* 55F2C 80065F2C 21186500 */  addu       $v1, $v1, $a1
    /* 55F30 80065F30 FE00C3A4 */  sh         $v1, 0xFE($a2)
    /* 55F34 80065F34 F600C380 */  lb         $v1, 0xF6($a2)
    /* 55F38 80065F38 FC00C2A4 */  sh         $v0, 0xFC($a2)
    /* 55F3C 80065F3C 02000224 */  addiu      $v0, $zero, 0x2
    /* 55F40 80065F40 02006214 */  bne        $v1, $v0, .L80065F4C
    /* 55F44 80065F44 80290500 */   sll       $a1, $a1, 6
    /* 55F48 80065F48 40280500 */  sll        $a1, $a1, 1
  .L80065F4C:
    /* 55F4C 80065F4C 2C01C28C */  lw         $v0, 0x12C($a2)
    /* 55F50 80065F50 3401C38C */  lw         $v1, 0x134($a2)
    /* 55F54 80065F54 21104500 */  addu       $v0, $v0, $a1
    /* 55F58 80065F58 2C01C2AC */  sw         $v0, 0x12C($a2)
    /* 55F5C 80065F5C B819C28C */  lw         $v0, 0x19B8($a2)
    /* 55F60 80065F60 21186500 */  addu       $v1, $v1, $a1
    /* 55F64 80065F64 3401C3AC */  sw         $v1, 0x134($a2)
    /* 55F68 80065F68 0008033C */  lui        $v1, (0x8000000 >> 16)
    /* 55F6C 80065F6C 24104300 */  and        $v0, $v0, $v1
    /* 55F70 80065F70 07004014 */  bnez       $v0, .L80065F90
    /* 55F74 80065F74 00000000 */   nop
    /* 55F78 80065F78 2801C28C */  lw         $v0, 0x128($a2)
    /* 55F7C 80065F7C 3001C38C */  lw         $v1, 0x130($a2)
    /* 55F80 80065F80 21104500 */  addu       $v0, $v0, $a1
    /* 55F84 80065F84 21186500 */  addu       $v1, $v1, $a1
    /* 55F88 80065F88 2801C2AC */  sw         $v0, 0x128($a2)
    /* 55F8C 80065F8C 3001C3AC */  sw         $v1, 0x130($a2)
  .L80065F90:
    /* 55F90 80065F90 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 55F94 80065F94 01000524 */   addiu     $a1, $zero, 0x1
    /* 55F98 80065F98 1000BF8F */  lw         $ra, 0x10($sp)
    /* 55F9C 80065F9C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 55FA0 80065FA0 0800E003 */  jr         $ra
    /* 55FA4 80065FA4 00000000 */   nop
endlabel ModifyPlrMag__Fii
