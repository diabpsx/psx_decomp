.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PCclose, 0x10

glabel PCclose
    /* ECC 80010ECC 21288000 */  addu       $a1, $a0, $zero
    /* ED0 80010ED0 0D410000 */  break      0, 260
    /* ED4 80010ED4 0800E003 */  jr         $ra
    /* ED8 80010ED8 00000000 */   nop
endlabel PCclose
