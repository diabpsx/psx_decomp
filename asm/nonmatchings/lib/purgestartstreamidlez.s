.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgestartstreamidlez, 0x28

glabel purgestartstreamidlez
    /* 1D5BC 8002D5BC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D5C0 8002D5C0 14000624 */  addiu      $a2, $zero, 0x14
    /* 1D5C4 8002D5C4 21380000 */  addu       $a3, $zero, $zero
    /* 1D5C8 8002D5C8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D5CC 8002D5CC ABB4000C */  jal        purgestreamcommanda
    /* 1D5D0 8002D5D0 1000A0AF */   sw        $zero, 0x10($sp)
    /* 1D5D4 8002D5D4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D5D8 8002D5D8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D5DC 8002D5DC 0800E003 */  jr         $ra
    /* 1D5E0 8002D5E0 00000000 */   nop
endlabel purgestartstreamidlez
