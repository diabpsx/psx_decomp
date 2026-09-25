.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdLastCom, 0x10

glabel CdLastCom
    /* ACCC 8001ACCC 0B80023C */  lui        $v0, %hi(CD_com)
    /* ACD0 8001ACD0 155F4290 */  lbu        $v0, %lo(CD_com)($v0)
    /* ACD4 8001ACD4 0800E003 */  jr         $ra
    /* ACD8 8001ACD8 00000000 */   nop
endlabel CdLastCom
