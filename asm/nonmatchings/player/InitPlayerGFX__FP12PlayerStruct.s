.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPlayerGFX__FP12PlayerStruct, 0x20

glabel InitPlayerGFX__FP12PlayerStruct
    /* 4FDF4 8005FDF4 1C01828C */  lw         $v0, 0x11C($a0)
    /* 4FDF8 8005FDF8 00000000 */  nop
    /* 4FDFC 8005FDFC 83110200 */  sra        $v0, $v0, 6
    /* 4FE00 8005FE00 02004014 */  bnez       $v0, .L8005FE0C
    /* 4FE04 8005FE04 00000000 */   nop
    /* 4FE08 8005FE08 430080A0 */  sb         $zero, 0x43($a0)
  .L8005FE0C:
    /* 4FE0C 8005FE0C 0800E003 */  jr         $ra
    /* 4FE10 8005FE10 00000000 */   nop
endlabel InitPlayerGFX__FP12PlayerStruct
