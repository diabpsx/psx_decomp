.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SmithRepairOk__Fi, 0xA8

glabel SmithRepairOk__Fi
    /* 5BB44 8006BB44 C0180400 */  sll        $v1, $a0, 3
    /* 5BB48 8006BB48 23186400 */  subu       $v1, $v1, $a0
    /* 5BB4C 8006BB4C 80180300 */  sll        $v1, $v1, 2
    /* 5BB50 8006BB50 23186400 */  subu       $v1, $v1, $a0
    /* 5BB54 8006BB54 1280043C */  lui        $a0, %hi(myplr)
    /* 5BB58 8006BB58 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5BB5C 8006BB5C 80180300 */  sll        $v1, $v1, 2
    /* 5BB60 8006BB60 40100400 */  sll        $v0, $a0, 1
    /* 5BB64 8006BB64 21104400 */  addu       $v0, $v0, $a0
    /* 5BB68 8006BB68 80100200 */  sll        $v0, $v0, 2
    /* 5BB6C 8006BB6C 21104400 */  addu       $v0, $v0, $a0
    /* 5BB70 8006BB70 00110200 */  sll        $v0, $v0, 4
    /* 5BB74 8006BB74 23104400 */  subu       $v0, $v0, $a0
    /* 5BB78 8006BB78 80100200 */  sll        $v0, $v0, 2
    /* 5BB7C 8006BB7C 21104400 */  addu       $v0, $v0, $a0
    /* 5BB80 8006BB80 C0100200 */  sll        $v0, $v0, 3
    /* 5BB84 8006BB84 21186200 */  addu       $v1, $v1, $v0
    /* 5BB88 8006BB88 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 5BB8C 8006BB8C 21082300 */  addu       $at, $at, $v1
    /* 5BB90 8006BB90 08AA2484 */  lh         $a0, %lo(plr + 0x4D0)($at)
    /* 5BB94 8006BB94 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5BB98 8006BB98 07008210 */  beq        $a0, $v0, .L8006BBB8
    /* 5BB9C 8006BB9C 00000000 */   nop
    /* 5BBA0 8006BBA0 05008010 */  beqz       $a0, .L8006BBB8
    /* 5BBA4 8006BBA4 0B000224 */   addiu     $v0, $zero, 0xB
    /* 5BBA8 8006BBA8 03008210 */  beq        $a0, $v0, .L8006BBB8
    /* 5BBAC 8006BBAC 0E000224 */   addiu     $v0, $zero, 0xE
    /* 5BBB0 8006BBB0 03008214 */  bne        $a0, $v0, .L8006BBC0
    /* 5BBB4 8006BBB4 00000000 */   nop
  .L8006BBB8:
    /* 5BBB8 8006BBB8 F9AE0108 */  j          .L8006BBE4
    /* 5BBBC 8006BBBC 21100000 */   addu      $v0, $zero, $zero
  .L8006BBC0:
    /* 5BBC0 8006BBC0 0E80013C */  lui        $at, %hi(plr + 0x4E2)
    /* 5BBC4 8006BBC4 21082300 */  addu       $at, $at, $v1
    /* 5BBC8 8006BBC8 1AAA2284 */  lh         $v0, %lo(plr + 0x4E2)($at)
    /* 5BBCC 8006BBCC 0E80013C */  lui        $at, %hi(plr + 0x4E4)
    /* 5BBD0 8006BBD0 21082300 */  addu       $at, $at, $v1
    /* 5BBD4 8006BBD4 1CAA2384 */  lh         $v1, %lo(plr + 0x4E4)($at)
    /* 5BBD8 8006BBD8 00000000 */  nop
    /* 5BBDC 8006BBDC 26104300 */  xor        $v0, $v0, $v1
    /* 5BBE0 8006BBE0 2B100200 */  sltu       $v0, $zero, $v0
  .L8006BBE4:
    /* 5BBE4 8006BBE4 0800E003 */  jr         $ra
    /* 5BBE8 8006BBE8 00000000 */   nop
endlabel SmithRepairOk__Fi
