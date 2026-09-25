.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___4PCIO, 0x58

glabel ___4PCIO
    /* 7611C 8008611C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 76120 80086120 1400B1AF */  sw         $s1, 0x14($sp)
    /* 76124 80086124 21888000 */  addu       $s1, $a0, $zero
    /* 76128 80086128 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7612C 8008612C 2180A000 */  addu       $s0, $a1, $zero
    /* 76130 80086130 1180023C */  lui        $v0, %hi(_vt_4PCIO)
    /* 76134 80086134 60014224 */  addiu      $v0, $v0, %lo(_vt_4PCIO)
    /* 76138 80086138 21280000 */  addu       $a1, $zero, $zero
    /* 7613C 8008613C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 76140 80086140 3316020C */  jal        ___6FileIO
    /* 76144 80086144 100022AE */   sw        $v0, 0x10($s1)
    /* 76148 80086148 01001032 */  andi       $s0, $s0, 0x1
    /* 7614C 8008614C 03000012 */  beqz       $s0, .L8008615C
    /* 76150 80086150 00000000 */   nop
    /* 76154 80086154 B619020C */  jal        __dl__6SysObjPv
    /* 76158 80086158 21202002 */   addu      $a0, $s1, $zero
  .L8008615C:
    /* 7615C 8008615C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 76160 80086160 1400B18F */  lw         $s1, 0x14($sp)
    /* 76164 80086164 1000B08F */  lw         $s0, 0x10($sp)
    /* 76168 80086168 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7616C 8008616C 0800E003 */  jr         $ra
    /* 76170 80086170 00000000 */   nop
endlabel ___4PCIO
