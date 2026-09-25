.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WorldToScrY__7CBlocksii, 0x14

glabel WorldToScrY__7CBlocksii
    /* 819D8 800919D8 2110A600 */  addu       $v0, $a1, $a2
    /* 819DC 800919DC C21F0200 */  srl        $v1, $v0, 31
    /* 819E0 800919E0 21104300 */  addu       $v0, $v0, $v1
    /* 819E4 800919E4 0800E003 */  jr         $ra
    /* 819E8 800919E8 43100200 */   sra       $v0, $v0, 1
endlabel WorldToScrY__7CBlocksii
