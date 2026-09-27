.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NewPal__13PalCollectionUsUsi, 0x80

glabel NewPal__13PalCollectionUsUsi
    /* 8AED0 8009AED0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8AED4 8009AED4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 8AED8 8009AED8 2198E000 */  addu       $s3, $a3, $zero
    /* 8AEDC 8009AEDC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8AEE0 8009AEE0 2188A000 */  addu       $s1, $a1, $zero
    /* 8AEE4 8009AEE4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8AEE8 8009AEE8 2190C000 */  addu       $s2, $a2, $zero
    /* 8AEEC 8009AEEC 2000BFAF */  sw         $ra, 0x20($sp)
    /* 8AEF0 8009AEF0 376C020C */  jal        GetObj__t10Collection2Z8PalEntryi20
    /* 8AEF4 8009AEF4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 8AEF8 8009AEF8 21804000 */  addu       $s0, $v0, $zero
    /* 8AEFC 8009AEFC 07000016 */  bnez       $s0, .L8009AF1C
    /* 8AF00 8009AF00 21200002 */   addu      $a0, $s0, $zero
    /* 8AF04 8009AF04 21200000 */  addu       $a0, $zero, $zero
    /* 8AF08 8009AF08 1180053C */  lui        $a1, %hi(D_80110A60)
    /* 8AF0C 8009AF0C 600AA524 */  addiu      $a1, $a1, %lo(D_80110A60)
    /* 8AF10 8009AF10 A583000C */  jal        DBG_Error
    /* 8AF14 8009AF14 33010624 */   addiu     $a2, $zero, 0x133
    /* 8AF18 8009AF18 21200002 */  addu       $a0, $s0, $zero
  .L8009AF1C:
    /* 8AF1C 8009AF1C FFFF2532 */  andi       $a1, $s1, 0xFFFF
    /* 8AF20 8009AF20 FFFF4632 */  andi       $a2, $s2, 0xFFFF
    /* 8AF24 8009AF24 D46B020C */  jal        MakePal__8PalEntryUsUsi
    /* 8AF28 8009AF28 21386002 */   addu      $a3, $s3, $zero
    /* 8AF2C 8009AF2C 21100002 */  addu       $v0, $s0, $zero
    /* 8AF30 8009AF30 2000BF8F */  lw         $ra, 0x20($sp)
    /* 8AF34 8009AF34 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 8AF38 8009AF38 1800B28F */  lw         $s2, 0x18($sp)
    /* 8AF3C 8009AF3C 1400B18F */  lw         $s1, 0x14($sp)
    /* 8AF40 8009AF40 1000B08F */  lw         $s0, 0x10($sp)
    /* 8AF44 8009AF44 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 8AF48 8009AF48 0800E003 */  jr         $ra
    /* 8AF4C 8009AF4C 00000000 */   nop
endlabel NewPal__13PalCollectionUsUsi
