.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching testticks, 0x30

glabel testticks
    /* 2010C 8003010C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 20110 80030110 1000BFAF */  sw         $ra, 0x10($sp)
    /* 20114 80030114 08C0000C */  jal        gettick
    /* 20118 80030118 00000000 */   nop
    /* 2011C 8003011C 7C1E838F */  lw         $v1, %gp_rel(tickset)($gp)
    /* 20120 80030120 00000000 */  nop
    /* 20124 80030124 23104300 */  subu       $v0, $v0, $v1
    /* 20128 80030128 27100200 */  nor        $v0, $zero, $v0
    /* 2012C 8003012C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 20130 80030130 C2170200 */  srl        $v0, $v0, 31
    /* 20134 80030134 0800E003 */  jr         $ra
    /* 20138 80030138 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel testticks
