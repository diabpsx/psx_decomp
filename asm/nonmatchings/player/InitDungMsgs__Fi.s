.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitDungMsgs__Fi, 0x4C

glabel InitDungMsgs__Fi
    /* 57124 80067124 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 57128 80067128 1000BFAF */  sw         $ra, 0x10($sp)
    /* 5712C 8006712C 40100400 */  sll        $v0, $a0, 1
    /* 57130 80067130 21104400 */  addu       $v0, $v0, $a0
    /* 57134 80067134 80100200 */  sll        $v0, $v0, 2
    /* 57138 80067138 21104400 */  addu       $v0, $v0, $a0
    /* 5713C 8006713C 00110200 */  sll        $v0, $v0, 4
    /* 57140 80067140 23104400 */  subu       $v0, $v0, $a0
    /* 57144 80067144 80100200 */  sll        $v0, $v0, 2
    /* 57148 80067148 21104400 */  addu       $v0, $v0, $a0
    /* 5714C 8006714C C0100200 */  sll        $v0, $v0, 3
    /* 57150 80067150 0E80043C */  lui        $a0, %hi(plr)
    /* 57154 80067154 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 57158 80067158 1099010C */  jal        InitDungMsgs__FP12PlayerStruct
    /* 5715C 8006715C 21204400 */   addu      $a0, $v0, $a0
    /* 57160 80067160 1000BF8F */  lw         $ra, 0x10($sp)
    /* 57164 80067164 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 57168 80067168 0800E003 */  jr         $ra
    /* 5716C 8006716C 00000000 */   nop
endlabel InitDungMsgs__Fi
