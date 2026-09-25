.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GPUQ_LoadImage__FP4RECTli, 0xB4

glabel GPUQ_LoadImage__FP4RECTli
    /* 73564 80083564 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 73568 80083568 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7356C 8008356C 21808000 */  addu       $s0, $a0, $zero
    /* 73570 80083570 1800B2AF */  sw         $s2, 0x18($sp)
    /* 73574 80083574 2190A000 */  addu       $s2, $a1, $zero
    /* 73578 80083578 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7357C 8008357C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 73580 80083580 EC0C020C */  jal        CheckMaxArgs__Fv
    /* 73584 80083584 2188C000 */   addu      $s1, $a2, $zero
    /* 73588 80083588 2403838F */  lw         $v1, %gp_rel(ArgsSoFar)($gp)
    /* 7358C 8008358C 0B80023C */  lui        $v0, %hi(AllArgs)
    /* 73590 80083590 D8754224 */  addiu      $v0, $v0, %lo(AllArgs)
    /* 73594 80083594 C0200300 */  sll        $a0, $v1, 3
    /* 73598 80083598 23208300 */  subu       $a0, $a0, $v1
    /* 7359C 8008359C 80200400 */  sll        $a0, $a0, 2
    /* 735A0 800835A0 21208200 */  addu       $a0, $a0, $v0
    /* 735A4 800835A4 0C0091AC */  sw         $s1, 0xC($a0)
    /* 735A8 800835A8 00000296 */  lhu        $v0, 0x0($s0)
    /* 735AC 800835AC 00000000 */  nop
    /* 735B0 800835B0 000082A4 */  sh         $v0, 0x0($a0)
    /* 735B4 800835B4 02000296 */  lhu        $v0, 0x2($s0)
    /* 735B8 800835B8 00000000 */  nop
    /* 735BC 800835BC 020082A4 */  sh         $v0, 0x2($a0)
    /* 735C0 800835C0 04000296 */  lhu        $v0, 0x4($s0)
    /* 735C4 800835C4 01006324 */  addiu      $v1, $v1, 0x1
    /* 735C8 800835C8 240383AF */  sw         $v1, %gp_rel(ArgsSoFar)($gp)
    /* 735CC 800835CC 040082A4 */  sh         $v0, 0x4($a0)
    /* 735D0 800835D0 06000596 */  lhu        $a1, 0x6($s0)
    /* 735D4 800835D4 0800828C */  lw         $v0, 0x8($a0)
    /* 735D8 800835D8 FDFF0324 */  addiu      $v1, $zero, -0x3
    /* 735DC 800835DC 100092AC */  sw         $s2, 0x10($a0)
    /* 735E0 800835E0 24104300 */  and        $v0, $v0, $v1
    /* 735E4 800835E4 FBFF0324 */  addiu      $v1, $zero, -0x5
    /* 735E8 800835E8 24104300 */  and        $v0, $v0, $v1
    /* 735EC 800835EC FEFF0324 */  addiu      $v1, $zero, -0x2
    /* 735F0 800835F0 24104300 */  and        $v0, $v0, $v1
    /* 735F4 800835F4 080082AC */  sw         $v0, 0x8($a0)
    /* 735F8 800835F8 060085A4 */  sh         $a1, 0x6($a0)
    /* 735FC 800835FC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 73600 80083600 1800B28F */  lw         $s2, 0x18($sp)
    /* 73604 80083604 1400B18F */  lw         $s1, 0x14($sp)
    /* 73608 80083608 1000B08F */  lw         $s0, 0x10($sp)
    /* 7360C 8008360C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 73610 80083610 0800E003 */  jr         $ra
    /* 73614 80083614 00000000 */   nop
endlabel GPUQ_LoadImage__FP4RECTli
