.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreatePlayer__Fic, 0x54

glabel CreatePlayer__Fic
    /* 56C50 80066C50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56C54 80066C54 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56C58 80066C58 40100400 */  sll        $v0, $a0, 1
    /* 56C5C 80066C5C 21104400 */  addu       $v0, $v0, $a0
    /* 56C60 80066C60 80100200 */  sll        $v0, $v0, 2
    /* 56C64 80066C64 21104400 */  addu       $v0, $v0, $a0
    /* 56C68 80066C68 00110200 */  sll        $v0, $v0, 4
    /* 56C6C 80066C6C 23104400 */  subu       $v0, $v0, $a0
    /* 56C70 80066C70 80100200 */  sll        $v0, $v0, 2
    /* 56C74 80066C74 21104400 */  addu       $v0, $v0, $a0
    /* 56C78 80066C78 C0100200 */  sll        $v0, $v0, 3
    /* 56C7C 80066C7C 0E80043C */  lui        $a0, %hi(plr)
    /* 56C80 80066C80 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56C84 80066C84 002E0500 */  sll        $a1, $a1, 24
    /* 56C88 80066C88 21204400 */  addu       $a0, $v0, $a0
    /* 56C8C 80066C8C 2480010C */  jal        CreatePlayer__FP12PlayerStructc
    /* 56C90 80066C90 032E0500 */   sra       $a1, $a1, 24
    /* 56C94 80066C94 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56C98 80066C98 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56C9C 80066C9C 0800E003 */  jr         $ra
    /* 56CA0 80066CA0 00000000 */   nop
endlabel CreatePlayer__Fic
