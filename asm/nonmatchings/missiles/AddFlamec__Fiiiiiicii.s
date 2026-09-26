.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFlamec__Fiiiiiicii, 0xF8

glabel AddFlamec__Fiiiiiicii
    /* 8348 80141F40 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 834C 80141F44 4000A38F */  lw         $v1, 0x40($sp)
    /* 8350 80141F48 4400A28F */  lw         $v0, 0x44($sp)
    /* 8354 80141F4C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 8358 80141F50 4800B393 */  lbu        $s3, 0x48($sp)
    /* 835C 80141F54 1800B0AF */  sw         $s0, 0x18($sp)
    /* 8360 80141F58 21808000 */  addu       $s0, $a0, $zero
    /* 8364 80141F5C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8368 80141F60 2188A000 */  addu       $s1, $a1, $zero
    /* 836C 80141F64 2000B2AF */  sw         $s2, 0x20($sp)
    /* 8370 80141F68 2190C000 */  addu       $s2, $a2, $zero
    /* 8374 80141F6C 0C002716 */  bne        $s1, $a3, .L80141FA0
    /* 8378 80141F70 2800BFAF */   sw        $ra, 0x28($sp)
    /* 837C 80141F74 0B004316 */  bne        $s2, $v1, .L80141FA4
    /* 8380 80141F78 21200002 */   addu      $a0, $s0, $zero
    /* 8384 80141F7C 80100200 */  sll        $v0, $v0, 2
    /* 8388 80141F80 1080013C */  lui        $at, %hi(XDirAdd)
    /* 838C 80141F84 21082200 */  addu       $at, $at, $v0
    /* 8390 80141F88 D829238C */  lw         $v1, %lo(XDirAdd)($at)
    /* 8394 80141F8C 1080013C */  lui        $at, %hi(YDirAdd)
    /* 8398 80141F90 21082200 */  addu       $at, $at, $v0
    /* 839C 80141F94 F829228C */  lw         $v0, %lo(YDirAdd)($at)
    /* 83A0 80141F98 21382302 */  addu       $a3, $s1, $v1
    /* 83A4 80141F9C 21184202 */  addu       $v1, $s2, $v0
  .L80141FA0:
    /* 83A8 80141FA0 21200002 */  addu       $a0, $s0, $zero
  .L80141FA4:
    /* 83AC 80141FA4 21282002 */  addu       $a1, $s1, $zero
    /* 83B0 80141FA8 20000224 */  addiu      $v0, $zero, 0x20
    /* 83B4 80141FAC 21304002 */  addu       $a2, $s2, $zero
    /* 83B8 80141FB0 1000A3AF */  sw         $v1, 0x10($sp)
    /* 83BC 80141FB4 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 83C0 80141FB8 1400A2AF */   sw        $v0, 0x14($sp)
    /* 83C4 80141FBC 05006016 */  bnez       $s3, .L80141FD4
    /* 83C8 80141FC0 80101000 */   sll       $v0, $s0, 2
    /* 83CC 80141FC4 4C00A48F */  lw         $a0, 0x4C($sp)
    /* 83D0 80141FC8 C2DC010C */  jal        UseMana__Fii
    /* 83D4 80141FCC 14000524 */   addiu     $a1, $zero, 0x14
    /* 83D8 80141FD0 80101000 */  sll        $v0, $s0, 2
  .L80141FD4:
    /* 83DC 80141FD4 21105000 */  addu       $v0, $v0, $s0
    /* 83E0 80141FD8 80100200 */  sll        $v0, $v0, 2
    /* 83E4 80141FDC 23105000 */  subu       $v0, $v0, $s0
    /* 83E8 80141FE0 80100200 */  sll        $v0, $v0, 2
    /* 83EC 80141FE4 00010324 */  addiu      $v1, $zero, 0x100
    /* 83F0 80141FE8 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 83F4 80141FEC 21082200 */  addu       $at, $at, $v0
    /* 83F8 80141FF0 762C31A4 */  sh         $s1, %lo(missile + 0x1E)($at)
    /* 83FC 80141FF4 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 8400 80141FF8 21082200 */  addu       $at, $at, $v0
    /* 8404 80141FFC 782C32A4 */  sh         $s2, %lo(missile + 0x20)($at)
    /* 8408 80142000 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 840C 80142004 21082200 */  addu       $at, $at, $v0
    /* 8410 80142008 7A2C20A4 */  sh         $zero, %lo(missile + 0x22)($at)
    /* 8414 8014200C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 8418 80142010 21082200 */  addu       $at, $at, $v0
    /* 841C 80142014 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 8420 80142018 2800BF8F */  lw         $ra, 0x28($sp)
    /* 8424 8014201C 2400B38F */  lw         $s3, 0x24($sp)
    /* 8428 80142020 2000B28F */  lw         $s2, 0x20($sp)
    /* 842C 80142024 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8430 80142028 1800B08F */  lw         $s0, 0x18($sp)
    /* 8434 8014202C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 8438 80142030 0800E003 */  jr         $ra
    /* 843C 80142034 00000000 */   nop
endlabel AddFlamec__Fiiiiiicii
