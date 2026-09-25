.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TrimCol__Fs, 0x38

glabel TrimCol__Fs
    /* 2017C 8003017C 21188000 */  addu       $v1, $a0, $zero
    /* 20180 80030180 00240400 */  sll        $a0, $a0, 16
    /* 20184 80030184 03008104 */  bgez       $a0, .L80030194
    /* 20188 80030188 00140300 */   sll       $v0, $v1, 16
    /* 2018C 8003018C 21180000 */  addu       $v1, $zero, $zero
    /* 20190 80030190 00140300 */  sll        $v0, $v1, 16
  .L80030194:
    /* 20194 80030194 03140200 */  sra        $v0, $v0, 16
    /* 20198 80030198 00014228 */  slti       $v0, $v0, 0x100
    /* 2019C 8003019C 02004014 */  bnez       $v0, .L800301A8
    /* 201A0 800301A0 00000000 */   nop
    /* 201A4 800301A4 FF000324 */  addiu      $v1, $zero, 0xFF
  .L800301A8:
    /* 201A8 800301A8 00140300 */  sll        $v0, $v1, 16
    /* 201AC 800301AC 0800E003 */  jr         $ra
    /* 201B0 800301B0 03140200 */   sra       $v0, $v0, 16
endlabel TrimCol__Fs
