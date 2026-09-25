.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncTOWN__FP13MissileStructiii, 0x1A0

glabel FuncTOWN__FP13MissileStructiii
    /* 6C01C 8007C01C A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 6C020 8007C020 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 6C024 8007C024 2198A000 */  addu       $s3, $a1, $zero
    /* 6C028 8007C028 5000B4AF */  sw         $s4, 0x50($sp)
    /* 6C02C 8007C02C 21A0C000 */  addu       $s4, $a2, $zero
    /* 6C030 8007C030 5400B5AF */  sw         $s5, 0x54($sp)
    /* 6C034 8007C034 5800BFAF */  sw         $ra, 0x58($sp)
    /* 6C038 8007C038 4800B2AF */  sw         $s2, 0x48($sp)
    /* 6C03C 8007C03C 4400B1AF */  sw         $s1, 0x44($sp)
    /* 6C040 8007C040 4000B0AF */  sw         $s0, 0x40($sp)
    /* 6C044 8007C044 3F008280 */  lb         $v0, 0x3F($a0)
    /* 6C048 8007C048 A814918F */  lw         $s1, %gp_rel(MissDat)($gp)
    /* 6C04C 8007C04C 03004018 */  blez       $v0, .L8007C05C
    /* 6C050 8007C050 21A8E000 */   addu      $s5, $a3, $zero
    /* 6C054 8007C054 18F00108 */  j          .L8007C060
    /* 6C058 8007C058 11001224 */   addiu     $s2, $zero, 0x11
  .L8007C05C:
    /* 6C05C 8007C05C 47009280 */  lb         $s2, 0x47($a0)
  .L8007C060:
    /* 6C060 8007C060 1280023C */  lui        $v0, %hi(currlevel)
    /* 6C064 8007C064 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 6C068 8007C068 00000000 */  nop
    /* 6C06C 8007C06C 1F004010 */  beqz       $v0, .L8007C0EC
    /* 6C070 8007C070 09000524 */   addiu     $a1, $zero, 0x9
    /* 6C074 8007C074 21202002 */  addu       $a0, $s1, $zero
    /* 6C078 8007C078 21300000 */  addu       $a2, $zero, $zero
    /* 6C07C 8007C07C 21380000 */  addu       $a3, $zero, $zero
    /* 6C080 8007C080 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6C084 8007C084 1000A0AF */   sw        $zero, 0x10($sp)
    /* 6C088 8007C088 FFFF5030 */  andi       $s0, $v0, 0xFFFF
    /* 6C08C 8007C08C 39F5010C */  jal        PRIM_GetPrim__FPP8POLY_FT4_8007d4e4
    /* 6C090 8007C090 3800A427 */   addiu     $a0, $sp, 0x38
    /* 6C094 8007C094 21202002 */  addu       $a0, $s1, $zero
    /* 6C098 8007C098 21300002 */  addu       $a2, $s0, $zero
    /* 6C09C 8007C09C 1000B4AF */  sw         $s4, 0x10($sp)
    /* 6C0A0 8007C0A0 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C0A4 8007C0A4 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C0A8 8007C0A8 3800A58F */  lw         $a1, 0x38($sp)
    /* 6C0AC 8007C0AC A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 6C0B0 8007C0B0 21386002 */   addu      $a3, $s3, $zero
    /* 6C0B4 8007C0B4 1000422A */  slti       $v0, $s2, 0x10
    /* 6C0B8 8007C0B8 08004014 */  bnez       $v0, .L8007C0DC
    /* 6C0BC 8007C0BC 21206002 */   addu      $a0, $s3, $zero
    /* 6C0C0 8007C0C0 21280000 */  addu       $a1, $zero, $zero
    /* 6C0C4 8007C0C4 21300000 */  addu       $a2, $zero, $zero
    /* 6C0C8 8007C0C8 1000B5AF */  sw         $s5, 0x10($sp)
    /* 6C0CC 8007C0CC 3800A48F */  lw         $a0, 0x38($sp)
    /* 6C0D0 8007C0D0 31EE010C */  jal        DoPortalFX__FP8POLY_FT4iiii
    /* 6C0D4 8007C0D4 FF000724 */   addiu     $a3, $zero, 0xFF
    /* 6C0D8 8007C0D8 21206002 */  addu       $a0, $s3, $zero
  .L8007C0DC:
    /* 6C0DC 8007C0DC 21288002 */  addu       $a1, $s4, $zero
    /* 6C0E0 8007C0E0 2130A002 */  addu       $a2, $s5, $zero
    /* 6C0E4 8007C0E4 59F00108 */  j          .L8007C164
    /* 6C0E8 8007C0E8 09000724 */   addiu     $a3, $zero, 0x9
  .L8007C0EC:
    /* 6C0EC 8007C0EC 21202002 */  addu       $a0, $s1, $zero
    /* 6C0F0 8007C0F0 02000524 */  addiu      $a1, $zero, 0x2
    /* 6C0F4 8007C0F4 21300000 */  addu       $a2, $zero, $zero
    /* 6C0F8 8007C0F8 21380000 */  addu       $a3, $zero, $zero
    /* 6C0FC 8007C0FC A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6C100 8007C100 1000A0AF */   sw        $zero, 0x10($sp)
    /* 6C104 8007C104 FFFF5030 */  andi       $s0, $v0, 0xFFFF
    /* 6C108 8007C108 39F5010C */  jal        PRIM_GetPrim__FPP8POLY_FT4_8007d4e4
    /* 6C10C 8007C10C 3800A427 */   addiu     $a0, $sp, 0x38
    /* 6C110 8007C110 21202002 */  addu       $a0, $s1, $zero
    /* 6C114 8007C114 21300002 */  addu       $a2, $s0, $zero
    /* 6C118 8007C118 1000B4AF */  sw         $s4, 0x10($sp)
    /* 6C11C 8007C11C 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C120 8007C120 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C124 8007C124 3800A58F */  lw         $a1, 0x38($sp)
    /* 6C128 8007C128 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 6C12C 8007C12C 21386002 */   addu      $a3, $s3, $zero
    /* 6C130 8007C130 1000422A */  slti       $v0, $s2, 0x10
    /* 6C134 8007C134 08004014 */  bnez       $v0, .L8007C158
    /* 6C138 8007C138 21206002 */   addu      $a0, $s3, $zero
    /* 6C13C 8007C13C 21280000 */  addu       $a1, $zero, $zero
    /* 6C140 8007C140 21300000 */  addu       $a2, $zero, $zero
    /* 6C144 8007C144 1000B5AF */  sw         $s5, 0x10($sp)
    /* 6C148 8007C148 3800A48F */  lw         $a0, 0x38($sp)
    /* 6C14C 8007C14C 31EE010C */  jal        DoPortalFX__FP8POLY_FT4iiii
    /* 6C150 8007C150 FF000724 */   addiu     $a3, $zero, 0xFF
    /* 6C154 8007C154 21206002 */  addu       $a0, $s3, $zero
  .L8007C158:
    /* 6C158 8007C158 21288002 */  addu       $a1, $s4, $zero
    /* 6C15C 8007C15C 2130A002 */  addu       $a2, $s5, $zero
    /* 6C160 8007C160 02000724 */  addiu      $a3, $zero, 0x2
  .L8007C164:
    /* 6C164 8007C164 C0000224 */  addiu      $v0, $zero, 0xC0
    /* 6C168 8007C168 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6C16C 8007C16C 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C170 8007C170 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C174 8007C174 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 6C178 8007C178 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6C17C 8007C17C 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6C180 8007C180 2800A0AF */  sw         $zero, 0x28($sp)
    /* 6C184 8007C184 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 6C188 8007C188 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C18C 8007C18C 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C190 8007C190 3400A0AF */   sw        $zero, 0x34($sp)
    /* 6C194 8007C194 5800BF8F */  lw         $ra, 0x58($sp)
    /* 6C198 8007C198 5400B58F */  lw         $s5, 0x54($sp)
    /* 6C19C 8007C19C 5000B48F */  lw         $s4, 0x50($sp)
    /* 6C1A0 8007C1A0 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 6C1A4 8007C1A4 4800B28F */  lw         $s2, 0x48($sp)
    /* 6C1A8 8007C1A8 4400B18F */  lw         $s1, 0x44($sp)
    /* 6C1AC 8007C1AC 4000B08F */  lw         $s0, 0x40($sp)
    /* 6C1B0 8007C1B0 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 6C1B4 8007C1B4 0800E003 */  jr         $ra
    /* 6C1B8 8007C1B8 00000000 */   nop
endlabel FuncTOWN__FP13MissileStructiii
