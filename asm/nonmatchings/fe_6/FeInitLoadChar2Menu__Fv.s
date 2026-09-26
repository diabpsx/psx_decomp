.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitLoadChar2Menu__Fv, 0x70

glabel FeInitLoadChar2Menu__Fv
    /* 20E0 8013BCD8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 20E4 8013BCDC 21200000 */  addu       $a0, $zero, $zero
    /* 20E8 8013BCE0 21280000 */  addu       $a1, $zero, $zero
    /* 20EC 8013BCE4 0C80023C */  lui        $v0, %hi(MediumFont)
    /* 20F0 8013BCE8 D8824224 */  addiu      $v0, $v0, %lo(MediumFont)
    /* 20F4 8013BCEC 01000624 */  addiu      $a2, $zero, 0x1
    /* 20F8 8013BCF0 B2030724 */  addiu      $a3, $zero, 0x3B2
    /* 20FC 8013BCF4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 2100 8013BCF8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2104 8013BCFC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 2108 8013BD00 14E7040C */  jal        FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont
    /* 210C 8013BD04 1400A2AF */   sw        $v0, 0x14($sp)
    /* 2110 8013BD08 21200000 */  addu       $a0, $zero, $zero
    /* 2114 8013BD0C 01001024 */  addiu      $s0, $zero, 0x1
    /* 2118 8013BD10 1280013C */  lui        $at, %hi(current_card)
    /* 211C 8013BD14 60B430AC */  sw         $s0, %lo(current_card)($at)
    /* 2120 8013BD18 E495020C */  jal        ActivateMemcard__Fii
    /* 2124 8013BD1C 01000524 */   addiu     $a1, $zero, 0x1
    /* 2128 8013BD20 1280013C */  lui        $at, %hi(CharacterBlockLoaded)
    /* 212C 8013BD24 40B220AC */  sw         $zero, %lo(CharacterBlockLoaded)($at)
    /* 2130 8013BD28 1280013C */  lui        $at, %hi(fileinfoflag)
    /* 2134 8013BD2C 28B430AC */  sw         $s0, %lo(fileinfoflag)($at)
    /* 2138 8013BD30 240C80AF */  sw         $zero, %gp_rel(fileselect)($gp)
    /* 213C 8013BD34 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 2140 8013BD38 1800B08F */  lw         $s0, 0x18($sp)
    /* 2144 8013BD3C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2148 8013BD40 0800E003 */  jr         $ra
    /* 214C 8013BD44 00000000 */   nop
endlabel FeInitLoadChar2Menu__Fv
