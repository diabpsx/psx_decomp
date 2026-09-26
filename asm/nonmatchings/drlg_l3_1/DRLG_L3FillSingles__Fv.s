.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3FillSingles__Fv, 0xCC

glabel DRLG_L3FillSingles__Fv
    /* FB58 80149750 01000D24 */  addiu      $t5, $zero, 0x1
    /* FB5C 80149754 0E800F3C */  lui        $t7, %hi(dungeon)
    /* FB60 80149758 C440EF25 */  addiu      $t7, $t7, %lo(dungeon)
    /* FB64 8014975C A0FFF925 */  addiu      $t9, $t7, -0x60
    /* FB68 80149760 6000F825 */  addiu      $t8, $t7, 0x60
    /* FB6C 80149764 03000E24 */  addiu      $t6, $zero, 0x3
  .L80149768:
    /* FB70 80149768 01000C24 */  addiu      $t4, $zero, 0x1
    /* FB74 8014976C 40580D00 */  sll        $t3, $t5, 1
    /* FB78 80149770 60000A27 */  addiu      $t2, $t8, 0x60
    /* FB7C 80149774 60002927 */  addiu      $t1, $t9, 0x60
    /* FB80 80149778 6000E825 */  addiu      $t0, $t7, 0x60
  .L8014977C:
    /* FB84 8014977C 21386801 */  addu       $a3, $t3, $t0
    /* FB88 80149780 0000E294 */  lhu        $v0, 0x0($a3)
    /* FB8C 80149784 00000000 */  nop
    /* FB90 80149788 18004014 */  bnez       $v0, .L801497EC
    /* FB94 8014978C 21286901 */   addu      $a1, $t3, $t1
    /* FB98 80149790 21306A01 */  addu       $a2, $t3, $t2
    /* FB9C 80149794 FEFFA294 */  lhu        $v0, -0x2($a1)
    /* FBA0 80149798 FEFFE394 */  lhu        $v1, -0x2($a3)
    /* FBA4 8014979C FEFFC494 */  lhu        $a0, -0x2($a2)
    /* FBA8 801497A0 21104300 */  addu       $v0, $v0, $v1
    /* FBAC 801497A4 21184400 */  addu       $v1, $v0, $a0
    /* FBB0 801497A8 10006E14 */  bne        $v1, $t6, .L801497EC
    /* FBB4 801497AC 00000000 */   nop
    /* FBB8 801497B0 0000A294 */  lhu        $v0, 0x0($a1)
    /* FBBC 801497B4 0000C394 */  lhu        $v1, 0x0($a2)
    /* FBC0 801497B8 00000000 */  nop
    /* FBC4 801497BC 21184300 */  addu       $v1, $v0, $v1
    /* FBC8 801497C0 02000224 */  addiu      $v0, $zero, 0x2
    /* FBCC 801497C4 09006214 */  bne        $v1, $v0, .L801497EC
    /* FBD0 801497C8 00000000 */   nop
    /* FBD4 801497CC 0200A294 */  lhu        $v0, 0x2($a1)
    /* FBD8 801497D0 0200E394 */  lhu        $v1, 0x2($a3)
    /* FBDC 801497D4 0200C494 */  lhu        $a0, 0x2($a2)
    /* FBE0 801497D8 21104300 */  addu       $v0, $v0, $v1
    /* FBE4 801497DC 21184400 */  addu       $v1, $v0, $a0
    /* FBE8 801497E0 02006E14 */  bne        $v1, $t6, .L801497EC
    /* FBEC 801497E4 01000224 */   addiu     $v0, $zero, 0x1
    /* FBF0 801497E8 0000E2A4 */  sh         $v0, 0x0($a3)
  .L801497EC:
    /* FBF4 801497EC 60004A25 */  addiu      $t2, $t2, 0x60
    /* FBF8 801497F0 60002925 */  addiu      $t1, $t1, 0x60
    /* FBFC 801497F4 01008C25 */  addiu      $t4, $t4, 0x1
    /* FC00 801497F8 27008229 */  slti       $v0, $t4, 0x27
    /* FC04 801497FC DFFF4014 */  bnez       $v0, .L8014977C
    /* FC08 80149800 60000825 */   addiu     $t0, $t0, 0x60
    /* FC0C 80149804 0100AD25 */  addiu      $t5, $t5, 0x1
    /* FC10 80149808 2700A229 */  slti       $v0, $t5, 0x27
    /* FC14 8014980C D6FF4014 */  bnez       $v0, .L80149768
    /* FC18 80149810 00000000 */   nop
    /* FC1C 80149814 0800E003 */  jr         $ra
    /* FC20 80149818 00000000 */   nop
endlabel DRLG_L3FillSingles__Fv
