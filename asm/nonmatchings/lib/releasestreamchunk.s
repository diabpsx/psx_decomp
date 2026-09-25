.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching releasestreamchunk, 0xC

glabel releasestreamchunk
    /* 1F24C 8002F24C FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 1F250 8002F250 0800E003 */  jr         $ra
    /* 1F254 8002F254 0000A2AC */   sw        $v0, 0x0($a1)
endlabel releasestreamchunk
