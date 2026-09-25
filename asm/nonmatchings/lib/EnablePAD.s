.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching EnablePAD, 0x14

glabel EnablePAD
    /* 1E7C 80011E7C 1380093C */  lui        $t1, %hi(jtbl_8012FFA8)
    /* 1E80 80011E80 A8FF298D */  lw         $t1, %lo(jtbl_8012FFA8)($t1)
    /* 1E84 80011E84 00000000 */  nop
    /* 1E88 80011E88 08002001 */  jr         $t1
    /* 1E8C 80011E8C 00000000 */   nop
endlabel EnablePAD
