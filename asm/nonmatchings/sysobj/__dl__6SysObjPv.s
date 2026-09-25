.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __dl__6SysObjPv, 0x6C

glabel __dl__6SysObjPv
    /* 766D8 800866D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 766DC 800866DC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 766E0 800866E0 21808000 */  addu       $s0, $a0, $zero
    /* 766E4 800866E4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 766E8 800866E8 0000038E */  lw         $v1, 0x0($s0)
    /* 766EC 800866EC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 766F0 800866F0 05006214 */  bne        $v1, $v0, .L80086708
    /* 766F4 800866F4 21200000 */   addu      $a0, $zero, $zero
    /* 766F8 800866F8 1180053C */  lui        $a1, %hi(D_80110198)
    /* 766FC 800866FC 9801A524 */  addiu      $a1, $a1, %lo(D_80110198)
    /* 76700 80086700 A583000C */  jal        DBG_Error
    /* 76704 80086704 74000624 */   addiu     $a2, $zero, 0x74
  .L80086708:
    /* 76708 80086708 0000048E */  lw         $a0, 0x0($s0)
    /* 7670C 8008670C 1886000C */  jal        GAL_Free
    /* 76710 80086710 00000000 */   nop
    /* 76714 80086714 FF004230 */  andi       $v0, $v0, 0xFF
    /* 76718 80086718 05004014 */  bnez       $v0, .L80086730
    /* 7671C 8008671C 21200000 */   addu      $a0, $zero, $zero
    /* 76720 80086720 1180053C */  lui        $a1, %hi(D_80110198)
    /* 76724 80086724 9801A524 */  addiu      $a1, $a1, %lo(D_80110198)
    /* 76728 80086728 A583000C */  jal        DBG_Error
    /* 7672C 8008672C 77000624 */   addiu     $a2, $zero, 0x77
  .L80086730:
    /* 76730 80086730 1400BF8F */  lw         $ra, 0x14($sp)
    /* 76734 80086734 1000B08F */  lw         $s0, 0x10($sp)
    /* 76738 80086738 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7673C 8008673C 0800E003 */  jr         $ra
    /* 76740 80086740 00000000 */   nop
endlabel __dl__6SysObjPv
