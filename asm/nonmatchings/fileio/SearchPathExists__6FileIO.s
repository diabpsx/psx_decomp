.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SearchPathExists__6FileIO, 0x14

glabel SearchPathExists__6FileIO
    /* 76064 80086064 0800828C */  lw         $v0, 0x8($a0)
    /* 76068 80086068 00000000 */  nop
    /* 7606C 8008606C 27100200 */  nor        $v0, $zero, $v0
    /* 76070 80086070 0800E003 */  jr         $ra
    /* 76074 80086074 2B100200 */   sltu      $v0, $zero, $v0
endlabel SearchPathExists__6FileIO
