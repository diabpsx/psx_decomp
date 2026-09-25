.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdPosToInt, 0x80

glabel CdPosToInt
    /* B3BC 8001B3BC 00008390 */  lbu        $v1, 0x0($a0)
    /* B3C0 8001B3C0 01008690 */  lbu        $a2, 0x1($a0)
    /* B3C4 8001B3C4 02290300 */  srl        $a1, $v1, 4
    /* B3C8 8001B3C8 80100500 */  sll        $v0, $a1, 2
    /* B3CC 8001B3CC 21104500 */  addu       $v0, $v0, $a1
    /* B3D0 8001B3D0 40100200 */  sll        $v0, $v0, 1
    /* B3D4 8001B3D4 0F006330 */  andi       $v1, $v1, 0xF
    /* B3D8 8001B3D8 21104300 */  addu       $v0, $v0, $v1
    /* B3DC 8001B3DC 00290200 */  sll        $a1, $v0, 4
    /* B3E0 8001B3E0 2328A200 */  subu       $a1, $a1, $v0
    /* B3E4 8001B3E4 80280500 */  sll        $a1, $a1, 2
    /* B3E8 8001B3E8 02190600 */  srl        $v1, $a2, 4
    /* B3EC 8001B3EC 80100300 */  sll        $v0, $v1, 2
    /* B3F0 8001B3F0 21104300 */  addu       $v0, $v0, $v1
    /* B3F4 8001B3F4 40100200 */  sll        $v0, $v0, 1
    /* B3F8 8001B3F8 0F00C630 */  andi       $a2, $a2, 0xF
    /* B3FC 8001B3FC 21104600 */  addu       $v0, $v0, $a2
    /* B400 8001B400 2128A200 */  addu       $a1, $a1, $v0
    /* B404 8001B404 80180500 */  sll        $v1, $a1, 2
    /* B408 8001B408 21186500 */  addu       $v1, $v1, $a1
    /* B40C 8001B40C 00110300 */  sll        $v0, $v1, 4
    /* B410 8001B410 02008590 */  lbu        $a1, 0x2($a0)
    /* B414 8001B414 23104300 */  subu       $v0, $v0, $v1
    /* B418 8001B418 02210500 */  srl        $a0, $a1, 4
    /* B41C 8001B41C 80180400 */  sll        $v1, $a0, 2
    /* B420 8001B420 21186400 */  addu       $v1, $v1, $a0
    /* B424 8001B424 40180300 */  sll        $v1, $v1, 1
    /* B428 8001B428 0F00A530 */  andi       $a1, $a1, 0xF
    /* B42C 8001B42C 21186500 */  addu       $v1, $v1, $a1
    /* B430 8001B430 21104300 */  addu       $v0, $v0, $v1
    /* B434 8001B434 0800E003 */  jr         $ra
    /* B438 8001B438 6AFF4224 */   addiu     $v0, $v0, -0x96
endlabel CdPosToInt
