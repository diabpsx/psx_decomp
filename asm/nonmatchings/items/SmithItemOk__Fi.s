.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SmithItemOk__Fi, 0x64

glabel SmithItemOk__Fi
    /* 39608 80049608 40210400 */  sll        $a0, $a0, 5
    /* 3960C 8004960C 1180013C */  lui        $at, %hi(AllItemsList + 0x4)
    /* 39610 80049610 21082400 */  addu       $at, $at, $a0
    /* 39614 80049614 A8132480 */  lb         $a0, %lo(AllItemsList + 0x4)($at)
    /* 39618 80049618 00000000 */  nop
    /* 3961C 8004961C 2B100400 */  sltu       $v0, $zero, $a0
    /* 39620 80049620 21184000 */  addu       $v1, $v0, $zero
    /* 39624 80049624 0B000224 */  addiu      $v0, $zero, 0xB
    /* 39628 80049628 02008214 */  bne        $a0, $v0, .L80049634
    /* 3962C 8004962C 0E000224 */   addiu     $v0, $zero, 0xE
    /* 39630 80049630 21180000 */  addu       $v1, $zero, $zero
  .L80049634:
    /* 39634 80049634 02008214 */  bne        $a0, $v0, .L80049640
    /* 39638 80049638 0A000224 */   addiu     $v0, $zero, 0xA
    /* 3963C 8004963C 21180000 */  addu       $v1, $zero, $zero
  .L80049640:
    /* 39640 80049640 02008214 */  bne        $a0, $v0, .L8004964C
    /* 39644 80049644 0C000224 */   addiu     $v0, $zero, 0xC
    /* 39648 80049648 21180000 */  addu       $v1, $zero, $zero
  .L8004964C:
    /* 3964C 8004964C 02008214 */  bne        $a0, $v0, .L80049658
    /* 39650 80049650 0D000224 */   addiu     $v0, $zero, 0xD
    /* 39654 80049654 21180000 */  addu       $v1, $zero, $zero
  .L80049658:
    /* 39658 80049658 02008214 */  bne        $a0, $v0, .L80049664
    /* 3965C 8004965C 00000000 */   nop
    /* 39660 80049660 21180000 */  addu       $v1, $zero, $zero
  .L80049664:
    /* 39664 80049664 0800E003 */  jr         $ra
    /* 39668 80049668 21106000 */   addu      $v0, $v1, $zero
endlabel SmithItemOk__Fi
