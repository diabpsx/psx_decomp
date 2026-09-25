.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetChar__5CFontiUs, 0x80

glabel SetChar__5CFontiUs
    /* 7AB20 8008AB20 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7AB24 8008AB24 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7AB28 8008AB28 21888000 */  addu       $s1, $a0, $zero
    /* 7AB2C 8008AB2C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7AB30 8008AB30 2180A000 */  addu       $s0, $a1, $zero
    /* 7AB34 8008AB34 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7AB38 8008AB38 2190C000 */  addu       $s2, $a2, $zero
    /* 7AB3C 8008AB3C 0001022A */  slti       $v0, $s0, 0x100
    /* 7AB40 8008AB40 06004014 */  bnez       $v0, .L8008AB5C
    /* 7AB44 8008AB44 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 7AB48 8008AB48 21200000 */  addu       $a0, $zero, $zero
    /* 7AB4C 8008AB4C 1180053C */  lui        $a1, %hi(D_801104C8)
    /* 7AB50 8008AB50 C804A524 */  addiu      $a1, $a1, %lo(D_801104C8)
    /* 7AB54 8008AB54 A583000C */  jal        DBG_Error
    /* 7AB58 8008AB58 CB040624 */   addiu     $a2, $zero, 0x4CB
  .L8008AB5C:
    /* 7AB5C 8008AB5C 07000106 */  bgez       $s0, .L8008AB7C
    /* 7AB60 8008AB60 40101000 */   sll       $v0, $s0, 1
    /* 7AB64 8008AB64 21200000 */  addu       $a0, $zero, $zero
    /* 7AB68 8008AB68 1180053C */  lui        $a1, %hi(D_801104C8)
    /* 7AB6C 8008AB6C C804A524 */  addiu      $a1, $a1, %lo(D_801104C8)
    /* 7AB70 8008AB70 A583000C */  jal        DBG_Error
    /* 7AB74 8008AB74 CC040624 */   addiu     $a2, $zero, 0x4CC
    /* 7AB78 8008AB78 40101000 */  sll        $v0, $s0, 1
  .L8008AB7C:
    /* 7AB7C 8008AB7C 21105100 */  addu       $v0, $v0, $s1
    /* 7AB80 8008AB80 040052A4 */  sh         $s2, 0x4($v0)
    /* 7AB84 8008AB84 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 7AB88 8008AB88 1800B28F */  lw         $s2, 0x18($sp)
    /* 7AB8C 8008AB8C 1400B18F */  lw         $s1, 0x14($sp)
    /* 7AB90 8008AB90 1000B08F */  lw         $s0, 0x10($sp)
    /* 7AB94 8008AB94 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7AB98 8008AB98 0800E003 */  jr         $ra
    /* 7AB9C 8008AB9C 00000000 */   nop
endlabel SetChar__5CFontiUs
