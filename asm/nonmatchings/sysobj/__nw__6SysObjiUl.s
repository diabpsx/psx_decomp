.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __nw__6SysObjiUl, 0x7C

glabel __nw__6SysObjiUl
    /* 7665C 8008665C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 76660 80086660 21300000 */  addu       $a2, $zero, $zero
    /* 76664 80086664 1800BFAF */  sw         $ra, 0x18($sp)
    /* 76668 80086668 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7666C 8008666C 7785000C */  jal        GAL_Alloc
    /* 76670 80086670 1000B0AF */   sw        $s0, 0x10($sp)
    /* 76674 80086674 21804000 */  addu       $s0, $v0, $zero
    /* 76678 80086678 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 7667C 8008667C 05000216 */  bne        $s0, $v0, .L80086694
    /* 76680 80086680 21200000 */   addu      $a0, $zero, $zero
    /* 76684 80086684 1180053C */  lui        $a1, %hi(D_80110198)
    /* 76688 80086688 9801A524 */  addiu      $a1, $a1, %lo(D_80110198)
    /* 7668C 8008668C A583000C */  jal        DBG_Error
    /* 76690 80086690 5E000624 */   addiu     $a2, $zero, 0x5E
  .L80086694:
    /* 76694 80086694 DD85000C */  jal        GAL_Lock
    /* 76698 80086698 21200002 */   addu      $a0, $s0, $zero
    /* 7669C 8008669C 21884000 */  addu       $s1, $v0, $zero
    /* 766A0 800866A0 05002016 */  bnez       $s1, .L800866B8
    /* 766A4 800866A4 21200000 */   addu      $a0, $zero, $zero
    /* 766A8 800866A8 1180053C */  lui        $a1, %hi(D_80110198)
    /* 766AC 800866AC 9801A524 */  addiu      $a1, $a1, %lo(D_80110198)
    /* 766B0 800866B0 A583000C */  jal        DBG_Error
    /* 766B4 800866B4 61000624 */   addiu     $a2, $zero, 0x61
  .L800866B8:
    /* 766B8 800866B8 BC0390AF */  sw         $s0, %gp_rel(_6SysObj_NewHnd)($gp)
    /* 766BC 800866BC 21102002 */  addu       $v0, $s1, $zero
    /* 766C0 800866C0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 766C4 800866C4 1400B18F */  lw         $s1, 0x14($sp)
    /* 766C8 800866C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 766CC 800866CC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 766D0 800866D0 0800E003 */  jr         $ra
    /* 766D4 800866D4 00000000 */   nop
endlabel __nw__6SysObjiUl
