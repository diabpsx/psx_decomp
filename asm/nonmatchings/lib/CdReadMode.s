.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdReadMode, 0x18

glabel CdReadMode
    /* DCA8 8001DCA8 0B80033C */  lui        $v1, %hi(D_800B6250)
    /* DCAC 8001DCAC 50626324 */  addiu      $v1, $v1, %lo(D_800B6250)
    /* DCB0 8001DCB0 0000628C */  lw         $v0, 0x0($v1)
    /* DCB4 8001DCB4 D0FF6324 */  addiu      $v1, $v1, -0x30
    /* DCB8 8001DCB8 0800E003 */  jr         $ra
    /* DCBC 8001DCBC 300064AC */   sw        $a0, 0x30($v1)
endlabel CdReadMode
    /* DCC0 8001DCC0 00000000 */  nop
    /* DCC4 8001DCC4 00000000 */  nop
    /* DCC8 8001DCC8 00000000 */  nop
