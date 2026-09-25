.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching isendofstream, 0x68

glabel isendofstream
    /* 1F2F4 8002F2F4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1F2F8 8002F2F8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1F2FC 8002F2FC 21888000 */  addu       $s1, $a0, $zero
    /* 1F300 8002F300 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1F304 8002F304 21800000 */  addu       $s0, $zero, $zero
    /* 1F308 8002F308 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1F30C 8002F30C 0B00A210 */  beq        $a1, $v0, .L8002F33C
    /* 1F310 8002F310 1800BFAF */   sw        $ra, 0x18($sp)
    /* 1F314 8002F314 0B00A014 */  bnez       $a1, .L8002F344
    /* 1F318 8002F318 21100002 */   addu      $v0, $s0, $zero
    /* 1F31C 8002F31C A0BC000C */  jal        streamidle
    /* 1F320 8002F320 00000000 */   nop
    /* 1F324 8002F324 07004010 */  beqz       $v0, .L8002F344
    /* 1F328 8002F328 21100002 */   addu      $v0, $s0, $zero
    /* 1F32C 8002F32C 96BC000C */  jal        streamgetstatus
    /* 1F330 8002F330 21202002 */   addu      $a0, $s1, $zero
    /* 1F334 8002F334 03004014 */  bnez       $v0, .L8002F344
    /* 1F338 8002F338 21100002 */   addu      $v0, $s0, $zero
  .L8002F33C:
    /* 1F33C 8002F33C 01001024 */  addiu      $s0, $zero, 0x1
    /* 1F340 8002F340 21100002 */  addu       $v0, $s0, $zero
  .L8002F344:
    /* 1F344 8002F344 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1F348 8002F348 1400B18F */  lw         $s1, 0x14($sp)
    /* 1F34C 8002F34C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1F350 8002F350 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1F354 8002F354 0800E003 */  jr         $ra
    /* 1F358 8002F358 00000000 */   nop
endlabel isendofstream
