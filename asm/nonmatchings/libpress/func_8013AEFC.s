.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013AEFC, 0xF0

glabel func_8013AEFC
    /* 1304 8013AEFC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1308 8013AF00 21288000 */  addu       $a1, $a0, $zero
    /* 130C 8013AF04 0600A010 */  beqz       $a1, .L8013AF20
    /* 1310 8013AF08 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1314 8013AF0C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1318 8013AF10 1B00A210 */  beq        $a1, $v0, .L8013AF80
    /* 131C 8013AF14 0080023C */   lui       $v0, (0x80000000 >> 16)
    /* 1320 8013AF18 F4EB0408 */  j          .L8013AFD0
    /* 1324 8013AF1C 00000000 */   nop
  .L8013AF20:
    /* 1328 8013AF20 1480033C */  lui        $v1, %hi(D_80139DF0)
    /* 132C 8013AF24 F09D638C */  lw         $v1, %lo(D_80139DF0)($v1)
    /* 1330 8013AF28 0080023C */  lui        $v0, (0x80000000 >> 16)
    /* 1334 8013AF2C 000062AC */  sw         $v0, 0x0($v1)
    /* 1338 8013AF30 1480023C */  lui        $v0, %hi(D_80139DC4)
    /* 133C 8013AF34 C49D428C */  lw         $v0, %lo(D_80139DC4)($v0)
    /* 1340 8013AF38 1480043C */  lui        $a0, %hi(D_80139CAC)
    /* 1344 8013AF3C AC9C8424 */  addiu      $a0, $a0, %lo(D_80139CAC)
    /* 1348 8013AF40 000040AC */  sw         $zero, 0x0($v0)
    /* 134C 8013AF44 1480023C */  lui        $v0, %hi(D_80139DD0)
    /* 1350 8013AF48 D09D428C */  lw         $v0, %lo(D_80139DD0)($v0)
    /* 1354 8013AF4C 20000524 */  addiu      $a1, $zero, 0x20
    /* 1358 8013AF50 000040AC */  sw         $zero, 0x0($v0)
    /* 135C 8013AF54 1480033C */  lui        $v1, %hi(D_80139DF0)
    /* 1360 8013AF58 F09D638C */  lw         $v1, %lo(D_80139DF0)($v1)
    /* 1364 8013AF5C 0060023C */  lui        $v0, (0x60000000 >> 16)
    /* 1368 8013AF60 FBEB040C */  jal        func_8013AFEC
    /* 136C 8013AF64 000062AC */   sw        $v0, 0x0($v1)
    /* 1370 8013AF68 1480043C */  lui        $a0, %hi(D_80139D30)
    /* 1374 8013AF6C 309D8424 */  addiu      $a0, $a0, %lo(D_80139D30)
    /* 1378 8013AF70 FBEB040C */  jal        func_8013AFEC
    /* 137C 8013AF74 20000524 */   addiu     $a1, $zero, 0x20
    /* 1380 8013AF78 F7EB0408 */  j          .L8013AFDC
    /* 1384 8013AF7C 00000000 */   nop
  .L8013AF80:
    /* 1388 8013AF80 1480033C */  lui        $v1, %hi(D_80139DF0)
    /* 138C 8013AF84 F09D638C */  lw         $v1, %lo(D_80139DF0)($v1)
    /* 1390 8013AF88 00000000 */  nop
    /* 1394 8013AF8C 000062AC */  sw         $v0, 0x0($v1)
    /* 1398 8013AF90 1480023C */  lui        $v0, %hi(D_80139DC4)
    /* 139C 8013AF94 C49D428C */  lw         $v0, %lo(D_80139DC4)($v0)
    /* 13A0 8013AF98 00000000 */  nop
    /* 13A4 8013AF9C 000040AC */  sw         $zero, 0x0($v0)
    /* 13A8 8013AFA0 1480023C */  lui        $v0, %hi(D_80139DD0)
    /* 13AC 8013AFA4 D09D428C */  lw         $v0, %lo(D_80139DD0)($v0)
    /* 13B0 8013AFA8 00000000 */  nop
    /* 13B4 8013AFAC 000040AC */  sw         $zero, 0x0($v0)
    /* 13B8 8013AFB0 1480023C */  lui        $v0, %hi(D_80139DD0)
    /* 13BC 8013AFB4 D09D428C */  lw         $v0, %lo(D_80139DD0)($v0)
    /* 13C0 8013AFB8 1480033C */  lui        $v1, %hi(D_80139DF0)
    /* 13C4 8013AFBC F09D638C */  lw         $v1, %lo(D_80139DF0)($v1)
    /* 13C8 8013AFC0 0000428C */  lw         $v0, 0x0($v0)
    /* 13CC 8013AFC4 0060023C */  lui        $v0, (0x60000000 >> 16)
    /* 13D0 8013AFC8 F7EB0408 */  j          .L8013AFDC
    /* 13D4 8013AFCC 000062AC */   sw        $v0, 0x0($v1)
  .L8013AFD0:
    /* 13D8 8013AFD0 1480043C */  lui        $a0, %hi(D_80139BFC)
    /* 13DC 8013AFD4 9367000C */  jal        printf
    /* 13E0 8013AFD8 FC9B8424 */   addiu     $a0, $a0, %lo(D_80139BFC)
  .L8013AFDC:
    /* 13E4 8013AFDC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 13E8 8013AFE0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13EC 8013AFE4 0800E003 */  jr         $ra
    /* 13F0 8013AFE8 00000000 */   nop
endlabel func_8013AEFC
