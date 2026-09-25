.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlayerHitPoints__Fii, 0x4C

glabel SetPlayerHitPoints__Fii
    /* 56CF0 80066CF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56CF4 80066CF4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56CF8 80066CF8 40100400 */  sll        $v0, $a0, 1
    /* 56CFC 80066CFC 21104400 */  addu       $v0, $v0, $a0
    /* 56D00 80066D00 80100200 */  sll        $v0, $v0, 2
    /* 56D04 80066D04 21104400 */  addu       $v0, $v0, $a0
    /* 56D08 80066D08 00110200 */  sll        $v0, $v0, 4
    /* 56D0C 80066D0C 23104400 */  subu       $v0, $v0, $a0
    /* 56D10 80066D10 80100200 */  sll        $v0, $v0, 2
    /* 56D14 80066D14 21104400 */  addu       $v0, $v0, $a0
    /* 56D18 80066D18 C0100200 */  sll        $v0, $v0, 3
    /* 56D1C 80066D1C 0E80043C */  lui        $a0, %hi(plr)
    /* 56D20 80066D20 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56D24 80066D24 5A98010C */  jal        SetPlayerHitPoints__FP12PlayerStructi
    /* 56D28 80066D28 21204400 */   addu      $a0, $v0, $a0
    /* 56D2C 80066D2C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56D30 80066D30 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56D34 80066D34 0800E003 */  jr         $ra
    /* 56D38 80066D38 00000000 */   nop
endlabel SetPlayerHitPoints__Fii
