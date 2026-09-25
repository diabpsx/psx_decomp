.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching topupstream, 0x64

glabel topupstream
    /* 1912C 8002912C C422828F */  lw         $v0, %gp_rel(streamtopupfunc)($gp)
    /* 19130 80029130 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19134 80029134 1000B0AF */  sw         $s0, 0x10($sp)
    /* 19138 80029138 21808000 */  addu       $s0, $a0, $zero
    /* 1913C 8002913C 0D004010 */  beqz       $v0, .L80029174
    /* 19140 80029140 1400BFAF */   sw        $ra, 0x14($sp)
    /* 19144 80029144 F41C828F */  lw         $v0, %gp_rel(streamer_setnotfull)($gp)
    /* 19148 80029148 9C2290AF */  sw         $s0, %gp_rel(requestedasyncmsecs)($gp)
    /* 1914C 8002914C 03004010 */  beqz       $v0, .L8002915C
    /* 19150 80029150 00000000 */   nop
    /* 19154 80029154 09F84000 */  jalr       $v0
    /* 19158 80029158 00000000 */   nop
  .L8002915C:
    /* 1915C 8002915C C422828F */  lw         $v0, %gp_rel(streamtopupfunc)($gp)
    /* 19160 80029160 E81C80AF */  sw         $zero, %gp_rel(streamtoppedupflag)($gp)
    /* 19164 80029164 09F84000 */  jalr       $v0
    /* 19168 80029168 21200002 */   addu      $a0, $s0, $zero
    /* 1916C 8002916C 5FA40008 */  j          .L8002917C
    /* 19170 80029170 00000000 */   nop
  .L80029174:
    /* 19174 80029174 01000224 */  addiu      $v0, $zero, 0x1
    /* 19178 80029178 E81C82AF */  sw         $v0, %gp_rel(streamtoppedupflag)($gp)
  .L8002917C:
    /* 1917C 8002917C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 19180 80029180 1000B08F */  lw         $s0, 0x10($sp)
    /* 19184 80029184 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 19188 80029188 0800E003 */  jr         $ra
    /* 1918C 8002918C 00000000 */   nop
endlabel topupstream
