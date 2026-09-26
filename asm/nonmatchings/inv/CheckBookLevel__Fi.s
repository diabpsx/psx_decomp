.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckBookLevel__Fi, 0x134

glabel CheckBookLevel__Fi
    /* 23FA4 8015DB9C 40100400 */  sll        $v0, $a0, 1
    /* 23FA8 8015DBA0 21104400 */  addu       $v0, $v0, $a0
    /* 23FAC 8015DBA4 80100200 */  sll        $v0, $v0, 2
    /* 23FB0 8015DBA8 21104400 */  addu       $v0, $v0, $a0
    /* 23FB4 8015DBAC 00110200 */  sll        $v0, $v0, 4
    /* 23FB8 8015DBB0 23104400 */  subu       $v0, $v0, $a0
    /* 23FBC 8015DBB4 80100200 */  sll        $v0, $v0, 2
    /* 23FC0 8015DBB8 21104400 */  addu       $v0, $v0, $a0
    /* 23FC4 8015DBBC C0200200 */  sll        $a0, $v0, 3
    /* 23FC8 8015DBC0 0E80013C */  lui        $at, %hi(plr + 0x195D)
    /* 23FCC 8015DBC4 21082400 */  addu       $at, $at, $a0
    /* 23FD0 8015DBC8 95BE2390 */  lbu        $v1, %lo(plr + 0x195D)($at)
    /* 23FD4 8015DBCC 18000224 */  addiu      $v0, $zero, 0x18
    /* 23FD8 8015DBD0 3D006214 */  bne        $v1, $v0, .L8015DCC8
    /* 23FDC 8015DBD4 00000000 */   nop
    /* 23FE0 8015DBD8 0E80013C */  lui        $at, %hi(plr + 0x194D)
    /* 23FE4 8015DBDC 21082400 */  addu       $at, $at, $a0
    /* 23FE8 8015DBE0 85BE2380 */  lb         $v1, %lo(plr + 0x194D)($at)
    /* 23FEC 8015DBE4 00000000 */  nop
    /* 23FF0 8015DBE8 40100300 */  sll        $v0, $v1, 1
    /* 23FF4 8015DBEC 21104300 */  addu       $v0, $v0, $v1
    /* 23FF8 8015DBF0 80100200 */  sll        $v0, $v0, 2
    /* 23FFC 8015DBF4 21104300 */  addu       $v0, $v0, $v1
    /* 24000 8015DBF8 80100200 */  sll        $v0, $v0, 2
    /* 24004 8015DBFC 0E80013C */  lui        $at, %hi(spelldata + 0x18)
    /* 24008 8015DC00 21082200 */  addu       $at, $at, $v0
    /* 2400C 8015DC04 98DB228C */  lw         $v0, %lo(spelldata + 0x18)($at)
    /* 24010 8015DC08 0E80013C */  lui        $at, %hi(plr + 0x194D)
    /* 24014 8015DC0C 21082400 */  addu       $at, $at, $a0
    /* 24018 8015DC10 85BE2380 */  lb         $v1, %lo(plr + 0x194D)($at)
    /* 2401C 8015DC14 0E80013C */  lui        $at, %hi(plr + 0x1974)
    /* 24020 8015DC18 21082400 */  addu       $at, $at, $a0
    /* 24024 8015DC1C ACBE22A0 */  sb         $v0, %lo(plr + 0x1974)($at)
    /* 24028 8015DC20 0E80023C */  lui        $v0, %hi(plr + 0x71)
    /* 2402C 8015DC24 A9A54224 */  addiu      $v0, $v0, %lo(plr + 0x71)
    /* 24030 8015DC28 21108200 */  addu       $v0, $a0, $v0
    /* 24034 8015DC2C 21104300 */  addu       $v0, $v0, $v1
    /* 24038 8015DC30 00004680 */  lb         $a2, 0x0($v0)
    /* 2403C 8015DC34 00000000 */  nop
    /* 24040 8015DC38 2300C010 */  beqz       $a2, .L8015DCC8
    /* 24044 8015DC3C 00000000 */   nop
    /* 24048 8015DC40 21388000 */  addu       $a3, $a0, $zero
    /* 2404C 8015DC44 6666083C */  lui        $t0, (0x66666667 >> 16)
    /* 24050 8015DC48 67660835 */  ori        $t0, $t0, (0x66666667 & 0xFFFF)
  .L8015DC4C:
    /* 24054 8015DC4C 0E80013C */  lui        $at, %hi(plr + 0x1974)
    /* 24058 8015DC50 21082700 */  addu       $at, $at, $a3
    /* 2405C 8015DC54 ACBE2590 */  lbu        $a1, %lo(plr + 0x1974)($at)
    /* 24060 8015DC58 00000000 */  nop
    /* 24064 8015DC5C FF00A330 */  andi       $v1, $a1, 0xFF
    /* 24068 8015DC60 18006800 */  mult       $v1, $t0
    /* 2406C 8015DC64 C31F0300 */  sra        $v1, $v1, 31
    /* 24070 8015DC68 10480000 */  mfhi       $t1
    /* 24074 8015DC6C 43100900 */  sra        $v0, $t1, 1
    /* 24078 8015DC70 23104300 */  subu       $v0, $v0, $v1
    /* 2407C 8015DC74 2128A200 */  addu       $a1, $a1, $v0
    /* 24080 8015DC78 FF00A430 */  andi       $a0, $a1, 0xFF
    /* 24084 8015DC7C 18008800 */  mult       $a0, $t0
    /* 24088 8015DC80 C31F0400 */  sra        $v1, $a0, 31
    /* 2408C 8015DC84 0E80013C */  lui        $at, %hi(plr + 0x1974)
    /* 24090 8015DC88 21082700 */  addu       $at, $at, $a3
    /* 24094 8015DC8C ACBE25A0 */  sb         $a1, %lo(plr + 0x1974)($at)
    /* 24098 8015DC90 10480000 */  mfhi       $t1
    /* 2409C 8015DC94 43100900 */  sra        $v0, $t1, 1
    /* 240A0 8015DC98 23104300 */  subu       $v0, $v0, $v1
    /* 240A4 8015DC9C 21208200 */  addu       $a0, $a0, $v0
    /* 240A8 8015DCA0 00018428 */  slti       $a0, $a0, 0x100
    /* 240AC 8015DCA4 06008014 */  bnez       $a0, .L8015DCC0
    /* 240B0 8015DCA8 FFFFC624 */   addiu     $a2, $a2, -0x1
    /* 240B4 8015DCAC FF000224 */  addiu      $v0, $zero, 0xFF
    /* 240B8 8015DCB0 0E80013C */  lui        $at, %hi(plr + 0x1974)
    /* 240BC 8015DCB4 21082700 */  addu       $at, $at, $a3
    /* 240C0 8015DCB8 ACBE22A0 */  sb         $v0, %lo(plr + 0x1974)($at)
    /* 240C4 8015DCBC 21300000 */  addu       $a2, $zero, $zero
  .L8015DCC0:
    /* 240C8 8015DCC0 E2FFC014 */  bnez       $a2, .L8015DC4C
    /* 240CC 8015DCC4 00000000 */   nop
  .L8015DCC8:
    /* 240D0 8015DCC8 0800E003 */  jr         $ra
    /* 240D4 8015DCCC 00000000 */   nop
endlabel CheckBookLevel__Fi
