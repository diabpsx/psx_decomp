.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StopTAP, 0x20

glabel StopTAP
    /* FCFC 8001FCFC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FD00 8001FD00 1400BFAF */  sw         $ra, 0x14($sp)
    /* FD04 8001FD04 177F000C */  jal        func_8001FC5C
    /* FD08 8001FD08 00000000 */   nop
    /* FD0C 8001FD0C 1400BF8F */  lw         $ra, 0x14($sp)
    /* FD10 8001FD10 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FD14 8001FD14 0800E003 */  jr         $ra
    /* FD18 8001FD18 00000000 */   nop
endlabel StopTAP
