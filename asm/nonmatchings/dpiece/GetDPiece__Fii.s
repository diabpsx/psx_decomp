.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDPiece__Fii, 0x88

glabel GetDPiece__Fii
    /* 72A44 80082A44 C416828F */  lw         $v0, %gp_rel(dPiece)($gp)
    /* 72A48 80082A48 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 72A4C 80082A4C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72A50 80082A50 21888000 */  addu       $s1, $a0, $zero
    /* 72A54 80082A54 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72A58 80082A58 2180A000 */  addu       $s0, $a1, $zero
    /* 72A5C 80082A5C 03004014 */  bnez       $v0, .L80082A6C
    /* 72A60 80082A60 1800BFAF */   sw        $ra, 0x18($sp)
    /* 72A64 80082A64 F609020C */  jal        DPIECE_ERROR__Fv
    /* 72A68 80082A68 00000000 */   nop
  .L80082A6C:
    /* 72A6C 80082A6C 7100222E */  sltiu      $v0, $s1, 0x71
    /* 72A70 80082A70 03004010 */  beqz       $v0, .L80082A80
    /* 72A74 80082A74 7100022E */   sltiu     $v0, $s0, 0x71
    /* 72A78 80082A78 07004014 */  bnez       $v0, .L80082A98
    /* 72A7C 80082A7C C0101000 */   sll       $v0, $s0, 3
  .L80082A80:
    /* 72A80 80082A80 21200000 */  addu       $a0, $zero, $zero
    /* 72A84 80082A84 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 72A88 80082A88 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 72A8C 80082A8C A583000C */  jal        DBG_Error
    /* 72A90 80082A90 99000624 */   addiu     $a2, $zero, 0x99
    /* 72A94 80082A94 C0101000 */  sll        $v0, $s0, 3
  .L80082A98:
    /* 72A98 80082A98 23105000 */  subu       $v0, $v0, $s0
    /* 72A9C 80082A9C 00110200 */  sll        $v0, $v0, 4
    /* 72AA0 80082AA0 21105100 */  addu       $v0, $v0, $s1
    /* 72AA4 80082AA4 C416838F */  lw         $v1, %gp_rel(dPiece)($gp)
    /* 72AA8 80082AA8 40100200 */  sll        $v0, $v0, 1
    /* 72AAC 80082AAC 21104300 */  addu       $v0, $v0, $v1
    /* 72AB0 80082AB0 00004284 */  lh         $v0, 0x0($v0)
    /* 72AB4 80082AB4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 72AB8 80082AB8 1400B18F */  lw         $s1, 0x14($sp)
    /* 72ABC 80082ABC 1000B08F */  lw         $s0, 0x10($sp)
    /* 72AC0 80082AC0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 72AC4 80082AC4 0800E003 */  jr         $ra
    /* 72AC8 80082AC8 00000000 */   nop
endlabel GetDPiece__Fii
