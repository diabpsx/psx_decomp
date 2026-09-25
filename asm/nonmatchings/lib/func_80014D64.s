.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80014D64, 0x98

glabel func_80014D64
    /* 4D64 80014D64 00140400 */  sll        $v0, $a0, 16
    /* 4D68 80014D68 03340200 */  sra        $a2, $v0, 16
    /* 4D6C 80014D6C 0B00C004 */  bltz       $a2, .L80014D9C
    /* 4D70 80014D70 21100000 */   addu      $v0, $zero, $zero
    /* 4D74 80014D74 0B80023C */  lui        $v0, %hi(D_800B54B0)
    /* 4D78 80014D78 B0544284 */  lh         $v0, %lo(D_800B54B0)($v0)
    /* 4D7C 80014D7C 00000000 */  nop
    /* 4D80 80014D80 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4D84 80014D84 2A104600 */  slt        $v0, $v0, $a2
    /* 4D88 80014D88 0B80063C */  lui        $a2, %hi(D_800B54B0)
    /* 4D8C 80014D8C B054C694 */  lhu        $a2, %lo(D_800B54B0)($a2)
    /* 4D90 80014D90 02004014 */  bnez       $v0, .L80014D9C
    /* 4D94 80014D94 FFFFC224 */   addiu     $v0, $a2, -0x1
    /* 4D98 80014D98 21108000 */  addu       $v0, $a0, $zero
  .L80014D9C:
    /* 4D9C 80014D9C 21204000 */  addu       $a0, $v0, $zero
    /* 4DA0 80014DA0 00140500 */  sll        $v0, $a1, 16
    /* 4DA4 80014DA4 03340200 */  sra        $a2, $v0, 16
    /* 4DA8 80014DA8 0C00C004 */  bltz       $a2, .L80014DDC
    /* 4DAC 80014DAC 00000000 */   nop
    /* 4DB0 80014DB0 0B80023C */  lui        $v0, %hi(D_800B54B2)
    /* 4DB4 80014DB4 B2544284 */  lh         $v0, %lo(D_800B54B2)($v0)
    /* 4DB8 80014DB8 00000000 */  nop
    /* 4DBC 80014DBC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4DC0 80014DC0 2A104600 */  slt        $v0, $v0, $a2
    /* 4DC4 80014DC4 0B80063C */  lui        $a2, %hi(D_800B54B2)
    /* 4DC8 80014DC8 B254C694 */  lhu        $a2, %lo(D_800B54B2)($a2)
    /* 4DCC 80014DCC 05004010 */  beqz       $v0, .L80014DE4
    /* 4DD0 80014DD0 FF03A330 */   andi      $v1, $a1, 0x3FF
    /* 4DD4 80014DD4 78530008 */  j          .L80014DE0
    /* 4DD8 80014DD8 FFFFC524 */   addiu     $a1, $a2, -0x1
  .L80014DDC:
    /* 4DDC 80014DDC 21280000 */  addu       $a1, $zero, $zero
  .L80014DE0:
    /* 4DE0 80014DE0 FF03A330 */  andi       $v1, $a1, 0x3FF
  .L80014DE4:
    /* 4DE4 80014DE4 801A0300 */  sll        $v1, $v1, 10
    /* 4DE8 80014DE8 FF038230 */  andi       $v0, $a0, 0x3FF
    /* 4DEC 80014DEC 00E3043C */  lui        $a0, (0xE3000000 >> 16)
    /* 4DF0 80014DF0 25104400 */  or         $v0, $v0, $a0
    /* 4DF4 80014DF4 0800E003 */  jr         $ra
    /* 4DF8 80014DF8 25106200 */   or        $v0, $v1, $v0
endlabel func_80014D64
