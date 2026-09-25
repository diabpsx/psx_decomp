.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_GetCurrentList__Fi, 0xAC

glabel GLUE_GetCurrentList__Fi
    /* 8C400 8009C400 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8C404 8009C404 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8C408 8009C408 FFFF9024 */  addiu      $s0, $a0, -0x1
    /* 8C40C 8009C40C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8C410 8009C410 07000006 */  bltz       $s0, .L8009C430
    /* 8C414 8009C414 1400B1AF */   sw        $s1, 0x14($sp)
    /* 8C418 8009C418 1280023C */  lui        $v0, %hi(NumOfMonsterListLevels)
    /* 8C41C 8009C41C 94AA428C */  lw         $v0, %lo(NumOfMonsterListLevels)($v0)
    /* 8C420 8009C420 00000000 */  nop
    /* 8C424 8009C424 2A100202 */  slt        $v0, $s0, $v0
    /* 8C428 8009C428 07004014 */  bnez       $v0, .L8009C448
    /* 8C42C 8009C42C C0181000 */   sll       $v1, $s0, 3
  .L8009C430:
    /* 8C430 8009C430 21200000 */  addu       $a0, $zero, $zero
    /* 8C434 8009C434 1180053C */  lui        $a1, %hi(D_80110B58)
    /* 8C438 8009C438 580BA524 */  addiu      $a1, $a1, %lo(D_80110B58)
    /* 8C43C 8009C43C A583000C */  jal        DBG_Error
    /* 8C440 8009C440 EC020624 */   addiu     $a2, $zero, 0x2EC
    /* 8C444 8009C444 C0181000 */  sll        $v1, $s0, 3
  .L8009C448:
    /* 8C448 8009C448 0B80023C */  lui        $v0, %hi(AllLevels)
    /* 8C44C 8009C44C 58754224 */  addiu      $v0, $v0, %lo(AllLevels)
    /* 8C450 8009C450 866E020C */  jal        GLUE_GetMonsterList__Fv
    /* 8C454 8009C454 21886200 */   addu      $s1, $v1, $v0
    /* 8C458 8009C458 21804000 */  addu       $s0, $v0, $zero
    /* 8C45C 8009C45C 06000006 */  bltz       $s0, .L8009C478
    /* 8C460 8009C460 21200000 */   addu      $a0, $zero, $zero
    /* 8C464 8009C464 0000228E */  lw         $v0, 0x0($s1)
    /* 8C468 8009C468 00000000 */  nop
    /* 8C46C 8009C46C 2A105000 */  slt        $v0, $v0, $s0
    /* 8C470 8009C470 05004010 */  beqz       $v0, .L8009C488
    /* 8C474 8009C474 00000000 */   nop
  .L8009C478:
    /* 8C478 8009C478 1180053C */  lui        $a1, %hi(D_80110B58)
    /* 8C47C 8009C47C 580BA524 */  addiu      $a1, $a1, %lo(D_80110B58)
    /* 8C480 8009C480 A583000C */  jal        DBG_Error
    /* 8C484 8009C484 EF020624 */   addiu     $a2, $zero, 0x2EF
  .L8009C488:
    /* 8C488 8009C488 0400238E */  lw         $v1, 0x4($s1)
    /* 8C48C 8009C48C 00111000 */  sll        $v0, $s0, 4
    /* 8C490 8009C490 21106200 */  addu       $v0, $v1, $v0
    /* 8C494 8009C494 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8C498 8009C498 1400B18F */  lw         $s1, 0x14($sp)
    /* 8C49C 8009C49C 1000B08F */  lw         $s0, 0x10($sp)
    /* 8C4A0 8009C4A0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8C4A4 8009C4A4 0800E003 */  jr         $ra
    /* 8C4A8 8009C4A8 00000000 */   nop
endlabel GLUE_GetCurrentList__Fi
