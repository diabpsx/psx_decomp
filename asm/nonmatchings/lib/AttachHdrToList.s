.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AttachHdrToList, 0x20

glabel AttachHdrToList
    /* 11A6C 80021A6C 0000A0AC */  sw         $zero, 0x0($a1)
    /* 11A70 80021A70 0000828C */  lw         $v0, 0x0($a0)
    /* 11A74 80021A74 00000000 */  nop
    /* 11A78 80021A78 02004010 */  beqz       $v0, .L80021A84
    /* 11A7C 80021A7C 0400A2AC */   sw        $v0, 0x4($a1)
    /* 11A80 80021A80 000045AC */  sw         $a1, 0x0($v0)
  .L80021A84:
    /* 11A84 80021A84 0800E003 */  jr         $ra
    /* 11A88 80021A88 000085AC */   sw        $a1, 0x0($a0)
endlabel AttachHdrToList
