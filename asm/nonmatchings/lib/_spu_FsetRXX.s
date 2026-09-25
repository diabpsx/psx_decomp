.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_FsetRXX, 0x44

glabel _spu_FsetRXX
    /* 70E8 800170E8 0700C014 */  bnez       $a2, .L80017108
    /* 70EC 800170EC 40100400 */   sll       $v0, $a0, 1
    /* 70F0 800170F0 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 70F4 800170F4 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 70F8 800170F8 00000000 */  nop
    /* 70FC 800170FC 21104300 */  addu       $v0, $v0, $v1
    /* 7100 80017100 495C0008 */  j          .L80017124
    /* 7104 80017104 000045A4 */   sh        $a1, 0x0($v0)
  .L80017108:
    /* 7108 80017108 0B80043C */  lui        $a0, %hi(_spu_RXX)
    /* 710C 8001710C 4C5A848C */  lw         $a0, %lo(_spu_RXX)($a0)
    /* 7110 80017110 0B80033C */  lui        $v1, %hi(_spu_mem_mode_plus)
    /* 7114 80017114 745A638C */  lw         $v1, %lo(_spu_mem_mode_plus)($v1)
    /* 7118 80017118 21104400 */  addu       $v0, $v0, $a0
    /* 711C 8001711C 06186500 */  srlv       $v1, $a1, $v1
    /* 7120 80017120 000043A4 */  sh         $v1, 0x0($v0)
  .L80017124:
    /* 7124 80017124 0800E003 */  jr         $ra
    /* 7128 80017128 00000000 */   nop
endlabel _spu_FsetRXX
