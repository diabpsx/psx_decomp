.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncstructsize, 0x18

glabel asyncstructsize
    /* 13780 80023780 40180400 */  sll        $v1, $a0, 1
    /* 13784 80023784 21186400 */  addu       $v1, $v1, $a0
    /* 13788 80023788 00110300 */  sll        $v0, $v1, 4
    /* 1378C 8002378C 23104300 */  subu       $v0, $v0, $v1
    /* 13790 80023790 0800E003 */  jr         $ra
    /* 13794 80023794 80100200 */   sll       $v0, $v0, 2
endlabel asyncstructsize
