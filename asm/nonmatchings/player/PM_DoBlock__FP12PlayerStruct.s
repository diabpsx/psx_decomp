.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PM_DoBlock__FP12PlayerStruct, 0x9C

glabel PM_DoBlock__FP12PlayerStruct
    /* 539D8 800639D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 539DC 800639DC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 539E0 800639E0 21808000 */  addu       $s0, $a0, $zero
    /* 539E4 800639E4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 539E8 800639E8 B819028E */  lw         $v0, 0x19B8($s0)
    /* 539EC 800639EC 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* 539F0 800639F0 24104300 */  and        $v0, $v0, $v1
    /* 539F4 800639F4 08004010 */  beqz       $v0, .L80063A18
    /* 539F8 800639F8 01000224 */   addiu     $v0, $zero, 0x1
    /* 539FC 800639FC 5400038E */  lw         $v1, 0x54($s0)
    /* 53A00 80063A00 00000000 */  nop
    /* 53A04 80063A04 04006210 */  beq        $v1, $v0, .L80063A18
    /* 53A08 80063A08 00000000 */   nop
    /* 53A0C 80063A0C AC01028E */  lw         $v0, 0x1AC($s0)
    /* 53A10 80063A10 00000000 */  nop
    /* 53A14 80063A14 540002AE */  sw         $v0, 0x54($s0)
  .L80063A18:
    /* 53A18 80063A18 5400028E */  lw         $v0, 0x54($s0)
    /* 53A1C 80063A1C AC01038E */  lw         $v1, 0x1AC($s0)
    /* 53A20 80063A20 00000000 */  nop
    /* 53A24 80063A24 2A104300 */  slt        $v0, $v0, $v1
    /* 53A28 80063A28 0D004014 */  bnez       $v0, .L80063A60
    /* 53A2C 80063A2C 21100000 */   addu      $v0, $zero, $zero
    /* 53A30 80063A30 42000582 */  lb         $a1, 0x42($s0)
    /* 53A34 80063A34 8483010C */  jal        StartStand__FP12PlayerStructi
    /* 53A38 80063A38 21200002 */   addu      $a0, $s0, $zero
    /* 53A3C 80063A3C 8E7F010C */  jal        ClearPlrPVars__FP12PlayerStruct
    /* 53A40 80063A40 21200002 */   addu      $a0, $s0, $zero
    /* 53A44 80063A44 C9F6000C */  jal        ENG_random__Fl
    /* 53A48 80063A48 0A000424 */   addiu     $a0, $zero, 0xA
    /* 53A4C 80063A4C 04004014 */  bnez       $v0, .L80063A60
    /* 53A50 80063A50 01000224 */   addiu     $v0, $zero, 0x1
    /* 53A54 80063A54 418E010C */  jal        ShieldDur__FP12PlayerStruct
    /* 53A58 80063A58 21200002 */   addu      $a0, $s0, $zero
    /* 53A5C 80063A5C 01000224 */  addiu      $v0, $zero, 0x1
  .L80063A60:
    /* 53A60 80063A60 1400BF8F */  lw         $ra, 0x14($sp)
    /* 53A64 80063A64 1000B08F */  lw         $s0, 0x10($sp)
    /* 53A68 80063A68 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 53A6C 80063A6C 0800E003 */  jr         $ra
    /* 53A70 80063A70 00000000 */   nop
endlabel PM_DoBlock__FP12PlayerStruct
