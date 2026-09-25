.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateLazStand__Fii, 0x184

glabel OperateLazStand__Fii
    /* 4D8AC 8005D8AC 1280023C */  lui        $v0, %hi(numitems)
    /* 4D8B0 8005D8B0 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 4D8B4 8005D8B4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 4D8B8 8005D8B8 2000B0AF */  sw         $s0, 0x20($sp)
    /* 4D8BC 8005D8BC 2180A000 */  addu       $s0, $a1, $zero
    /* 4D8C0 8005D8C0 7F004228 */  slti       $v0, $v0, 0x7F
    /* 4D8C4 8005D8C4 10004014 */  bnez       $v0, .L8005D908
    /* 4D8C8 8005D8C8 2400BFAF */   sw        $ra, 0x24($sp)
    /* 4D8CC 8005D8CC 40101000 */  sll        $v0, $s0, 1
    /* 4D8D0 8005D8D0 21105000 */  addu       $v0, $v0, $s0
    /* 4D8D4 8005D8D4 80100200 */  sll        $v0, $v0, 2
    /* 4D8D8 8005D8D8 23105000 */  subu       $v0, $v0, $s0
    /* 4D8DC 8005D8DC 80100200 */  sll        $v0, $v0, 2
    /* 4D8E0 8005D8E0 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D8E4 8005D8E4 21082200 */  addu       $at, $at, $v0
    /* 4D8E8 8005D8E8 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4D8EC 8005D8EC 00000000 */  nop
    /* 4D8F0 8005D8F0 05004010 */  beqz       $v0, .L8005D908
    /* 4D8F4 8005D8F4 00000000 */   nop
    /* 4D8F8 8005D8F8 C6F5000C */  jal        PlaySFX__Fi
    /* 4D8FC 8005D8FC D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 4D900 8005D900 87760108 */  j          .L8005DA1C
    /* 4D904 8005D904 00000000 */   nop
  .L8005D908:
    /* 4D908 8005D908 1280023C */  lui        $v0, %hi(deltaload)
    /* 4D90C 8005D90C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4D910 8005D910 00000000 */  nop
    /* 4D914 8005D914 11004010 */  beqz       $v0, .L8005D95C
    /* 4D918 8005D918 40101000 */   sll       $v0, $s0, 1
    /* 4D91C 8005D91C 21105000 */  addu       $v0, $v0, $s0
    /* 4D920 8005D920 80100200 */  sll        $v0, $v0, 2
    /* 4D924 8005D924 23105000 */  subu       $v0, $v0, $s0
    /* 4D928 8005D928 80100200 */  sll        $v0, $v0, 2
    /* 4D92C 8005D92C 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4D930 8005D930 21082200 */  addu       $at, $at, $v0
    /* 4D934 8005D934 6D8C2390 */  lbu        $v1, %lo(object + 0x21)($at)
    /* 4D938 8005D938 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D93C 8005D93C 21082200 */  addu       $at, $at, $v0
    /* 4D940 8005D940 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4D944 8005D944 01006324 */  addiu      $v1, $v1, 0x1
    /* 4D948 8005D948 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4D94C 8005D94C 21082200 */  addu       $at, $at, $v0
    /* 4D950 8005D950 6D8C23A0 */  sb         $v1, %lo(object + 0x21)($at)
    /* 4D954 8005D954 87760108 */  j          .L8005DA1C
    /* 4D958 8005D958 00000000 */   nop
  .L8005D95C:
    /* 4D95C 8005D95C 21105000 */  addu       $v0, $v0, $s0
    /* 4D960 8005D960 80100200 */  sll        $v0, $v0, 2
    /* 4D964 8005D964 23105000 */  subu       $v0, $v0, $s0
    /* 4D968 8005D968 80180200 */  sll        $v1, $v0, 2
    /* 4D96C 8005D96C 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D970 8005D970 21082300 */  addu       $at, $at, $v1
    /* 4D974 8005D974 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4D978 8005D978 00000000 */  nop
    /* 4D97C 8005D97C 27004010 */  beqz       $v0, .L8005DA1C
    /* 4D980 8005D980 00000000 */   nop
    /* 4D984 8005D984 1280023C */  lui        $v0, %hi(qtextflag)
    /* 4D988 8005D988 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 4D98C 8005D98C 00000000 */  nop
    /* 4D990 8005D990 22004014 */  bnez       $v0, .L8005DA1C
    /* 4D994 8005D994 00000000 */   nop
    /* 4D998 8005D998 1280023C */  lui        $v0, %hi(myplr)
    /* 4D99C 8005D99C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4D9A0 8005D9A0 00000000 */  nop
    /* 4D9A4 8005D9A4 1D008214 */  bne        $a0, $v0, .L8005DA1C
    /* 4D9A8 8005D9A8 1800A627 */   addiu     $a2, $sp, 0x18
    /* 4D9AC 8005D9AC 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4D9B0 8005D9B0 21082300 */  addu       $at, $at, $v1
    /* 4D9B4 8005D9B4 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4D9B8 8005D9B8 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4D9BC 8005D9BC 21082300 */  addu       $at, $at, $v1
    /* 4D9C0 8005D9C0 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4D9C4 8005D9C4 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4D9C8 8005D9C8 21082300 */  addu       $at, $at, $v1
    /* 4D9CC 8005D9CC 6D8C2290 */  lbu        $v0, %lo(object + 0x21)($at)
    /* 4D9D0 8005D9D0 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D9D4 8005D9D4 21082300 */  addu       $at, $at, $v1
    /* 4D9D8 8005D9D8 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4D9DC 8005D9DC 01004224 */  addiu      $v0, $v0, 0x1
    /* 4D9E0 8005D9E0 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4D9E4 8005D9E4 21082300 */  addu       $at, $at, $v1
    /* 4D9E8 8005D9E8 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 4D9EC 8005D9EC 7F02010C */  jal        GetSuperItemLoc__FiiRiT2
    /* 4D9F0 8005D9F0 1C00A727 */   addiu     $a3, $sp, 0x1C
    /* 4D9F4 8005D9F4 21000424 */  addiu      $a0, $zero, 0x21
    /* 4D9F8 8005D9F8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 4D9FC 8005D9FC 1800A58F */  lw         $a1, 0x18($sp)
    /* 4DA00 8005DA00 1C00A68F */  lw         $a2, 0x1C($sp)
    /* 4DA04 8005DA04 8214010C */  jal        SpawnQuestItem__Fiiiii
    /* 4DA08 8005DA08 21380000 */   addu      $a3, $zero, $zero
    /* 4DA0C 8005DA0C 21200000 */  addu       $a0, $zero, $zero
    /* 4DA10 8005DA10 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4DA14 8005DA14 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 4DA18 8005DA18 FFFF0632 */   andi      $a2, $s0, 0xFFFF
  .L8005DA1C:
    /* 4DA1C 8005DA1C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 4DA20 8005DA20 2000B08F */  lw         $s0, 0x20($sp)
    /* 4DA24 8005DA24 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 4DA28 8005DA28 0800E003 */  jr         $ra
    /* 4DA2C 8005DA2C 00000000 */   nop
endlabel OperateLazStand__Fii
