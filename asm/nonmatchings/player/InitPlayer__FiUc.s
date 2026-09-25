.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPlayer__FiUc, 0x50

glabel InitPlayer__FiUc
    /* 56FF0 80066FF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56FF4 80066FF4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56FF8 80066FF8 40100400 */  sll        $v0, $a0, 1
    /* 56FFC 80066FFC 21104400 */  addu       $v0, $v0, $a0
    /* 57000 80067000 80100200 */  sll        $v0, $v0, 2
    /* 57004 80067004 21104400 */  addu       $v0, $v0, $a0
    /* 57008 80067008 00110200 */  sll        $v0, $v0, 4
    /* 5700C 8006700C 23104400 */  subu       $v0, $v0, $a0
    /* 57010 80067010 80100200 */  sll        $v0, $v0, 2
    /* 57014 80067014 21104400 */  addu       $v0, $v0, $a0
    /* 57018 80067018 C0100200 */  sll        $v0, $v0, 3
    /* 5701C 8006701C 0E80043C */  lui        $a0, %hi(plr)
    /* 57020 80067020 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 57024 80067024 21204400 */  addu       $a0, $v0, $a0
    /* 57028 80067028 4982010C */  jal        InitPlayer__FP12PlayerStructUc
    /* 5702C 8006702C FF00A530 */   andi      $a1, $a1, 0xFF
    /* 57030 80067030 1000BF8F */  lw         $ra, 0x10($sp)
    /* 57034 80067034 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 57038 80067038 0800E003 */  jr         $ra
    /* 5703C 8006703C 00000000 */   nop
endlabel InitPlayer__FiUc
