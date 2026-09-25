.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateItem__Fiii, 0x1B8

glabel CreateItem__Fiii
    /* 34A20 80044A20 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 34A24 80044A24 1800B2AF */  sw         $s2, 0x18($sp)
    /* 34A28 80044A28 21908000 */  addu       $s2, $a0, $zero
    /* 34A2C 80044A2C 2120A000 */  addu       $a0, $a1, $zero
    /* 34A30 80044A30 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 34A34 80044A34 2128C000 */  addu       $a1, $a2, $zero
    /* 34A38 80044A38 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 34A3C 80044A3C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 34A40 80044A40 7F004228 */  slti       $v0, $v0, 0x7F
    /* 34A44 80044A44 5D004010 */  beqz       $v0, .L80044BBC
    /* 34A48 80044A48 1000B0AF */   sw        $s0, 0x10($sp)
    /* 34A4C 80044A4C 1280023C */  lui        $v0, %hi(currlevel)
    /* 34A50 80044A50 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 34A54 80044A54 00000000 */  nop
    /* 34A58 80044A58 13004014 */  bnez       $v0, .L80044AA8
    /* 34A5C 80044A5C 0600422A */   slti      $v0, $s2, 0x6
    /* 34A60 80044A60 05004010 */  beqz       $v0, .L80044A78
    /* 34A64 80044A64 0400422A */   slti      $v0, $s2, 0x4
    /* 34A68 80044A68 0F004010 */  beqz       $v0, .L80044AA8
    /* 34A6C 80044A6C 02000224 */   addiu     $v0, $zero, 0x2
    /* 34A70 80044A70 9F120108 */  j          .L80044A7C
    /* 34A74 80044A74 00000000 */   nop
  .L80044A78:
    /* 34A78 80044A78 08000224 */  addiu      $v0, $zero, 0x8
  .L80044A7C:
    /* 34A7C 80044A7C 0A004212 */  beq        $s2, $v0, .L80044AA8
    /* 34A80 80044A80 00000000 */   nop
    /* 34A84 80044A84 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 34A88 80044A88 00000000 */  nop
    /* 34A8C 80044A8C 7B004228 */  slti       $v0, $v0, 0x7B
    /* 34A90 80044A90 05004010 */  beqz       $v0, .L80044AA8
    /* 34A94 80044A94 00000000 */   nop
    /* 34A98 80044A98 C6F5000C */  jal        PlaySFX__Fi
    /* 34A9C 80044A9C D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 34AA0 80044AA0 EF120108 */  j          .L80044BBC
    /* 34AA4 80044AA4 00000000 */   nop
  .L80044AA8:
    /* 34AA8 80044AA8 0D80103C */  lui        $s0, %hi(itemavail)
    /* 34AAC 80044AAC D4531026 */  addiu      $s0, $s0, %lo(itemavail)
    /* 34AB0 80044AB0 00001182 */  lb         $s1, 0x0($s0)
    /* 34AB4 80044AB4 2902010C */  jal        GetSuperItemSpace__Fiic
    /* 34AB8 80044AB8 21302002 */   addu      $a2, $s1, $zero
    /* 34ABC 80044ABC 7E000326 */  addiu      $v1, $s0, 0x7E
    /* 34AC0 80044AC0 80101200 */  sll        $v0, $s2, 2
    /* 34AC4 80044AC4 21105200 */  addu       $v0, $v0, $s2
    /* 34AC8 80044AC8 80100200 */  sll        $v0, $v0, 2
    /* 34ACC 80044ACC 21105200 */  addu       $v0, $v0, $s2
    /* 34AD0 80044AD0 80100200 */  sll        $v0, $v0, 2
    /* 34AD4 80044AD4 0811858F */  lw         $a1, %gp_rel(numitems)($gp)
    /* 34AD8 80044AD8 1180043C */  lui        $a0, %hi(AllItemsList + 0x5)
    /* 34ADC 80044ADC A9138480 */  lb         $a0, %lo(AllItemsList + 0x5)($a0)
    /* 34AE0 80044AE0 1180013C */  lui        $at, %hi(UniqueItemList + 0x4)
    /* 34AE4 80044AE4 21082200 */  addu       $at, $at, $v0
    /* 34AE8 80044AE8 68432280 */  lb         $v0, %lo(UniqueItemList + 0x4)($at)
    /* 34AEC 80044AEC 23186500 */  subu       $v1, $v1, $a1
    /* 34AF0 80044AF0 00006390 */  lbu        $v1, 0x0($v1)
    /* 34AF4 80044AF4 00000000 */  nop
    /* 34AF8 80044AF8 000003A2 */  sb         $v1, 0x0($s0)
    /* 34AFC 80044AFC 0D80013C */  lui        $at, %hi(itemactive)
    /* 34B00 80044B00 21082500 */  addu       $at, $at, $a1
    /* 34B04 80044B04 545331A0 */  sb         $s1, %lo(itemactive)($at)
    /* 34B08 80044B08 0A008210 */  beq        $a0, $v0, .L80044B34
    /* 34B0C 80044B0C 21380000 */   addu      $a3, $zero, $zero
    /* 34B10 80044B10 21204000 */  addu       $a0, $v0, $zero
    /* 34B14 80044B14 21180000 */  addu       $v1, $zero, $zero
  .L80044B18:
    /* 34B18 80044B18 20006324 */  addiu      $v1, $v1, 0x20
    /* 34B1C 80044B1C 1180013C */  lui        $at, %hi(AllItemsList + 0x5)
    /* 34B20 80044B20 21082300 */  addu       $at, $at, $v1
    /* 34B24 80044B24 A9132280 */  lb         $v0, %lo(AllItemsList + 0x5)($at)
    /* 34B28 80044B28 00000000 */  nop
    /* 34B2C 80044B2C FAFF4414 */  bne        $v0, $a0, .L80044B18
    /* 34B30 80044B30 0100E724 */   addiu     $a3, $a3, 0x1
  .L80044B34:
    /* 34B34 80044B34 21202002 */  addu       $a0, $s1, $zero
    /* 34B38 80044B38 1280063C */  lui        $a2, %hi(currlevel)
    /* 34B3C 80044B3C 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 34B40 80044B40 A704010C */  jal        GetItemAttrs__Fiii
    /* 34B44 80044B44 2128E000 */   addu      $a1, $a3, $zero
    /* 34B48 80044B48 21202002 */  addu       $a0, $s1, $zero
    /* 34B4C 80044B4C D50F010C */  jal        GetUniqueItem__Fii
    /* 34B50 80044B50 21284002 */   addu      $a1, $s2, $zero
    /* 34B54 80044B54 4C0D010C */  jal        SetupItem__Fi
    /* 34B58 80044B58 21202002 */   addu      $a0, $s1, $zero
    /* 34B5C 80044B5C C0101100 */  sll        $v0, $s1, 3
    /* 34B60 80044B60 23105100 */  subu       $v0, $v0, $s1
    /* 34B64 80044B64 80100200 */  sll        $v0, $v0, 2
    /* 34B68 80044B68 23105100 */  subu       $v0, $v0, $s1
    /* 34B6C 80044B6C 80100200 */  sll        $v0, $v0, 2
    /* 34B70 80044B70 02000324 */  addiu      $v1, $zero, 0x2
    /* 34B74 80044B74 0D80013C */  lui        $at, %hi(item + 0x51)
    /* 34B78 80044B78 21082200 */  addu       $at, $at, $v0
    /* 34B7C 80044B7C A51D23A0 */  sb         $v1, %lo(item + 0x51)($at)
    /* 34B80 80044B80 1280023C */  lui        $v0, %hi(deltaload)
    /* 34B84 80044B84 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 34B88 80044B88 00000000 */  nop
    /* 34B8C 80044B8C 07004014 */  bnez       $v0, .L80044BAC
    /* 34B90 80044B90 07000224 */   addiu     $v0, $zero, 0x7
    /* 34B94 80044B94 05004212 */  beq        $s2, $v0, .L80044BAC
    /* 34B98 80044B98 03000224 */   addiu     $v0, $zero, 0x3
    /* 34B9C 80044B9C 03004212 */  beq        $s2, $v0, .L80044BAC
    /* 34BA0 80044BA0 21200000 */   addu      $a0, $zero, $zero
    /* 34BA4 80044BA4 723F010C */  jal        NetSendCmdDItem__FUci
    /* 34BA8 80044BA8 21282002 */   addu      $a1, $s1, $zero
  .L80044BAC:
    /* 34BAC 80044BAC 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 34BB0 80044BB0 00000000 */  nop
    /* 34BB4 80044BB4 01004224 */  addiu      $v0, $v0, 0x1
    /* 34BB8 80044BB8 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
  .L80044BBC:
    /* 34BBC 80044BBC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 34BC0 80044BC0 1800B28F */  lw         $s2, 0x18($sp)
    /* 34BC4 80044BC4 1400B18F */  lw         $s1, 0x14($sp)
    /* 34BC8 80044BC8 1000B08F */  lw         $s0, 0x10($sp)
    /* 34BCC 80044BCC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 34BD0 80044BD0 0800E003 */  jr         $ra
    /* 34BD4 80044BD4 00000000 */   nop
endlabel CreateItem__Fiii
