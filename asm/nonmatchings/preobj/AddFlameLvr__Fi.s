.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFlameLvr__Fi, 0x40

glabel AddFlameLvr__Fi
    /* 1D650 80157248 40100400 */  sll        $v0, $a0, 1
    /* 1D654 8015724C 21104400 */  addu       $v0, $v0, $a0
    /* 1D658 80157250 80100200 */  sll        $v0, $v0, 2
    /* 1D65C 80157254 23104400 */  subu       $v0, $v0, $a0
    /* 1D660 80157258 80100200 */  sll        $v0, $v0, 2
    /* 1D664 8015725C 1280043C */  lui        $a0, %hi(trapid)
    /* 1D668 80157260 D4B9848C */  lw         $a0, %lo(trapid)($a0)
    /* 1D66C 80157264 31000324 */  addiu      $v1, $zero, 0x31
    /* 1D670 80157268 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1D674 8015726C 21082200 */  addu       $at, $at, $v0
    /* 1D678 80157270 5C8C23A4 */  sh         $v1, %lo(object + 0x10)($at)
    /* 1D67C 80157274 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1D680 80157278 21082200 */  addu       $at, $at, $v0
    /* 1D684 8015727C 5A8C24A4 */  sh         $a0, %lo(object + 0xE)($at)
    /* 1D688 80157280 0800E003 */  jr         $ra
    /* 1D68C 80157284 00000000 */   nop
endlabel AddFlameLvr__Fi
