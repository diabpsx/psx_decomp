.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ML_Init__Fv, 0x38

glabel ML_Init__Fv
    /* 6D5F8 8007D5F8 21180000 */  addu       $v1, $zero, $zero
    /* 6D5FC 8007D5FC FFFF0424 */  addiu      $a0, $zero, -0x1
  .L8007D600:
    /* 6D600 8007D600 0E80013C */  lui        $at, %hi(MlTab)
    /* 6D604 8007D604 21082300 */  addu       $at, $at, $v1
    /* 6D608 8007D608 C43924A0 */  sb         $a0, %lo(MlTab)($at)
    /* 6D60C 8007D60C 0E80013C */  lui        $at, %hi(QlTab)
    /* 6D610 8007D610 21082300 */  addu       $at, $at, $v1
    /* 6D614 8007D614 D43924A0 */  sb         $a0, %lo(QlTab)($at)
    /* 6D618 8007D618 01006324 */  addiu      $v1, $v1, 0x1
    /* 6D61C 8007D61C 10006228 */  slti       $v0, $v1, 0x10
    /* 6D620 8007D620 F7FF4014 */  bnez       $v0, .L8007D600
    /* 6D624 8007D624 00000000 */   nop
    /* 6D628 8007D628 0800E003 */  jr         $ra
    /* 6D62C 8007D62C 00000000 */   nop
endlabel ML_Init__Fv
