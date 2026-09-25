.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncOpL2Door__Fiii, 0x114

glabel SyncOpL2Door__Fiii
    /* 4DF7C 8005DF7C 1280023C */  lui        $v0, %hi(myplr)
    /* 4DF80 8005DF80 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4DF84 8005DF84 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4DF88 8005DF88 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4DF8C 8005DF8C 2180C000 */  addu       $s0, $a2, $zero
    /* 4DF90 8005DF90 1800BFAF */  sw         $ra, 0x18($sp)
    /* 4DF94 8005DF94 38008210 */  beq        $a0, $v0, .L8005E078
    /* 4DF98 8005DF98 1400B1AF */   sw        $s1, 0x14($sp)
    /* 4DF9C 8005DF9C 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 4DFA0 8005DFA0 0C00A214 */  bne        $a1, $v0, .L8005DFD4
    /* 4DFA4 8005DFA4 21200000 */   addu      $a0, $zero, $zero
    /* 4DFA8 8005DFA8 40101000 */  sll        $v0, $s0, 1
    /* 4DFAC 8005DFAC 21105000 */  addu       $v0, $v0, $s0
    /* 4DFB0 8005DFB0 80100200 */  sll        $v0, $v0, 2
    /* 4DFB4 8005DFB4 23105000 */  subu       $v0, $v0, $s0
    /* 4DFB8 8005DFB8 80100200 */  sll        $v0, $v0, 2
    /* 4DFBC 8005DFBC 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4DFC0 8005DFC0 21082200 */  addu       $at, $at, $v0
    /* 4DFC4 8005DFC4 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 4DFC8 8005DFC8 00000000 */  nop
    /* 4DFCC 8005DFCC 0100422C */  sltiu      $v0, $v0, 0x1
    /* 4DFD0 8005DFD0 21204000 */  addu       $a0, $v0, $zero
  .L8005DFD4:
    /* 4DFD4 8005DFD4 2C000224 */  addiu      $v0, $zero, 0x2C
    /* 4DFD8 8005DFD8 0E00A214 */  bne        $a1, $v0, .L8005E014
    /* 4DFDC 8005DFDC FF008230 */   andi      $v0, $a0, 0xFF
    /* 4DFE0 8005DFE0 40101000 */  sll        $v0, $s0, 1
    /* 4DFE4 8005DFE4 21105000 */  addu       $v0, $v0, $s0
    /* 4DFE8 8005DFE8 80100200 */  sll        $v0, $v0, 2
    /* 4DFEC 8005DFEC 23105000 */  subu       $v0, $v0, $s0
    /* 4DFF0 8005DFF0 80100200 */  sll        $v0, $v0, 2
    /* 4DFF4 8005DFF4 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4DFF8 8005DFF8 21082200 */  addu       $at, $at, $v0
    /* 4DFFC 8005DFFC 608C2384 */  lh         $v1, %lo(object + 0x14)($at)
    /* 4E000 8005E000 01000224 */  addiu      $v0, $zero, 0x1
    /* 4E004 8005E004 03006214 */  bne        $v1, $v0, .L8005E014
    /* 4E008 8005E008 FF008230 */   andi      $v0, $a0, 0xFF
    /* 4E00C 8005E00C 01000424 */  addiu      $a0, $zero, 0x1
    /* 4E010 8005E010 FF008230 */  andi       $v0, $a0, 0xFF
  .L8005E014:
    /* 4E014 8005E014 18004010 */  beqz       $v0, .L8005E078
    /* 4E018 8005E018 40101000 */   sll       $v0, $s0, 1
    /* 4E01C 8005E01C 21105000 */  addu       $v0, $v0, $s0
    /* 4E020 8005E020 80100200 */  sll        $v0, $v0, 2
    /* 4E024 8005E024 23105000 */  subu       $v0, $v0, $s0
    /* 4E028 8005E028 80880200 */  sll        $s1, $v0, 2
    /* 4E02C 8005E02C 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4E030 8005E030 21083100 */  addu       $at, $at, $s1
    /* 4E034 8005E034 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4E038 8005E038 2A000224 */  addiu      $v0, $zero, 0x2A
    /* 4E03C 8005E03C 09006214 */  bne        $v1, $v0, .L8005E064
    /* 4E040 8005E040 2B000224 */   addiu     $v0, $zero, 0x2B
    /* 4E044 8005E044 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 4E048 8005E048 21280002 */  addu       $a1, $s0, $zero
    /* 4E04C 8005E04C CA59010C */  jal        OperateL2LDoor__FiiUc
    /* 4E050 8005E050 21300000 */   addu      $a2, $zero, $zero
    /* 4E054 8005E054 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4E058 8005E058 21083100 */  addu       $at, $at, $s1
    /* 4E05C 8005E05C 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4E060 8005E060 2B000224 */  addiu      $v0, $zero, 0x2B
  .L8005E064:
    /* 4E064 8005E064 04006214 */  bne        $v1, $v0, .L8005E078
    /* 4E068 8005E068 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 4E06C 8005E06C 21280002 */  addu       $a1, $s0, $zero
    /* 4E070 8005E070 EF58010C */  jal        OperateL2RDoor__FiiUc
    /* 4E074 8005E074 21300000 */   addu      $a2, $zero, $zero
  .L8005E078:
    /* 4E078 8005E078 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4E07C 8005E07C 1400B18F */  lw         $s1, 0x14($sp)
    /* 4E080 8005E080 1000B08F */  lw         $s0, 0x10($sp)
    /* 4E084 8005E084 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4E088 8005E088 0800E003 */  jr         $ra
    /* 4E08C 8005E08C 00000000 */   nop
endlabel SyncOpL2Door__Fiii
