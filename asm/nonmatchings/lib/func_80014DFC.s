.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80014DFC, 0x98

glabel func_80014DFC
    /* 4DFC 80014DFC 00140400 */  sll        $v0, $a0, 16
    /* 4E00 80014E00 03340200 */  sra        $a2, $v0, 16
    /* 4E04 80014E04 0B00C004 */  bltz       $a2, .L80014E34
    /* 4E08 80014E08 21100000 */   addu      $v0, $zero, $zero
    /* 4E0C 80014E0C 0B80023C */  lui        $v0, %hi(D_800B54B0)
    /* 4E10 80014E10 B0544284 */  lh         $v0, %lo(D_800B54B0)($v0)
    /* 4E14 80014E14 00000000 */  nop
    /* 4E18 80014E18 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4E1C 80014E1C 2A104600 */  slt        $v0, $v0, $a2
    /* 4E20 80014E20 0B80063C */  lui        $a2, %hi(D_800B54B0)
    /* 4E24 80014E24 B054C694 */  lhu        $a2, %lo(D_800B54B0)($a2)
    /* 4E28 80014E28 02004014 */  bnez       $v0, .L80014E34
    /* 4E2C 80014E2C FFFFC224 */   addiu     $v0, $a2, -0x1
    /* 4E30 80014E30 21108000 */  addu       $v0, $a0, $zero
  .L80014E34:
    /* 4E34 80014E34 21204000 */  addu       $a0, $v0, $zero
    /* 4E38 80014E38 00140500 */  sll        $v0, $a1, 16
    /* 4E3C 80014E3C 03340200 */  sra        $a2, $v0, 16
    /* 4E40 80014E40 0C00C004 */  bltz       $a2, .L80014E74
    /* 4E44 80014E44 00000000 */   nop
    /* 4E48 80014E48 0B80023C */  lui        $v0, %hi(D_800B54B2)
    /* 4E4C 80014E4C B2544284 */  lh         $v0, %lo(D_800B54B2)($v0)
    /* 4E50 80014E50 00000000 */  nop
    /* 4E54 80014E54 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4E58 80014E58 2A104600 */  slt        $v0, $v0, $a2
    /* 4E5C 80014E5C 0B80063C */  lui        $a2, %hi(D_800B54B2)
    /* 4E60 80014E60 B254C694 */  lhu        $a2, %lo(D_800B54B2)($a2)
    /* 4E64 80014E64 05004010 */  beqz       $v0, .L80014E7C
    /* 4E68 80014E68 FF03A330 */   andi      $v1, $a1, 0x3FF
    /* 4E6C 80014E6C 9E530008 */  j          .L80014E78
    /* 4E70 80014E70 FFFFC524 */   addiu     $a1, $a2, -0x1
  .L80014E74:
    /* 4E74 80014E74 21280000 */  addu       $a1, $zero, $zero
  .L80014E78:
    /* 4E78 80014E78 FF03A330 */  andi       $v1, $a1, 0x3FF
  .L80014E7C:
    /* 4E7C 80014E7C 801A0300 */  sll        $v1, $v1, 10
    /* 4E80 80014E80 FF038230 */  andi       $v0, $a0, 0x3FF
    /* 4E84 80014E84 00E4043C */  lui        $a0, (0xE4000000 >> 16)
    /* 4E88 80014E88 25104400 */  or         $v0, $v0, $a0
    /* 4E8C 80014E8C 0800E003 */  jr         $ra
    /* 4E90 80014E90 25106200 */   or        $v0, $v1, $v0
endlabel func_80014DFC
