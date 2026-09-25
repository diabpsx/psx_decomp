.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ResetEntryInt, 0xC

glabel ResetEntryInt
    /* 296C 8001296C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 2970 80012970 08004001 */  jr         $t2
    /* 2974 80012974 18000924 */   addiu     $t1, $zero, 0x18
endlabel ResetEntryInt
    /* 2978 80012978 00000000 */  nop
