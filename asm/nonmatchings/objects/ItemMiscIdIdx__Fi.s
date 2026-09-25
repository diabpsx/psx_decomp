.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ItemMiscIdIdx__Fi, 0x70

glabel ItemMiscIdIdx__Fi
    /* 4A408 8005A408 1180023C */  lui        $v0, %hi(AllItemsList)
    /* 4A40C 8005A40C A4134290 */  lbu        $v0, %lo(AllItemsList)($v0)
    /* 4A410 8005A410 00000000 */  nop
    /* 4A414 8005A414 06004010 */  beqz       $v0, .L8005A430
    /* 4A418 8005A418 21280000 */   addu      $a1, $zero, $zero
    /* 4A41C 8005A41C 1180023C */  lui        $v0, %hi(AllItemsList + 0x18)
    /* 4A420 8005A420 BC134290 */  lbu        $v0, %lo(AllItemsList + 0x18)($v0)
    /* 4A424 8005A424 00000000 */  nop
    /* 4A428 8005A428 11004410 */  beq        $v0, $a0, .L8005A470
    /* 4A42C 8005A42C 00000000 */   nop
  .L8005A430:
    /* 4A430 8005A430 0100A524 */  addiu      $a1, $a1, 0x1
  .L8005A434:
    /* 4A434 8005A434 40190500 */  sll        $v1, $a1, 5
    /* 4A438 8005A438 1180013C */  lui        $at, %hi(AllItemsList)
    /* 4A43C 8005A43C 21082300 */  addu       $at, $at, $v1
    /* 4A440 8005A440 A4132290 */  lbu        $v0, %lo(AllItemsList)($at)
    /* 4A444 8005A444 00000000 */  nop
    /* 4A448 8005A448 FAFF4010 */  beqz       $v0, .L8005A434
    /* 4A44C 8005A44C 0100A524 */   addiu     $a1, $a1, 0x1
    /* 4A450 8005A450 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 4A454 8005A454 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 4A458 8005A458 21082300 */  addu       $at, $at, $v1
    /* 4A45C 8005A45C BC132290 */  lbu        $v0, %lo(AllItemsList + 0x18)($at)
    /* 4A460 8005A460 00000000 */  nop
    /* 4A464 8005A464 F3FF4414 */  bne        $v0, $a0, .L8005A434
    /* 4A468 8005A468 0100A524 */   addiu     $a1, $a1, 0x1
    /* 4A46C 8005A46C FFFFA524 */  addiu      $a1, $a1, -0x1
  .L8005A470:
    /* 4A470 8005A470 0800E003 */  jr         $ra
    /* 4A474 8005A474 2110A000 */   addu      $v0, $a1, $zero
endlabel ItemMiscIdIdx__Fi
