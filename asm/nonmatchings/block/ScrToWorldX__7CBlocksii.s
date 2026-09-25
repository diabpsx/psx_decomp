.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ScrToWorldX__7CBlocksii, 0x14

glabel ScrToWorldX__7CBlocksii
    /* 815E4 800915E4 C2170500 */  srl        $v0, $a1, 31
    /* 815E8 800915E8 21104500 */  addu       $v0, $v0, $a1
    /* 815EC 800915EC 43100200 */  sra        $v0, $v0, 1
    /* 815F0 800915F0 0800E003 */  jr         $ra
    /* 815F4 800915F4 21104600 */   addu      $v0, $v0, $a2
endlabel ScrToWorldX__7CBlocksii
