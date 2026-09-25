.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ML_SetList__Fii, 0xB0

glabel ML_SetList__Fii
    /* 6D748 8007D748 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6D74C 8007D74C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6D750 8007D750 2188A000 */  addu       $s1, $a1, $zero
    /* 6D754 8007D754 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6D758 8007D758 FFFF9024 */  addiu      $s0, $a0, -0x1
    /* 6D75C 8007D75C 1000022E */  sltiu      $v0, $s0, 0x10
    /* 6D760 8007D760 06004014 */  bnez       $v0, .L8007D77C
    /* 6D764 8007D764 1800BFAF */   sw        $ra, 0x18($sp)
    /* 6D768 8007D768 21200000 */  addu       $a0, $zero, $zero
    /* 6D76C 8007D76C 1280053C */  lui        $a1, %hi(D_80118D78)
    /* 6D770 8007D770 788DA524 */  addiu      $a1, $a1, %lo(D_80118D78)
    /* 6D774 8007D774 A583000C */  jal        DBG_Error
    /* 6D778 8007D778 8B000624 */   addiu     $a2, $zero, 0x8B
  .L8007D77C:
    /* 6D77C 8007D77C C0101000 */  sll        $v0, $s0, 3
    /* 6D780 8007D780 0B80013C */  lui        $at, %hi(AllLevels)
    /* 6D784 8007D784 21082200 */  addu       $at, $at, $v0
    /* 6D788 8007D788 5875228C */  lw         $v0, %lo(AllLevels)($at)
    /* 6D78C 8007D78C 00000000 */  nop
    /* 6D790 8007D790 2A102202 */  slt        $v0, $s1, $v0
    /* 6D794 8007D794 05004014 */  bnez       $v0, .L8007D7AC
    /* 6D798 8007D798 21200000 */   addu      $a0, $zero, $zero
    /* 6D79C 8007D79C 1280053C */  lui        $a1, %hi(D_80118D78)
    /* 6D7A0 8007D7A0 788DA524 */  addiu      $a1, $a1, %lo(D_80118D78)
    /* 6D7A4 8007D7A4 A583000C */  jal        DBG_Error
    /* 6D7A8 8007D7A8 90000624 */   addiu     $a2, $zero, 0x90
  .L8007D7AC:
    /* 6D7AC 8007D7AC 1280023C */  lui        $v0, %hi(setlevel)
    /* 6D7B0 8007D7B0 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 6D7B4 8007D7B4 00000000 */  nop
    /* 6D7B8 8007D7B8 06004014 */  bnez       $v0, .L8007D7D4
    /* 6D7BC 8007D7BC 21102002 */   addu      $v0, $s1, $zero
    /* 6D7C0 8007D7C0 0E80013C */  lui        $at, %hi(MlTab)
    /* 6D7C4 8007D7C4 21083000 */  addu       $at, $at, $s0
    /* 6D7C8 8007D7C8 C43931A0 */  sb         $s1, %lo(MlTab)($at)
    /* 6D7CC 8007D7CC F8F50108 */  j          .L8007D7E0
    /* 6D7D0 8007D7D0 00000000 */   nop
  .L8007D7D4:
    /* 6D7D4 8007D7D4 0E80013C */  lui        $at, %hi(QlTab)
    /* 6D7D8 8007D7D8 21083000 */  addu       $at, $at, $s0
    /* 6D7DC 8007D7DC D43931A0 */  sb         $s1, %lo(QlTab)($at)
  .L8007D7E0:
    /* 6D7E0 8007D7E0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6D7E4 8007D7E4 1400B18F */  lw         $s1, 0x14($sp)
    /* 6D7E8 8007D7E8 1000B08F */  lw         $s0, 0x10($sp)
    /* 6D7EC 8007D7EC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6D7F0 8007D7F0 0800E003 */  jr         $ra
    /* 6D7F4 8007D7F4 00000000 */   nop
endlabel ML_SetList__Fii
