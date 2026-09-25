.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddSLine__Fi, 0x50

glabel AddSLine__Fi
    /* 59D70 80069D70 C0100400 */  sll        $v0, $a0, 3
    /* 59D74 80069D74 21104400 */  addu       $v0, $v0, $a0
    /* 59D78 80069D78 80100200 */  sll        $v0, $v0, 2
    /* 59D7C 80069D7C 23104400 */  subu       $v0, $v0, $a0
    /* 59D80 80069D80 80100200 */  sll        $v0, $v0, 2
    /* 59D84 80069D84 01000324 */  addiu      $v1, $zero, 0x1
    /* 59D88 80069D88 1380013C */  lui        $at, %hi(D_8012EE48)
    /* 59D8C 80069D8C 21082200 */  addu       $at, $at, $v0
    /* 59D90 80069D90 48EE20A0 */  sb         $zero, %lo(D_8012EE48)($at)
    /* 59D94 80069D94 1380013C */  lui        $at, %hi(D_8012EE49)
    /* 59D98 80069D98 21082200 */  addu       $at, $at, $v0
    /* 59D9C 80069D9C 49EE20A0 */  sb         $zero, %lo(D_8012EE49)($at)
    /* 59DA0 80069DA0 1380013C */  lui        $at, %hi(D_8012EE4A)
    /* 59DA4 80069DA4 21082200 */  addu       $at, $at, $v0
    /* 59DA8 80069DA8 4AEE20A0 */  sb         $zero, %lo(D_8012EE4A)($at)
    /* 59DAC 80069DAC 1380013C */  lui        $at, %hi(D_8012EECC)
    /* 59DB0 80069DB0 21082200 */  addu       $at, $at, $v0
    /* 59DB4 80069DB4 CCEE23A0 */  sb         $v1, %lo(D_8012EECC)($at)
    /* 59DB8 80069DB8 0800E003 */  jr         $ra
    /* 59DBC 80069DBC 00000000 */   nop
endlabel AddSLine__Fi
