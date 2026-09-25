.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ScrToWorldY__7CBlocksii, 0x14

glabel ScrToWorldY__7CBlocksii
    /* 815F8 800915F8 C2170500 */  srl        $v0, $a1, 31
    /* 815FC 800915FC 21104500 */  addu       $v0, $v0, $a1
    /* 81600 80091600 43100200 */  sra        $v0, $v0, 1
    /* 81604 80091604 0800E003 */  jr         $ra
    /* 81608 80091608 2310C200 */   subu      $v0, $a2, $v0
endlabel ScrToWorldY__7CBlocksii
