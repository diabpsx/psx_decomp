.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TrimCol__Fs_8008ad90, 0x38

glabel TrimCol__Fs_8008ad90
    /* 7AD90 8008AD90 21188000 */  addu       $v1, $a0, $zero
    /* 7AD94 8008AD94 00240400 */  sll        $a0, $a0, 16
    /* 7AD98 8008AD98 03008104 */  bgez       $a0, .L8008ADA8
    /* 7AD9C 8008AD9C 00140300 */   sll       $v0, $v1, 16
    /* 7ADA0 8008ADA0 21180000 */  addu       $v1, $zero, $zero
    /* 7ADA4 8008ADA4 00140300 */  sll        $v0, $v1, 16
  .L8008ADA8:
    /* 7ADA8 8008ADA8 03140200 */  sra        $v0, $v0, 16
    /* 7ADAC 8008ADAC 00014228 */  slti       $v0, $v0, 0x100
    /* 7ADB0 8008ADB0 02004014 */  bnez       $v0, .L8008ADBC
    /* 7ADB4 8008ADB4 00000000 */   nop
    /* 7ADB8 8008ADB8 FF000324 */  addiu      $v1, $zero, 0xFF
  .L8008ADBC:
    /* 7ADBC 8008ADBC 00140300 */  sll        $v0, $v1, 16
    /* 7ADC0 8008ADC0 0800E003 */  jr         $ra
    /* 7ADC4 8008ADC4 03140200 */   sra       $v0, $v0, 16
endlabel TrimCol__Fs_8008ad90
