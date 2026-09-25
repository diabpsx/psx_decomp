.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ShieldDur__FP12PlayerStruct, 0xD4

glabel ShieldDur__FP12PlayerStruct
    /* 53904 80063904 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 53908 80063908 2000B0AF */  sw         $s0, 0x20($sp)
    /* 5390C 8006390C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 53910 80063910 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 53914 80063914 21808000 */   addu      $s0, $a0, $zero
    /* 53918 80063918 01004238 */  xori       $v0, $v0, 0x1
    /* 5391C 8006391C 29004014 */  bnez       $v0, .L800639C4
    /* 53920 80063920 05000224 */   addiu     $v0, $zero, 0x5
    /* 53924 80063924 8C030386 */  lh         $v1, 0x38C($s0)
    /* 53928 80063928 00000000 */  nop
    /* 5392C 8006392C 11006214 */  bne        $v1, $v0, .L80063974
    /* 53930 80063930 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 53934 80063934 9E030386 */  lh         $v1, 0x39E($s0)
    /* 53938 80063938 00000000 */  nop
    /* 5393C 8006393C 21006210 */  beq        $v1, $v0, .L800639C4
    /* 53940 80063940 21206000 */   addu      $a0, $v1, $zero
    /* 53944 80063944 FFFF8224 */  addiu      $v0, $a0, -0x1
    /* 53948 80063948 9E0302A6 */  sh         $v0, 0x39E($s0)
    /* 5394C 8006394C 00140200 */  sll        $v0, $v0, 16
    /* 53950 80063950 08004014 */  bnez       $v0, .L80063974
    /* 53954 80063954 01000424 */   addiu     $a0, $zero, 0x1
    /* 53958 80063958 663F010C */  jal        NetSendCmdDelItem__FUcUc
    /* 5395C 8006395C 04000524 */   addiu     $a1, $zero, 0x4
    /* 53960 80063960 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 53964 80063964 8C0302A6 */  sh         $v0, 0x38C($s0)
    /* 53968 80063968 21200002 */  addu       $a0, $s0, $zero
    /* 5396C 8006396C 209A010C */  jal        CalcPlrInv__FP12PlayerStructUc
    /* 53970 80063970 01000524 */   addiu     $a1, $zero, 0x1
  .L80063974:
    /* 53974 80063974 F8030386 */  lh         $v1, 0x3F8($s0)
    /* 53978 80063978 05000224 */  addiu      $v0, $zero, 0x5
    /* 5397C 8006397C 11006214 */  bne        $v1, $v0, .L800639C4
    /* 53980 80063980 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 53984 80063984 0A040386 */  lh         $v1, 0x40A($s0)
    /* 53988 80063988 00000000 */  nop
    /* 5398C 8006398C 0D006210 */  beq        $v1, $v0, .L800639C4
    /* 53990 80063990 21206000 */   addu      $a0, $v1, $zero
    /* 53994 80063994 FFFF8224 */  addiu      $v0, $a0, -0x1
    /* 53998 80063998 0A0402A6 */  sh         $v0, 0x40A($s0)
    /* 5399C 8006399C 00140200 */  sll        $v0, $v0, 16
    /* 539A0 800639A0 08004014 */  bnez       $v0, .L800639C4
    /* 539A4 800639A4 01000424 */   addiu     $a0, $zero, 0x1
    /* 539A8 800639A8 663F010C */  jal        NetSendCmdDelItem__FUcUc
    /* 539AC 800639AC 05000524 */   addiu     $a1, $zero, 0x5
    /* 539B0 800639B0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 539B4 800639B4 F80302A6 */  sh         $v0, 0x3F8($s0)
    /* 539B8 800639B8 21200002 */  addu       $a0, $s0, $zero
    /* 539BC 800639BC 209A010C */  jal        CalcPlrInv__FP12PlayerStructUc
    /* 539C0 800639C0 01000524 */   addiu     $a1, $zero, 0x1
  .L800639C4:
    /* 539C4 800639C4 2400BF8F */  lw         $ra, 0x24($sp)
    /* 539C8 800639C8 2000B08F */  lw         $s0, 0x20($sp)
    /* 539CC 800639CC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 539D0 800639D0 0800E003 */  jr         $ra
    /* 539D4 800639D4 00000000 */   nop
endlabel ShieldDur__FP12PlayerStruct
