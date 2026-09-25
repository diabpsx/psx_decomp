.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___6FileIO, 0x54

glabel ___6FileIO
    /* 758CC 800858CC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 758D0 800858D0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 758D4 800858D4 21888000 */  addu       $s1, $a0, $zero
    /* 758D8 800858D8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 758DC 800858DC 2180A000 */  addu       $s0, $a1, $zero
    /* 758E0 800858E0 1180023C */  lui        $v0, %hi(_vt_6FileIO)
    /* 758E4 800858E4 F8004224 */  addiu      $v0, $v0, %lo(_vt_6FileIO)
    /* 758E8 800858E8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 758EC 800858EC 2E17020C */  jal        DumpOldPath__6FileIO
    /* 758F0 800858F0 100022AE */   sw        $v0, 0x10($s1)
    /* 758F4 800858F4 01001032 */  andi       $s0, $s0, 0x1
    /* 758F8 800858F8 03000012 */  beqz       $s0, .L80085908
    /* 758FC 800858FC 00000000 */   nop
    /* 75900 80085900 B619020C */  jal        __dl__6SysObjPv
    /* 75904 80085904 21202002 */   addu      $a0, $s1, $zero
  .L80085908:
    /* 75908 80085908 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7590C 8008590C 1400B18F */  lw         $s1, 0x14($sp)
    /* 75910 80085910 1000B08F */  lw         $s0, 0x10($sp)
    /* 75914 80085914 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 75918 80085918 0800E003 */  jr         $ra
    /* 7591C 8008591C 00000000 */   nop
endlabel ___6FileIO
