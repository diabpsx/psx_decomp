.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncPortals__Fv, 0x154

glabel SyncPortals__Fv
    /* 70FE8 80080FE8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 70FEC 80080FEC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 70FF0 80080FF0 21880000 */  addu       $s1, $zero, $zero
    /* 70FF4 80080FF4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 70FF8 80080FF8 BFFF1224 */  addiu      $s2, $zero, -0x41
    /* 70FFC 80080FFC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 71000 80081000 21800000 */  addu       $s0, $zero, $zero
    /* 71004 80081004 1C00BFAF */  sw         $ra, 0x1C($sp)
  .L80081008:
    /* 71008 80081008 0400222A */  slti       $v0, $s1, 0x4
    /* 7100C 8008100C 44004010 */  beqz       $v0, .L80081120
    /* 71010 80081010 00000000 */   nop
    /* 71014 80081014 0E80013C */  lui        $at, %hi(portal + 0x8)
    /* 71018 80081018 21083000 */  addu       $at, $at, $s0
    /* 7101C 8008101C F43B2290 */  lbu        $v0, %lo(portal + 0x8)($at)
    /* 71020 80081020 00000000 */  nop
    /* 71024 80081024 3B004010 */  beqz       $v0, .L80081114
    /* 71028 80081028 00000000 */   nop
    /* 7102C 8008102C 1280043C */  lui        $a0, %hi(currlevel)
    /* 71030 80081030 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 71034 80081034 00000000 */  nop
    /* 71038 80081038 20008014 */  bnez       $a0, .L800810BC
    /* 7103C 8008103C 21300000 */   addu      $a2, $zero, $zero
    /* 71040 80081040 21280000 */  addu       $a1, $zero, $zero
  .L80081044:
    /* 71044 80081044 7000C228 */  slti       $v0, $a2, 0x70
    /* 71048 80081048 13004010 */  beqz       $v0, .L80081098
    /* 7104C 8008104C 21200000 */   addu      $a0, $zero, $zero
    /* 71050 80081050 2118A000 */  addu       $v1, $a1, $zero
  .L80081054:
    /* 71054 80081054 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 71058 80081058 21082300 */  addu       $at, $at, $v1
    /* 7105C 8008105C 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 71060 80081060 01008424 */  addiu      $a0, $a0, 0x1
    /* 71064 80081064 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 71068 80081068 21082300 */  addu       $at, $at, $v1
    /* 7106C 8008106C 2D7A20A0 */  sb         $zero, %lo(dung_map + 0x5)($at)
    /* 71070 80081070 24105200 */  and        $v0, $v0, $s2
    /* 71074 80081074 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 71078 80081078 21082300 */  addu       $at, $at, $v1
    /* 7107C 8008107C 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 71080 80081080 70008228 */  slti       $v0, $a0, 0x70
    /* 71084 80081084 F3FF4014 */  bnez       $v0, .L80081054
    /* 71088 80081088 08006324 */   addiu     $v1, $v1, 0x8
    /* 7108C 8008108C 8003A524 */  addiu      $a1, $a1, 0x380
    /* 71090 80081090 11040208 */  j          .L80081044
    /* 71094 80081094 0100C624 */   addiu     $a2, $a2, 0x1
  .L80081098:
    /* 71098 80081098 80101100 */  sll        $v0, $s1, 2
    /* 7109C 8008109C 0E80013C */  lui        $at, %hi(D_800E3BCC)
    /* 710A0 800810A0 21082200 */  addu       $at, $at, $v0
    /* 710A4 800810A4 CC3B258C */  lw         $a1, %lo(D_800E3BCC)($at)
    /* 710A8 800810A8 0E80013C */  lui        $at, %hi(D_800E3BDC)
    /* 710AC 800810AC 21082200 */  addu       $at, $at, $v0
    /* 710B0 800810B0 DC3B268C */  lw         $a2, %lo(D_800E3BDC)($at)
    /* 710B4 800810B4 43040208 */  j          .L8008110C
    /* 710B8 800810B8 00000000 */   nop
  .L800810BC:
    /* 710BC 800810BC 0E80013C */  lui        $at, %hi(portal + 0x9)
    /* 710C0 800810C0 21083000 */  addu       $at, $at, $s0
    /* 710C4 800810C4 F53B2390 */  lbu        $v1, %lo(portal + 0x9)($at)
    /* 710C8 800810C8 1280023C */  lui        $v0, %hi(setlevel)
    /* 710CC 800810CC 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 710D0 800810D0 00000000 */  nop
    /* 710D4 800810D4 0F006214 */  bne        $v1, $v0, .L80081114
    /* 710D8 800810D8 00000000 */   nop
    /* 710DC 800810DC 0E80013C */  lui        $at, %hi(portal + 0x6)
    /* 710E0 800810E0 21083000 */  addu       $at, $at, $s0
    /* 710E4 800810E4 F23B2280 */  lb         $v0, %lo(portal + 0x6)($at)
    /* 710E8 800810E8 00000000 */  nop
    /* 710EC 800810EC 09004414 */  bne        $v0, $a0, .L80081114
    /* 710F0 800810F0 00000000 */   nop
    /* 710F4 800810F4 0E80013C */  lui        $at, %hi(portal + 0x4)
    /* 710F8 800810F8 21083000 */  addu       $at, $at, $s0
    /* 710FC 800810FC F03B2580 */  lb         $a1, %lo(portal + 0x4)($at)
    /* 71100 80081100 0E80013C */  lui        $at, %hi(portal + 0x5)
    /* 71104 80081104 21083000 */  addu       $at, $at, $s0
    /* 71108 80081108 F13B2680 */  lb         $a2, %lo(portal + 0x5)($at)
  .L8008110C:
    /* 7110C 8008110C BE03020C */  jal        AddWarpMissile__Fiii
    /* 71110 80081110 21202002 */   addu      $a0, $s1, $zero
  .L80081114:
    /* 71114 80081114 0C001026 */  addiu      $s0, $s0, 0xC
    /* 71118 80081118 02040208 */  j          .L80081008
    /* 7111C 8008111C 01003126 */   addiu     $s1, $s1, 0x1
  .L80081120:
    /* 71120 80081120 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 71124 80081124 1800B28F */  lw         $s2, 0x18($sp)
    /* 71128 80081128 1400B18F */  lw         $s1, 0x14($sp)
    /* 7112C 8008112C 1000B08F */  lw         $s0, 0x10($sp)
    /* 71130 80081130 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 71134 80081134 0800E003 */  jr         $ra
    /* 71138 80081138 00000000 */   nop
endlabel SyncPortals__Fv
