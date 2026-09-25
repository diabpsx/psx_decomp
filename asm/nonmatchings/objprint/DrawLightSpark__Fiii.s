.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawLightSpark__Fiii, 0xE0

glabel DrawLightSpark__Fiii
    /* 6E1C4 8007E1C4 1280023C */  lui        $v0, %hi(PauseMode)
    /* 6E1C8 8007E1C8 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 6E1CC 8007E1CC B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6E1D0 8007E1D0 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 6E1D4 8007E1D4 21888000 */  addu       $s1, $a0, $zero
    /* 6E1D8 8007E1D8 4000B2AF */  sw         $s2, 0x40($sp)
    /* 6E1DC 8007E1DC 2190A000 */  addu       $s2, $a1, $zero
    /* 6E1E0 8007E1E0 4400B3AF */  sw         $s3, 0x44($sp)
    /* 6E1E4 8007E1E4 2198C000 */  addu       $s3, $a2, $zero
    /* 6E1E8 8007E1E8 4800BFAF */  sw         $ra, 0x48($sp)
    /* 6E1EC 8007E1EC 14004014 */  bnez       $v0, .L8007E240
    /* 6E1F0 8007E1F0 3800B0AF */   sw        $s0, 0x38($sp)
    /* 6E1F4 8007E1F4 0783000C */  jal        TICK_Get
    /* 6E1F8 8007E1F8 30001024 */   addiu     $s0, $zero, 0x30
    /* 6E1FC 8007E1FC 01004230 */  andi       $v0, $v0, 0x1
    /* 6E200 8007E200 00110200 */  sll        $v0, $v0, 4
    /* 6E204 8007E204 0783000C */  jal        TICK_Get
    /* 6E208 8007E208 23800202 */   subu      $s0, $s0, $v0
    /* 6E20C 8007E20C 21202002 */  addu       $a0, $s1, $zero
    /* 6E210 8007E210 21284002 */  addu       $a1, $s2, $zero
    /* 6E214 8007E214 FF000624 */  addiu      $a2, $zero, 0xFF
    /* 6E218 8007E218 80000724 */  addiu      $a3, $zero, 0x80
    /* 6E21C 8007E21C 28000324 */  addiu      $v1, $zero, 0x28
    /* 6E220 8007E220 01004230 */  andi       $v0, $v0, 0x1
    /* 6E224 8007E224 C0100200 */  sll        $v0, $v0, 3
    /* 6E228 8007E228 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6E22C 8007E22C 08000224 */  addiu      $v0, $zero, 0x8
    /* 6E230 8007E230 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6E234 8007E234 1400B0AF */  sw         $s0, 0x14($sp)
    /* 6E238 8007E238 9BF80108 */  j          .L8007E26C
    /* 6E23C 8007E23C 1800A3AF */   sw        $v1, 0x18($sp)
  .L8007E240:
    /* 6E240 8007E240 21202002 */  addu       $a0, $s1, $zero
    /* 6E244 8007E244 21284002 */  addu       $a1, $s2, $zero
    /* 6E248 8007E248 FF000624 */  addiu      $a2, $zero, 0xFF
    /* 6E24C 8007E24C 80000724 */  addiu      $a3, $zero, 0x80
    /* 6E250 8007E250 30000224 */  addiu      $v0, $zero, 0x30
    /* 6E254 8007E254 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6E258 8007E258 28000224 */  addiu      $v0, $zero, 0x28
    /* 6E25C 8007E25C 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6E260 8007E260 08000224 */  addiu      $v0, $zero, 0x8
    /* 6E264 8007E264 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6E268 8007E268 1C00A0AF */  sw         $zero, 0x1C($sp)
  .L8007E26C:
    /* 6E26C 8007E26C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6E270 8007E270 2400B3AF */  sw         $s3, 0x24($sp)
    /* 6E274 8007E274 2800A0AF */  sw         $zero, 0x28($sp)
    /* 6E278 8007E278 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 6E27C 8007E27C 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 6E280 8007E280 3000A2AF */   sw        $v0, 0x30($sp)
    /* 6E284 8007E284 4800BF8F */  lw         $ra, 0x48($sp)
    /* 6E288 8007E288 4400B38F */  lw         $s3, 0x44($sp)
    /* 6E28C 8007E28C 4000B28F */  lw         $s2, 0x40($sp)
    /* 6E290 8007E290 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 6E294 8007E294 3800B08F */  lw         $s0, 0x38($sp)
    /* 6E298 8007E298 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 6E29C 8007E29C 0800E003 */  jr         $ra
    /* 6E2A0 8007E2A0 00000000 */   nop
endlabel DrawLightSpark__Fiii
