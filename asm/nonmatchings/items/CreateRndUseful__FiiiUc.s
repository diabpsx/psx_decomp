.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateRndUseful__FiiiUc, 0xC0

glabel CreateRndUseful__FiiiUc
    /* 34E04 80044E04 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 34E08 80044E08 2120A000 */  addu       $a0, $a1, $zero
    /* 34E0C 80044E0C 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 34E10 80044E10 2128C000 */  addu       $a1, $a2, $zero
    /* 34E14 80044E14 1800B2AF */  sw         $s2, 0x18($sp)
    /* 34E18 80044E18 2190E000 */  addu       $s2, $a3, $zero
    /* 34E1C 80044E1C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 34E20 80044E20 1400B1AF */  sw         $s1, 0x14($sp)
    /* 34E24 80044E24 7F004228 */  slti       $v0, $v0, 0x7F
    /* 34E28 80044E28 1F004010 */  beqz       $v0, .L80044EA8
    /* 34E2C 80044E2C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 34E30 80044E30 0D80103C */  lui        $s0, %hi(itemavail)
    /* 34E34 80044E34 D4531026 */  addiu      $s0, $s0, %lo(itemavail)
    /* 34E38 80044E38 00001182 */  lb         $s1, 0x0($s0)
    /* 34E3C 80044E3C 2902010C */  jal        GetSuperItemSpace__Fiic
    /* 34E40 80044E40 21302002 */   addu      $a2, $s1, $zero
    /* 34E44 80044E44 0811838F */  lw         $v1, %gp_rel(numitems)($gp)
    /* 34E48 80044E48 7E000226 */  addiu      $v0, $s0, 0x7E
    /* 34E4C 80044E4C 23104300 */  subu       $v0, $v0, $v1
    /* 34E50 80044E50 00004290 */  lbu        $v0, 0x0($v0)
    /* 34E54 80044E54 00000000 */  nop
    /* 34E58 80044E58 000002A2 */  sb         $v0, 0x0($s0)
    /* 34E5C 80044E5C 0D80013C */  lui        $at, %hi(itemactive)
    /* 34E60 80044E60 21082300 */  addu       $at, $at, $v1
    /* 34E64 80044E64 545331A0 */  sb         $s1, %lo(itemactive)($at)
    /* 34E68 80044E68 B7F6000C */  jal        GetRndSeed__Fv
    /* 34E6C 80044E6C 00000000 */   nop
    /* 34E70 80044E70 21202002 */  addu       $a0, $s1, $zero
    /* 34E74 80044E74 1280063C */  lui        $a2, %hi(currlevel)
    /* 34E78 80044E78 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 34E7C 80044E7C 4813010C */  jal        SetupAllUseful__Fiii
    /* 34E80 80044E80 21284000 */   addu      $a1, $v0, $zero
    /* 34E84 80044E84 FF004232 */  andi       $v0, $s2, 0xFF
    /* 34E88 80044E88 03004010 */  beqz       $v0, .L80044E98
    /* 34E8C 80044E8C 21200000 */   addu      $a0, $zero, $zero
    /* 34E90 80044E90 723F010C */  jal        NetSendCmdDItem__FUci
    /* 34E94 80044E94 21282002 */   addu      $a1, $s1, $zero
  .L80044E98:
    /* 34E98 80044E98 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 34E9C 80044E9C 00000000 */  nop
    /* 34EA0 80044EA0 01004224 */  addiu      $v0, $v0, 0x1
    /* 34EA4 80044EA4 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
  .L80044EA8:
    /* 34EA8 80044EA8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 34EAC 80044EAC 1800B28F */  lw         $s2, 0x18($sp)
    /* 34EB0 80044EB0 1400B18F */  lw         $s1, 0x14($sp)
    /* 34EB4 80044EB4 1000B08F */  lw         $s0, 0x10($sp)
    /* 34EB8 80044EB8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 34EBC 80044EBC 0800E003 */  jr         $ra
    /* 34EC0 80044EC0 00000000 */   nop
endlabel CreateRndUseful__FiiiUc
