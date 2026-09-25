.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching sound_init__Fv, 0xA8

glabel sound_init__Fv
    /* 2D940 8003D940 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2D944 8003D944 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 2D948 8003D948 A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 2D94C 8003D94C 21200000 */  addu       $a0, $zero, $zero
    /* 2D950 8003D950 0200422C */  sltiu      $v0, $v0, 0x2
    /* 2D954 8003D954 03004014 */  bnez       $v0, .L8003D964
    /* 2D958 8003D958 1000BFAF */   sw        $ra, 0x10($sp)
    /* 2D95C 8003D95C 74F60008 */  j          .L8003D9D0
    /* 2D960 8003D960 70000424 */   addiu     $a0, $zero, 0x70
  .L8003D964:
    /* 2D964 8003D964 1280033C */  lui        $v1, %hi(myplr)
    /* 2D968 8003D968 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2D96C 8003D96C 00000000 */  nop
    /* 2D970 8003D970 40100300 */  sll        $v0, $v1, 1
    /* 2D974 8003D974 21104300 */  addu       $v0, $v0, $v1
    /* 2D978 8003D978 80100200 */  sll        $v0, $v0, 2
    /* 2D97C 8003D97C 21104300 */  addu       $v0, $v0, $v1
    /* 2D980 8003D980 00110200 */  sll        $v0, $v0, 4
    /* 2D984 8003D984 23104300 */  subu       $v0, $v0, $v1
    /* 2D988 8003D988 80100200 */  sll        $v0, $v0, 2
    /* 2D98C 8003D98C 21104300 */  addu       $v0, $v0, $v1
    /* 2D990 8003D990 C0100200 */  sll        $v0, $v0, 3
    /* 2D994 8003D994 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 2D998 8003D998 21082200 */  addu       $at, $at, $v0
    /* 2D99C 8003D99C 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 2D9A0 8003D9A0 00000000 */  nop
    /* 2D9A4 8003D9A4 03006014 */  bnez       $v1, .L8003D9B4
    /* 2D9A8 8003D9A8 01000224 */   addiu     $v0, $zero, 0x1
    /* 2D9AC 8003D9AC 74F60008 */  j          .L8003D9D0
    /* 2D9B0 8003D9B0 20000424 */   addiu     $a0, $zero, 0x20
  .L8003D9B4:
    /* 2D9B4 8003D9B4 03006214 */  bne        $v1, $v0, .L8003D9C4
    /* 2D9B8 8003D9B8 02000224 */   addiu     $v0, $zero, 0x2
    /* 2D9BC 8003D9BC 74F60008 */  j          .L8003D9D0
    /* 2D9C0 8003D9C0 10000424 */   addiu     $a0, $zero, 0x10
  .L8003D9C4:
    /* 2D9C4 8003D9C4 02006214 */  bne        $v1, $v0, .L8003D9D0
    /* 2D9C8 8003D9C8 00000000 */   nop
    /* 2D9CC 8003D9CC 40000424 */  addiu      $a0, $zero, 0x40
  .L8003D9D0:
    /* 2D9D0 8003D9D0 3FF6000C */  jal        priv_sound_init__FUc
    /* 2D9D4 8003D9D4 00000000 */   nop
    /* 2D9D8 8003D9D8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2D9DC 8003D9DC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2D9E0 8003D9E0 0800E003 */  jr         $ra
    /* 2D9E4 8003D9E4 00000000 */   nop
endlabel sound_init__Fv
