.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching healFX__Fv, 0x13C

glabel healFX__Fv
    /* 901A4 800A01A4 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 901A8 800A01A8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 901AC 800A01AC 21880000 */  addu       $s1, $zero, $zero
    /* 901B0 800A01B0 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 901B4 800A01B4 21980000 */  addu       $s3, $zero, $zero
    /* 901B8 800A01B8 2000B0AF */  sw         $s0, 0x20($sp)
    /* 901BC 800A01BC 21800000 */  addu       $s0, $zero, $zero
    /* 901C0 800A01C0 3000BFAF */  sw         $ra, 0x30($sp)
    /* 901C4 800A01C4 2800B2AF */  sw         $s2, 0x28($sp)
  .L800A01C8:
    /* 901C8 800A01C8 0200222A */  slti       $v0, $s1, 0x2
    /* 901CC 800A01CC 3C004010 */  beqz       $v0, .L800A02C0
    /* 901D0 800A01D0 00000000 */   nop
    /* 901D4 800A01D4 0D80013C */  lui        $at, %hi(SpellFXDat + 0x4)
    /* 901D8 800A01D8 21083000 */  addu       $at, $at, $s0
    /* 901DC 800A01DC E0C6228C */  lw         $v0, %lo(SpellFXDat + 0x4)($at)
    /* 901E0 800A01E0 00000000 */  nop
    /* 901E4 800A01E4 32004010 */  beqz       $v0, .L800A02B0
    /* 901E8 800A01E8 00000000 */   nop
    /* 901EC 800A01EC 0D80023C */  lui        $v0, %hi(SpellFXDat)
    /* 901F0 800A01F0 DCC64224 */  addiu      $v0, $v0, %lo(SpellFXDat)
    /* 901F4 800A01F4 21900202 */  addu       $s2, $s0, $v0
    /* 901F8 800A01F8 21204002 */  addu       $a0, $s2, $zero
    /* 901FC 800A01FC 0E80053C */  lui        $a1, %hi(plr)
    /* 90200 800A0200 38A5A524 */  addiu      $a1, $a1, %lo(plr)
    /* 90204 800A0204 2080020C */  jal        GetPlrPos__11SPELLFX_DATP12PlayerStruct
    /* 90208 800A0208 21286502 */   addu      $a1, $s3, $a1
    /* 9020C 800A020C 4A82020C */  jal        GetPlayer__7CPlayeri_800a0928
    /* 90210 800A0210 21202002 */   addu      $a0, $s1, $zero
    /* 90214 800A0214 5E82020C */  jal        GetLastOtPos__C7CPlayer_800a0978
    /* 90218 800A0218 21204000 */   addu      $a0, $v0, $zero
    /* 9021C 800A021C 4000063C */  lui        $a2, (0x40C0FF >> 16)
    /* 90220 800A0220 FFC0C634 */  ori        $a2, $a2, (0x40C0FF & 0xFFFF)
    /* 90224 800A0224 0D80013C */  lui        $at, %hi(SpellFXDat + 0x24)
    /* 90228 800A0228 21083000 */  addu       $at, $at, $s0
    /* 9022C 800A022C 00C7248C */  lw         $a0, %lo(SpellFXDat + 0x24)($at)
    /* 90230 800A0230 0D80013C */  lui        $at, %hi(SpellFXDat + 0x28)
    /* 90234 800A0234 21083000 */  addu       $at, $at, $s0
    /* 90238 800A0238 04C7258C */  lw         $a1, %lo(SpellFXDat + 0x28)($at)
    /* 9023C 800A023C 00400324 */  addiu      $v1, $zero, 0x4000
    /* 90240 800A0240 1000A3AF */  sw         $v1, 0x10($sp)
    /* 90244 800A0244 10000324 */  addiu      $v1, $zero, 0x10
    /* 90248 800A0248 1400A6AF */  sw         $a2, 0x14($sp)
    /* 9024C 800A024C 10000624 */  addiu      $a2, $zero, 0x10
    /* 90250 800A0250 10000724 */  addiu      $a3, $zero, 0x10
    /* 90254 800A0254 1800A3AF */  sw         $v1, 0x18($sp)
    /* 90258 800A0258 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 9025C 800A025C B07E020C */  jal        Teleportfx__Fiiiiiiii
    /* 90260 800A0260 FCFF8424 */   addiu     $a0, $a0, -0x4
    /* 90264 800A0264 7C09828F */  lw         $v0, %gp_rel(D_8011B0FC)($gp)
    /* 90268 800A0268 00000000 */  nop
    /* 9026C 800A026C 07004014 */  bnez       $v0, .L800A028C
    /* 90270 800A0270 00000000 */   nop
    /* 90274 800A0274 0D80013C */  lui        $at, %hi(SpellFXDat + 0x44)
    /* 90278 800A0278 21083000 */  addu       $at, $at, $s0
    /* 9027C 800A027C 20C7228C */  lw         $v0, %lo(SpellFXDat + 0x44)($at)
    /* 90280 800A0280 00000000 */  nop
    /* 90284 800A0284 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 90288 800A0288 440042AE */  sw         $v0, 0x44($s2)
  .L800A028C:
    /* 9028C 800A028C 0D80013C */  lui        $at, %hi(SpellFXDat + 0x44)
    /* 90290 800A0290 21083000 */  addu       $at, $at, $s0
    /* 90294 800A0294 20C7228C */  lw         $v0, %lo(SpellFXDat + 0x44)($at)
    /* 90298 800A0298 00000000 */  nop
    /* 9029C 800A029C 04004014 */  bnez       $v0, .L800A02B0
    /* 902A0 800A02A0 00000000 */   nop
    /* 902A4 800A02A4 0D80013C */  lui        $at, %hi(SpellFXDat + 0x4)
    /* 902A8 800A02A8 21083000 */  addu       $at, $at, $s0
    /* 902AC 800A02AC E0C620AC */  sw         $zero, %lo(SpellFXDat + 0x4)($at)
  .L800A02B0:
    /* 902B0 800A02B0 E8197326 */  addiu      $s3, $s3, 0x19E8
    /* 902B4 800A02B4 48001026 */  addiu      $s0, $s0, 0x48
    /* 902B8 800A02B8 72800208 */  j          .L800A01C8
    /* 902BC 800A02BC 01003126 */   addiu     $s1, $s1, 0x1
  .L800A02C0:
    /* 902C0 800A02C0 3000BF8F */  lw         $ra, 0x30($sp)
    /* 902C4 800A02C4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 902C8 800A02C8 2800B28F */  lw         $s2, 0x28($sp)
    /* 902CC 800A02CC 2400B18F */  lw         $s1, 0x24($sp)
    /* 902D0 800A02D0 2000B08F */  lw         $s0, 0x20($sp)
    /* 902D4 800A02D4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 902D8 800A02D8 0800E003 */  jr         $ra
    /* 902DC 800A02DC 00000000 */   nop
endlabel healFX__Fv
