.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcStatDiff__Fi, 0x4C

glabel CalcStatDiff__Fi
    /* 56BB8 80066BB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56BBC 80066BBC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56BC0 80066BC0 40100400 */  sll        $v0, $a0, 1
    /* 56BC4 80066BC4 21104400 */  addu       $v0, $v0, $a0
    /* 56BC8 80066BC8 80100200 */  sll        $v0, $v0, 2
    /* 56BCC 80066BCC 21104400 */  addu       $v0, $v0, $a0
    /* 56BD0 80066BD0 00110200 */  sll        $v0, $v0, 4
    /* 56BD4 80066BD4 23104400 */  subu       $v0, $v0, $a0
    /* 56BD8 80066BD8 80100200 */  sll        $v0, $v0, 2
    /* 56BDC 80066BDC 21104400 */  addu       $v0, $v0, $a0
    /* 56BE0 80066BE0 C0100200 */  sll        $v0, $v0, 3
    /* 56BE4 80066BE4 0E80043C */  lui        $a0, %hi(plr)
    /* 56BE8 80066BE8 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56BEC 80066BEC 2681010C */  jal        CalcStatDiff__FP12PlayerStruct
    /* 56BF0 80066BF0 21204400 */   addu      $a0, $v0, $a0
    /* 56BF4 80066BF4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56BF8 80066BF8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56BFC 80066BFC 0800E003 */  jr         $ra
    /* 56C00 80066C00 00000000 */   nop
endlabel CalcStatDiff__Fi
