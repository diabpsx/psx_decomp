.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetMap__4AMap, 0x120

glabel GetMap__4AMap
    /* 71C78 80081C78 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 71C7C 80081C7C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 71C80 80081C80 21908000 */  addu       $s2, $a0, $zero
    /* 71C84 80081C84 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 71C88 80081C88 1400B1AF */  sw         $s1, 0x14($sp)
    /* 71C8C 80081C8C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 71C90 80081C90 0C00428E */  lw         $v0, 0xC($s2)
    /* 71C94 80081C94 00000000 */  nop
    /* 71C98 80081C98 05004010 */  beqz       $v0, .L80081CB0
    /* 71C9C 80081C9C 21200000 */   addu      $a0, $zero, $zero
    /* 71CA0 80081CA0 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71CA4 80081CA4 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71CA8 80081CA8 A583000C */  jal        DBG_Error
    /* 71CAC 80081CAC 2A010624 */   addiu     $a2, $zero, 0x12A
  .L80081CB0:
    /* 71CB0 80081CB0 0400508E */  lw         $s0, 0x4($s2)
    /* 71CB4 80081CB4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 71CB8 80081CB8 24000216 */  bne        $s0, $v0, .L80081D4C
    /* 71CBC 80081CBC 58120424 */   addiu     $a0, $zero, 0x1258
    /* 71CC0 80081CC0 1280063C */  lui        $a2, %hi(D_8011BCBC)
    /* 71CC4 80081CC4 BCBCC624 */  addiu      $a2, $a2, %lo(D_8011BCBC)
    /* 71CC8 80081CC8 7785000C */  jal        GAL_Alloc
    /* 71CCC 80081CCC 01000524 */   addiu     $a1, $zero, 0x1
    /* 71CD0 80081CD0 21884000 */  addu       $s1, $v0, $zero
    /* 71CD4 80081CD4 05003016 */  bne        $s1, $s0, .L80081CEC
    /* 71CD8 80081CD8 21200000 */   addu      $a0, $zero, $zero
    /* 71CDC 80081CDC 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71CE0 80081CE0 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71CE4 80081CE4 A583000C */  jal        DBG_Error
    /* 71CE8 80081CE8 33010624 */   addiu     $a2, $zero, 0x133
  .L80081CEC:
    /* 71CEC 80081CEC DD85000C */  jal        GAL_Lock
    /* 71CF0 80081CF0 21202002 */   addu      $a0, $s1, $zero
    /* 71CF4 80081CF4 21804000 */  addu       $s0, $v0, $zero
    /* 71CF8 80081CF8 06000016 */  bnez       $s0, .L80081D14
    /* 71CFC 80081CFC 00000000 */   nop
    /* 71D00 80081D00 21200000 */  addu       $a0, $zero, $zero
    /* 71D04 80081D04 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71D08 80081D08 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71D0C 80081D0C A583000C */  jal        DBG_Error
    /* 71D10 80081D10 36010624 */   addiu     $a2, $zero, 0x136
  .L80081D14:
    /* 71D14 80081D14 21200002 */  addu       $a0, $s0, $zero
    /* 71D18 80081D18 FF000524 */  addiu      $a1, $zero, 0xFF
    /* 71D1C 80081D1C E940000C */  jal        memset
    /* 71D20 80081D20 58120624 */   addiu     $a2, $zero, 0x1258
    /* 71D24 80081D24 F785000C */  jal        GAL_Unlock
    /* 71D28 80081D28 21202002 */   addu      $a0, $s1, $zero
    /* 71D2C 80081D2C FF004230 */  andi       $v0, $v0, 0xFF
    /* 71D30 80081D30 05004014 */  bnez       $v0, .L80081D48
    /* 71D34 80081D34 21200000 */   addu      $a0, $zero, $zero
    /* 71D38 80081D38 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71D3C 80081D3C 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71D40 80081D40 A583000C */  jal        DBG_Error
    /* 71D44 80081D44 3B010624 */   addiu     $a2, $zero, 0x13B
  .L80081D48:
    /* 71D48 80081D48 040051AE */  sw         $s1, 0x4($s2)
  .L80081D4C:
    /* 71D4C 80081D4C 0400448E */  lw         $a0, 0x4($s2)
    /* 71D50 80081D50 DD85000C */  jal        GAL_Lock
    /* 71D54 80081D54 00000000 */   nop
    /* 71D58 80081D58 21804000 */  addu       $s0, $v0, $zero
    /* 71D5C 80081D5C 05000016 */  bnez       $s0, .L80081D74
    /* 71D60 80081D60 21200000 */   addu      $a0, $zero, $zero
    /* 71D64 80081D64 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71D68 80081D68 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71D6C 80081D6C A583000C */  jal        DBG_Error
    /* 71D70 80081D70 43010624 */   addiu     $a2, $zero, 0x143
  .L80081D74:
    /* 71D74 80081D74 0C0050AE */  sw         $s0, 0xC($s2)
    /* 71D78 80081D78 21100002 */  addu       $v0, $s0, $zero
    /* 71D7C 80081D7C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 71D80 80081D80 1800B28F */  lw         $s2, 0x18($sp)
    /* 71D84 80081D84 1400B18F */  lw         $s1, 0x14($sp)
    /* 71D88 80081D88 1000B08F */  lw         $s0, 0x10($sp)
    /* 71D8C 80081D8C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 71D90 80081D90 0800E003 */  jr         $ra
    /* 71D94 80081D94 00000000 */   nop
endlabel GetMap__4AMap
