.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching seekblockhandlea, 0x90

glabel seekblockhandlea
    /* 16F14 80026F14 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 16F18 80026F18 80100400 */  sll        $v0, $a0, 2
    /* 16F1C 80026F1C 21104400 */  addu       $v0, $v0, $a0
    /* 16F20 80026F20 C0200200 */  sll        $a0, $v0, 3
    /* 16F24 80026F24 1000BFAF */  sw         $ra, 0x10($sp)
    /* 16F28 80026F28 0B80013C */  lui        $at, %hi(D_800B6400)
    /* 16F2C 80026F2C 21082400 */  addu       $at, $at, $a0
    /* 16F30 80026F30 0064238C */  lw         $v1, %lo(D_800B6400)($at)
    /* 16F34 80026F34 02000224 */  addiu      $v0, $zero, 0x2
    /* 16F38 80026F38 10006210 */  beq        $v1, $v0, .L80026F7C
    /* 16F3C 80026F3C 00000000 */   nop
    /* 16F40 80026F40 0B80013C */  lui        $at, %hi(D_800B640C)
    /* 16F44 80026F44 21082400 */  addu       $at, $at, $a0
    /* 16F48 80026F48 0C64228C */  lw         $v0, %lo(D_800B640C)($at)
    /* 16F4C 80026F4C 00000000 */  nop
    /* 16F50 80026F50 21104500 */  addu       $v0, $v0, $a1
    /* 16F54 80026F54 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16F58 80026F58 21082400 */  addu       $at, $at, $a0
    /* 16F5C 80026F5C 106422AC */  sw         $v0, %lo(D_800B6410)($at)
    /* 16F60 80026F60 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16F64 80026F64 21082400 */  addu       $at, $at, $a0
    /* 16F68 80026F68 1064228C */  lw         $v0, %lo(D_800B6410)($at)
    /* 16F6C 80026F6C FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 16F70 80026F70 242383AF */  sw         $v1, %gp_rel(blockiosector)($gp)
    /* 16F74 80026F74 E59B0008 */  j          .L80026F94
    /* 16F78 80026F78 FF074230 */   andi      $v0, $v0, 0x7FF
  .L80026F7C:
    /* 16F7C 80026F7C 0B80013C */  lui        $at, %hi(D_800B6404)
    /* 16F80 80026F80 21082400 */  addu       $at, $at, $a0
    /* 16F84 80026F84 0464248C */  lw         $a0, %lo(D_800B6404)($at)
    /* 16F88 80026F88 BAA3000C */  jal        seekhandle
    /* 16F8C 80026F8C 00000000 */   nop
    /* 16F90 80026F90 21100000 */  addu       $v0, $zero, $zero
  .L80026F94:
    /* 16F94 80026F94 1000BF8F */  lw         $ra, 0x10($sp)
    /* 16F98 80026F98 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 16F9C 80026F9C 0800E003 */  jr         $ra
    /* 16FA0 80026FA0 00000000 */   nop
endlabel seekblockhandlea
