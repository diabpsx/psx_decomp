.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RestartTownLvl__Fi, 0x4C

glabel RestartTownLvl__Fi
    /* 572EC 800672EC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 572F0 800672F0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 572F4 800672F4 40100400 */  sll        $v0, $a0, 1
    /* 572F8 800672F8 21104400 */  addu       $v0, $v0, $a0
    /* 572FC 800672FC 80100200 */  sll        $v0, $v0, 2
    /* 57300 80067300 21104400 */  addu       $v0, $v0, $a0
    /* 57304 80067304 00110200 */  sll        $v0, $v0, 4
    /* 57308 80067308 23104400 */  subu       $v0, $v0, $a0
    /* 5730C 8006730C 80100200 */  sll        $v0, $v0, 2
    /* 57310 80067310 21104400 */  addu       $v0, $v0, $a0
    /* 57314 80067314 C0100200 */  sll        $v0, $v0, 3
    /* 57318 80067318 0E80043C */  lui        $a0, %hi(plr)
    /* 5731C 8006731C 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 57320 80067320 E888010C */  jal        RestartTownLvl__FP12PlayerStruct
    /* 57324 80067324 21204400 */   addu      $a0, $v0, $a0
    /* 57328 80067328 1000BF8F */  lw         $ra, 0x10($sp)
    /* 5732C 8006732C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 57330 80067330 0800E003 */  jr         $ra
    /* 57334 80067334 00000000 */   nop
endlabel RestartTownLvl__Fi
