.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCharWidth__5CFontUc, 0xD4

glabel GetCharWidth__5CFontUc
    /* 7ABAC 8008ABAC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7ABB0 8008ABB0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7ABB4 8008ABB4 21888000 */  addu       $s1, $a0, $zero
    /* 7ABB8 8008ABB8 2110A000 */  addu       $v0, $a1, $zero
    /* 7ABBC 8008ABBC 8000A530 */  andi       $a1, $a1, 0x80
    /* 7ABC0 8008ABC0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 7ABC4 8008ABC4 0300A010 */  beqz       $a1, .L8008ABD4
    /* 7ABC8 8008ABC8 1000B0AF */   sw        $s0, 0x10($sp)
    /* 7ABCC 8008ABCC 1A2B0208 */  j          .L8008AC68
    /* 7ABD0 8008ABD0 0C000224 */   addiu     $v0, $zero, 0xC
  .L8008ABD4:
    /* 7ABD4 8008ABD4 FF005030 */  andi       $s0, $v0, 0xFF
    /* 7ABD8 8008ABD8 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 7ABDC 8008ABDC 07000212 */  beq        $s0, $v0, .L8008ABFC
    /* 7ABE0 8008ABE0 20000224 */   addiu     $v0, $zero, 0x20
    /* 7ABE4 8008ABE4 03000216 */  bne        $s0, $v0, .L8008ABF4
    /* 7ABE8 8008ABE8 0A000224 */   addiu     $v0, $zero, 0xA
    /* 7ABEC 8008ABEC 1A2B0208 */  j          .L8008AC68
    /* 7ABF0 8008ABF0 03000224 */   addiu     $v0, $zero, 0x3
  .L8008ABF4:
    /* 7ABF4 8008ABF4 03000216 */  bne        $s0, $v0, .L8008AC04
    /* 7ABF8 8008ABF8 21202002 */   addu      $a0, $s1, $zero
  .L8008ABFC:
    /* 7ABFC 8008ABFC 1A2B0208 */  j          .L8008AC68
    /* 7AC00 8008AC00 21100000 */   addu      $v0, $zero, $zero
  .L8008AC04:
    /* 7AC04 8008AC04 422B020C */  jal        IsDefined__5CFontUc
    /* 7AC08 8008AC08 21280002 */   addu      $a1, $s0, $zero
    /* 7AC0C 8008AC0C 01004238 */  xori       $v0, $v0, 0x1
    /* 7AC10 8008AC10 15004014 */  bnez       $v0, .L8008AC68
    /* 7AC14 8008AC14 01000224 */   addiu     $v0, $zero, 0x1
    /* 7AC18 8008AC18 2E000224 */  addiu      $v0, $zero, 0x2E
    /* 7AC1C 8008AC1C 0B000212 */  beq        $s0, $v0, .L8008AC4C
    /* 7AC20 8008AC20 40101000 */   sll       $v0, $s0, 1
    /* 7AC24 8008AC24 21105100 */  addu       $v0, $v0, $s1
    /* 7AC28 8008AC28 1402248E */  lw         $a0, 0x214($s1)
    /* 7AC2C 8008AC2C 04004594 */  lhu        $a1, 0x4($v0)
    /* 7AC30 8008AC30 5D2B020C */  jal        GetFr__7TextDati_8008ad74
    /* 7AC34 8008AC34 00000000 */   nop
    /* 7AC38 8008AC38 0800428C */  lw         $v0, 0x8($v0)
    /* 7AC3C 8008AC3C 00000000 */  nop
    /* 7AC40 8008AC40 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7AC44 8008AC44 1A2B0208 */  j          .L8008AC68
    /* 7AC48 8008AC48 FFFF4224 */   addiu     $v0, $v0, -0x1
  .L8008AC4C:
    /* 7AC4C 8008AC4C 1402248E */  lw         $a0, 0x214($s1)
    /* 7AC50 8008AC50 60002596 */  lhu        $a1, 0x60($s1)
    /* 7AC54 8008AC54 5D2B020C */  jal        GetFr__7TextDati_8008ad74
    /* 7AC58 8008AC58 00000000 */   nop
    /* 7AC5C 8008AC5C 0800428C */  lw         $v0, 0x8($v0)
    /* 7AC60 8008AC60 00000000 */  nop
    /* 7AC64 8008AC64 FF014230 */  andi       $v0, $v0, 0x1FF
  .L8008AC68:
    /* 7AC68 8008AC68 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7AC6C 8008AC6C 1400B18F */  lw         $s1, 0x14($sp)
    /* 7AC70 8008AC70 1000B08F */  lw         $s0, 0x10($sp)
    /* 7AC74 8008AC74 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7AC78 8008AC78 0800E003 */  jr         $ra
    /* 7AC7C 8008AC7C 00000000 */   nop
endlabel GetCharWidth__5CFontUc
