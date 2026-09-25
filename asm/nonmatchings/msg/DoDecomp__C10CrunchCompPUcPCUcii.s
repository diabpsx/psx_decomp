.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoDecomp__C10CrunchCompPUcPCUcii, 0x28

glabel DoDecomp__C10CrunchCompPUcPCUcii
    /* 42AA4 80052AA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42AA8 80052AA8 2120C000 */  addu       $a0, $a2, $zero
    /* 42AAC 80052AAC 2800A68F */  lw         $a2, 0x28($sp)
    /* 42AB0 80052AB0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 42AB4 80052AB4 C042000C */  jal        decrunch
    /* 42AB8 80052AB8 00000000 */   nop
    /* 42ABC 80052ABC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 42AC0 80052AC0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42AC4 80052AC4 0800E003 */  jr         $ra
    /* 42AC8 80052AC8 00000000 */   nop
endlabel DoDecomp__C10CrunchCompPUcPCUcii
