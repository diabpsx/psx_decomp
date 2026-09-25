.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDPiece__Fiis, 0x94

glabel SetDPiece__Fiis
    /* 72ACC 80082ACC C416828F */  lw         $v0, %gp_rel(dPiece)($gp)
    /* 72AD0 80082AD0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 72AD4 80082AD4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72AD8 80082AD8 21888000 */  addu       $s1, $a0, $zero
    /* 72ADC 80082ADC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72AE0 80082AE0 2180A000 */  addu       $s0, $a1, $zero
    /* 72AE4 80082AE4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 72AE8 80082AE8 2190C000 */  addu       $s2, $a2, $zero
    /* 72AEC 80082AEC 03004014 */  bnez       $v0, .L80082AFC
    /* 72AF0 80082AF0 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 72AF4 80082AF4 F609020C */  jal        DPIECE_ERROR__Fv
    /* 72AF8 80082AF8 00000000 */   nop
  .L80082AFC:
    /* 72AFC 80082AFC 7100222E */  sltiu      $v0, $s1, 0x71
    /* 72B00 80082B00 03004010 */  beqz       $v0, .L80082B10
    /* 72B04 80082B04 7100022E */   sltiu     $v0, $s0, 0x71
    /* 72B08 80082B08 07004014 */  bnez       $v0, .L80082B28
    /* 72B0C 80082B0C C0101000 */   sll       $v0, $s0, 3
  .L80082B10:
    /* 72B10 80082B10 21200000 */  addu       $a0, $zero, $zero
    /* 72B14 80082B14 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 72B18 80082B18 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 72B1C 80082B1C A583000C */  jal        DBG_Error
    /* 72B20 80082B20 A0000624 */   addiu     $a2, $zero, 0xA0
    /* 72B24 80082B24 C0101000 */  sll        $v0, $s0, 3
  .L80082B28:
    /* 72B28 80082B28 23105000 */  subu       $v0, $v0, $s0
    /* 72B2C 80082B2C 00110200 */  sll        $v0, $v0, 4
    /* 72B30 80082B30 21105100 */  addu       $v0, $v0, $s1
    /* 72B34 80082B34 C416838F */  lw         $v1, %gp_rel(dPiece)($gp)
    /* 72B38 80082B38 40100200 */  sll        $v0, $v0, 1
    /* 72B3C 80082B3C 21104300 */  addu       $v0, $v0, $v1
    /* 72B40 80082B40 000052A4 */  sh         $s2, 0x0($v0)
    /* 72B44 80082B44 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 72B48 80082B48 1800B28F */  lw         $s2, 0x18($sp)
    /* 72B4C 80082B4C 1400B18F */  lw         $s1, 0x14($sp)
    /* 72B50 80082B50 1000B08F */  lw         $s0, 0x10($sp)
    /* 72B54 80082B54 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 72B58 80082B58 0800E003 */  jr         $ra
    /* 72B5C 80082B5C 00000000 */   nop
endlabel SetDPiece__Fiis
