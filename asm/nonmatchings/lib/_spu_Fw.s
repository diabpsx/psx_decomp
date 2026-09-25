.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_Fw, 0x84

glabel _spu_Fw
    /* 7000 80017000 0B80023C */  lui        $v0, %hi(_spu_transMode)
    /* 7004 80017004 685A428C */  lw         $v0, %lo(_spu_transMode)($v0)
    /* 7008 80017008 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 700C 8001700C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7010 80017010 21888000 */  addu       $s1, $a0, $zero
    /* 7014 80017014 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7018 80017018 2180A000 */  addu       $s0, $a1, $zero
    /* 701C 8001701C 10004014 */  bnez       $v0, .L80017060
    /* 7020 80017020 1800BFAF */   sw        $ra, 0x18($sp)
    /* 7024 80017024 0B80023C */  lui        $v0, %hi(_spu_tsa)
    /* 7028 80017028 645A4294 */  lhu        $v0, %lo(_spu_tsa)($v0)
    /* 702C 8001702C 0B80053C */  lui        $a1, %hi(_spu_mem_mode_plus)
    /* 7030 80017030 745AA58C */  lw         $a1, %lo(_spu_mem_mode_plus)($a1)
    /* 7034 80017034 02000424 */  addiu      $a0, $zero, 0x2
    /* 7038 80017038 605B000C */  jal        _spu_t
    /* 703C 8001703C 0428A200 */   sllv      $a1, $v0, $a1
    /* 7040 80017040 605B000C */  jal        _spu_t
    /* 7044 80017044 01000424 */   addiu     $a0, $zero, 0x1
    /* 7048 80017048 03000424 */  addiu      $a0, $zero, 0x3
    /* 704C 8001704C 21282002 */  addu       $a1, $s1, $zero
    /* 7050 80017050 605B000C */  jal        _spu_t
    /* 7054 80017054 21300002 */   addu      $a2, $s0, $zero
    /* 7058 80017058 1C5C0008 */  j          .L80017070
    /* 705C 8001705C 21100002 */   addu      $v0, $s0, $zero
  .L80017060:
    /* 7060 80017060 21202002 */  addu       $a0, $s1, $zero
    /* 7064 80017064 975A000C */  jal        func_80016A5C
    /* 7068 80017068 21280002 */   addu      $a1, $s0, $zero
    /* 706C 8001706C 21100002 */  addu       $v0, $s0, $zero
  .L80017070:
    /* 7070 80017070 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7074 80017074 1400B18F */  lw         $s1, 0x14($sp)
    /* 7078 80017078 1000B08F */  lw         $s0, 0x10($sp)
    /* 707C 8001707C 0800E003 */  jr         $ra
    /* 7080 80017080 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel _spu_Fw
