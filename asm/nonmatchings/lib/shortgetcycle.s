.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching shortgetcycle, 0x1C

glabel shortgetcycle
    /* 1FBD8 8002FBD8 801F023C */  lui        $v0, (0x1F801110 >> 16)
    /* 1FBDC 8002FBDC 10114284 */  lh         $v0, (0x1F801110 & 0xFFFF)($v0)
    /* 1FBE0 8002FBE0 801F033C */  lui        $v1, (0x1F801070 >> 16)
    /* 1FBE4 8002FBE4 7010638C */  lw         $v1, (0x1F801070 & 0xFFFF)($v1)
    /* 1FBE8 8002FBE8 00140200 */  sll        $v0, $v0, 16
    /* 1FBEC 8002FBEC 0800E003 */  jr         $ra
    /* 1FBF0 8002FBF0 03140200 */   sra       $v0, $v0, 16
endlabel shortgetcycle
