.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearOTag, 0xC8

glabel ClearOTag
    /* 3E9C 80013E9C 0B80023C */  lui        $v0, %hi(D_800B54AE)
    /* 3EA0 80013EA0 AE544290 */  lbu        $v0, %lo(D_800B54AE)($v0)
    /* 3EA4 80013EA4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3EA8 80013EA8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3EAC 80013EAC 21808000 */  addu       $s0, $a0, $zero
    /* 3EB0 80013EB0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3EB4 80013EB4 2188A000 */  addu       $s1, $a1, $zero
    /* 3EB8 80013EB8 0200422C */  sltiu      $v0, $v0, 0x2
    /* 3EBC 80013EBC 08004014 */  bnez       $v0, .L80013EE0
    /* 3EC0 80013EC0 1800BFAF */   sw        $ra, 0x18($sp)
    /* 3EC4 80013EC4 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 3EC8 80013EC8 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 3ECC 80013ECC 1180043C */  lui        $a0, %hi(D_8010DFC4)
    /* 3ED0 80013ED0 C4DF8424 */  addiu      $a0, $a0, %lo(D_8010DFC4)
    /* 3ED4 80013ED4 21280002 */  addu       $a1, $s0, $zero
    /* 3ED8 80013ED8 09F84000 */  jalr       $v0
    /* 3EDC 80013EDC 21302002 */   addu      $a2, $s1, $zero
  .L80013EE0:
    /* 3EE0 80013EE0 FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 3EE4 80013EE4 0D002012 */  beqz       $s1, .L80013F1C
    /* 3EE8 80013EE8 FF00053C */   lui       $a1, (0xFFFFFF >> 16)
    /* 3EEC 80013EEC FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 3EF0 80013EF0 00FF063C */  lui        $a2, (0xFF000000 >> 16)
  .L80013EF4:
    /* 3EF4 80013EF4 FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 3EF8 80013EF8 04000426 */  addiu      $a0, $s0, 0x4
    /* 3EFC 80013EFC 030000A2 */  sb         $zero, 0x3($s0)
    /* 3F00 80013F00 0000028E */  lw         $v0, 0x0($s0)
    /* 3F04 80013F04 24188500 */  and        $v1, $a0, $a1
    /* 3F08 80013F08 24104600 */  and        $v0, $v0, $a2
    /* 3F0C 80013F0C 25104300 */  or         $v0, $v0, $v1
    /* 3F10 80013F10 000002AE */  sw         $v0, 0x0($s0)
    /* 3F14 80013F14 F7FF2016 */  bnez       $s1, .L80013EF4
    /* 3F18 80013F18 21808000 */   addu      $s0, $a0, $zero
  .L80013F1C:
    /* 3F1C 80013F1C FF00063C */  lui        $a2, (0xFFFFFF >> 16)
    /* 3F20 80013F20 FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
    /* 3F24 80013F24 21100002 */  addu       $v0, $s0, $zero
    /* 3F28 80013F28 0B80053C */  lui        $a1, %hi(D_800B556C)
    /* 3F2C 80013F2C 6C55A524 */  addiu      $a1, $a1, %lo(D_800B556C)
    /* 3F30 80013F30 0B80033C */  lui        $v1, %hi(D_800B5558)
    /* 3F34 80013F34 58556324 */  addiu      $v1, $v1, %lo(D_800B5558)
    /* 3F38 80013F38 24186600 */  and        $v1, $v1, $a2
    /* 3F3C 80013F3C 0004043C */  lui        $a0, (0x4000000 >> 16)
    /* 3F40 80013F40 25186400 */  or         $v1, $v1, $a0
    /* 3F44 80013F44 0000A3AC */  sw         $v1, 0x0($a1)
    /* 3F48 80013F48 2428A600 */  and        $a1, $a1, $a2
    /* 3F4C 80013F4C 000045AC */  sw         $a1, 0x0($v0)
    /* 3F50 80013F50 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F54 80013F54 1400B18F */  lw         $s1, 0x14($sp)
    /* 3F58 80013F58 1000B08F */  lw         $s0, 0x10($sp)
    /* 3F5C 80013F5C 0800E003 */  jr         $ra
    /* 3F60 80013F60 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel ClearOTag
