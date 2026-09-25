.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching signalstreamtopup, 0x34

glabel signalstreamtopup
    /* 19190 80029190 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19194 80029194 05008014 */  bnez       $a0, .L800291AC
    /* 19198 80029198 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1919C 8002919C 1180043C */  lui        $a0, %hi(D_8010F254)
    /* 191A0 800291A0 54F28424 */  addiu      $a0, $a0, %lo(D_8010F254)
    /* 191A4 800291A4 5F97000C */  jal        print
    /* 191A8 800291A8 00000000 */   nop
  .L800291AC:
    /* 191AC 800291AC 01000224 */  addiu      $v0, $zero, 0x1
    /* 191B0 800291B0 E81C82AF */  sw         $v0, %gp_rel(streamtoppedupflag)($gp)
    /* 191B4 800291B4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 191B8 800291B8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 191BC 800291BC 0800E003 */  jr         $ra
    /* 191C0 800291C0 00000000 */   nop
endlabel signalstreamtopup
