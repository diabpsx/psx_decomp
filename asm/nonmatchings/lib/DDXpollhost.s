.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DDXpollhost, 0x40

glabel DDXpollhost
    /* 136D0 800236D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 136D4 800236D4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 136D8 800236D8 9B8C000C */  jal        SwapByte
    /* 136DC 800236DC FE000434 */   ori       $a0, $zero, 0xFE
    /* 136E0 800236E0 9B8C000C */  jal        SwapByte
    /* 136E4 800236E4 70000434 */   ori       $a0, $zero, 0x70
    /* 136E8 800236E8 C28C000C */  jal        GetLong
    /* 136EC 800236EC 00000000 */   nop
    /* 136F0 800236F0 03004010 */  beqz       $v0, .L80023700
    /* 136F4 800236F4 00000000 */   nop
    /* 136F8 800236F8 0D000000 */  break      0
    /* 136FC 800236FC 00000000 */  nop
  .L80023700:
    /* 13700 80023700 1000BF8F */  lw         $ra, 0x10($sp)
    /* 13704 80023704 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13708 80023708 0800E003 */  jr         $ra
    /* 1370C 8002370C 00000000 */   nop
endlabel DDXpollhost
