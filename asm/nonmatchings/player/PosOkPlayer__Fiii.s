.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PosOkPlayer__Fiii, 0x4C

glabel PosOkPlayer__Fiii
    /* 56B6C 80066B6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56B70 80066B70 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56B74 80066B74 40100400 */  sll        $v0, $a0, 1
    /* 56B78 80066B78 21104400 */  addu       $v0, $v0, $a0
    /* 56B7C 80066B7C 80100200 */  sll        $v0, $v0, 2
    /* 56B80 80066B80 21104400 */  addu       $v0, $v0, $a0
    /* 56B84 80066B84 00110200 */  sll        $v0, $v0, 4
    /* 56B88 80066B88 23104400 */  subu       $v0, $v0, $a0
    /* 56B8C 80066B8C 80100200 */  sll        $v0, $v0, 2
    /* 56B90 80066B90 21104400 */  addu       $v0, $v0, $a0
    /* 56B94 80066B94 C0100200 */  sll        $v0, $v0, 3
    /* 56B98 80066B98 0E80043C */  lui        $a0, %hi(plr)
    /* 56B9C 80066B9C 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56BA0 80066BA0 1D95010C */  jal        PosOkPlayer__FP12PlayerStructii
    /* 56BA4 80066BA4 21204400 */   addu      $a0, $v0, $a0
    /* 56BA8 80066BA8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56BAC 80066BAC FF004230 */  andi       $v0, $v0, 0xFF
    /* 56BB0 80066BB0 0800E003 */  jr         $ra
    /* 56BB4 80066BB4 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel PosOkPlayer__Fiii
