.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HookEntryInt, 0xC

glabel HookEntryInt
    /* 297C 8001297C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 2980 80012980 08004001 */  jr         $t2
    /* 2984 80012984 19000924 */   addiu     $t1, $zero, 0x19
endlabel HookEntryInt
    /* 2988 80012988 00000000 */  nop
