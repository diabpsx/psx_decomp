.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamreleasestatus, 0x14

glabel streamreleasestatus
    /* 1F26C 8002F26C 02008010 */  beqz       $a0, .L8002F278
    /* 1F270 8002F270 21100000 */   addu      $v0, $zero, $zero
    /* 1F274 8002F274 9400828C */  lw         $v0, 0x94($a0)
  .L8002F278:
    /* 1F278 8002F278 0800E003 */  jr         $ra
    /* 1F27C 8002F27C 00000000 */   nop
endlabel streamreleasestatus
