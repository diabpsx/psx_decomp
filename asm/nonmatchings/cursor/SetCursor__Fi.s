.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetCursor__Fi, 0x64

glabel SetCursor__Fi
    /* 277A0 800377A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 277A4 800377A4 1280023C */  lui        $v0, %hi(myplr)
    /* 277A8 800377A8 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 277AC 800377AC 1280033C */  lui        $v1, %hi(_pcurs)
    /* 277B0 800377B0 30B76324 */  addiu      $v1, $v1, %lo(_pcurs)
    /* 277B4 800377B4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 277B8 800377B8 80100200 */  sll        $v0, $v0, 2
    /* 277BC 800377BC 21104300 */  addu       $v0, $v0, $v1
    /* 277C0 800377C0 000044AC */  sw         $a0, 0x0($v0)
    /* 277C4 800377C4 1180013C */  lui        $at, %hi(InvItemWidth)
    /* 277C8 800377C8 21082400 */  addu       $at, $at, $a0
    /* 277CC 800377CC 18D52390 */  lbu        $v1, %lo(InvItemWidth)($at)
    /* 277D0 800377D0 0000428C */  lw         $v0, 0x0($v0)
    /* 277D4 800377D4 B80F83AF */  sw         $v1, %gp_rel(cursW)($gp)
    /* 277D8 800377D8 1180013C */  lui        $at, %hi(InvItemHeight)
    /* 277DC 800377DC 21082200 */  addu       $at, $at, $v0
    /* 277E0 800377E0 CCD52290 */  lbu        $v0, %lo(InvItemHeight)($at)
    /* 277E4 800377E4 00000000 */  nop
    /* 277E8 800377E8 BC0F82AF */  sw         $v0, %gp_rel(cursH)($gp)
    /* 277EC 800377EC D1DD000C */  jal        SetICursor__Fi
    /* 277F0 800377F0 00000000 */   nop
    /* 277F4 800377F4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 277F8 800377F8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 277FC 800377FC 0800E003 */  jr         $ra
    /* 27800 80037800 00000000 */   nop
endlabel SetCursor__Fi
