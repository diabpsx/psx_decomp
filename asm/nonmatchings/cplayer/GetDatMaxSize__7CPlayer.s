.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDatMaxSize__7CPlayer, 0x40

glabel GetDatMaxSize__7CPlayer
    /* 86720 80096720 7800828C */  lw         $v0, 0x78($a0)
    /* 86724 80096724 00000000 */  nop
    /* 86728 80096728 03004010 */  beqz       $v0, .L80096738
    /* 8672C 8009672C 0100023C */   lui       $v0, (0x19E10 >> 16)
    /* 86730 80096730 D6590208 */  j          .L80096758
    /* 86734 80096734 109E4234 */   ori       $v0, $v0, (0x19E10 & 0xFFFF)
  .L80096738:
    /* 86738 80096738 0100033C */  lui        $v1, (0x182B8 >> 16)
    /* 8673C 8009673C 74008294 */  lhu        $v0, 0x74($a0)
    /* 86740 80096740 00000000 */  nop
    /* 86744 80096744 03004014 */  bnez       $v0, .L80096754
    /* 86748 80096748 B8826334 */   ori       $v1, $v1, (0x182B8 & 0xFFFF)
    /* 8674C 8009674C 0200033C */  lui        $v1, (0x2C308 >> 16)
    /* 86750 80096750 08C36334 */  ori        $v1, $v1, (0x2C308 & 0xFFFF)
  .L80096754:
    /* 86754 80096754 21106000 */  addu       $v0, $v1, $zero
  .L80096758:
    /* 86758 80096758 0800E003 */  jr         $ra
    /* 8675C 8009675C 00000000 */   nop
endlabel GetDatMaxSize__7CPlayer
