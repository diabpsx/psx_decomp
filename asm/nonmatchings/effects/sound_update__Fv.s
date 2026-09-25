.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching sound_update__Fv, 0x34

glabel sound_update__Fv
    /* 2D8C8 8003D8C8 1280023C */  lui        $v0, %hi(gbSndInited)
    /* 2D8CC 8003D8CC 99BB4290 */  lbu        $v0, %lo(gbSndInited)($v0)
    /* 2D8D0 8003D8D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2D8D4 8003D8D4 05004010 */  beqz       $v0, .L8003D8EC
    /* 2D8D8 8003D8D8 1000BFAF */   sw        $ra, 0x10($sp)
    /* 2D8DC 8003D8DC 45DF010C */  jal        snd_update__FUc
    /* 2D8E0 8003D8E0 21200000 */   addu      $a0, $zero, $zero
    /* 2D8E4 8003D8E4 56F4000C */  jal        stream_update__Fv
    /* 2D8E8 8003D8E8 00000000 */   nop
  .L8003D8EC:
    /* 2D8EC 8003D8EC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2D8F0 8003D8F0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2D8F4 8003D8F4 0800E003 */  jr         $ra
    /* 2D8F8 8003D8F8 00000000 */   nop
endlabel sound_update__Fv
