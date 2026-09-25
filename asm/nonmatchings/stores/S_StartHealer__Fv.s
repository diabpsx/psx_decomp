.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartHealer__Fv, 0x1D4

glabel S_StartHealer__Fv
    /* 5E130 8006E130 1280033C */  lui        $v1, %hi(myplr)
    /* 5E134 8006E134 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5E138 8006E138 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5E13C 8006E13C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5E140 8006E140 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5E144 8006E144 40100300 */  sll        $v0, $v1, 1
    /* 5E148 8006E148 21104300 */  addu       $v0, $v0, $v1
    /* 5E14C 8006E14C 80100200 */  sll        $v0, $v0, 2
    /* 5E150 8006E150 21104300 */  addu       $v0, $v0, $v1
    /* 5E154 8006E154 00110200 */  sll        $v0, $v0, 4
    /* 5E158 8006E158 23104300 */  subu       $v0, $v0, $v1
    /* 5E15C 8006E15C 80100200 */  sll        $v0, $v0, 2
    /* 5E160 8006E160 21104300 */  addu       $v0, $v0, $v1
    /* 5E164 8006E164 C0100200 */  sll        $v0, $v0, 3
    /* 5E168 8006E168 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 5E16C 8006E16C 21082200 */  addu       $at, $at, $v0
    /* 5E170 8006E170 54A6238C */  lw         $v1, %lo(plr + 0x11C)($at)
    /* 5E174 8006E174 0E80013C */  lui        $at, %hi(plr + 0x120)
    /* 5E178 8006E178 21082200 */  addu       $at, $at, $v0
    /* 5E17C 8006E17C 58A6228C */  lw         $v0, %lo(plr + 0x120)($at)
    /* 5E180 8006E180 00000000 */  nop
    /* 5E184 8006E184 1B006210 */  beq        $v1, $v0, .L8006E1F4
    /* 5E188 8006E188 00000000 */   nop
    /* 5E18C 8006E18C C6F5000C */  jal        PlaySFX__Fi
    /* 5E190 8006E190 3F000424 */   addiu     $a0, $zero, 0x3F
    /* 5E194 8006E194 1280033C */  lui        $v1, %hi(myplr)
    /* 5E198 8006E198 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5E19C 8006E19C 00000000 */  nop
    /* 5E1A0 8006E1A0 40100300 */  sll        $v0, $v1, 1
    /* 5E1A4 8006E1A4 21104300 */  addu       $v0, $v0, $v1
    /* 5E1A8 8006E1A8 80100200 */  sll        $v0, $v0, 2
    /* 5E1AC 8006E1AC 21104300 */  addu       $v0, $v0, $v1
    /* 5E1B0 8006E1B0 00110200 */  sll        $v0, $v0, 4
    /* 5E1B4 8006E1B4 23104300 */  subu       $v0, $v0, $v1
    /* 5E1B8 8006E1B8 80100200 */  sll        $v0, $v0, 2
    /* 5E1BC 8006E1BC 21104300 */  addu       $v0, $v0, $v1
    /* 5E1C0 8006E1C0 C0100200 */  sll        $v0, $v0, 3
    /* 5E1C4 8006E1C4 0E80013C */  lui        $at, %hi(plr + 0x120)
    /* 5E1C8 8006E1C8 21082200 */  addu       $at, $at, $v0
    /* 5E1CC 8006E1CC 58A6238C */  lw         $v1, %lo(plr + 0x120)($at)
    /* 5E1D0 8006E1D0 0E80013C */  lui        $at, %hi(plr + 0x118)
    /* 5E1D4 8006E1D4 21082200 */  addu       $at, $at, $v0
    /* 5E1D8 8006E1D8 50A6248C */  lw         $a0, %lo(plr + 0x118)($at)
    /* 5E1DC 8006E1DC 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 5E1E0 8006E1E0 21082200 */  addu       $at, $at, $v0
    /* 5E1E4 8006E1E4 54A623AC */  sw         $v1, %lo(plr + 0x11C)($at)
    /* 5E1E8 8006E1E8 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 5E1EC 8006E1EC 21082200 */  addu       $at, $at, $v0
    /* 5E1F0 8006E1F0 4CA624AC */  sw         $a0, %lo(plr + 0x114)($at)
  .L8006E1F4:
    /* 5E1F4 8006E1F4 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5E1F8 8006E1F8 611380A3 */  sb         $zero, %gp_rel(stextsize)($gp)
    /* 5E1FC 8006E1FC 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5E200 8006E200 4AED010C */  jal        GetStr__Fi
    /* 5E204 8006E204 CA040424 */   addiu     $a0, $zero, 0x4CA
    /* 5E208 8006E208 21200000 */  addu       $a0, $zero, $zero
    /* 5E20C 8006E20C 01000524 */  addiu      $a1, $zero, 0x1
    /* 5E210 8006E210 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E214 8006E214 21384000 */  addu       $a3, $v0, $zero
    /* 5E218 8006E218 03001024 */  addiu      $s0, $zero, 0x3
    /* 5E21C 8006E21C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5E220 8006E220 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E224 8006E224 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5E228 8006E228 4AED010C */  jal        GetStr__Fi
    /* 5E22C 8006E22C B4010424 */   addiu     $a0, $zero, 0x1B4
    /* 5E230 8006E230 21200000 */  addu       $a0, $zero, $zero
    /* 5E234 8006E234 02000524 */  addiu      $a1, $zero, 0x2
    /* 5E238 8006E238 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E23C 8006E23C 21384000 */  addu       $a3, $v0, $zero
    /* 5E240 8006E240 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5E244 8006E244 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E248 8006E248 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5E24C 8006E24C 4AED010C */  jal        GetStr__Fi
    /* 5E250 8006E250 DF040424 */   addiu     $a0, $zero, 0x4DF
    /* 5E254 8006E254 21200000 */  addu       $a0, $zero, $zero
    /* 5E258 8006E258 07000524 */  addiu      $a1, $zero, 0x7
    /* 5E25C 8006E25C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E260 8006E260 21384000 */  addu       $a3, $v0, $zero
    /* 5E264 8006E264 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5E268 8006E268 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E26C 8006E26C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5E270 8006E270 4AED010C */  jal        GetStr__Fi
    /* 5E274 8006E274 2C040424 */   addiu     $a0, $zero, 0x42C
    /* 5E278 8006E278 21200000 */  addu       $a0, $zero, $zero
    /* 5E27C 8006E27C 09000524 */  addiu      $a1, $zero, 0x9
    /* 5E280 8006E280 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E284 8006E284 21384000 */  addu       $a3, $v0, $zero
    /* 5E288 8006E288 01001024 */  addiu      $s0, $zero, 0x1
    /* 5E28C 8006E28C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5E290 8006E290 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E294 8006E294 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5E298 8006E298 4AED010C */  jal        GetStr__Fi
    /* 5E29C 8006E29C 96000424 */   addiu     $a0, $zero, 0x96
    /* 5E2A0 8006E2A0 21200000 */  addu       $a0, $zero, $zero
    /* 5E2A4 8006E2A4 0B000524 */  addiu      $a1, $zero, 0xB
    /* 5E2A8 8006E2A8 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E2AC 8006E2AC 21384000 */  addu       $a3, $v0, $zero
    /* 5E2B0 8006E2B0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5E2B4 8006E2B4 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E2B8 8006E2B8 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5E2BC 8006E2BC 4AED010C */  jal        GetStr__Fi
    /* 5E2C0 8006E2C0 3F020424 */   addiu     $a0, $zero, 0x23F
    /* 5E2C4 8006E2C4 21200000 */  addu       $a0, $zero, $zero
    /* 5E2C8 8006E2C8 0D000524 */  addiu      $a1, $zero, 0xD
    /* 5E2CC 8006E2CC 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E2D0 8006E2D0 21384000 */  addu       $a3, $v0, $zero
    /* 5E2D4 8006E2D4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5E2D8 8006E2D8 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E2DC 8006E2DC 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5E2E0 8006E2E0 5CA7010C */  jal        AddSLine__Fi
    /* 5E2E4 8006E2E4 03000424 */   addiu     $a0, $zero, 0x3
    /* 5E2E8 8006E2E8 14000224 */  addiu      $v0, $zero, 0x14
    /* 5E2EC 8006E2EC 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5E2F0 8006E2F0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5E2F4 8006E2F4 1800B08F */  lw         $s0, 0x18($sp)
    /* 5E2F8 8006E2F8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5E2FC 8006E2FC 0800E003 */  jr         $ra
    /* 5E300 8006E300 00000000 */   nop
endlabel S_StartHealer__Fv
