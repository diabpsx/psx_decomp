.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartNewLvl__Fiii, 0x4C

glabel StartNewLvl__Fiii
    /* 56C04 80066C04 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56C08 80066C08 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56C0C 80066C0C 40100400 */  sll        $v0, $a0, 1
    /* 56C10 80066C10 21104400 */  addu       $v0, $v0, $a0
    /* 56C14 80066C14 80100200 */  sll        $v0, $v0, 2
    /* 56C18 80066C18 21104400 */  addu       $v0, $v0, $a0
    /* 56C1C 80066C1C 00110200 */  sll        $v0, $v0, 4
    /* 56C20 80066C20 23104400 */  subu       $v0, $v0, $a0
    /* 56C24 80066C24 80100200 */  sll        $v0, $v0, 2
    /* 56C28 80066C28 21104400 */  addu       $v0, $v0, $a0
    /* 56C2C 80066C2C C0100200 */  sll        $v0, $v0, 3
    /* 56C30 80066C30 0E80043C */  lui        $a0, %hi(plr)
    /* 56C34 80066C34 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56C38 80066C38 7B88010C */  jal        StartNewLvl__FP12PlayerStructii
    /* 56C3C 80066C3C 21204400 */   addu      $a0, $v0, $a0
    /* 56C40 80066C40 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56C44 80066C44 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56C48 80066C48 0800E003 */  jr         $ra
    /* 56C4C 80066C4C 00000000 */   nop
endlabel StartNewLvl__Fiii
