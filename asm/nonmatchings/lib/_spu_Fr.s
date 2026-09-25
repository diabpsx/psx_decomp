.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_Fr, 0x64

glabel _spu_Fr
    /* 7084 80017084 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7088 80017088 1400B1AF */  sw         $s1, 0x14($sp)
    /* 708C 8001708C 21888000 */  addu       $s1, $a0, $zero
    /* 7090 80017090 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7094 80017094 2180A000 */  addu       $s0, $a1, $zero
    /* 7098 80017098 0B80023C */  lui        $v0, %hi(_spu_tsa)
    /* 709C 8001709C 645A4294 */  lhu        $v0, %lo(_spu_tsa)($v0)
    /* 70A0 800170A0 0B80053C */  lui        $a1, %hi(_spu_mem_mode_plus)
    /* 70A4 800170A4 745AA58C */  lw         $a1, %lo(_spu_mem_mode_plus)($a1)
    /* 70A8 800170A8 02000424 */  addiu      $a0, $zero, 0x2
    /* 70AC 800170AC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 70B0 800170B0 605B000C */  jal        _spu_t
    /* 70B4 800170B4 0428A200 */   sllv      $a1, $v0, $a1
    /* 70B8 800170B8 605B000C */  jal        _spu_t
    /* 70BC 800170BC 21200000 */   addu      $a0, $zero, $zero
    /* 70C0 800170C0 03000424 */  addiu      $a0, $zero, 0x3
    /* 70C4 800170C4 21282002 */  addu       $a1, $s1, $zero
    /* 70C8 800170C8 605B000C */  jal        _spu_t
    /* 70CC 800170CC 21300002 */   addu      $a2, $s0, $zero
    /* 70D0 800170D0 21100002 */  addu       $v0, $s0, $zero
    /* 70D4 800170D4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 70D8 800170D8 1400B18F */  lw         $s1, 0x14($sp)
    /* 70DC 800170DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 70E0 800170E0 0800E003 */  jr         $ra
    /* 70E4 800170E4 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel _spu_Fr
