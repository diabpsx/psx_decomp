.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching snd_play_snd__FP4TSFXll, 0x48

glabel snd_play_snd__FP4TSFXll
    /* 67D58 80077D58 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 67D5C 80077D5C 0C008010 */  beqz       $a0, .L80077D90
    /* 67D60 80077D60 1000BFAF */   sw        $ra, 0x10($sp)
    /* 67D64 80077D64 40280500 */  sll        $a1, $a1, 1
    /* 67D68 80077D68 0300A104 */  bgez       $a1, .L80077D78
    /* 67D6C 80077D6C 0040A228 */   slti      $v0, $a1, 0x4000
    /* 67D70 80077D70 61DF0108 */  j          .L80077D84
    /* 67D74 80077D74 21280000 */   addu      $a1, $zero, $zero
  .L80077D78:
    /* 67D78 80077D78 02004014 */  bnez       $v0, .L80077D84
    /* 67D7C 80077D7C 00000000 */   nop
    /* 67D80 80077D80 FF3F0524 */  addiu      $a1, $zero, 0x3FFF
  .L80077D84:
    /* 67D84 80077D84 02008494 */  lhu        $a0, 0x2($a0)
    /* 67D88 80077D88 E769020C */  jal        SND_PlaySnd__FUsiii
    /* 67D8C 80077D8C 21380000 */   addu      $a3, $zero, $zero
  .L80077D90:
    /* 67D90 80077D90 1000BF8F */  lw         $ra, 0x10($sp)
    /* 67D94 80077D94 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 67D98 80077D98 0800E003 */  jr         $ra
    /* 67D9C 80077D9C 00000000 */   nop
endlabel snd_play_snd__FP4TSFXll
