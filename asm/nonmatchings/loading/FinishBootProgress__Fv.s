.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FinishBootProgress__Fv, 0x8C

glabel FinishBootProgress__Fv
    /* 94D4C 800A4D4C CC09828F */  lw         $v0, %gp_rel(D_8011B14C)($gp)
    /* 94D50 800A4D50 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 94D54 800A4D54 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 94D58 800A4D58 1A004010 */  beqz       $v0, .L800A4DC4
    /* 94D5C 800A4D5C 1800B0AF */   sw        $s0, 0x18($sp)
    /* 94D60 800A4D60 BEFC010C */  jal        PaletteFadeOut__Fi
    /* 94D64 800A4D64 08000424 */   addiu     $a0, $zero, 0x8
    /* 94D68 800A4D68 11004010 */  beqz       $v0, .L800A4DB0
    /* 94D6C 800A4D6C 00000000 */   nop
    /* 94D70 800A4D70 1180103C */  lui        $s0, %hi(D_80110CBE)
    /* 94D74 800A4D74 BE0C1026 */  addiu      $s0, $s0, %lo(D_80110CBE)
  .L800A4D78:
    /* 94D78 800A4D78 ABFB010C */  jal        GetFadeState__Fv
    /* 94D7C 800A4D7C 00000000 */   nop
    /* 94D80 800A4D80 0B004010 */  beqz       $v0, .L800A4DB0
    /* 94D84 800A4D84 0B000624 */   addiu     $a2, $zero, 0xB
    /* 94D88 800A4D88 0D80043C */  lui        $a0, %hi(CutScr)
    /* 94D8C 800A4D8C 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 94D90 800A4D90 00000596 */  lhu        $a1, 0x0($s0)
    /* 94D94 800A4D94 21380000 */  addu       $a3, $zero, $zero
    /* 94D98 800A4D98 F252020C */  jal        Display__7CScreeniiii
    /* 94D9C 800A4D9C 1000A0AF */   sw        $zero, 0x10($sp)
    /* 94DA0 800A4DA0 EE80000C */  jal        TSK_Sleep
    /* 94DA4 800A4DA4 01000424 */   addiu     $a0, $zero, 0x1
    /* 94DA8 800A4DA8 5E930208 */  j          .L800A4D78
    /* 94DAC 800A4DAC 00000000 */   nop
  .L800A4DB0:
    /* 94DB0 800A4DB0 0D80043C */  lui        $a0, %hi(CutScr)
    /* 94DB4 800A4DB4 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 94DB8 800A4DB8 E952020C */  jal        Unload__7CScreen
    /* 94DBC 800A4DBC 00000000 */   nop
    /* 94DC0 800A4DC0 C80980AF */  sw         $zero, %gp_rel(D_8011B148)($gp)
  .L800A4DC4:
    /* 94DC4 800A4DC4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 94DC8 800A4DC8 1800B08F */  lw         $s0, 0x18($sp)
    /* 94DCC 800A4DCC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 94DD0 800A4DD0 0800E003 */  jr         $ra
    /* 94DD4 800A4DD4 00000000 */   nop
endlabel FinishBootProgress__Fv
