.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PM_DoRangeAttack__FP12PlayerStruct, 0x100

glabel PM_DoRangeAttack__FP12PlayerStruct
    /* 53804 80063804 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 53808 80063808 2800B0AF */  sw         $s0, 0x28($sp)
    /* 5380C 8006380C 21808000 */  addu       $s0, $a0, $zero
    /* 53810 80063810 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 53814 80063814 5400038E */  lw         $v1, 0x54($s0)
    /* 53818 80063818 8C01028E */  lw         $v0, 0x18C($s0)
    /* 5381C 8006381C 00000000 */  nop
    /* 53820 80063820 27006214 */  bne        $v1, $v0, .L800638C0
    /* 53824 80063824 00000000 */   nop
    /* 53828 80063828 B819028E */  lw         $v0, 0x19B8($s0)
    /* 5382C 8006382C 00000000 */  nop
    /* 53830 80063830 08004330 */  andi       $v1, $v0, 0x8
    /* 53834 80063834 2B180300 */  sltu       $v1, $zero, $v1
    /* 53838 80063838 23180300 */  negu       $v1, $v1
    /* 5383C 8006383C 1B006830 */  andi       $t0, $v1, 0x1B
    /* 53840 80063840 0002033C */  lui        $v1, (0x2000000 >> 16)
    /* 53844 80063844 24104300 */  and        $v0, $v0, $v1
    /* 53848 80063848 02004010 */  beqz       $v0, .L80063854
    /* 5384C 8006384C 00000000 */   nop
    /* 53850 80063850 38000824 */  addiu      $t0, $zero, 0x38
  .L80063854:
    /* 53854 80063854 0E80023C */  lui        $v0, %hi(plr)
    /* 53858 80063858 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 5385C 8006385C 26100202 */  xor        $v0, $s0, $v0
    /* 53860 80063860 30000486 */  lh         $a0, 0x30($s0)
    /* 53864 80063864 32000586 */  lh         $a1, 0x32($s0)
    /* 53868 80063868 56010686 */  lh         $a2, 0x156($s0)
    /* 5386C 8006386C 58010786 */  lh         $a3, 0x158($s0)
    /* 53870 80063870 42000382 */  lb         $v1, 0x42($s0)
    /* 53874 80063874 2B100200 */  sltu       $v0, $zero, $v0
    /* 53878 80063878 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 5387C 8006387C 04000224 */  addiu      $v0, $zero, 0x4
    /* 53880 80063880 1400A8AF */  sw         $t0, 0x14($sp)
    /* 53884 80063884 1800A0AF */  sw         $zero, 0x18($sp)
    /* 53888 80063888 2000A2AF */  sw         $v0, 0x20($sp)
    /* 5388C 8006388C 2400A0AF */  sw         $zero, 0x24($sp)
    /* 53890 80063890 810A050C */  jal        func_80142A04
    /* 53894 80063894 1000A3AF */   sw        $v1, 0x10($sp)
    /* 53898 80063898 30000586 */  lh         $a1, 0x30($s0)
    /* 5389C 8006389C 32000686 */  lh         $a2, 0x32($s0)
    /* 538A0 800638A0 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 538A4 800638A4 04000424 */   addiu     $a0, $zero, 0x4
    /* 538A8 800638A8 21200002 */  addu       $a0, $s0, $zero
    /* 538AC 800638AC 0A8A010C */  jal        WeaponDur__FP12PlayerStructi
    /* 538B0 800638B0 28000524 */   addiu     $a1, $zero, 0x28
    /* 538B4 800638B4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 538B8 800638B8 07004014 */  bnez       $v0, .L800638D8
    /* 538BC 800638BC 00000000 */   nop
  .L800638C0:
    /* 538C0 800638C0 5400028E */  lw         $v0, 0x54($s0)
    /* 538C4 800638C4 9801038E */  lw         $v1, 0x198($s0)
    /* 538C8 800638C8 00000000 */  nop
    /* 538CC 800638CC 2A104300 */  slt        $v0, $v0, $v1
    /* 538D0 800638D0 07004014 */  bnez       $v0, .L800638F0
    /* 538D4 800638D4 21100000 */   addu      $v0, $zero, $zero
  .L800638D8:
    /* 538D8 800638D8 42000582 */  lb         $a1, 0x42($s0)
    /* 538DC 800638DC 8483010C */  jal        StartStand__FP12PlayerStructi
    /* 538E0 800638E0 21200002 */   addu      $a0, $s0, $zero
    /* 538E4 800638E4 8E7F010C */  jal        ClearPlrPVars__FP12PlayerStruct
    /* 538E8 800638E8 21200002 */   addu      $a0, $s0, $zero
    /* 538EC 800638EC 01000224 */  addiu      $v0, $zero, 0x1
  .L800638F0:
    /* 538F0 800638F0 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 538F4 800638F4 2800B08F */  lw         $s0, 0x28($sp)
    /* 538F8 800638F8 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 538FC 800638FC 0800E003 */  jr         $ra
    /* 53900 80063900 00000000 */   nop
endlabel PM_DoRangeAttack__FP12PlayerStruct
