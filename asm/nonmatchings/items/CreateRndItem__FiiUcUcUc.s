.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateRndItem__FiiUcUcUc, 0x148

glabel CreateRndItem__FiiUcUcUc
    /* 34BD8 80044BD8 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 34BDC 80044BDC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 34BE0 80044BE0 21808000 */  addu       $s0, $a0, $zero
    /* 34BE4 80044BE4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 34BE8 80044BE8 2198A000 */  addu       $s3, $a1, $zero
    /* 34BEC 80044BEC 3000B4AF */  sw         $s4, 0x30($sp)
    /* 34BF0 80044BF0 21A0C000 */  addu       $s4, $a2, $zero
    /* 34BF4 80044BF4 3800B6AF */  sw         $s6, 0x38($sp)
    /* 34BF8 80044BF8 21B0E000 */  addu       $s6, $a3, $zero
    /* 34BFC 80044BFC 3400B5AF */  sw         $s5, 0x34($sp)
    /* 34C00 80044C00 5000B593 */  lbu        $s5, 0x50($sp)
    /* 34C04 80044C04 FF008232 */  andi       $v0, $s4, 0xFF
    /* 34C08 80044C08 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 34C0C 80044C0C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 34C10 80044C10 05004010 */  beqz       $v0, .L80044C28
    /* 34C14 80044C14 2400B1AF */   sw        $s1, 0x24($sp)
    /* 34C18 80044C18 250E010C */  jal        RndUItem__Fi
    /* 34C1C 80044C1C FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 34C20 80044C20 0D130108 */  j          .L80044C34
    /* 34C24 80044C24 21904000 */   addu      $s2, $v0, $zero
  .L80044C28:
    /* 34C28 80044C28 B70E010C */  jal        RndAllItems__Fv
    /* 34C2C 80044C2C 00000000 */   nop
    /* 34C30 80044C30 21904000 */  addu       $s2, $v0, $zero
  .L80044C34:
    /* 34C34 80044C34 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 34C38 80044C38 00000000 */  nop
    /* 34C3C 80044C3C 7F004228 */  slti       $v0, $v0, 0x7F
    /* 34C40 80044C40 2C004010 */  beqz       $v0, .L80044CF4
    /* 34C44 80044C44 21200002 */   addu      $a0, $s0, $zero
    /* 34C48 80044C48 0D80103C */  lui        $s0, %hi(itemavail)
    /* 34C4C 80044C4C D4531026 */  addiu      $s0, $s0, %lo(itemavail)
    /* 34C50 80044C50 00001182 */  lb         $s1, 0x0($s0)
    /* 34C54 80044C54 21286002 */  addu       $a1, $s3, $zero
    /* 34C58 80044C58 2902010C */  jal        GetSuperItemSpace__Fiic
    /* 34C5C 80044C5C 21302002 */   addu      $a2, $s1, $zero
    /* 34C60 80044C60 0811838F */  lw         $v1, %gp_rel(numitems)($gp)
    /* 34C64 80044C64 7E000226 */  addiu      $v0, $s0, 0x7E
    /* 34C68 80044C68 23104300 */  subu       $v0, $v0, $v1
    /* 34C6C 80044C6C 00004290 */  lbu        $v0, 0x0($v0)
    /* 34C70 80044C70 00000000 */  nop
    /* 34C74 80044C74 000002A2 */  sb         $v0, 0x0($s0)
    /* 34C78 80044C78 0D80013C */  lui        $at, %hi(itemactive)
    /* 34C7C 80044C7C 21082300 */  addu       $at, $at, $v1
    /* 34C80 80044C80 545331A0 */  sb         $s1, %lo(itemactive)($at)
    /* 34C84 80044C84 B7F6000C */  jal        GetRndSeed__Fv
    /* 34C88 80044C88 FF00B032 */   andi      $s0, $s5, 0xFF
    /* 34C8C 80044C8C 21202002 */  addu       $a0, $s1, $zero
    /* 34C90 80044C90 21284002 */  addu       $a1, $s2, $zero
    /* 34C94 80044C94 21304000 */  addu       $a2, $v0, $zero
    /* 34C98 80044C98 01000224 */  addiu      $v0, $zero, 0x1
    /* 34C9C 80044C9C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 34CA0 80044CA0 FF008232 */  andi       $v0, $s4, 0xFF
    /* 34CA4 80044CA4 1280073C */  lui        $a3, %hi(currlevel)
    /* 34CA8 80044CA8 0CC1E790 */  lbu        $a3, %lo(currlevel)($a3)
    /* 34CAC 80044CAC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 34CB0 80044CB0 1800A0AF */  sw         $zero, 0x18($sp)
    /* 34CB4 80044CB4 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 34CB8 80044CB8 2411010C */  jal        SetupAllItems__FiiiiiUcUcUc
    /* 34CBC 80044CBC 40380700 */   sll       $a3, $a3, 1
    /* 34CC0 80044CC0 FF00C232 */  andi       $v0, $s6, 0xFF
    /* 34CC4 80044CC4 03004010 */  beqz       $v0, .L80044CD4
    /* 34CC8 80044CC8 21200000 */   addu      $a0, $zero, $zero
    /* 34CCC 80044CCC 723F010C */  jal        NetSendCmdDItem__FUci
    /* 34CD0 80044CD0 21282002 */   addu      $a1, $s1, $zero
  .L80044CD4:
    /* 34CD4 80044CD4 03000012 */  beqz       $s0, .L80044CE4
    /* 34CD8 80044CD8 00000000 */   nop
    /* 34CDC 80044CDC CE3C010C */  jal        DeltaAddItem__Fi
    /* 34CE0 80044CE0 21202002 */   addu      $a0, $s1, $zero
  .L80044CE4:
    /* 34CE4 80044CE4 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 34CE8 80044CE8 00000000 */  nop
    /* 34CEC 80044CEC 01004224 */  addiu      $v0, $v0, 0x1
    /* 34CF0 80044CF0 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
  .L80044CF4:
    /* 34CF4 80044CF4 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 34CF8 80044CF8 3800B68F */  lw         $s6, 0x38($sp)
    /* 34CFC 80044CFC 3400B58F */  lw         $s5, 0x34($sp)
    /* 34D00 80044D00 3000B48F */  lw         $s4, 0x30($sp)
    /* 34D04 80044D04 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 34D08 80044D08 2800B28F */  lw         $s2, 0x28($sp)
    /* 34D0C 80044D0C 2400B18F */  lw         $s1, 0x24($sp)
    /* 34D10 80044D10 2000B08F */  lw         $s0, 0x20($sp)
    /* 34D14 80044D14 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 34D18 80044D18 0800E003 */  jr         $ra
    /* 34D1C 80044D1C 00000000 */   nop
endlabel CreateRndItem__FiiUcUcUc
