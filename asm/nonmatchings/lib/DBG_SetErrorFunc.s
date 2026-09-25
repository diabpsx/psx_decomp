.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DBG_SetErrorFunc, 0x10

glabel DBG_SetErrorFunc
    /* 10EC8 80020EC8 1280013C */  lui        $at, %hi(ErrorFunc)
    /* 10ECC 80020ECC B8CA24AC */  sw         $a0, %lo(ErrorFunc)($at)
    /* 10ED0 80020ED0 0800E003 */  jr         $ra
    /* 10ED4 80020ED4 00000000 */   nop
endlabel DBG_SetErrorFunc
