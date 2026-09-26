.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont, 0x84

glabel FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont
    /* 58 80139C50 FC0B838F */  lw         $v1, %gp_rel(FeBufferCount)($gp)
    /* 5C 80139C54 00000000 */  nop
    /* 60 80139C58 40100300 */  sll        $v0, $v1, 1
    /* 64 80139C5C 21104300 */  addu       $v0, $v0, $v1
    /* 68 80139C60 C0100200 */  sll        $v0, $v0, 3
    /* 6C 80139C64 0D80013C */  lui        $at, %hi(FeBuffer)
    /* 70 80139C68 21082200 */  addu       $at, $at, $v0
    /* 74 80139C6C 78DB24AC */  sw         $a0, %lo(FeBuffer)($at)
    /* 78 80139C70 0D80013C */  lui        $at, %hi(FeBuffer + 0x4)
    /* 7C 80139C74 21082200 */  addu       $at, $at, $v0
    /* 80 80139C78 7CDB25AC */  sw         $a1, %lo(FeBuffer + 0x4)($at)
    /* 84 80139C7C 0D80013C */  lui        $at, %hi(FeBuffer + 0x8)
    /* 88 80139C80 21082200 */  addu       $at, $at, $v0
    /* 8C 80139C84 80DB26AC */  sw         $a2, %lo(FeBuffer + 0x8)($at)
    /* 90 80139C88 1000A58F */  lw         $a1, 0x10($sp)
    /* 94 80139C8C 1400A48F */  lw         $a0, 0x14($sp)
    /* 98 80139C90 FFFFE730 */  andi       $a3, $a3, 0xFFFF
    /* 9C 80139C94 0D80013C */  lui        $at, %hi(FeBuffer + 0xC)
    /* A0 80139C98 21082200 */  addu       $at, $at, $v0
    /* A4 80139C9C 84DB27AC */  sw         $a3, %lo(FeBuffer + 0xC)($at)
    /* A8 80139CA0 0D80013C */  lui        $at, %hi(FeBuffer + 0x10)
    /* AC 80139CA4 21082200 */  addu       $at, $at, $v0
    /* B0 80139CA8 88DB24AC */  sw         $a0, %lo(FeBuffer + 0x10)($at)
    /* B4 80139CAC 0D80013C */  lui        $at, %hi(FeBuffer + 0x14)
    /* B8 80139CB0 21082200 */  addu       $at, $at, $v0
    /* BC 80139CB4 8CDB25AC */  sw         $a1, %lo(FeBuffer + 0x14)($at)
    /* C0 80139CB8 000C828F */  lw         $v0, %gp_rel(FeMaxBufferCount)($gp)
    /* C4 80139CBC 01006324 */  addiu      $v1, $v1, 0x1
    /* C8 80139CC0 FC0B83AF */  sw         $v1, %gp_rel(FeBufferCount)($gp)
    /* CC 80139CC4 01004224 */  addiu      $v0, $v0, 0x1
    /* D0 80139CC8 000C82AF */  sw         $v0, %gp_rel(FeMaxBufferCount)($gp)
    /* D4 80139CCC 0800E003 */  jr         $ra
    /* D8 80139CD0 00000000 */   nop
endlabel FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont
