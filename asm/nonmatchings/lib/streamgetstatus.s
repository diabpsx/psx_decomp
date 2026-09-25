.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamgetstatus, 0x14

glabel streamgetstatus
    /* 1F258 8002F258 02008010 */  beqz       $a0, .L8002F264
    /* 1F25C 8002F25C 21100000 */   addu      $v0, $zero, $zero
    /* 1F260 8002F260 9000828C */  lw         $v0, 0x90($a0)
  .L8002F264:
    /* 1F264 8002F264 0800E003 */  jr         $ra
    /* 1F268 8002F268 00000000 */   nop
endlabel streamgetstatus
