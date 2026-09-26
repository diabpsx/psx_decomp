.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoFadein__Fi, 0xE0

glabel M_DoFadein__Fi
    /* 1445C 8014E054 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 14460 8014E058 40100400 */  sll        $v0, $a0, 1
    /* 14464 8014E05C 21104400 */  addu       $v0, $v0, $a0
    /* 14468 8014E060 80100200 */  sll        $v0, $v0, 2
    /* 1446C 8014E064 21104400 */  addu       $v0, $v0, $a0
    /* 14470 8014E068 C0280200 */  sll        $a1, $v0, 3
    /* 14474 8014E06C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 14478 8014E070 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1447C 8014E074 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14480 8014E078 21082500 */  addu       $at, $at, $a1
    /* 14484 8014E07C C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14488 8014E080 00000000 */  nop
    /* 1448C 8014E084 02004230 */  andi       $v0, $v0, 0x2
    /* 14490 8014E088 09004010 */  beqz       $v0, .L8014E0B0
    /* 14494 8014E08C 01000224 */   addiu     $v0, $zero, 0x1
    /* 14498 8014E090 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 1449C 8014E094 21082500 */  addu       $at, $at, $a1
    /* 144A0 8014E098 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 144A4 8014E09C 00000000 */  nop
    /* 144A8 8014E0A0 0D006210 */  beq        $v1, $v0, .L8014E0D8
    /* 144AC 8014E0A4 40800400 */   sll       $s0, $a0, 1
    /* 144B0 8014E0A8 48380508 */  j          .L8014E120
    /* 144B4 8014E0AC 21100000 */   addu      $v0, $zero, $zero
  .L8014E0B0:
    /* 144B8 8014E0B0 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 144BC 8014E0B4 21082500 */  addu       $at, $at, $a1
    /* 144C0 8014E0B8 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 144C4 8014E0BC 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 144C8 8014E0C0 21082500 */  addu       $at, $at, $a1
    /* 144CC 8014E0C4 D4532280 */  lb         $v0, %lo(monster + 0x40)($at)
    /* 144D0 8014E0C8 00000000 */  nop
    /* 144D4 8014E0CC 14006214 */  bne        $v1, $v0, .L8014E120
    /* 144D8 8014E0D0 21100000 */   addu      $v0, $zero, $zero
    /* 144DC 8014E0D4 40800400 */  sll        $s0, $a0, 1
  .L8014E0D8:
    /* 144E0 8014E0D8 21800402 */  addu       $s0, $s0, $a0
    /* 144E4 8014E0DC 80801000 */  sll        $s0, $s0, 2
    /* 144E8 8014E0E0 21800402 */  addu       $s0, $s0, $a0
    /* 144EC 8014E0E4 C0801000 */  sll        $s0, $s0, 3
    /* 144F0 8014E0E8 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 144F4 8014E0EC 21083000 */  addu       $at, $at, $s0
    /* 144F8 8014E0F0 D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 144FC 8014E0F4 9CFF010C */  jal        M_StartStand__Fii
    /* 14500 8014E0F8 00000000 */   nop
    /* 14504 8014E0FC 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14508 8014E100 21083000 */  addu       $at, $at, $s0
    /* 1450C 8014E104 C0532394 */  lhu        $v1, %lo(monster + 0x2C)($at)
    /* 14510 8014E108 00000000 */  nop
    /* 14514 8014E10C FDFF6330 */  andi       $v1, $v1, 0xFFFD
    /* 14518 8014E110 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1451C 8014E114 21083000 */  addu       $at, $at, $s0
    /* 14520 8014E118 C05323A4 */  sh         $v1, %lo(monster + 0x2C)($at)
    /* 14524 8014E11C 01000224 */  addiu      $v0, $zero, 0x1
  .L8014E120:
    /* 14528 8014E120 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1452C 8014E124 1000B08F */  lw         $s0, 0x10($sp)
    /* 14530 8014E128 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 14534 8014E12C 0800E003 */  jr         $ra
    /* 14538 8014E130 00000000 */   nop
endlabel M_DoFadein__Fi
