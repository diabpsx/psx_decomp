.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetClut, 0x18

glabel GetClut
    /* 3058 80013058 80110500 */  sll        $v0, $a1, 6
    /* 305C 8001305C 03210400 */  sra        $a0, $a0, 4
    /* 3060 80013060 3F008430 */  andi       $a0, $a0, 0x3F
    /* 3064 80013064 25104400 */  or         $v0, $v0, $a0
    /* 3068 80013068 0800E003 */  jr         $ra
    /* 306C 8001306C FFFF4230 */   andi      $v0, $v0, 0xFFFF
endlabel GetClut
