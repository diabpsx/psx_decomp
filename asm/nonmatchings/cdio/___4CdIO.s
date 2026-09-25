.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___4CdIO, 0x58

glabel ___4CdIO
    /* 76C84 80086C84 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 76C88 80086C88 1400B1AF */  sw         $s1, 0x14($sp)
    /* 76C8C 80086C8C 21888000 */  addu       $s1, $a0, $zero
    /* 76C90 80086C90 1000B0AF */  sw         $s0, 0x10($sp)
    /* 76C94 80086C94 2180A000 */  addu       $s0, $a1, $zero
    /* 76C98 80086C98 1180023C */  lui        $v0, %hi(_vt_4CdIO)
    /* 76C9C 80086C9C 34024224 */  addiu      $v0, $v0, %lo(_vt_4CdIO)
    /* 76CA0 80086CA0 21280000 */  addu       $a1, $zero, $zero
    /* 76CA4 80086CA4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 76CA8 80086CA8 3316020C */  jal        ___6FileIO
    /* 76CAC 80086CAC 100022AE */   sw        $v0, 0x10($s1)
    /* 76CB0 80086CB0 01001032 */  andi       $s0, $s0, 0x1
    /* 76CB4 80086CB4 03000012 */  beqz       $s0, .L80086CC4
    /* 76CB8 80086CB8 00000000 */   nop
    /* 76CBC 80086CBC B619020C */  jal        __dl__6SysObjPv
    /* 76CC0 80086CC0 21202002 */   addu      $a0, $s1, $zero
  .L80086CC4:
    /* 76CC4 80086CC4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 76CC8 80086CC8 1400B18F */  lw         $s1, 0x14($sp)
    /* 76CCC 80086CCC 1000B08F */  lw         $s0, 0x10($sp)
    /* 76CD0 80086CD0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 76CD4 80086CD4 0800E003 */  jr         $ra
    /* 76CD8 80086CD8 00000000 */   nop
endlabel ___4CdIO
