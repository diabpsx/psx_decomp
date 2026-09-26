.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitLoadChar1Menu__Fv, 0x68

glabel FeInitLoadChar1Menu__Fv
    /* 2078 8013BC70 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 207C 8013BC74 21200000 */  addu       $a0, $zero, $zero
    /* 2080 8013BC78 21280000 */  addu       $a1, $zero, $zero
    /* 2084 8013BC7C 0C80023C */  lui        $v0, %hi(MediumFont)
    /* 2088 8013BC80 D8824224 */  addiu      $v0, $v0, %lo(MediumFont)
    /* 208C 8013BC84 01000624 */  addiu      $a2, $zero, 0x1
    /* 2090 8013BC88 B2030724 */  addiu      $a3, $zero, 0x3B2
    /* 2094 8013BC8C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 2098 8013BC90 1000A0AF */  sw         $zero, 0x10($sp)
    /* 209C 8013BC94 14E7040C */  jal        FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont
    /* 20A0 8013BC98 1400A2AF */   sw        $v0, 0x14($sp)
    /* 20A4 8013BC9C 01000424 */  addiu      $a0, $zero, 0x1
    /* 20A8 8013BCA0 1280013C */  lui        $at, %hi(current_card)
    /* 20AC 8013BCA4 60B420AC */  sw         $zero, %lo(current_card)($at)
    /* 20B0 8013BCA8 E495020C */  jal        ActivateMemcard__Fii
    /* 20B4 8013BCAC 21280000 */   addu      $a1, $zero, $zero
    /* 20B8 8013BCB0 01000224 */  addiu      $v0, $zero, 0x1
    /* 20BC 8013BCB4 1280013C */  lui        $at, %hi(CharacterBlockLoaded)
    /* 20C0 8013BCB8 40B220AC */  sw         $zero, %lo(CharacterBlockLoaded)($at)
    /* 20C4 8013BCBC 1280013C */  lui        $at, %hi(fileinfoflag)
    /* 20C8 8013BCC0 28B422AC */  sw         $v0, %lo(fileinfoflag)($at)
    /* 20CC 8013BCC4 240C80AF */  sw         $zero, %gp_rel(fileselect)($gp)
    /* 20D0 8013BCC8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 20D4 8013BCCC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 20D8 8013BCD0 0800E003 */  jr         $ra
    /* 20DC 8013BCD4 00000000 */   nop
endlabel FeInitLoadChar1Menu__Fv
