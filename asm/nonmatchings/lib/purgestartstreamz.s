.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgestartstreamz, 0x28

glabel purgestartstreamz
    /* 1D4B8 8002D4B8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D4BC 8002D4BC 0D000624 */  addiu      $a2, $zero, 0xD
    /* 1D4C0 8002D4C0 21380000 */  addu       $a3, $zero, $zero
    /* 1D4C4 8002D4C4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D4C8 8002D4C8 ABB4000C */  jal        purgestreamcommanda
    /* 1D4CC 8002D4CC 1000A0AF */   sw        $zero, 0x10($sp)
    /* 1D4D0 8002D4D0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D4D4 8002D4D4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D4D8 8002D4D8 0800E003 */  jr         $ra
    /* 1D4DC 8002D4DC 00000000 */   nop
endlabel purgestartstreamz
