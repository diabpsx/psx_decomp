.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpCurrentText__Fv, 0x58

glabel DumpCurrentText__Fv
    /* 6B700 8007B700 7014848F */  lw         $a0, %gp_rel(hndText)($gp)
    /* 6B704 8007B704 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6B708 8007B708 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6B70C 8007B70C FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 6B710 8007B710 0C009010 */  beq        $a0, $s0, .L8007B744
    /* 6B714 8007B714 1400BFAF */   sw        $ra, 0x14($sp)
    /* 6B718 8007B718 1886000C */  jal        GAL_Free
    /* 6B71C 8007B71C 00000000 */   nop
    /* 6B720 8007B720 FF004230 */  andi       $v0, $v0, 0xFF
    /* 6B724 8007B724 05004014 */  bnez       $v0, .L8007B73C
    /* 6B728 8007B728 21200000 */   addu      $a0, $zero, $zero
    /* 6B72C 8007B72C 1280053C */  lui        $a1, %hi(D_80118C40)
    /* 6B730 8007B730 408CA524 */  addiu      $a1, $a1, %lo(D_80118C40)
    /* 6B734 8007B734 A583000C */  jal        DBG_Error
    /* 6B738 8007B738 1A010624 */   addiu     $a2, $zero, 0x11A
  .L8007B73C:
    /* 6B73C 8007B73C 741480AF */  sw         $zero, %gp_rel(TextPtr)($gp)
    /* 6B740 8007B740 701490AF */  sw         $s0, %gp_rel(hndText)($gp)
  .L8007B744:
    /* 6B744 8007B744 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6B748 8007B748 1000B08F */  lw         $s0, 0x10($sp)
    /* 6B74C 8007B74C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6B750 8007B750 0800E003 */  jr         $ra
    /* 6B754 8007B754 00000000 */   nop
endlabel DumpCurrentText__Fv
