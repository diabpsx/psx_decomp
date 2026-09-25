.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncinitread, 0x70

glabel asyncinitread
    /* 17600 80027600 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 17604 80027604 20030224 */  addiu      $v0, $zero, 0x320
    /* 17608 80027608 781C82AF */  sw         $v0, %gp_rel(asynctimeout)($gp)
    /* 1760C 8002760C 01000224 */  addiu      $v0, $zero, 0x1
    /* 17610 80027610 1800BFAF */  sw         $ra, 0x18($sp)
    /* 17614 80027614 941C82AF */  sw         $v0, %gp_rel(asyncreadreq)($gp)
    /* 17618 80027618 556B000C */  jal        CdFlush
    /* 1761C 8002761C 00000000 */   nop
    /* 17620 80027620 21200000 */  addu       $a0, $zero, $zero
    /* 17624 80027624 7C6B000C */  jal        CdSync
    /* 17628 80027628 21280000 */   addu      $a1, $zero, $zero
    /* 1762C 8002762C E422858F */  lw         $a1, %gp_rel(asyncsector)($gp)
    /* 17630 80027630 1280043C */  lui        $a0, %hi(asyncloc)
    /* 17634 80027634 9CCA8424 */  addiu      $a0, $a0, %lo(asyncloc)
    /* 17638 80027638 4C9C000C */  jal        sectortotime
    /* 1763C 8002763C 00000000 */   nop
    /* 17640 80027640 1B000424 */  addiu      $a0, $zero, 0x1B
    /* 17644 80027644 1280053C */  lui        $a1, %hi(asyncloc)
    /* 17648 80027648 9CCAA524 */  addiu      $a1, $a1, %lo(asyncloc)
    /* 1764C 8002764C 966B000C */  jal        CdControl
    /* 17650 80027650 1000A627 */   addiu     $a2, $sp, 0x10
    /* 17654 80027654 E422828F */  lw         $v0, %gp_rel(asyncsector)($gp)
    /* 17658 80027658 00000000 */  nop
    /* 1765C 8002765C 3C2382AF */  sw         $v0, %gp_rel(currentsector)($gp)
    /* 17660 80027660 1800BF8F */  lw         $ra, 0x18($sp)
    /* 17664 80027664 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 17668 80027668 0800E003 */  jr         $ra
    /* 1766C 8002766C 00000000 */   nop
endlabel asyncinitread
