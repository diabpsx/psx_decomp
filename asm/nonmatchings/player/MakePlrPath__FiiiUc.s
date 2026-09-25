.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakePlrPath__FiiiUc, 0x50

glabel MakePlrPath__FiiiUc
    /* 56D3C 80066D3C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56D40 80066D40 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56D44 80066D44 40100400 */  sll        $v0, $a0, 1
    /* 56D48 80066D48 21104400 */  addu       $v0, $v0, $a0
    /* 56D4C 80066D4C 80100200 */  sll        $v0, $v0, 2
    /* 56D50 80066D50 21104400 */  addu       $v0, $v0, $a0
    /* 56D54 80066D54 00110200 */  sll        $v0, $v0, 4
    /* 56D58 80066D58 23104400 */  subu       $v0, $v0, $a0
    /* 56D5C 80066D5C 80100200 */  sll        $v0, $v0, 2
    /* 56D60 80066D60 21104400 */  addu       $v0, $v0, $a0
    /* 56D64 80066D64 C0100200 */  sll        $v0, $v0, 3
    /* 56D68 80066D68 0E80043C */  lui        $a0, %hi(plr)
    /* 56D6C 80066D6C 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56D70 80066D70 21204400 */  addu       $a0, $v0, $a0
    /* 56D74 80066D74 9395010C */  jal        MakePlrPath__FP12PlayerStructiiUc
    /* 56D78 80066D78 FF00E730 */   andi      $a3, $a3, 0xFF
    /* 56D7C 80066D7C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56D80 80066D80 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56D84 80066D84 0800E003 */  jr         $ra
    /* 56D88 80066D88 00000000 */   nop
endlabel MakePlrPath__FiiiUc
