.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ForceSChambTrig__Fv, 0x8C

glabel ForceSChambTrig__Fv
    /* 664CC 800764CC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 664D0 800764D0 1280043C */  lui        $a0, %hi(cursmx)
    /* 664D4 800764D4 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 664D8 800764D8 1280053C */  lui        $a1, %hi(cursmy)
    /* 664DC 800764DC 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 664E0 800764E0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 664E4 800764E4 18D4010C */  jal        FindLevTrig__Fiii
    /* 664E8 800764E8 01000624 */   addiu     $a2, $zero, 0x1
    /* 664EC 800764EC 16004010 */  beqz       $v0, .L80076548
    /* 664F0 800764F0 21100000 */   addu      $v0, $zero, $zero
    /* 664F4 800764F4 4AED010C */  jal        GetStr__Fi
    /* 664F8 800764F8 3B000424 */   addiu     $a0, $zero, 0x3B
    /* 664FC 800764FC 21284000 */  addu       $a1, $v0, $zero
    /* 66500 80076500 0D80023C */  lui        $v0, %hi(_infostr)
    /* 66504 80076504 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 66508 80076508 1280043C */  lui        $a0, %hi(sel_data)
    /* 6650C 8007650C 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 66510 80076510 0E80063C */  lui        $a2, %hi(quests + 0x118)
    /* 66514 80076514 58DBC690 */  lbu        $a2, %lo(quests + 0x118)($a2)
    /* 66518 80076518 00220400 */  sll        $a0, $a0, 8
    /* 6651C 8007651C 9767000C */  jal        sprintf
    /* 66520 80076520 21208200 */   addu      $a0, $a0, $v0
    /* 66524 80076524 0E80033C */  lui        $v1, %hi(trigs)
    /* 66528 80076528 CC33638C */  lw         $v1, %lo(trigs)($v1)
    /* 6652C 8007652C 0E80043C */  lui        $a0, %hi(trigs + 0x4)
    /* 66530 80076530 D033848C */  lw         $a0, %lo(trigs + 0x4)($a0)
    /* 66534 80076534 01000224 */  addiu      $v0, $zero, 0x1
    /* 66538 80076538 1280013C */  lui        $at, %hi(cursmx)
    /* 6653C 8007653C 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 66540 80076540 1280013C */  lui        $at, %hi(cursmy)
    /* 66544 80076544 54B724AC */  sw         $a0, %lo(cursmy)($at)
  .L80076548:
    /* 66548 80076548 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6654C 8007654C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 66550 80076550 0800E003 */  jr         $ra
    /* 66554 80076554 00000000 */   nop
endlabel ForceSChambTrig__Fv
