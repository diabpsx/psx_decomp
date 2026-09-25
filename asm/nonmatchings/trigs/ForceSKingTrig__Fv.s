.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ForceSKingTrig__Fv, 0x8C

glabel ForceSKingTrig__Fv
    /* 66440 80076440 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 66444 80076444 1280043C */  lui        $a0, %hi(cursmx)
    /* 66448 80076448 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 6644C 8007644C 1280053C */  lui        $a1, %hi(cursmy)
    /* 66450 80076450 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 66454 80076454 1000BFAF */  sw         $ra, 0x10($sp)
    /* 66458 80076458 18D4010C */  jal        FindLevTrig__Fiii
    /* 6645C 8007645C 21300000 */   addu      $a2, $zero, $zero
    /* 66460 80076460 16004010 */  beqz       $v0, .L800764BC
    /* 66464 80076464 21100000 */   addu      $v0, $zero, $zero
    /* 66468 80076468 4AED010C */  jal        GetStr__Fi
    /* 6646C 8007646C 3B000424 */   addiu     $a0, $zero, 0x3B
    /* 66470 80076470 21284000 */  addu       $a1, $v0, $zero
    /* 66474 80076474 0D80023C */  lui        $v0, %hi(_infostr)
    /* 66478 80076478 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 6647C 8007647C 1280043C */  lui        $a0, %hi(sel_data)
    /* 66480 80076480 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 66484 80076484 0E80063C */  lui        $a2, %hi(quests + 0xF0)
    /* 66488 80076488 30DBC690 */  lbu        $a2, %lo(quests + 0xF0)($a2)
    /* 6648C 8007648C 00220400 */  sll        $a0, $a0, 8
    /* 66490 80076490 9767000C */  jal        sprintf
    /* 66494 80076494 21208200 */   addu      $a0, $a0, $v0
    /* 66498 80076498 0E80033C */  lui        $v1, %hi(trigs)
    /* 6649C 8007649C CC33638C */  lw         $v1, %lo(trigs)($v1)
    /* 664A0 800764A0 0E80043C */  lui        $a0, %hi(trigs + 0x4)
    /* 664A4 800764A4 D033848C */  lw         $a0, %lo(trigs + 0x4)($a0)
    /* 664A8 800764A8 01000224 */  addiu      $v0, $zero, 0x1
    /* 664AC 800764AC 1280013C */  lui        $at, %hi(cursmx)
    /* 664B0 800764B0 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 664B4 800764B4 1280013C */  lui        $at, %hi(cursmy)
    /* 664B8 800764B8 54B724AC */  sw         $a0, %lo(cursmy)($at)
  .L800764BC:
    /* 664BC 800764BC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 664C0 800764C0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 664C4 800764C4 0800E003 */  jr         $ra
    /* 664C8 800764C8 00000000 */   nop
endlabel ForceSKingTrig__Fv
