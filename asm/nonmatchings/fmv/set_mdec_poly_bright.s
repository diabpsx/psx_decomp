.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching set_mdec_poly_bright, 0x10

glabel set_mdec_poly_bright
    /* 1DAE4 801576DC 21480000 */  addu       $t1, $zero, $zero
    /* 1DAE8 801576E0 15800A3C */  lui        $t2, %hi(tmdc_pol)
    /* 1DAEC 801576E4 A44F4A25 */  addiu      $t2, $t2, %lo(tmdc_pol)
    /* 1DAF0 801576E8 21400000 */  addu       $t0, $zero, $zero
endlabel set_mdec_poly_bright
