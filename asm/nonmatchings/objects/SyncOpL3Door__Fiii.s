.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncOpL3Door__Fiii, 0x114

glabel SyncOpL3Door__Fiii
    /* 4E090 8005E090 1280023C */  lui        $v0, %hi(myplr)
    /* 4E094 8005E094 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4E098 8005E098 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4E09C 8005E09C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4E0A0 8005E0A0 2180C000 */  addu       $s0, $a2, $zero
    /* 4E0A4 8005E0A4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 4E0A8 8005E0A8 38008210 */  beq        $a0, $v0, .L8005E18C
    /* 4E0AC 8005E0AC 1400B1AF */   sw        $s1, 0x14($sp)
    /* 4E0B0 8005E0B0 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 4E0B4 8005E0B4 0C00A214 */  bne        $a1, $v0, .L8005E0E8
    /* 4E0B8 8005E0B8 21200000 */   addu      $a0, $zero, $zero
    /* 4E0BC 8005E0BC 40101000 */  sll        $v0, $s0, 1
    /* 4E0C0 8005E0C0 21105000 */  addu       $v0, $v0, $s0
    /* 4E0C4 8005E0C4 80100200 */  sll        $v0, $v0, 2
    /* 4E0C8 8005E0C8 23105000 */  subu       $v0, $v0, $s0
    /* 4E0CC 8005E0CC 80100200 */  sll        $v0, $v0, 2
    /* 4E0D0 8005E0D0 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4E0D4 8005E0D4 21082200 */  addu       $at, $at, $v0
    /* 4E0D8 8005E0D8 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 4E0DC 8005E0DC 00000000 */  nop
    /* 4E0E0 8005E0E0 0100422C */  sltiu      $v0, $v0, 0x1
    /* 4E0E4 8005E0E4 21204000 */  addu       $a0, $v0, $zero
  .L8005E0E8:
    /* 4E0E8 8005E0E8 2C000224 */  addiu      $v0, $zero, 0x2C
    /* 4E0EC 8005E0EC 0E00A214 */  bne        $a1, $v0, .L8005E128
    /* 4E0F0 8005E0F0 FF008230 */   andi      $v0, $a0, 0xFF
    /* 4E0F4 8005E0F4 40101000 */  sll        $v0, $s0, 1
    /* 4E0F8 8005E0F8 21105000 */  addu       $v0, $v0, $s0
    /* 4E0FC 8005E0FC 80100200 */  sll        $v0, $v0, 2
    /* 4E100 8005E100 23105000 */  subu       $v0, $v0, $s0
    /* 4E104 8005E104 80100200 */  sll        $v0, $v0, 2
    /* 4E108 8005E108 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4E10C 8005E10C 21082200 */  addu       $at, $at, $v0
    /* 4E110 8005E110 608C2384 */  lh         $v1, %lo(object + 0x14)($at)
    /* 4E114 8005E114 01000224 */  addiu      $v0, $zero, 0x1
    /* 4E118 8005E118 03006214 */  bne        $v1, $v0, .L8005E128
    /* 4E11C 8005E11C FF008230 */   andi      $v0, $a0, 0xFF
    /* 4E120 8005E120 01000424 */  addiu      $a0, $zero, 0x1
    /* 4E124 8005E124 FF008230 */  andi       $v0, $a0, 0xFF
  .L8005E128:
    /* 4E128 8005E128 18004010 */  beqz       $v0, .L8005E18C
    /* 4E12C 8005E12C 40101000 */   sll       $v0, $s0, 1
    /* 4E130 8005E130 21105000 */  addu       $v0, $v0, $s0
    /* 4E134 8005E134 80100200 */  sll        $v0, $v0, 2
    /* 4E138 8005E138 23105000 */  subu       $v0, $v0, $s0
    /* 4E13C 8005E13C 80880200 */  sll        $s1, $v0, 2
    /* 4E140 8005E140 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4E144 8005E144 21083100 */  addu       $at, $at, $s1
    /* 4E148 8005E148 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4E14C 8005E14C 4A000224 */  addiu      $v0, $zero, 0x4A
    /* 4E150 8005E150 09006214 */  bne        $v1, $v0, .L8005E178
    /* 4E154 8005E154 4B000224 */   addiu     $v0, $zero, 0x4B
    /* 4E158 8005E158 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 4E15C 8005E15C 21280002 */  addu       $a1, $s0, $zero
    /* 4E160 8005E160 5C5B010C */  jal        OperateL3LDoor__FiiUc
    /* 4E164 8005E164 21300000 */   addu      $a2, $zero, $zero
    /* 4E168 8005E168 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4E16C 8005E16C 21083100 */  addu       $at, $at, $s1
    /* 4E170 8005E170 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4E174 8005E174 4B000224 */  addiu      $v0, $zero, 0x4B
  .L8005E178:
    /* 4E178 8005E178 04006214 */  bne        $v1, $v0, .L8005E18C
    /* 4E17C 8005E17C FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 4E180 8005E180 21280002 */  addu       $a1, $s0, $zero
    /* 4E184 8005E184 A55A010C */  jal        OperateL3RDoor__FiiUc
    /* 4E188 8005E188 21300000 */   addu      $a2, $zero, $zero
  .L8005E18C:
    /* 4E18C 8005E18C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4E190 8005E190 1400B18F */  lw         $s1, 0x14($sp)
    /* 4E194 8005E194 1000B08F */  lw         $s0, 0x10($sp)
    /* 4E198 8005E198 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4E19C 8005E19C 0800E003 */  jr         $ra
    /* 4E1A0 8005E1A0 00000000 */   nop
endlabel SyncOpL3Door__Fiii
