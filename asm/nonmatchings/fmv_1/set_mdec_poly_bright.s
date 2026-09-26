.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching set_mdec_poly_bright, 0x68

glabel set_mdec_poly_bright
    /* 1DAE4 801576DC 21480000 */  addu       $t1, $zero, $zero
    /* 1DAE8 801576E0 15800A3C */  lui        $t2, %hi(tmdc_pol)
    /* 1DAEC 801576E4 A44F4A25 */  addiu      $t2, $t2, %lo(tmdc_pol)
    /* 1DAF0 801576E8 21400000 */  addu       $t0, $zero, $zero
  .L801576EC:
    /* 1DAF4 801576EC 21380000 */  addu       $a3, $zero, $zero
    /* 1DAF8 801576F0 21300000 */  addu       $a2, $zero, $zero
  .L801576F4:
    /* 1DAFC 801576F4 21280000 */  addu       $a1, $zero, $zero
    /* 1DB00 801576F8 21180601 */  addu       $v1, $t0, $a2
  .L801576FC:
    /* 1DB04 801576FC 21106A00 */  addu       $v0, $v1, $t2
    /* 1DB08 80157700 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1DB0C 80157704 040044A0 */  sb         $a0, 0x4($v0)
    /* 1DB10 80157708 050044A0 */  sb         $a0, 0x5($v0)
    /* 1DB14 8015770C 060044A0 */  sb         $a0, 0x6($v0)
    /* 1DB18 80157710 0A00A228 */  slti       $v0, $a1, 0xA
    /* 1DB1C 80157714 F9FF4014 */  bnez       $v0, .L801576FC
    /* 1DB20 80157718 28006324 */   addiu     $v1, $v1, 0x28
    /* 1DB24 8015771C 0100E724 */  addiu      $a3, $a3, 0x1
    /* 1DB28 80157720 0200E228 */  slti       $v0, $a3, 0x2
    /* 1DB2C 80157724 F3FF4014 */  bnez       $v0, .L801576F4
    /* 1DB30 80157728 9001C624 */   addiu     $a2, $a2, 0x190
    /* 1DB34 8015772C 01002925 */  addiu      $t1, $t1, 0x1
    /* 1DB38 80157730 02002229 */  slti       $v0, $t1, 0x2
    /* 1DB3C 80157734 EDFF4014 */  bnez       $v0, .L801576EC
    /* 1DB40 80157738 20030825 */   addiu     $t0, $t0, 0x320
    /* 1DB44 8015773C 0800E003 */  jr         $ra
    /* 1DB48 80157740 00000000 */   nop
endlabel set_mdec_poly_bright
