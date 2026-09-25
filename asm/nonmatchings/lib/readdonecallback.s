.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching readdonecallback, 0x14

glabel readdonecallback
    /* 173D8 800273D8 01000224 */  addiu      $v0, $zero, 0x1
    /* 173DC 800273DC 1280013C */  lui        $at, %hi(cdreaddone)
    /* 173E0 800273E0 98C522AC */  sw         $v0, %lo(cdreaddone)($at)
    /* 173E4 800273E4 0800E003 */  jr         $ra
    /* 173E8 800273E8 00000000 */   nop
endlabel readdonecallback
