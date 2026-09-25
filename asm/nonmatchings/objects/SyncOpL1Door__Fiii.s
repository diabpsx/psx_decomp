.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncOpL1Door__Fiii, 0x114

glabel SyncOpL1Door__Fiii
    /* 4DE68 8005DE68 1280023C */  lui        $v0, %hi(myplr)
    /* 4DE6C 8005DE6C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4DE70 8005DE70 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4DE74 8005DE74 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4DE78 8005DE78 2180C000 */  addu       $s0, $a2, $zero
    /* 4DE7C 8005DE7C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 4DE80 8005DE80 38008210 */  beq        $a0, $v0, .L8005DF64
    /* 4DE84 8005DE84 1400B1AF */   sw        $s1, 0x14($sp)
    /* 4DE88 8005DE88 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 4DE8C 8005DE8C 0C00A214 */  bne        $a1, $v0, .L8005DEC0
    /* 4DE90 8005DE90 21200000 */   addu      $a0, $zero, $zero
    /* 4DE94 8005DE94 40101000 */  sll        $v0, $s0, 1
    /* 4DE98 8005DE98 21105000 */  addu       $v0, $v0, $s0
    /* 4DE9C 8005DE9C 80100200 */  sll        $v0, $v0, 2
    /* 4DEA0 8005DEA0 23105000 */  subu       $v0, $v0, $s0
    /* 4DEA4 8005DEA4 80100200 */  sll        $v0, $v0, 2
    /* 4DEA8 8005DEA8 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4DEAC 8005DEAC 21082200 */  addu       $at, $at, $v0
    /* 4DEB0 8005DEB0 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 4DEB4 8005DEB4 00000000 */  nop
    /* 4DEB8 8005DEB8 0100422C */  sltiu      $v0, $v0, 0x1
    /* 4DEBC 8005DEBC 21204000 */  addu       $a0, $v0, $zero
  .L8005DEC0:
    /* 4DEC0 8005DEC0 2C000224 */  addiu      $v0, $zero, 0x2C
    /* 4DEC4 8005DEC4 0E00A214 */  bne        $a1, $v0, .L8005DF00
    /* 4DEC8 8005DEC8 FF008230 */   andi      $v0, $a0, 0xFF
    /* 4DECC 8005DECC 40101000 */  sll        $v0, $s0, 1
    /* 4DED0 8005DED0 21105000 */  addu       $v0, $v0, $s0
    /* 4DED4 8005DED4 80100200 */  sll        $v0, $v0, 2
    /* 4DED8 8005DED8 23105000 */  subu       $v0, $v0, $s0
    /* 4DEDC 8005DEDC 80100200 */  sll        $v0, $v0, 2
    /* 4DEE0 8005DEE0 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4DEE4 8005DEE4 21082200 */  addu       $at, $at, $v0
    /* 4DEE8 8005DEE8 608C2384 */  lh         $v1, %lo(object + 0x14)($at)
    /* 4DEEC 8005DEEC 01000224 */  addiu      $v0, $zero, 0x1
    /* 4DEF0 8005DEF0 03006214 */  bne        $v1, $v0, .L8005DF00
    /* 4DEF4 8005DEF4 FF008230 */   andi      $v0, $a0, 0xFF
    /* 4DEF8 8005DEF8 01000424 */  addiu      $a0, $zero, 0x1
    /* 4DEFC 8005DEFC FF008230 */  andi       $v0, $a0, 0xFF
  .L8005DF00:
    /* 4DF00 8005DF00 18004010 */  beqz       $v0, .L8005DF64
    /* 4DF04 8005DF04 40101000 */   sll       $v0, $s0, 1
    /* 4DF08 8005DF08 21105000 */  addu       $v0, $v0, $s0
    /* 4DF0C 8005DF0C 80100200 */  sll        $v0, $v0, 2
    /* 4DF10 8005DF10 23105000 */  subu       $v0, $v0, $s0
    /* 4DF14 8005DF14 80880200 */  sll        $s1, $v0, 2
    /* 4DF18 8005DF18 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4DF1C 8005DF1C 21083100 */  addu       $at, $at, $s1
    /* 4DF20 8005DF20 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4DF24 8005DF24 01000224 */  addiu      $v0, $zero, 0x1
    /* 4DF28 8005DF28 09006214 */  bne        $v1, $v0, .L8005DF50
    /* 4DF2C 8005DF2C 02000224 */   addiu     $v0, $zero, 0x2
    /* 4DF30 8005DF30 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 4DF34 8005DF34 21280002 */  addu       $a1, $s0, $zero
    /* 4DF38 8005DF38 0958010C */  jal        OperateL1LDoor__FiiUc
    /* 4DF3C 8005DF3C 21300000 */   addu      $a2, $zero, $zero
    /* 4DF40 8005DF40 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4DF44 8005DF44 21083100 */  addu       $at, $at, $s1
    /* 4DF48 8005DF48 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4DF4C 8005DF4C 02000224 */  addiu      $v0, $zero, 0x2
  .L8005DF50:
    /* 4DF50 8005DF50 04006214 */  bne        $v1, $v0, .L8005DF64
    /* 4DF54 8005DF54 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 4DF58 8005DF58 21280002 */  addu       $a1, $s0, $zero
    /* 4DF5C 8005DF5C 3157010C */  jal        OperateL1RDoor__FiiUc
    /* 4DF60 8005DF60 21300000 */   addu      $a2, $zero, $zero
  .L8005DF64:
    /* 4DF64 8005DF64 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4DF68 8005DF68 1400B18F */  lw         $s1, 0x14($sp)
    /* 4DF6C 8005DF6C 1000B08F */  lw         $s0, 0x10($sp)
    /* 4DF70 8005DF70 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4DF74 8005DF74 0800E003 */  jr         $ra
    /* 4DF78 8005DF78 00000000 */   nop
endlabel SyncOpL1Door__Fiii
