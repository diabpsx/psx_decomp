.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching reserveioforstream, 0x9C

glabel reserveioforstream
    /* 19060 80029060 DC1C828F */  lw         $v0, %gp_rel(streamhasioflag)($gp)
    /* 19064 80029064 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19068 80029068 18004014 */  bnez       $v0, .L800290CC
    /* 1906C 8002906C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 19070 80029070 4C23848F */  lw         $a0, %gp_rel(asynctick)($gp)
    /* 19074 80029074 0CC0000C */  jal        tickcount
    /* 19078 80029078 00000000 */   nop
    /* 1907C 8002907C 40190200 */  sll        $v1, $v0, 5
    /* 19080 80029080 23186200 */  subu       $v1, $v1, $v0
    /* 19084 80029084 1280043C */  lui        $a0, %hi(timerhz)
    /* 19088 80029088 9CC5848C */  lw         $a0, %lo(timerhz)($a0)
    /* 1908C 8002908C 80180300 */  sll        $v1, $v1, 2
    /* 19090 80029090 21186200 */  addu       $v1, $v1, $v0
    /* 19094 80029094 C0180300 */  sll        $v1, $v1, 3
    /* 19098 80029098 1A006400 */  div        $zero, $v1, $a0
    /* 1909C 8002909C 02008014 */  bnez       $a0, .L800290A8
    /* 190A0 800290A0 00000000 */   nop
    /* 190A4 800290A4 0D000700 */  break      7
  .L800290A8:
    /* 190A8 800290A8 FFFF0124 */  addiu      $at, $zero, -0x1
    /* 190AC 800290AC 04008114 */  bne        $a0, $at, .L800290C0
    /* 190B0 800290B0 0080013C */   lui       $at, (0x80000000 >> 16)
    /* 190B4 800290B4 02006114 */  bne        $v1, $at, .L800290C0
    /* 190B8 800290B8 00000000 */   nop
    /* 190BC 800290BC 0D000600 */  break      6
  .L800290C0:
    /* 190C0 800290C0 12180000 */  mflo       $v1
    /* 190C4 800290C4 00000000 */  nop
    /* 190C8 800290C8 042383AF */  sw         $v1, %gp_rel(elapsedasyncmsecs)($gp)
  .L800290CC:
    /* 190CC 800290CC E41C828F */  lw         $v0, %gp_rel(streamstarting)($gp)
    /* 190D0 800290D0 00000000 */  nop
    /* 190D4 800290D4 03004010 */  beqz       $v0, .L800290E4
    /* 190D8 800290D8 02000224 */   addiu     $v0, $zero, 0x2
    /* 190DC 800290DC E81C80AF */  sw         $zero, %gp_rel(streamtoppedupflag)($gp)
    /* 190E0 800290E0 E41C80AF */  sw         $zero, %gp_rel(streamstarting)($gp)
  .L800290E4:
    /* 190E4 800290E4 D81C80AF */  sw         $zero, %gp_rel(relinquishio)($gp)
    /* 190E8 800290E8 001D82AF */  sw         $v0, %gp_rel(D_8011C480)($gp)
    /* 190EC 800290EC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 190F0 800290F0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 190F4 800290F4 0800E003 */  jr         $ra
    /* 190F8 800290F8 00000000 */   nop
endlabel reserveioforstream
