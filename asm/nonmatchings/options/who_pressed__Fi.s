.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching who_pressed__Fi, 0x88

glabel who_pressed__Fi
    /* 98314 800A8314 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 98318 800A8318 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9831C 800A831C 21888000 */  addu       $s1, $a0, $zero
    /* 98320 800A8320 21200000 */  addu       $a0, $zero, $zero
    /* 98324 800A8324 21280000 */  addu       $a1, $zero, $zero
    /* 98328 800A8328 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9832C 800A832C FD25020C */  jal        PAD_GetPad__FiUc
    /* 98330 800A8330 1000B0AF */   sw        $s0, 0x10($sp)
    /* 98334 800A8334 01000424 */  addiu      $a0, $zero, 0x1
    /* 98338 800A8338 21280000 */  addu       $a1, $zero, $zero
    /* 9833C 800A833C FD25020C */  jal        PAD_GetPad__FiUc
    /* 98340 800A8340 21804000 */   addu      $s0, $v0, $zero
    /* 98344 800A8344 21200002 */  addu       $a0, $s0, $zero
    /* 98348 800A8348 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9834C 800A834C 21804000 */   addu      $s0, $v0, $zero
    /* 98350 800A8350 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 98354 800A8354 24105100 */  and        $v0, $v0, $s1
    /* 98358 800A8358 03004010 */  beqz       $v0, .L800A8368
    /* 9835C 800A835C 00000000 */   nop
    /* 98360 800A8360 E1A00208 */  j          .L800A8384
    /* 98364 800A8364 21100000 */   addu      $v0, $zero, $zero
  .L800A8368:
    /* 98368 800A8368 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9836C 800A836C 21200002 */   addu      $a0, $s0, $zero
    /* 98370 800A8370 FFFF4330 */  andi       $v1, $v0, 0xFFFF
    /* 98374 800A8374 24187100 */  and        $v1, $v1, $s1
    /* 98378 800A8378 02006014 */  bnez       $v1, .L800A8384
    /* 9837C 800A837C 01000224 */   addiu     $v0, $zero, 0x1
    /* 98380 800A8380 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L800A8384:
    /* 98384 800A8384 1800BF8F */  lw         $ra, 0x18($sp)
    /* 98388 800A8388 1400B18F */  lw         $s1, 0x14($sp)
    /* 9838C 800A838C 1000B08F */  lw         $s0, 0x10($sp)
    /* 98390 800A8390 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 98394 800A8394 0800E003 */  jr         $ra
    /* 98398 800A8398 00000000 */   nop
endlabel who_pressed__Fi
