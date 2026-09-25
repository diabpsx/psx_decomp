.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AlterSpeedMenu__F9GM_SPEEDS, 0x54

glabel AlterSpeedMenu__F9GM_SPEEDS
    /* 9A154 800AA154 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 9A158 800AA158 00000000 */  nop
    /* 9A15C 800AA15C C0100200 */  sll        $v0, $v0, 3
    /* 9A160 800AA160 0D80013C */  lui        $at, %hi(MenuList + 0x4)
    /* 9A164 800AA164 21082200 */  addu       $at, $at, $v0
    /* 9A168 800AA168 44D2238C */  lw         $v1, %lo(MenuList + 0x4)($at)
    /* 9A16C 800AA16C 06008010 */  beqz       $a0, .L800AA188
    /* 9A170 800AA170 18006324 */   addiu     $v1, $v1, 0x18
    /* 9A174 800AA174 01000224 */  addiu      $v0, $zero, 0x1
    /* 9A178 800AA178 07008210 */  beq        $a0, $v0, .L800AA198
    /* 9A17C 800AA17C 00000000 */   nop
    /* 9A180 800AA180 68A80208 */  j          .L800AA1A0
    /* 9A184 800AA184 00000000 */   nop
  .L800AA188:
    /* 9A188 800AA188 01000224 */  addiu      $v0, $zero, 0x1
    /* 9A18C 800AA18C 0C0062AC */  sw         $v0, 0xC($v1)
    /* 9A190 800AA190 68A80208 */  j          .L800AA1A0
    /* 9A194 800AA194 240060AC */   sw        $zero, 0x24($v1)
  .L800AA198:
    /* 9A198 800AA198 0C0060AC */  sw         $zero, 0xC($v1)
    /* 9A19C 800AA19C 240064AC */  sw         $a0, 0x24($v1)
  .L800AA1A0:
    /* 9A1A0 800AA1A0 0800E003 */  jr         $ra
    /* 9A1A4 800AA1A4 00000000 */   nop
endlabel AlterSpeedMenu__F9GM_SPEEDS
