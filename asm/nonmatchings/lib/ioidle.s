.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ioidle, 0x50

glabel ioidle
    /* 192A8 800292A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 192AC 800292AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 192B0 800292B0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 192B4 800292B4 A0BC000C */  jal        streamidle
    /* 192B8 800292B8 21800000 */   addu      $s0, $zero, $zero
    /* 192BC 800292BC 09004010 */  beqz       $v0, .L800292E4
    /* 192C0 800292C0 21100002 */   addu      $v0, $s0, $zero
    /* 192C4 800292C4 CF90000C */  jal        asyncidle
    /* 192C8 800292C8 00000000 */   nop
    /* 192CC 800292CC 05004010 */  beqz       $v0, .L800292E4
    /* 192D0 800292D0 21100002 */   addu      $v0, $s0, $zero
    /* 192D4 800292D4 041D828F */  lw         $v0, %gp_rel(loadfilewaiting)($gp)
    /* 192D8 800292D8 00000000 */  nop
    /* 192DC 800292DC 0100502C */  sltiu      $s0, $v0, 0x1
    /* 192E0 800292E0 21100002 */  addu       $v0, $s0, $zero
  .L800292E4:
    /* 192E4 800292E4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 192E8 800292E8 1000B08F */  lw         $s0, 0x10($sp)
    /* 192EC 800292EC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 192F0 800292F0 0800E003 */  jr         $ra
    /* 192F4 800292F4 00000000 */   nop
endlabel ioidle
