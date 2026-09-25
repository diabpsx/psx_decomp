.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTPage, 0x3C

glabel GetTPage
    /* 301C 8001301C 03008230 */  andi       $v0, $a0, 0x3
    /* 3020 80013020 C0110200 */  sll        $v0, $v0, 7
    /* 3024 80013024 0300A530 */  andi       $a1, $a1, 0x3
    /* 3028 80013028 40290500 */  sll        $a1, $a1, 5
    /* 302C 8001302C 25104500 */  or         $v0, $v0, $a1
    /* 3030 80013030 0001E330 */  andi       $v1, $a3, 0x100
    /* 3034 80013034 03190300 */  sra        $v1, $v1, 4
    /* 3038 80013038 25104300 */  or         $v0, $v0, $v1
    /* 303C 8001303C FF03C630 */  andi       $a2, $a2, 0x3FF
    /* 3040 80013040 83310600 */  sra        $a2, $a2, 6
    /* 3044 80013044 25104600 */  or         $v0, $v0, $a2
    /* 3048 80013048 0002E730 */  andi       $a3, $a3, 0x200
    /* 304C 8001304C 80380700 */  sll        $a3, $a3, 2
    /* 3050 80013050 0800E003 */  jr         $ra
    /* 3054 80013054 25104700 */   or        $v0, $v0, $a3
endlabel GetTPage
