.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AS_CloseStream__FP6STRHDRP6SFXHDR, 0x54

glabel AS_CloseStream__FP6STRHDRP6SFXHDR
    /* 8AC24 8009AC24 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8AC28 8009AC28 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8AC2C 8009AC2C 2180A000 */  addu       $s0, $a1, $zero
    /* 8AC30 8009AC30 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8AC34 8009AC34 FD6A020C */  jal        AS_GetBlock__FP6SFXHDR
    /* 8AC38 8009AC38 21200002 */   addu      $a0, $s0, $zero
    /* 8AC3C 8009AC3C 00160200 */  sll        $v0, $v0, 24
    /* 8AC40 8009AC40 08004014 */  bnez       $v0, .L8009AC64
    /* 8AC44 8009AC44 00000000 */   nop
    /* 8AC48 8009AC48 5400048E */  lw         $a0, 0x54($s0)
    /* 8AC4C 8009AC4C 9A90000C */  jal        cancelasyncload
    /* 8AC50 8009AC50 00000000 */   nop
    /* 8AC54 8009AC54 21200000 */  addu       $a0, $zero, $zero
    /* 8AC58 8009AC58 01000224 */  addiu      $v0, $zero, 0x1
    /* 8AC5C 8009AC5C 53BE000C */  jal        systemtask
    /* 8AC60 8009AC60 0D0002A2 */   sb        $v0, 0xD($s0)
  .L8009AC64:
    /* 8AC64 8009AC64 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8AC68 8009AC68 1000B08F */  lw         $s0, 0x10($sp)
    /* 8AC6C 8009AC6C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8AC70 8009AC70 0800E003 */  jr         $ra
    /* 8AC74 8009AC74 00000000 */   nop
endlabel AS_CloseStream__FP6STRHDRP6SFXHDR
