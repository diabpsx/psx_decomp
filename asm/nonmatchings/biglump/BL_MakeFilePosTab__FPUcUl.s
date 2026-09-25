.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_MakeFilePosTab__FPUcUl, 0xE8

glabel BL_MakeFilePosTab__FPUcUl
    /* 77984 80087984 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 77988 80087988 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7798C 8008798C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 77990 80087990 21888000 */  addu       $s1, $a0, $zero
    /* 77994 80087994 1180043C */  lui        $a0, %hi(D_80110340)
    /* 77998 80087998 40038424 */  addiu      $a0, $a0, %lo(D_80110340)
    /* 7799C 8008799C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 779A0 800879A0 01A4000C */  jal        fileexists
    /* 779A4 800879A4 2180A000 */   addu      $s0, $a1, $zero
    /* 779A8 800879A8 0B004014 */  bnez       $v0, .L800879D8
    /* 779AC 800879AC 01000226 */   addiu     $v0, $s0, 0x1
    /* 779B0 800879B0 1180023C */  lui        $v0, %hi(D_8011034C)
    /* 779B4 800879B4 4C034224 */  addiu      $v0, $v0, %lo(D_8011034C)
    /* 779B8 800879B8 07004010 */  beqz       $v0, .L800879D8
    /* 779BC 800879BC 01000226 */   addiu     $v0, $s0, 0x1
    /* 779C0 800879C0 21200000 */  addu       $a0, $zero, $zero
    /* 779C4 800879C4 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 779C8 800879C8 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 779CC 800879CC A583000C */  jal        DBG_Error
    /* 779D0 800879D0 80010624 */   addiu     $a2, $zero, 0x180
    /* 779D4 800879D4 01000226 */  addiu      $v0, $s0, 0x1
  .L800879D8:
    /* 779D8 800879D8 80200200 */  sll        $a0, $v0, 2
    /* 779DC 800879DC 21208200 */  addu       $a0, $a0, $v0
    /* 779E0 800879E0 AA20020C */  jal        Tmalloc__Fi
    /* 779E4 800879E4 80200400 */   sll       $a0, $a0, 2
    /* 779E8 800879E8 21202002 */  addu       $a0, $s1, $zero
    /* 779EC 800879EC 21484000 */  addu       $t1, $v0, $zero
    /* 779F0 800879F0 21302001 */  addu       $a2, $t1, $zero
    /* 779F4 800879F4 80101000 */  sll        $v0, $s0, 2
    /* 779F8 800879F8 21105000 */  addu       $v0, $v0, $s0
    /* 779FC 800879FC 80100200 */  sll        $v0, $v0, 2
    /* 77A00 80087A00 21404400 */  addu       $t0, $v0, $a0
  .L80087A04:
    /* 77A04 80087A04 2A108800 */  slt        $v0, $a0, $t0
    /* 77A08 80087A08 11004010 */  beqz       $v0, .L80087A50
    /* 77A0C 80087A0C 21280000 */   addu      $a1, $zero, $zero
    /* 77A10 80087A10 0000828C */  lw         $v0, 0x0($a0)
    /* 77A14 80087A14 21388000 */  addu       $a3, $a0, $zero
    /* 77A18 80087A18 2000C2AC */  sw         $v0, 0x20($a2)
    /* 77A1C 80087A1C 0400828C */  lw         $v0, 0x4($a0)
    /* 77A20 80087A20 1400C324 */  addiu      $v1, $a2, 0x14
    /* 77A24 80087A24 2400C2AC */  sw         $v0, 0x24($a2)
  .L80087A28:
    /* 77A28 80087A28 2110E500 */  addu       $v0, $a3, $a1
    /* 77A2C 80087A2C 08004290 */  lbu        $v0, 0x8($v0)
    /* 77A30 80087A30 0100A524 */  addiu      $a1, $a1, 0x1
    /* 77A34 80087A34 000062A0 */  sb         $v0, 0x0($v1)
    /* 77A38 80087A38 0C00A228 */  slti       $v0, $a1, 0xC
    /* 77A3C 80087A3C FAFF4014 */  bnez       $v0, .L80087A28
    /* 77A40 80087A40 01006324 */   addiu     $v1, $v1, 0x1
    /* 77A44 80087A44 14008424 */  addiu      $a0, $a0, 0x14
    /* 77A48 80087A48 811E0208 */  j          .L80087A04
    /* 77A4C 80087A4C 1400C624 */   addiu     $a2, $a2, 0x14
  .L80087A50:
    /* 77A50 80087A50 21102001 */  addu       $v0, $t1, $zero
    /* 77A54 80087A54 1800BF8F */  lw         $ra, 0x18($sp)
    /* 77A58 80087A58 1400B18F */  lw         $s1, 0x14($sp)
    /* 77A5C 80087A5C 1000B08F */  lw         $s0, 0x10($sp)
    /* 77A60 80087A60 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 77A64 80087A64 0800E003 */  jr         $ra
    /* 77A68 80087A68 00000000 */   nop
endlabel BL_MakeFilePosTab__FPUcUl
