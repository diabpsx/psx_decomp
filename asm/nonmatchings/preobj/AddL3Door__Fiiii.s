.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddL3Door__Fiiii, 0x94

glabel AddL3Door__Fiiii
    /* 1C884 8015647C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C888 80156480 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1C88C 80156484 21808000 */  addu       $s0, $a0, $zero
    /* 1C890 80156488 2120A000 */  addu       $a0, $a1, $zero
    /* 1C894 8015648C 2128C000 */  addu       $a1, $a2, $zero
    /* 1C898 80156490 40101000 */  sll        $v0, $s0, 1
    /* 1C89C 80156494 21105000 */  addu       $v0, $v0, $s0
    /* 1C8A0 80156498 80100200 */  sll        $v0, $v0, 2
    /* 1C8A4 8015649C 23105000 */  subu       $v0, $v0, $s0
    /* 1C8A8 801564A0 80100200 */  sll        $v0, $v0, 2
    /* 1C8AC 801564A4 01000324 */  addiu      $v1, $zero, 0x1
    /* 1C8B0 801564A8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1C8B4 801564AC 0E80013C */  lui        $at, %hi(object + 0x2B)
    /* 1C8B8 801564B0 21082200 */  addu       $at, $at, $v0
    /* 1C8BC 801564B4 778C23A0 */  sb         $v1, %lo(object + 0x2B)($at)
    /* 1C8C0 801564B8 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 1C8C4 801564BC 21082200 */  addu       $at, $at, $v0
    /* 1C8C8 801564C0 718C20A0 */  sb         $zero, %lo(object + 0x25)($at)
    /* 1C8CC 801564C4 4A000224 */  addiu      $v0, $zero, 0x4A
    /* 1C8D0 801564C8 0200E214 */  bne        $a3, $v0, .L801564D4
    /* 1C8D4 801564CC 16020624 */   addiu     $a2, $zero, 0x216
    /* 1C8D8 801564D0 13020624 */  addiu      $a2, $zero, 0x213
  .L801564D4:
    /* 1C8DC 801564D4 D555010C */  jal        ObjSetMicro__Fiii
    /* 1C8E0 801564D8 00000000 */   nop
    /* 1C8E4 801564DC 40101000 */  sll        $v0, $s0, 1
    /* 1C8E8 801564E0 21105000 */  addu       $v0, $v0, $s0
    /* 1C8EC 801564E4 80100200 */  sll        $v0, $v0, 2
    /* 1C8F0 801564E8 23105000 */  subu       $v0, $v0, $s0
    /* 1C8F4 801564EC 80100200 */  sll        $v0, $v0, 2
    /* 1C8F8 801564F0 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1C8FC 801564F4 21082200 */  addu       $at, $at, $v0
    /* 1C900 801564F8 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 1C904 801564FC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1C908 80156500 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C90C 80156504 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C910 80156508 0800E003 */  jr         $ra
    /* 1C914 8015650C 00000000 */   nop
endlabel AddL3Door__Fiiii
