.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownBlackSmith__Fv, 0x8C

glabel TownBlackSmith__Fv
    /* 2B1F0 8003B1F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B1F4 8003B1F4 21200000 */  addu       $a0, $zero, $zero
    /* 2B1F8 8003B1F8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2B1FC 8003B1FC E2E7000C */  jal        GetActiveTowner__Fi
    /* 2B200 8003B200 1000B0AF */   sw        $s0, 0x10($sp)
    /* 2B204 8003B204 21804000 */  addu       $s0, $v0, $zero
    /* 2B208 8003B208 42EC000C */  jal        TownCtrlMsg__Fi
    /* 2B20C 8003B20C 21200002 */   addu      $a0, $s0, $zero
    /* 2B210 8003B210 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2B214 8003B214 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2B218 8003B218 00000000 */  nop
    /* 2B21C 8003B21C 12004014 */  bnez       $v0, .L8003B268
    /* 2B220 8003B220 03000224 */   addiu     $v0, $zero, 0x3
    /* 2B224 8003B224 0E80033C */  lui        $v1, %hi(quests + 0x2)
    /* 2B228 8003B228 42DA6390 */  lbu        $v1, %lo(quests + 0x2)($v1)
    /* 2B22C 8003B22C 00000000 */  nop
    /* 2B230 8003B230 0D006214 */  bne        $v1, $v0, .L8003B268
    /* 2B234 8003B234 40101000 */   sll       $v0, $s0, 1
    /* 2B238 8003B238 21105000 */  addu       $v0, $v0, $s0
    /* 2B23C 8003B23C 00110200 */  sll        $v0, $v0, 4
    /* 2B240 8003B240 21105000 */  addu       $v0, $v0, $s0
    /* 2B244 8003B244 80100200 */  sll        $v0, $v0, 2
    /* 2B248 8003B248 0D80013C */  lui        $at, %hi(towner + 0xC)
    /* 2B24C 8003B24C 21082200 */  addu       $at, $at, $v0
    /* 2B250 8003B250 8CFE258C */  lw         $a1, %lo(towner + 0xC)($at)
    /* 2B254 8003B254 0D80013C */  lui        $at, %hi(towner + 0x8)
    /* 2B258 8003B258 21082200 */  addu       $at, $at, $v0
    /* 2B25C 8003B25C 88FE248C */  lw         $a0, %lo(towner + 0x8)($at)
    /* 2B260 8003B260 447F010C */  jal        IsDplayer__Fii
    /* 2B264 8003B264 0100A524 */   addiu     $a1, $a1, 0x1
  .L8003B268:
    /* 2B268 8003B268 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2B26C 8003B26C 1000B08F */  lw         $s0, 0x10($sp)
    /* 2B270 8003B270 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B274 8003B274 0800E003 */  jr         $ra
    /* 2B278 8003B278 00000000 */   nop
endlabel TownBlackSmith__Fv
