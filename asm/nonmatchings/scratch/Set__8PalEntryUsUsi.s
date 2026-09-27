.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Set__8PalEntryUsUsi, 0x14

glabel Set__8PalEntryUsUsi
    /* 8B22C 8009B22C 0080C634 */  ori        $a2, $a2, 0x8000
    /* 8B230 8009B230 100085A4 */  sh         $a1, 0x10($a0)
    /* 8B234 8009B234 080086A4 */  sh         $a2, 0x8($a0)
    /* 8B238 8009B238 0800E003 */  jr         $ra
    /* 8B23C 8009B23C 120087A4 */   sh        $a3, 0x12($a0)
endlabel Set__8PalEntryUsUsi
