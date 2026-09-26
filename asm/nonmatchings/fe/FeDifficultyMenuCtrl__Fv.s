.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeDifficultyMenuCtrl__Fv, 0xE4

glabel FeDifficultyMenuCtrl__Fv
    /* 21F4 8013BDEC 1280023C */  lui        $v0, %hi(qtextflag)
    /* 21F8 8013BDF0 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 21FC 8013BDF4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2200 8013BDF8 31004014 */  bnez       $v0, .L8013BEC0
    /* 2204 8013BDFC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 2208 8013BE00 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 220C 8013BE04 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 2210 8013BE08 00000000 */  nop
    /* 2214 8013BE0C 2C004014 */  bnez       $v0, .L8013BEC0
    /* 2218 8013BE10 00000000 */   nop
    /* 221C 8013BE14 1280023C */  lui        $v0, %hi(PauseMode)
    /* 2220 8013BE18 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 2224 8013BE1C 00000000 */  nop
    /* 2228 8013BE20 27004014 */  bnez       $v0, .L8013BEC0
    /* 222C 8013BE24 00000000 */   nop
    /* 2230 8013BE28 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 2234 8013BE2C 1280033C */  lui        $v1, %hi(DavesPad)
    /* 2238 8013BE30 12AB6394 */  lhu        $v1, %lo(DavesPad)($v1)
    /* 223C 8013BE34 0400428C */  lw         $v0, 0x4($v0)
    /* 2240 8013BE38 01006330 */  andi       $v1, $v1, 0x1
    /* 2244 8013BE3C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 2248 8013BE40 1280013C */  lui        $at, %hi(gnDifficulty)
    /* 224C 8013BE44 08C122AC */  sw         $v0, %lo(gnDifficulty)($at)
    /* 2250 8013BE48 03006010 */  beqz       $v1, .L8013BE58
    /* 2254 8013BE4C 00000000 */   nop
    /* 2258 8013BE50 9BE9040C */  jal        FeSelUp__Fi
    /* 225C 8013BE54 01000424 */   addiu     $a0, $zero, 0x1
  .L8013BE58:
    /* 2260 8013BE58 1280023C */  lui        $v0, %hi(DavesPad)
    /* 2264 8013BE5C 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 2268 8013BE60 00000000 */  nop
    /* 226C 8013BE64 02004230 */  andi       $v0, $v0, 0x2
    /* 2270 8013BE68 03004010 */  beqz       $v0, .L8013BE78
    /* 2274 8013BE6C 00000000 */   nop
    /* 2278 8013BE70 D5E9040C */  jal        FeSelDown__Fi
    /* 227C 8013BE74 01000424 */   addiu     $a0, $zero, 0x1
  .L8013BE78:
    /* 2280 8013BE78 1280033C */  lui        $v1, %hi(DavesPad)
    /* 2284 8013BE7C 12AB6394 */  lhu        $v1, %lo(DavesPad)($v1)
    /* 2288 8013BE80 00000000 */  nop
    /* 228C 8013BE84 50006230 */  andi       $v0, $v1, 0x50
    /* 2290 8013BE88 07004010 */  beqz       $v0, .L8013BEA8
    /* 2294 8013BE8C 00016230 */   andi      $v0, $v1, 0x100
    /* 2298 8013BE90 C6F5000C */  jal        PlaySFX__Fi
    /* 229C 8013BE94 33000424 */   addiu     $a0, $zero, 0x33
    /* 22A0 8013BE98 F2EE040C */  jal        FeEnterGame__Fv
    /* 22A4 8013BE9C 00000000 */   nop
    /* 22A8 8013BEA0 AEEF0408 */  j          .L8013BEB8
    /* 22AC 8013BEA4 00000000 */   nop
  .L8013BEA8:
    /* 22B0 8013BEA8 03004010 */  beqz       $v0, .L8013BEB8
    /* 22B4 8013BEAC 00000000 */   nop
    /* 22B8 8013BEB0 49E9040C */  jal        FePrevMenu__Fv
    /* 22BC 8013BEB4 00000000 */   nop
  .L8013BEB8:
    /* 22C0 8013BEB8 EDEB040C */  jal        FeDrawChrClass__Fv
    /* 22C4 8013BEBC 00000000 */   nop
  .L8013BEC0:
    /* 22C8 8013BEC0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 22CC 8013BEC4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22D0 8013BEC8 0800E003 */  jr         $ra
    /* 22D4 8013BECC 00000000 */   nop
endlabel FeDifficultyMenuCtrl__Fv
