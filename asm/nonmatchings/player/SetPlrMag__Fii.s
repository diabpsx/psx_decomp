.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlrMag__Fii, 0x70

glabel SetPlrMag__Fii
    /* 56288 80066288 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5628C 8006628C 40100400 */  sll        $v0, $a0, 1
    /* 56290 80066290 21104400 */  addu       $v0, $v0, $a0
    /* 56294 80066294 80100200 */  sll        $v0, $v0, 2
    /* 56298 80066298 21104400 */  addu       $v0, $v0, $a0
    /* 5629C 8006629C 00110200 */  sll        $v0, $v0, 4
    /* 562A0 800662A0 23104400 */  subu       $v0, $v0, $a0
    /* 562A4 800662A4 80100200 */  sll        $v0, $v0, 2
    /* 562A8 800662A8 21104400 */  addu       $v0, $v0, $a0
    /* 562AC 800662AC C0100200 */  sll        $v0, $v0, 3
    /* 562B0 800662B0 0E80033C */  lui        $v1, %hi(plr)
    /* 562B4 800662B4 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 562B8 800662B8 21304300 */  addu       $a2, $v0, $v1
    /* 562BC 800662BC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 562C0 800662C0 FE00C5A4 */  sh         $a1, 0xFE($a2)
    /* 562C4 800662C4 F600C380 */  lb         $v1, 0xF6($a2)
    /* 562C8 800662C8 02000224 */  addiu      $v0, $zero, 0x2
    /* 562CC 800662CC 02006214 */  bne        $v1, $v0, .L800662D8
    /* 562D0 800662D0 80290500 */   sll       $a1, $a1, 6
    /* 562D4 800662D4 40280500 */  sll        $a1, $a1, 1
  .L800662D8:
    /* 562D8 800662D8 2C01C5AC */  sw         $a1, 0x12C($a2)
    /* 562DC 800662DC 3401C5AC */  sw         $a1, 0x134($a2)
    /* 562E0 800662E0 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 562E4 800662E4 01000524 */   addiu     $a1, $zero, 0x1
    /* 562E8 800662E8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 562EC 800662EC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 562F0 800662F0 0800E003 */  jr         $ra
    /* 562F4 800662F4 00000000 */   nop
endlabel SetPlrMag__Fii
