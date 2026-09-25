.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_ENDSHIELD__FPC4TCmdi, 0xD8

glabel On_ENDSHIELD__FPC4TCmdi
    /* 42390 80052390 1280023C */  lui        $v0, %hi(myplr)
    /* 42394 80052394 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 42398 80052398 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 4239C 8005239C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 423A0 800523A0 2198A000 */  addu       $s3, $a1, $zero
    /* 423A4 800523A4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 423A8 800523A8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 423AC 800523AC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 423B0 800523B0 25006212 */  beq        $s3, $v0, .L80052448
    /* 423B4 800523B4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 423B8 800523B8 21880000 */  addu       $s1, $zero, $zero
    /* 423BC 800523BC 1080123C */  lui        $s2, %hi(missileactive)
    /* 423C0 800523C0 602A5226 */  addiu      $s2, $s2, %lo(missileactive)
  .L800523C4:
    /* 423C4 800523C4 1280023C */  lui        $v0, %hi(nummissiles)
    /* 423C8 800523C8 88C2428C */  lw         $v0, %lo(nummissiles)($v0)
    /* 423CC 800523CC 00000000 */  nop
    /* 423D0 800523D0 2A102202 */  slt        $v0, $s1, $v0
    /* 423D4 800523D4 1C004010 */  beqz       $v0, .L80052448
    /* 423D8 800523D8 00000000 */   nop
    /* 423DC 800523DC 00005086 */  lh         $s0, 0x0($s2)
    /* 423E0 800523E0 00000000 */  nop
    /* 423E4 800523E4 80101000 */  sll        $v0, $s0, 2
    /* 423E8 800523E8 21105000 */  addu       $v0, $v0, $s0
    /* 423EC 800523EC 80100200 */  sll        $v0, $v0, 2
    /* 423F0 800523F0 23105000 */  subu       $v0, $v0, $s0
    /* 423F4 800523F4 80200200 */  sll        $a0, $v0, 2
    /* 423F8 800523F8 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 423FC 800523FC 21082400 */  addu       $at, $at, $a0
    /* 42400 80052400 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 42404 80052404 0D000224 */  addiu      $v0, $zero, 0xD
    /* 42408 80052408 0C006214 */  bne        $v1, $v0, .L8005243C
    /* 4240C 8005240C 00000000 */   nop
    /* 42410 80052410 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 42414 80052414 21082400 */  addu       $at, $at, $a0
    /* 42418 80052418 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* 4241C 8005241C 00000000 */  nop
    /* 42420 80052420 06005314 */  bne        $v0, $s3, .L8005243C
    /* 42424 80052424 00000000 */   nop
    /* 42428 80052428 B02A050C */  jal        func_8014AAC0
    /* 4242C 8005242C 21200002 */   addu      $a0, $s0, $zero
    /* 42430 80052430 21200002 */  addu       $a0, $s0, $zero
    /* 42434 80052434 3AEA040C */  jal        func_8013A8E8
    /* 42438 80052438 21282002 */   addu      $a1, $s1, $zero
  .L8005243C:
    /* 4243C 8005243C 02005226 */  addiu      $s2, $s2, 0x2
    /* 42440 80052440 F1480108 */  j          .L800523C4
    /* 42444 80052444 01003126 */   addiu     $s1, $s1, 0x1
  .L80052448:
    /* 42448 80052448 2000BF8F */  lw         $ra, 0x20($sp)
    /* 4244C 8005244C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 42450 80052450 1800B28F */  lw         $s2, 0x18($sp)
    /* 42454 80052454 1400B18F */  lw         $s1, 0x14($sp)
    /* 42458 80052458 1000B08F */  lw         $s0, 0x10($sp)
    /* 4245C 8005245C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 42460 80052460 0800E003 */  jr         $ra
    /* 42464 80052464 00000000 */   nop
endlabel On_ENDSHIELD__FPC4TCmdi
