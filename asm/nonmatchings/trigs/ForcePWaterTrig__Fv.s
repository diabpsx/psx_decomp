.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ForcePWaterTrig__Fv, 0x8C

glabel ForcePWaterTrig__Fv
    /* 66558 80076558 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6655C 8007655C 1280043C */  lui        $a0, %hi(cursmx)
    /* 66560 80076560 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 66564 80076564 1280053C */  lui        $a1, %hi(cursmy)
    /* 66568 80076568 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 6656C 8007656C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 66570 80076570 18D4010C */  jal        FindLevTrig__Fiii
    /* 66574 80076574 01000624 */   addiu     $a2, $zero, 0x1
    /* 66578 80076578 16004010 */  beqz       $v0, .L800765D4
    /* 6657C 8007657C 21100000 */   addu      $v0, $zero, $zero
    /* 66580 80076580 4AED010C */  jal        GetStr__Fi
    /* 66584 80076584 3B000424 */   addiu     $a0, $zero, 0x3B
    /* 66588 80076588 21284000 */  addu       $a1, $v0, $zero
    /* 6658C 8007658C 0D80023C */  lui        $v0, %hi(_infostr)
    /* 66590 80076590 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 66594 80076594 1280043C */  lui        $a0, %hi(sel_data)
    /* 66598 80076598 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 6659C 8007659C 0E80063C */  lui        $a2, %hi(quests + 0x104)
    /* 665A0 800765A0 44DBC690 */  lbu        $a2, %lo(quests + 0x104)($a2)
    /* 665A4 800765A4 00220400 */  sll        $a0, $a0, 8
    /* 665A8 800765A8 9767000C */  jal        sprintf
    /* 665AC 800765AC 21208200 */   addu      $a0, $a0, $v0
    /* 665B0 800765B0 0E80033C */  lui        $v1, %hi(trigs)
    /* 665B4 800765B4 CC33638C */  lw         $v1, %lo(trigs)($v1)
    /* 665B8 800765B8 0E80043C */  lui        $a0, %hi(trigs + 0x4)
    /* 665BC 800765BC D033848C */  lw         $a0, %lo(trigs + 0x4)($a0)
    /* 665C0 800765C0 01000224 */  addiu      $v0, $zero, 0x1
    /* 665C4 800765C4 1280013C */  lui        $at, %hi(cursmx)
    /* 665C8 800765C8 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 665CC 800765CC 1280013C */  lui        $at, %hi(cursmy)
    /* 665D0 800765D0 54B724AC */  sw         $a0, %lo(cursmy)($at)
  .L800765D4:
    /* 665D4 800765D4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 665D8 800765D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 665DC 800765DC 0800E003 */  jr         $ra
    /* 665E0 800765E0 00000000 */   nop
endlabel ForcePWaterTrig__Fv
