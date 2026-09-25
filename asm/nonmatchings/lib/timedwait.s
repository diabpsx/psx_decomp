.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching timedwait, 0x40

glabel timedwait
    /* 2013C 8003013C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 20140 80030140 1000B0AF */  sw         $s0, 0x10($sp)
    /* 20144 80030144 1400BFAF */  sw         $ra, 0x14($sp)
    /* 20148 80030148 08C0000C */  jal        gettick
    /* 2014C 8003014C 21808000 */   addu      $s0, $a0, $zero
    /* 20150 80030150 21805000 */  addu       $s0, $v0, $s0
  .L80030154:
    /* 20154 80030154 08C0000C */  jal        gettick
    /* 20158 80030158 00000000 */   nop
    /* 2015C 8003015C 23105000 */  subu       $v0, $v0, $s0
    /* 20160 80030160 FCFF4004 */  bltz       $v0, .L80030154
    /* 20164 80030164 00000000 */   nop
    /* 20168 80030168 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2016C 8003016C 1000B08F */  lw         $s0, 0x10($sp)
    /* 20170 80030170 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 20174 80030174 0800E003 */  jr         $ra
    /* 20178 80030178 00000000 */   nop
endlabel timedwait
