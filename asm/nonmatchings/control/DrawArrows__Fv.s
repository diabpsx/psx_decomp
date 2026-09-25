.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawArrows__Fv, 0x100

glabel DrawArrows__Fv
    /* 24334 80034334 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 24338 80034338 21200000 */  addu       $a0, $zero, $zero
    /* 2433C 8003433C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 24340 80034340 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 24344 80034344 2800B2AF */  sw         $s2, 0x28($sp)
    /* 24348 80034348 2400B1AF */  sw         $s1, 0x24($sp)
    /* 2434C 8003434C 044F020C */  jal        GM_UseTexData__Fi
    /* 24350 80034350 2000B0AF */   sw        $s0, 0x20($sp)
    /* 24354 80034354 01001024 */  addiu      $s0, $zero, 0x1
    /* 24358 80034358 BDDD000C */  jal        GetMaxOtPos__7CBlocks
    /* 2435C 8003435C 21904000 */   addu      $s2, $v0, $zero
    /* 24360 80034360 1E011124 */  addiu      $s1, $zero, 0x11E
    /* 24364 80034364 E80E838F */  lw         $v1, %gp_rel(D_8011B668)($gp)
    /* 24368 80034368 00000000 */  nop
    /* 2436C 8003436C 03006010 */  beqz       $v1, .L8003437C
    /* 24370 80034370 FCFF5324 */   addiu     $s3, $v0, -0x4
    /* 24374 80034374 21800000 */  addu       $s0, $zero, $zero
    /* 24378 80034378 1C001124 */  addiu      $s1, $zero, 0x1C
  .L8003437C:
    /* 2437C 8003437C 21204002 */  addu       $a0, $s2, $zero
    /* 24380 80034380 7E000524 */  addiu      $a1, $zero, 0x7E
    /* 24384 80034384 21302002 */  addu       $a2, $s1, $zero
    /* 24388 80034388 CA000724 */  addiu      $a3, $zero, 0xCA
    /* 2438C 8003438C FF001032 */  andi       $s0, $s0, 0xFF
    /* 24390 80034390 1000B0AF */  sw         $s0, 0x10($sp)
    /* 24394 80034394 1400B3AF */  sw         $s3, 0x14($sp)
    /* 24398 80034398 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 2439C 8003439C 1800A0AF */   sw        $zero, 0x18($sp)
    /* 243A0 800343A0 21504000 */  addu       $t2, $v0, $zero
    /* 243A4 800343A4 21204002 */  addu       $a0, $s2, $zero
    /* 243A8 800343A8 7E000524 */  addiu      $a1, $zero, 0x7E
    /* 243AC 800343AC 01002636 */  ori        $a2, $s1, 0x1
    /* 243B0 800343B0 CB000724 */  addiu      $a3, $zero, 0xCB
    /* 243B4 800343B4 1280033C */  lui        $v1, %hi(GOLDR)
    /* 243B8 800343B8 DAAB6390 */  lbu        $v1, %lo(GOLDR)($v1)
    /* 243BC 800343BC 1280083C */  lui        $t0, %hi(GOLDG)
    /* 243C0 800343C0 DBAB0891 */  lbu        $t0, %lo(GOLDG)($t0)
    /* 243C4 800343C4 07004291 */  lbu        $v0, 0x7($t2)
    /* 243C8 800343C8 1280093C */  lui        $t1, %hi(GOLDB)
    /* 243CC 800343CC DCAB2991 */  lbu        $t1, %lo(GOLDB)($t1)
    /* 243D0 800343D0 FC004230 */  andi       $v0, $v0, 0xFC
    /* 243D4 800343D4 040043A1 */  sb         $v1, 0x4($t2)
    /* 243D8 800343D8 050048A1 */  sb         $t0, 0x5($t2)
    /* 243DC 800343DC 060049A1 */  sb         $t1, 0x6($t2)
    /* 243E0 800343E0 070042A1 */  sb         $v0, 0x7($t2)
    /* 243E4 800343E4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 243E8 800343E8 1400B3AF */  sw         $s3, 0x14($sp)
    /* 243EC 800343EC 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 243F0 800343F0 1800A0AF */   sw        $zero, 0x18($sp)
    /* 243F4 800343F4 21504000 */  addu       $t2, $v0, $zero
    /* 243F8 800343F8 07004291 */  lbu        $v0, 0x7($t2)
    /* 243FC 800343FC 040040A1 */  sb         $zero, 0x4($t2)
    /* 24400 80034400 050040A1 */  sb         $zero, 0x5($t2)
    /* 24404 80034404 060040A1 */  sb         $zero, 0x6($t2)
    /* 24408 80034408 02004234 */  ori        $v0, $v0, 0x2
    /* 2440C 8003440C FE004230 */  andi       $v0, $v0, 0xFE
    /* 24410 80034410 070042A1 */  sb         $v0, 0x7($t2)
    /* 24414 80034414 3000BF8F */  lw         $ra, 0x30($sp)
    /* 24418 80034418 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 2441C 8003441C 2800B28F */  lw         $s2, 0x28($sp)
    /* 24420 80034420 2400B18F */  lw         $s1, 0x24($sp)
    /* 24424 80034424 2000B08F */  lw         $s0, 0x20($sp)
    /* 24428 80034428 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 2442C 8003442C 0800E003 */  jr         $ra
    /* 24430 80034430 00000000 */   nop
endlabel DrawArrows__Fv
