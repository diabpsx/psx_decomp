.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GPUQ_MoveImage__FP4RECTii, 0xA0

glabel GPUQ_MoveImage__FP4RECTii
    /* 73754 80083754 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 73758 80083758 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7375C 8008375C 21808000 */  addu       $s0, $a0, $zero
    /* 73760 80083760 1400B1AF */  sw         $s1, 0x14($sp)
    /* 73764 80083764 2188A000 */  addu       $s1, $a1, $zero
    /* 73768 80083768 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7376C 8008376C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 73770 80083770 EC0C020C */  jal        CheckMaxArgs__Fv
    /* 73774 80083774 2190C000 */   addu      $s2, $a2, $zero
    /* 73778 80083778 2403838F */  lw         $v1, %gp_rel(ArgsSoFar)($gp)
    /* 7377C 8008377C 00000000 */  nop
    /* 73780 80083780 C0100300 */  sll        $v0, $v1, 3
    /* 73784 80083784 23104300 */  subu       $v0, $v0, $v1
    /* 73788 80083788 80100200 */  sll        $v0, $v0, 2
    /* 7378C 8008378C 0B80033C */  lui        $v1, %hi(AllArgs)
    /* 73790 80083790 D8756324 */  addiu      $v1, $v1, %lo(AllArgs)
    /* 73794 80083794 21104300 */  addu       $v0, $v0, $v1
    /* 73798 80083798 0300038A */  lwl        $v1, 0x3($s0)
    /* 7379C 8008379C 0000039A */  lwr        $v1, 0x0($s0)
    /* 737A0 800837A0 0700048A */  lwl        $a0, 0x7($s0)
    /* 737A4 800837A4 0400049A */  lwr        $a0, 0x4($s0)
    /* 737A8 800837A8 030043A8 */  swl        $v1, 0x3($v0)
    /* 737AC 800837AC 000043B8 */  swr        $v1, 0x0($v0)
    /* 737B0 800837B0 070044A8 */  swl        $a0, 0x7($v0)
    /* 737B4 800837B4 040044B8 */  swr        $a0, 0x4($v0)
    /* 737B8 800837B8 0800438C */  lw         $v1, 0x8($v0)
    /* 737BC 800837BC 2403848F */  lw         $a0, %gp_rel(ArgsSoFar)($gp)
    /* 737C0 800837C0 180051A4 */  sh         $s1, 0x18($v0)
    /* 737C4 800837C4 1A0052A4 */  sh         $s2, 0x1A($v0)
    /* 737C8 800837C8 04006334 */  ori        $v1, $v1, 0x4
    /* 737CC 800837CC 01008424 */  addiu      $a0, $a0, 0x1
    /* 737D0 800837D0 080043AC */  sw         $v1, 0x8($v0)
    /* 737D4 800837D4 240384AF */  sw         $a0, %gp_rel(ArgsSoFar)($gp)
    /* 737D8 800837D8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 737DC 800837DC 1800B28F */  lw         $s2, 0x18($sp)
    /* 737E0 800837E0 1400B18F */  lw         $s1, 0x14($sp)
    /* 737E4 800837E4 1000B08F */  lw         $s0, 0x10($sp)
    /* 737E8 800837E8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 737EC 800837EC 0800E003 */  jr         $ra
    /* 737F0 800837F0 00000000 */   nop
endlabel GPUQ_MoveImage__FP4RECTii
