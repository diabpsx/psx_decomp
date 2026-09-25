.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initloadfilecallback, 0x18

glabel initloadfilecallback
    /* 1979C 8002979C 0380023C */  lui        $v0, %hi(eacloadfilecallback)
    /* 197A0 800297A0 14964224 */  addiu      $v0, $v0, %lo(eacloadfilecallback)
    /* 197A4 800297A4 1280013C */  lui        $at, %hi(loadfilecallback)
    /* 197A8 800297A8 98C422AC */  sw         $v0, %lo(loadfilecallback)($at)
    /* 197AC 800297AC 0800E003 */  jr         $ra
    /* 197B0 800297B0 00000000 */   nop
endlabel initloadfilecallback
