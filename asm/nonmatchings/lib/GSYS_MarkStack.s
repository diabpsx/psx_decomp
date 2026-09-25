.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GSYS_MarkStack, 0x10

glabel GSYS_MarkStack
    /* 111B8 800211B8 CDAB023C */  lui        $v0, (0xABCD0123 >> 16)
    /* 111BC 800211BC 23014234 */  ori        $v0, $v0, (0xABCD0123 & 0xFFFF)
    /* 111C0 800211C0 0800E003 */  jr         $ra
    /* 111C4 800211C4 000082AC */   sw        $v0, 0x0($a0)
endlabel GSYS_MarkStack
