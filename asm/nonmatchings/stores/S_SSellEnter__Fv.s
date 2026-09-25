.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_SSellEnter__Fv, 0x110

glabel S_SSellEnter__Fv
    /* 61D44 80071D44 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 61D48 80071D48 03000224 */  addiu      $v0, $zero, 0x3
    /* 61D4C 80071D4C 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 61D50 80071D50 1C21828F */  lw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 61D54 80071D54 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 61D58 80071D58 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 61D5C 80071D5C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 61D60 80071D60 23106200 */  subu       $v0, $v1, $v0
    /* 61D64 80071D64 082183AF */  sw         $v1, %gp_rel(D_8011C888)($gp)
    /* 61D68 80071D68 102184AF */  sw         $a0, %gp_rel(D_8011C890)($gp)
    /* 61D6C 80071D6C 02004104 */  bgez       $v0, .L80071D78
    /* 61D70 80071D70 00000000 */   nop
    /* 61D74 80071D74 07004224 */  addiu      $v0, $v0, 0x7
  .L80071D78:
    /* 61D78 80071D78 C3100200 */  sra        $v0, $v0, 3
    /* 61D7C 80071D7C 21404400 */  addu       $t0, $v0, $a0
    /* 61D80 80071D80 0E80033C */  lui        $v1, %hi(storehold)
    /* 61D84 80071D84 881D6324 */  addiu      $v1, $v1, %lo(storehold)
    /* 61D88 80071D88 C0100800 */  sll        $v0, $t0, 3
    /* 61D8C 80071D8C 23104800 */  subu       $v0, $v0, $t0
    /* 61D90 80071D90 80100200 */  sll        $v0, $v0, 2
    /* 61D94 80071D94 23104800 */  subu       $v0, $v0, $t0
    /* 61D98 80071D98 80100200 */  sll        $v0, $v0, 2
    /* 61D9C 80071D9C 21384300 */  addu       $a3, $v0, $v1
    /* 61DA0 80071DA0 1280033C */  lui        $v1, %hi(myplr)
    /* 61DA4 80071DA4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 61DA8 80071DA8 6000E924 */  addiu      $t1, $a3, 0x60
    /* 61DAC 80071DAC 40100300 */  sll        $v0, $v1, 1
    /* 61DB0 80071DB0 21104300 */  addu       $v0, $v0, $v1
    /* 61DB4 80071DB4 80100200 */  sll        $v0, $v0, 2
    /* 61DB8 80071DB8 21104300 */  addu       $v0, $v0, $v1
    /* 61DBC 80071DBC 00110200 */  sll        $v0, $v0, 4
    /* 61DC0 80071DC0 23104300 */  subu       $v0, $v0, $v1
    /* 61DC4 80071DC4 80100200 */  sll        $v0, $v0, 2
    /* 61DC8 80071DC8 21104300 */  addu       $v0, $v0, $v1
    /* 61DCC 80071DCC C0100200 */  sll        $v0, $v0, 3
    /* 61DD0 80071DD0 0E80033C */  lui        $v1, %hi(plr + 0x1910)
    /* 61DD4 80071DD4 48BE6324 */  addiu      $v1, $v1, %lo(plr + 0x1910)
    /* 61DD8 80071DD8 21304300 */  addu       $a2, $v0, $v1
  .L80071DDC:
    /* 61DDC 80071DDC 0000E28C */  lw         $v0, 0x0($a3)
    /* 61DE0 80071DE0 0400E38C */  lw         $v1, 0x4($a3)
    /* 61DE4 80071DE4 0800E48C */  lw         $a0, 0x8($a3)
    /* 61DE8 80071DE8 0C00E58C */  lw         $a1, 0xC($a3)
    /* 61DEC 80071DEC 0000C2AC */  sw         $v0, 0x0($a2)
    /* 61DF0 80071DF0 0400C3AC */  sw         $v1, 0x4($a2)
    /* 61DF4 80071DF4 0800C4AC */  sw         $a0, 0x8($a2)
    /* 61DF8 80071DF8 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 61DFC 80071DFC 1000E724 */  addiu      $a3, $a3, 0x10
    /* 61E00 80071E00 F6FFE914 */  bne        $a3, $t1, .L80071DDC
    /* 61E04 80071E04 1000C624 */   addiu     $a2, $a2, 0x10
    /* 61E08 80071E08 0000E28C */  lw         $v0, 0x0($a3)
    /* 61E0C 80071E0C 0400E38C */  lw         $v1, 0x4($a3)
    /* 61E10 80071E10 0800E48C */  lw         $a0, 0x8($a3)
    /* 61E14 80071E14 0000C2AC */  sw         $v0, 0x0($a2)
    /* 61E18 80071E18 0400C3AC */  sw         $v1, 0x4($a2)
    /* 61E1C 80071E1C 0800C4AC */  sw         $a0, 0x8($a2)
    /* 61E20 80071E20 681388AF */  sw         $t0, %gp_rel(SellIdx)($gp)
    /* 61E24 80071E24 2AC5010C */  jal        StoreGoldFit__Fi
    /* 61E28 80071E28 21200001 */   addu      $a0, $t0, $zero
    /* 61E2C 80071E2C FF004230 */  andi       $v0, $v0, 0xFF
    /* 61E30 80071E30 02004010 */  beqz       $v0, .L80071E3C
    /* 61E34 80071E34 0A000424 */   addiu     $a0, $zero, 0xA
    /* 61E38 80071E38 0B000424 */  addiu      $a0, $zero, 0xB
  .L80071E3C:
    /* 61E3C 80071E3C 5BBE010C */  jal        StartStore__Fc
    /* 61E40 80071E40 00000000 */   nop
    /* 61E44 80071E44 1000BF8F */  lw         $ra, 0x10($sp)
    /* 61E48 80071E48 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 61E4C 80071E4C 0800E003 */  jr         $ra
    /* 61E50 80071E50 00000000 */   nop
endlabel S_SSellEnter__Fv
