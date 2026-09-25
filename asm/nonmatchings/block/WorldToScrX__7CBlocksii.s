.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WorldToScrX__7CBlocksii, 0x8

glabel WorldToScrX__7CBlocksii
    /* 819D0 800919D0 0800E003 */  jr         $ra
    /* 819D4 800919D4 2310A600 */   subu      $v0, $a1, $a2
endlabel WorldToScrX__7CBlocksii
