.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MEM_SetupMem__Fv, 0x2C

glabel MEM_SetupMem__Fv
    /* A04D0 800B04D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A04D4 800B04D4 1180023C */  lui        $v0, %hi(OPT_LinkerOpts)
    /* A04D8 800B04D8 D8DB4224 */  addiu      $v0, $v0, %lo(OPT_LinkerOpts)
    /* A04DC 800B04DC 1000BFAF */  sw         $ra, 0x10($sp)
    /* A04E0 800B04E0 580382AF */  sw         $v0, %gp_rel(Gaz)($gp)
    /* A04E4 800B04E4 3FC1020C */  jal        SetupWorkRam__Fv
    /* A04E8 800B04E8 00000000 */   nop
    /* A04EC 800B04EC 1000BF8F */  lw         $ra, 0x10($sp)
    /* A04F0 800B04F0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* A04F4 800B04F4 0800E003 */  jr         $ra
    /* A04F8 800B04F8 00000000 */   nop
endlabel MEM_SetupMem__Fv
