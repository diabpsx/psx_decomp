.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching creatememclass, 0x190

glabel creatememclass
    /* 1A3A4 8002A3A4 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1A3A8 8002A3A8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1A3AC 8002A3AC 4800B08F */  lw         $s0, 0x48($sp)
    /* 1A3B0 8002A3B0 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1A3B4 8002A3B4 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 1A3B8 8002A3B8 2800B6AF */  sw         $s6, 0x28($sp)
    /* 1A3BC 8002A3BC 5000B68F */  lw         $s6, 0x50($sp)
    /* 1A3C0 8002A3C0 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 1A3C4 8002A3C4 5400B78F */  lw         $s7, 0x54($sp)
    /* 1A3C8 8002A3C8 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1A3CC 8002A3CC 21A08000 */  addu       $s4, $a0, $zero
    /* 1A3D0 8002A3D0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1A3D4 8002A3D4 2190A000 */  addu       $s2, $a1, $zero
    /* 1A3D8 8002A3D8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1A3DC 8002A3DC 2198C000 */  addu       $s3, $a2, $zero
    /* 1A3E0 8002A3E0 3000BEAF */  sw         $fp, 0x30($sp)
    /* 1A3E4 8002A3E4 21F0E000 */  addu       $fp, $a3, $zero
    /* 1A3E8 8002A3E8 21206002 */  addu       $a0, $s3, $zero
    /* 1A3EC 8002A3EC 21280000 */  addu       $a1, $zero, $zero
    /* 1A3F0 8002A3F0 3400BFAF */  sw         $ra, 0x34($sp)
    /* 1A3F4 8002A3F4 6FAB000C */  jal        findmemblocka
    /* 1A3F8 8002A3F8 1400B1AF */   sw        $s1, 0x14($sp)
    /* 1A3FC 8002A3FC 0D004010 */  beqz       $v0, .L8002A434
    /* 1A400 8002A400 000F4232 */   andi      $v0, $s2, 0xF00
    /* 1A404 8002A404 1180043C */  lui        $a0, %hi(D_8010F484)
    /* 1A408 8002A408 84F48424 */  addiu      $a0, $a0, %lo(D_8010F484)
    /* 1A40C 8002A40C 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1A410 8002A410 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1A414 8002A414 1280013C */  lui        $at, %hi(abortfile)
    /* 1A418 8002A418 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1A41C 8002A41C C9000224 */  addiu      $v0, $zero, 0xC9
    /* 1A420 8002A420 1280013C */  lui        $at, %hi(abortline)
    /* 1A424 8002A424 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1A428 8002A428 0F95000C */  jal        abortmessage
    /* 1A42C 8002A42C 00000000 */   nop
    /* 1A430 8002A430 000F4232 */  andi       $v0, $s2, 0xF00
  .L8002A434:
    /* 1A434 8002A434 03120200 */  sra        $v0, $v0, 8
    /* 1A438 8002A438 40180200 */  sll        $v1, $v0, 1
    /* 1A43C 8002A43C 21186200 */  addu       $v1, $v1, $v0
    /* 1A440 8002A440 C0180300 */  sll        $v1, $v1, 3
    /* 1A444 8002A444 1380023C */  lui        $v0, %hi(memclass)
    /* 1A448 8002A448 307A4224 */  addiu      $v0, $v0, %lo(memclass)
    /* 1A44C 8002A44C 21886200 */  addu       $s1, $v1, $v0
    /* 1A450 8002A450 FFFF0226 */  addiu      $v0, $s0, -0x1
    /* 1A454 8002A454 080022AE */  sw         $v0, 0x8($s1)
    /* 1A458 8002A458 FFFFA226 */  addiu      $v0, $s5, -0x1
    /* 1A45C 8002A45C 0C0022AE */  sw         $v0, 0xC($s1)
    /* 1A460 8002A460 0400E012 */  beqz       $s7, .L8002A474
    /* 1A464 8002A464 100036AE */   sw        $s6, 0x10($s1)
    /* 1A468 8002A468 04000224 */  addiu      $v0, $zero, 0x4
    /* 1A46C 8002A46C 1EA90008 */  j          .L8002A478
    /* 1A470 8002A470 140022AE */   sw        $v0, 0x14($s1)
  .L8002A474:
    /* 1A474 8002A474 140020AE */  sw         $zero, 0x14($s1)
  .L8002A478:
    /* 1A478 8002A478 C8AD000C */  jal        getmemblock
    /* 1A47C 8002A47C 00000000 */   nop
    /* 1A480 8002A480 21804000 */  addu       $s0, $v0, $zero
    /* 1A484 8002A484 04000426 */  addiu      $a0, $s0, 0x4
    /* 1A488 8002A488 1180053C */  lui        $a1, %hi(D_8010F4EC)
    /* 1A48C 8002A48C ECF4A524 */  addiu      $a1, $a1, %lo(D_8010F4EC)
    /* 1A490 8002A490 9767000C */  jal        sprintf
    /* 1A494 8002A494 21308002 */   addu      $a2, $s4, $zero
    /* 1A498 8002A498 00804236 */  ori        $v0, $s2, 0x8000
    /* 1A49C 8002A49C 000013AE */  sw         $s3, 0x0($s0)
    /* 1A4A0 8002A4A0 140000AE */  sw         $zero, 0x14($s0)
    /* 1A4A4 8002A4A4 100000AE */  sw         $zero, 0x10($s0)
    /* 1A4A8 8002A4A8 240000AE */  sw         $zero, 0x24($s0)
    /* 1A4AC 8002A4AC 180002AE */  sw         $v0, 0x18($s0)
    /* 1A4B0 8002A4B0 C8AD000C */  jal        getmemblock
    /* 1A4B4 8002A4B4 000030AE */   sw        $s0, 0x0($s1)
    /* 1A4B8 8002A4B8 21804000 */  addu       $s0, $v0, $zero
    /* 1A4BC 8002A4BC 04000426 */  addiu      $a0, $s0, 0x4
    /* 1A4C0 8002A4C0 1180053C */  lui        $a1, %hi(D_8010F4F8)
    /* 1A4C4 8002A4C4 F8F4A524 */  addiu      $a1, $a1, %lo(D_8010F4F8)
    /* 1A4C8 8002A4C8 9767000C */  jal        sprintf
    /* 1A4CC 8002A4CC 21308002 */   addu      $a2, $s4, $zero
    /* 1A4D0 8002A4D0 20804236 */  ori        $v0, $s2, 0x8020
    /* 1A4D4 8002A4D4 00001EAE */  sw         $fp, 0x0($s0)
    /* 1A4D8 8002A4D8 140000AE */  sw         $zero, 0x14($s0)
    /* 1A4DC 8002A4DC 100000AE */  sw         $zero, 0x10($s0)
    /* 1A4E0 8002A4E0 200000AE */  sw         $zero, 0x20($s0)
    /* 1A4E4 8002A4E4 180002AE */  sw         $v0, 0x18($s0)
    /* 1A4E8 8002A4E8 0000228E */  lw         $v0, 0x0($s1)
    /* 1A4EC 8002A4EC 040030AE */  sw         $s0, 0x4($s1)
    /* 1A4F0 8002A4F0 200050AC */  sw         $s0, 0x20($v0)
    /* 1A4F4 8002A4F4 0000238E */  lw         $v1, 0x0($s1)
    /* 1A4F8 8002A4F8 21102002 */  addu       $v0, $s1, $zero
    /* 1A4FC 8002A4FC 240003AE */  sw         $v1, 0x24($s0)
    /* 1A500 8002A500 3400BF8F */  lw         $ra, 0x34($sp)
    /* 1A504 8002A504 3000BE8F */  lw         $fp, 0x30($sp)
    /* 1A508 8002A508 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 1A50C 8002A50C 2800B68F */  lw         $s6, 0x28($sp)
    /* 1A510 8002A510 2400B58F */  lw         $s5, 0x24($sp)
    /* 1A514 8002A514 2000B48F */  lw         $s4, 0x20($sp)
    /* 1A518 8002A518 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1A51C 8002A51C 1800B28F */  lw         $s2, 0x18($sp)
    /* 1A520 8002A520 1400B18F */  lw         $s1, 0x14($sp)
    /* 1A524 8002A524 1000B08F */  lw         $s0, 0x10($sp)
    /* 1A528 8002A528 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1A52C 8002A52C 0800E003 */  jr         $ra
    /* 1A530 8002A530 00000000 */   nop
endlabel creatememclass
