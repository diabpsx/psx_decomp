.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StSetRing, 0x2C

glabel StSetRing
    /* DE6C 8001DE6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* DE70 8001DE70 1000BFAF */  sw         $ra, 0x10($sp)
    /* DE74 8001DE74 1480013C */  lui        $at, %hi(StRingAddr)
    /* DE78 8001DE78 D89B24AC */  sw         $a0, %lo(StRingAddr)($at)
    /* DE7C 8001DE7C 1480013C */  lui        $at, %hi(StRingSize)
    /* DE80 8001DE80 A777000C */  jal        StClearRing
    /* DE84 8001DE84 F09B25AC */   sw        $a1, %lo(StRingSize)($at)
    /* DE88 8001DE88 1000BF8F */  lw         $ra, 0x10($sp)
    /* DE8C 8001DE8C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* DE90 8001DE90 0800E003 */  jr         $ra
    /* DE94 8001DE94 00000000 */   nop
endlabel StSetRing
    /* DE98 8001DE98 00000000 */  nop
