.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ApocaStart__Fi, 0x64

glabel ApocaStart__Fi
    /* 90680 800A0680 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 90684 800A0684 1000BFAF */  sw         $ra, 0x10($sp)
    /* 90688 800A0688 40280400 */  sll        $a1, $a0, 1
    /* 9068C 800A068C 2128A400 */  addu       $a1, $a1, $a0
    /* 90690 800A0690 80280500 */  sll        $a1, $a1, 2
    /* 90694 800A0694 2128A400 */  addu       $a1, $a1, $a0
    /* 90698 800A0698 00290500 */  sll        $a1, $a1, 4
    /* 9069C 800A069C 2328A400 */  subu       $a1, $a1, $a0
    /* 906A0 800A06A0 80280500 */  sll        $a1, $a1, 2
    /* 906A4 800A06A4 2128A400 */  addu       $a1, $a1, $a0
    /* 906A8 800A06A8 C0280500 */  sll        $a1, $a1, 3
    /* 906AC 800A06AC 0E80033C */  lui        $v1, %hi(plr)
    /* 906B0 800A06B0 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 906B4 800A06B4 C0100400 */  sll        $v0, $a0, 3
    /* 906B8 800A06B8 21104400 */  addu       $v0, $v0, $a0
    /* 906BC 800A06BC C0100200 */  sll        $v0, $v0, 3
    /* 906C0 800A06C0 0D80043C */  lui        $a0, %hi(SpellFXDat)
    /* 906C4 800A06C4 DCC68424 */  addiu      $a0, $a0, %lo(SpellFXDat)
    /* 906C8 800A06C8 21204400 */  addu       $a0, $v0, $a0
    /* 906CC 800A06CC 2681020C */  jal        ApocInit__11SPELLFX_DATP12PlayerStruct
    /* 906D0 800A06D0 2128A300 */   addu      $a1, $a1, $v1
    /* 906D4 800A06D4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 906D8 800A06D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 906DC 800A06DC 0800E003 */  jr         $ra
    /* 906E0 800A06E0 00000000 */   nop
endlabel ApocaStart__Fi
