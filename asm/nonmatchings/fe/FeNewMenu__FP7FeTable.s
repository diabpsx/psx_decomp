.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeNewMenu__FP7FeTable, 0x80

glabel FeNewMenu__FP7FeTable
    /* 8AC 8013A4A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8B0 8013A4A8 0D80023C */  lui        $v0, %hi(DummyMenu)
    /* 8B4 8013A4AC 80D64224 */  addiu      $v0, $v0, %lo(DummyMenu)
    /* 8B8 8013A4B0 18008210 */  beq        $a0, $v0, .L8013A514
    /* 8BC 8013A4B4 1000BFAF */   sw        $ra, 0x10($sp)
    /* 8C0 8013A4B8 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* 8C4 8013A4BC 0D80023C */  lui        $v0, %hi(FeMainMenu)
    /* 8C8 8013A4C0 9CD64224 */  addiu      $v0, $v0, %lo(FeMainMenu)
    /* 8CC 8013A4C4 140C84AF */  sw         $a0, %gp_rel(FeCurMenu)($gp)
    /* 8D0 8013A4C8 02008210 */  beq        $a0, $v0, .L8013A4D4
    /* 8D4 8013A4CC 00000000 */   nop
    /* 8D8 8013A4D0 180083AC */  sw         $v1, 0x18($a0)
  .L8013A4D4:
    /* 8DC 8013A4D4 09E7040C */  jal        FeInitBuffer__Fv
    /* 8E0 8013A4D8 00000000 */   nop
    /* 8E4 8013A4DC 140C848F */  lw         $a0, %gp_rel(FeCurMenu)($gp)
    /* 8E8 8013A4E0 00000000 */  nop
    /* 8EC 8013A4E4 0400838C */  lw         $v1, 0x4($a0)
    /* 8F0 8013A4E8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 8F4 8013A4EC 02006214 */  bne        $v1, $v0, .L8013A4F8
    /* 8F8 8013A4F0 01000224 */   addiu     $v0, $zero, 0x1
    /* 8FC 8013A4F4 040082AC */  sw         $v0, 0x4($a0)
  .L8013A4F8:
    /* 900 8013A4F8 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 904 8013A4FC 00000000 */  nop
    /* 908 8013A500 1000428C */  lw         $v0, 0x10($v0)
    /* 90C 8013A504 00000000 */  nop
    /* 910 8013A508 09F84000 */  jalr       $v0
    /* 914 8013A50C 00000000 */   nop
    /* 918 8013A510 B40B80AF */  sw         $zero, %gp_rel(FeMenuDelay)($gp)
  .L8013A514:
    /* 91C 8013A514 1000BF8F */  lw         $ra, 0x10($sp)
    /* 920 8013A518 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 924 8013A51C 0800E003 */  jr         $ra
    /* 928 8013A520 00000000 */   nop
endlabel FeNewMenu__FP7FeTable
