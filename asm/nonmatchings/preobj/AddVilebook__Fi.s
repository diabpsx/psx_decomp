.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddVilebook__Fi, 0x50

glabel AddVilebook__Fi
    /* 1D21C 80156E14 1280023C */  lui        $v0, %hi(setlevel)
    /* 1D220 80156E18 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 1D224 80156E1C 00000000 */  nop
    /* 1D228 80156E20 0E004010 */  beqz       $v0, .L80156E5C
    /* 1D22C 80156E24 05000224 */   addiu     $v0, $zero, 0x5
    /* 1D230 80156E28 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 1D234 80156E2C 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 1D238 80156E30 00000000 */  nop
    /* 1D23C 80156E34 09006214 */  bne        $v1, $v0, .L80156E5C
    /* 1D240 80156E38 40100400 */   sll       $v0, $a0, 1
    /* 1D244 80156E3C 21104400 */  addu       $v0, $v0, $a0
    /* 1D248 80156E40 80100200 */  sll        $v0, $v0, 2
    /* 1D24C 80156E44 23104400 */  subu       $v0, $v0, $a0
    /* 1D250 80156E48 80100200 */  sll        $v0, $v0, 2
    /* 1D254 80156E4C 04000324 */  addiu      $v1, $zero, 0x4
    /* 1D258 80156E50 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 1D25C 80156E54 21082200 */  addu       $at, $at, $v0
    /* 1D260 80156E58 6D8C23A0 */  sb         $v1, %lo(object + 0x21)($at)
  .L80156E5C:
    /* 1D264 80156E5C 0800E003 */  jr         $ra
    /* 1D268 80156E60 00000000 */   nop
endlabel AddVilebook__Fi
