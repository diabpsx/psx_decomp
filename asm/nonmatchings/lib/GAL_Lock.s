.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_Lock, 0x68

glabel GAL_Lock
    /* 11774 80021774 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 11778 80021778 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1177C 8002177C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 11780 80021780 B686000C */  jal        IsActiveValidHandle
    /* 11784 80021784 21808000 */   addu      $s0, $a0, $zero
    /* 11788 80021788 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1178C 8002178C 0B004010 */  beqz       $v0, .L800217BC
    /* 11790 80021790 C0181000 */   sll       $v1, $s0, 3
    /* 11794 80021794 23187000 */  subu       $v1, $v1, $s0
    /* 11798 80021798 80180300 */  sll        $v1, $v1, 2
    /* 1179C 8002179C 1380023C */  lui        $v0, %hi(D_801325D0)
    /* 117A0 800217A0 D0254224 */  addiu      $v0, $v0, %lo(D_801325D0)
    /* 117A4 800217A4 21186200 */  addu       $v1, $v1, $v0
    /* 117A8 800217A8 14006494 */  lhu        $a0, 0x14($v1)
    /* 117AC 800217AC 0800628C */  lw         $v0, 0x8($v1)
    /* 117B0 800217B0 01008424 */  addiu      $a0, $a0, 0x1
    /* 117B4 800217B4 F2850008 */  j          .L800217C8
    /* 117B8 800217B8 140064A4 */   sh        $a0, 0x14($v1)
  .L800217BC:
    /* 117BC 800217BC 0389000C */  jal        GSetError
    /* 117C0 800217C0 05000434 */   ori       $a0, $zero, 0x5
    /* 117C4 800217C4 21100000 */  addu       $v0, $zero, $zero
  .L800217C8:
    /* 117C8 800217C8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 117CC 800217CC 1000B08F */  lw         $s0, 0x10($sp)
    /* 117D0 800217D0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 117D4 800217D4 0800E003 */  jr         $ra
    /* 117D8 800217D8 00000000 */   nop
endlabel GAL_Lock
