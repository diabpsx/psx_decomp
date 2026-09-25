.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DisablePAD, 0x14

glabel DisablePAD
    /* 1E90 80011E90 1380093C */  lui        $t1, %hi(jtbl_8012FFAC)
    /* 1E94 80011E94 ACFF298D */  lw         $t1, %lo(jtbl_8012FFAC)($t1)
    /* 1E98 80011E98 00000000 */  nop
    /* 1E9C 80011E9C 08002001 */  jr         $t1
    /* 1EA0 80011EA0 00000000 */   nop
endlabel DisablePAD
