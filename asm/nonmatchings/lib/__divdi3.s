.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __divdi3, 0x98

glabel __divdi3
    /* 1260 80011260 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1264 80011264 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1268 80011268 21900000 */  addu       $s2, $zero, $zero
    /* 126C 8001126C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 1270 80011270 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1274 80011274 0800A104 */  bgez       $a1, .L80011298
    /* 1278 80011278 1800B0AF */   sw        $s0, 0x18($sp)
    /* 127C 8001127C FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 1280 80011280 23400400 */  negu       $t0, $a0
    /* 1284 80011284 23180500 */  negu       $v1, $a1
    /* 1288 80011288 2B100800 */  sltu       $v0, $zero, $t0
    /* 128C 8001128C 23486200 */  subu       $t1, $v1, $v0
    /* 1290 80011290 21200001 */  addu       $a0, $t0, $zero
    /* 1294 80011294 21282001 */  addu       $a1, $t1, $zero
  .L80011298:
    /* 1298 80011298 0700E104 */  bgez       $a3, .L800112B8
    /* 129C 8001129C 23500600 */   negu      $t2, $a2
    /* 12A0 800112A0 27901200 */  nor        $s2, $zero, $s2
    /* 12A4 800112A4 23180700 */  negu       $v1, $a3
    /* 12A8 800112A8 2B100A00 */  sltu       $v0, $zero, $t2
    /* 12AC 800112AC 23586200 */  subu       $t3, $v1, $v0
    /* 12B0 800112B0 21304001 */  addu       $a2, $t2, $zero
    /* 12B4 800112B4 21386001 */  addu       $a3, $t3, $zero
  .L800112B8:
    /* 12B8 800112B8 C744000C */  jal        __udivmoddi4
    /* 12BC 800112BC 1000A0AF */   sw        $zero, 0x10($sp)
    /* 12C0 800112C0 06004012 */  beqz       $s2, .L800112DC
    /* 12C4 800112C4 23800200 */   negu      $s0, $v0
    /* 12C8 800112C8 23180300 */  negu       $v1, $v1
    /* 12CC 800112CC 2B101000 */  sltu       $v0, $zero, $s0
  .L800112D0:
    /* 12D0 800112D0 23886200 */  subu       $s1, $v1, $v0
    /* 12D4 800112D4 21100002 */  addu       $v0, $s0, $zero
    /* 12D8 800112D8 21182002 */  addu       $v1, $s1, $zero
  .L800112DC:
    /* 12DC 800112DC 2400BF8F */  lw         $ra, 0x24($sp)
    /* 12E0 800112E0 2000B28F */  lw         $s2, 0x20($sp)
    /* 12E4 800112E4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 12E8 800112E8 1800B08F */  lw         $s0, 0x18($sp)
    /* 12EC 800112EC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 12F0 800112F0 0800E003 */  jr         $ra
    /* 12F4 800112F4 00000000 */   nop
endlabel __divdi3
