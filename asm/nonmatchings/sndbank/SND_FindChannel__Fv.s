.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SND_FindChannel__Fv, 0x6C

glabel SND_FindChannel__Fv
    /* 8A364 8009A364 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 8A368 8009A368 2800B0AF */  sw         $s0, 0x28($sp)
    /* 8A36C 8009A36C FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 8A370 8009A370 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 8A374 8009A374 1465000C */  jal        SpuGetAllKeysStatus
    /* 8A378 8009A378 1000A427 */   addiu     $a0, $sp, 0x10
    /* 8A37C 8009A37C 02000324 */  addiu      $v1, $zero, 0x2
    /* 8A380 8009A380 FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 8A384 8009A384 01000524 */  addiu      $a1, $zero, 0x1
    /* 8A388 8009A388 1200A427 */  addiu      $a0, $sp, 0x12
  .L8009A38C:
    /* 8A38C 8009A38C 0B000616 */  bne        $s0, $a2, .L8009A3BC
    /* 8A390 8009A390 21100002 */   addu      $v0, $s0, $zero
    /* 8A394 8009A394 00008280 */  lb         $v0, 0x0($a0)
    /* 8A398 8009A398 00000000 */  nop
    /* 8A39C 8009A39C 02004510 */  beq        $v0, $a1, .L8009A3A8
    /* 8A3A0 8009A3A0 00000000 */   nop
    /* 8A3A4 8009A3A4 21806000 */  addu       $s0, $v1, $zero
  .L8009A3A8:
    /* 8A3A8 8009A3A8 01006324 */  addiu      $v1, $v1, 0x1
    /* 8A3AC 8009A3AC 18006228 */  slti       $v0, $v1, 0x18
    /* 8A3B0 8009A3B0 F6FF4014 */  bnez       $v0, .L8009A38C
    /* 8A3B4 8009A3B4 01008424 */   addiu     $a0, $a0, 0x1
    /* 8A3B8 8009A3B8 21100002 */  addu       $v0, $s0, $zero
  .L8009A3BC:
    /* 8A3BC 8009A3BC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 8A3C0 8009A3C0 2800B08F */  lw         $s0, 0x28($sp)
    /* 8A3C4 8009A3C4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 8A3C8 8009A3C8 0800E003 */  jr         $ra
    /* 8A3CC 8009A3CC 00000000 */   nop
endlabel SND_FindChannel__Fv
