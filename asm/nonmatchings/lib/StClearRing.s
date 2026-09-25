.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StClearRing, 0x60

glabel StClearRing
    /* DE9C 8001DE9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* DEA0 8001DEA0 1480053C */  lui        $a1, %hi(StRingSize)
    /* DEA4 8001DEA4 F09BA58C */  lw         $a1, %lo(StRingSize)($a1)
    /* DEA8 8001DEA8 1000BFAF */  sw         $ra, 0x10($sp)
    /* DEAC 8001DEAC 1480013C */  lui        $at, %hi(StRingIdx3)
    /* DEB0 8001DEB0 C09B20AC */  sw         $zero, %lo(StRingIdx3)($at)
    /* DEB4 8001DEB4 1480013C */  lui        $at, %hi(StRingIdx2)
    /* DEB8 8001DEB8 BC9B20AC */  sw         $zero, %lo(StRingIdx2)($at)
    /* DEBC 8001DEBC 1480013C */  lui        $at, %hi(StRingIdx1)
    /* DEC0 8001DEC0 B89B20AC */  sw         $zero, %lo(StRingIdx1)($at)
    /* DEC4 8001DEC4 1380013C */  lui        $at, %hi(StFinalSector)
    /* DEC8 8001DEC8 287220AC */  sw         $zero, %lo(StFinalSector)($at)
    /* DECC 8001DECC E377000C */  jal        init_ring_status
    /* DED0 8001DED0 21200000 */   addu      $a0, $zero, $zero
    /* DED4 8001DED4 1380013C */  lui        $at, %hi(StCdIntrFlag)
    /* DED8 8001DED8 E45120AC */  sw         $zero, %lo(StCdIntrFlag)($at)
    /* DEDC 8001DEDC 1380013C */  lui        $at, %hi(Stsector_offset)
    /* DEE0 8001DEE0 D05120A4 */  sh         $zero, %lo(Stsector_offset)($at)
    /* DEE4 8001DEE4 1380013C */  lui        $at, %hi(Stframe_no)
    /* DEE8 8001DEE8 405020AC */  sw         $zero, %lo(Stframe_no)($at)
    /* DEEC 8001DEEC 1000BF8F */  lw         $ra, 0x10($sp)
    /* DEF0 8001DEF0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* DEF4 8001DEF4 0800E003 */  jr         $ra
    /* DEF8 8001DEF8 00000000 */   nop
endlabel StClearRing
