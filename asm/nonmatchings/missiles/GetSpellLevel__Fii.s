.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSpellLevel__Fii, 0x74

glabel GetSpellLevel__Fii
    /* 844 8013A43C 1280023C */  lui        $v0, %hi(myplr)
    /* 848 8013A440 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 84C 8013A444 00000000 */  nop
    /* 850 8013A448 13008214 */  bne        $a0, $v0, .L8013A498
    /* 854 8013A44C 40100400 */   sll       $v0, $a0, 1
    /* 858 8013A450 21104400 */  addu       $v0, $v0, $a0
    /* 85C 8013A454 80100200 */  sll        $v0, $v0, 2
    /* 860 8013A458 21104400 */  addu       $v0, $v0, $a0
    /* 864 8013A45C 00110200 */  sll        $v0, $v0, 4
    /* 868 8013A460 23104400 */  subu       $v0, $v0, $a0
    /* 86C 8013A464 80100200 */  sll        $v0, $v0, 2
    /* 870 8013A468 21104400 */  addu       $v0, $v0, $a0
    /* 874 8013A46C C0100200 */  sll        $v0, $v0, 3
    /* 878 8013A470 0E80033C */  lui        $v1, %hi(plr + 0x71)
    /* 87C 8013A474 A9A56324 */  addiu      $v1, $v1, %lo(plr + 0x71)
    /* 880 8013A478 21184300 */  addu       $v1, $v0, $v1
    /* 884 8013A47C 21186500 */  addu       $v1, $v1, $a1
    /* 888 8013A480 00006380 */  lb         $v1, 0x0($v1)
    /* 88C 8013A484 0E80013C */  lui        $at, %hi(plr + 0x19C0)
    /* 890 8013A488 21082200 */  addu       $at, $at, $v0
    /* 894 8013A48C F8BE2280 */  lb         $v0, %lo(plr + 0x19C0)($at)
    /* 898 8013A490 27E90408 */  j          .L8013A49C
    /* 89C 8013A494 21106200 */   addu      $v0, $v1, $v0
  .L8013A498:
    /* 8A0 8013A498 01000224 */  addiu      $v0, $zero, 0x1
  .L8013A49C:
    /* 8A4 8013A49C 02004104 */  bgez       $v0, .L8013A4A8
    /* 8A8 8013A4A0 00000000 */   nop
    /* 8AC 8013A4A4 21100000 */  addu       $v0, $zero, $zero
  .L8013A4A8:
    /* 8B0 8013A4A8 0800E003 */  jr         $ra
    /* 8B4 8013A4AC 00000000 */   nop
endlabel GetSpellLevel__Fii
