.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPolyFT4, 0x14

glabel SetPolyFT4
    /* 32B0 800132B0 09000224 */  addiu      $v0, $zero, 0x9
    /* 32B4 800132B4 030082A0 */  sb         $v0, 0x3($a0)
    /* 32B8 800132B8 2C000224 */  addiu      $v0, $zero, 0x2C
    /* 32BC 800132BC 0800E003 */  jr         $ra
    /* 32C0 800132C0 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetPolyFT4
