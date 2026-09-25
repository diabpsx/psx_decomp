.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching blockhandlefile, 0x1C

glabel blockhandlefile
    /* 1655C 8002655C 80180400 */  sll        $v1, $a0, 2
    /* 16560 80026560 21186400 */  addu       $v1, $v1, $a0
    /* 16564 80026564 C0180300 */  sll        $v1, $v1, 3
    /* 16568 80026568 0B80023C */  lui        $v0, %hi(libblockhandle)
    /* 1656C 8002656C F4634224 */  addiu      $v0, $v0, %lo(libblockhandle)
    /* 16570 80026570 0800E003 */  jr         $ra
    /* 16574 80026574 21106200 */   addu      $v0, $v1, $v0
endlabel blockhandlefile
