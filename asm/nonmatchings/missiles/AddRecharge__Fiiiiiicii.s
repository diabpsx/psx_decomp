.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddRecharge__Fiiiiiicii, 0xB8

glabel AddRecharge__Fiiiiiicii
    /* 7D80 80141978 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7D84 8014197C 80100400 */  sll        $v0, $a0, 2
    /* 7D88 80141980 21104400 */  addu       $v0, $v0, $a0
    /* 7D8C 80141984 80100200 */  sll        $v0, $v0, 2
    /* 7D90 80141988 23104400 */  subu       $v0, $v0, $a0
    /* 7D94 8014198C 80100200 */  sll        $v0, $v0, 2
    /* 7D98 80141990 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7D9C 80141994 01001124 */  addiu      $s1, $zero, 0x1
    /* 7DA0 80141998 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7DA4 8014199C 3C00B08F */  lw         $s0, 0x3C($sp)
    /* 7DA8 801419A0 1B000524 */  addiu      $a1, $zero, 0x1B
    /* 7DAC 801419A4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 7DB0 801419A8 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 7DB4 801419AC 21082200 */  addu       $at, $at, $v0
    /* 7DB8 801419B0 902C31A0 */  sb         $s1, %lo(missile + 0x38)($at)
    /* 7DBC 801419B4 C2DC010C */  jal        UseMana__Fii
    /* 7DC0 801419B8 21200002 */   addu      $a0, $s0, $zero
    /* 7DC4 801419BC 1280023C */  lui        $v0, %hi(myplr)
    /* 7DC8 801419C0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 7DCC 801419C4 00000000 */  nop
    /* 7DD0 801419C8 13000216 */  bne        $s0, $v0, .L80141A18
    /* 7DD4 801419CC 00000000 */   nop
    /* 7DD8 801419D0 1280023C */  lui        $v0, %hi(sbookflag)
    /* 7DDC 801419D4 C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 7DE0 801419D8 00000000 */  nop
    /* 7DE4 801419DC 03004010 */  beqz       $v0, .L801419EC
    /* 7DE8 801419E0 00000000 */   nop
    /* 7DEC 801419E4 1280013C */  lui        $at, %hi(sbookflag)
    /* 7DF0 801419E8 C6B620A0 */  sb         $zero, %lo(sbookflag)($at)
  .L801419EC:
    /* 7DF4 801419EC 1280023C */  lui        $v0, %hi(invflag)
    /* 7DF8 801419F0 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 7DFC 801419F4 00000000 */  nop
    /* 7E00 801419F8 03004014 */  bnez       $v0, .L80141A08
    /* 7E04 801419FC 00000000 */   nop
    /* 7E08 80141A00 1280013C */  lui        $at, %hi(invflag)
    /* 7E0C 80141A04 2CC331A0 */  sb         $s1, %lo(invflag)($at)
  .L80141A08:
    /* 7E10 80141A08 1280013C */  lui        $at, %hi(options_pad)
    /* 7E14 80141A0C 50B230AC */  sw         $s0, %lo(options_pad)($at)
    /* 7E18 80141A10 01DE000C */  jal        NewCursor__Fi
    /* 7E1C 80141A14 04000424 */   addiu     $a0, $zero, 0x4
  .L80141A18:
    /* 7E20 80141A18 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7E24 80141A1C 1400B18F */  lw         $s1, 0x14($sp)
    /* 7E28 80141A20 1000B08F */  lw         $s0, 0x10($sp)
    /* 7E2C 80141A24 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7E30 80141A28 0800E003 */  jr         $ra
    /* 7E34 80141A2C 00000000 */   nop
endlabel AddRecharge__Fiiiiiicii
