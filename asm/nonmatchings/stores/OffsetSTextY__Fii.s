.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OffsetSTextY__Fii, 0x28

glabel OffsetSTextY__Fii
    /* 59DE8 80069DE8 C0100400 */  sll        $v0, $a0, 3
    /* 59DEC 80069DEC 21104400 */  addu       $v0, $v0, $a0
    /* 59DF0 80069DF0 80100200 */  sll        $v0, $v0, 2
    /* 59DF4 80069DF4 23104400 */  subu       $v0, $v0, $a0
    /* 59DF8 80069DF8 80100200 */  sll        $v0, $v0, 2
    /* 59DFC 80069DFC 1380013C */  lui        $at, %hi(D_8012EE49)
    /* 59E00 80069E00 21082200 */  addu       $at, $at, $v0
    /* 59E04 80069E04 49EE25A0 */  sb         $a1, %lo(D_8012EE49)($at)
    /* 59E08 80069E08 0800E003 */  jr         $ra
    /* 59E0C 80069E0C 00000000 */   nop
endlabel OffsetSTextY__Fii
