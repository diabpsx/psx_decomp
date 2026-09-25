.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _SpuInit, 0xE8

glabel _SpuInit
    /* 667C 8001667C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6680 80016680 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6684 80016684 1400BFAF */  sw         $ra, 0x14($sp)
    /* 6688 80016688 9F48000C */  jal        ResetCallback
    /* 668C 8001668C 21808000 */   addu      $s0, $a0, $zero
    /* 6690 80016690 F759000C */  jal        _spu_init
    /* 6694 80016694 21200002 */   addu      $a0, $s0, $zero
    /* 6698 80016698 08000016 */  bnez       $s0, .L800166BC
    /* 669C 8001669C 00C00434 */   ori       $a0, $zero, 0xC000
    /* 66A0 800166A0 17000324 */  addiu      $v1, $zero, 0x17
    /* 66A4 800166A4 0B80023C */  lui        $v0, %hi(D_800B5636)
    /* 66A8 800166A8 36564224 */  addiu      $v0, $v0, %lo(D_800B5636)
  .L800166AC:
    /* 66AC 800166AC 000044A4 */  sh         $a0, 0x0($v0)
    /* 66B0 800166B0 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 66B4 800166B4 FDFF6104 */  bgez       $v1, .L800166AC
    /* 66B8 800166B8 FEFF4224 */   addiu     $v0, $v0, -0x2
  .L800166BC:
    /* 66BC 800166BC D959000C */  jal        SpuStart
    /* 66C0 800166C0 00000000 */   nop
    /* 66C4 800166C4 D1000424 */  addiu      $a0, $zero, 0xD1
    /* 66C8 800166C8 0B80023C */  lui        $v0, %hi(D_800B55F0)
    /* 66CC 800166CC F0554224 */  addiu      $v0, $v0, %lo(D_800B55F0)
    /* 66D0 800166D0 0B80053C */  lui        $a1, %hi(_spu_rev_startaddr)
    /* 66D4 800166D4 BC5AA58C */  lw         $a1, %lo(_spu_rev_startaddr)($a1)
    /* 66D8 800166D8 0B80013C */  lui        $at, %hi(_spu_rev_flag)
    /* 66DC 800166DC E05520AC */  sw         $zero, %lo(_spu_rev_flag)($at)
    /* 66E0 800166E0 0B80013C */  lui        $at, %hi(_spu_rev_reserve_wa)
    /* 66E4 800166E4 E45520AC */  sw         $zero, %lo(_spu_rev_reserve_wa)($at)
    /* 66E8 800166E8 000040AC */  sw         $zero, 0x0($v0)
    /* 66EC 800166EC 040040A4 */  sh         $zero, 0x4($v0)
    /* 66F0 800166F0 060040A4 */  sh         $zero, 0x6($v0)
    /* 66F4 800166F4 080040AC */  sw         $zero, 0x8($v0)
    /* 66F8 800166F8 0C0040AC */  sw         $zero, 0xC($v0)
    /* 66FC 800166FC 0B80013C */  lui        $at, %hi(_spu_rev_offsetaddr)
    /* 6700 80016700 E85525AC */  sw         $a1, %lo(_spu_rev_offsetaddr)($at)
    /* 6704 80016704 3A5C000C */  jal        _spu_FsetRXX
    /* 6708 80016708 21300000 */   addu      $a2, $zero, $zero
    /* 670C 8001670C 0B80013C */  lui        $at, %hi(_spu_AllocBlockNum)
    /* 6710 80016710 AC5A20AC */  sw         $zero, %lo(_spu_AllocBlockNum)($at)
    /* 6714 80016714 0B80013C */  lui        $at, %hi(_spu_AllocLastNum)
    /* 6718 80016718 B05A20AC */  sw         $zero, %lo(_spu_AllocLastNum)($at)
    /* 671C 8001671C 0B80013C */  lui        $at, %hi(_spu_memList)
    /* 6720 80016720 B45A20AC */  sw         $zero, %lo(_spu_memList)($at)
    /* 6724 80016724 0B80013C */  lui        $at, %hi(_spu_trans_mode)
    /* 6728 80016728 DC5520AC */  sw         $zero, %lo(_spu_trans_mode)($at)
    /* 672C 8001672C 0B80013C */  lui        $at, %hi(_spu_transMode)
    /* 6730 80016730 685A20AC */  sw         $zero, %lo(_spu_transMode)($at)
    /* 6734 80016734 0B80013C */  lui        $at, %hi(_spu_keystat)
    /* 6738 80016738 D85520AC */  sw         $zero, %lo(_spu_keystat)($at)
    /* 673C 8001673C 0B80013C */  lui        $at, %hi(_spu_RQmask)
    /* 6740 80016740 045620AC */  sw         $zero, %lo(_spu_RQmask)($at)
    /* 6744 80016744 0B80013C */  lui        $at, %hi(_spu_RQvoice)
    /* 6748 80016748 005620AC */  sw         $zero, %lo(_spu_RQvoice)($at)
    /* 674C 8001674C 0B80013C */  lui        $at, %hi(_spu_env)
    /* 6750 80016750 385A20AC */  sw         $zero, %lo(_spu_env)($at)
    /* 6754 80016754 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6758 80016758 1000B08F */  lw         $s0, 0x10($sp)
    /* 675C 8001675C 0800E003 */  jr         $ra
    /* 6760 80016760 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel _SpuInit
