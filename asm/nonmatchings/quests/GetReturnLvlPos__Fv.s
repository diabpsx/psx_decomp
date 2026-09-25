.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetReturnLvlPos__Fv, 0x54

glabel GetReturnLvlPos__Fv
    /* 582DC 800682DC 0E80033C */  lui        $v1, %hi(quests + 0x12E)
    /* 582E0 800682E0 6EDB6390 */  lbu        $v1, %lo(quests + 0x12E)($v1)
    /* 582E4 800682E4 03000224 */  addiu      $v0, $zero, 0x3
    /* 582E8 800682E8 03006214 */  bne        $v1, $v0, .L800682F8
    /* 582EC 800682EC 02000224 */   addiu     $v0, $zero, 0x2
    /* 582F0 800682F0 0E80013C */  lui        $at, %hi(quests + 0x13C)
    /* 582F4 800682F4 7CDB22A0 */  sb         $v0, %lo(quests + 0x13C)($at)
  .L800682F8:
    /* 582F8 800682F8 D412828F */  lw         $v0, %gp_rel(ReturnLvlX)($gp)
    /* 582FC 800682FC D812838F */  lw         $v1, %gp_rel(ReturnLvlY)($gp)
    /* 58300 80068300 DC12848F */  lw         $a0, %gp_rel(ReturnLvl)($gp)
    /* 58304 80068304 E012858F */  lw         $a1, %gp_rel(ReturnLvlT)($gp)
    /* 58308 80068308 1280013C */  lui        $at, %hi(ViewX)
    /* 5830C 8006830C 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 58310 80068310 1280013C */  lui        $at, %hi(ViewY)
    /* 58314 80068314 18C123AC */  sw         $v1, %lo(ViewY)($at)
    /* 58318 80068318 1280013C */  lui        $at, %hi(currlevel)
    /* 5831C 8006831C 0CC124A0 */  sb         $a0, %lo(currlevel)($at)
    /* 58320 80068320 1280013C */  lui        $at, %hi(leveltype)
    /* 58324 80068324 0DC125A0 */  sb         $a1, %lo(leveltype)($at)
    /* 58328 80068328 0800E003 */  jr         $ra
    /* 5832C 8006832C 00000000 */   nop
endlabel GetReturnLvlPos__Fv
