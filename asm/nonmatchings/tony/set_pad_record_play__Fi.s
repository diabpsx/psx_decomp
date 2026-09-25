.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching set_pad_record_play__Fi, 0x74

glabel set_pad_record_play__Fi
    /* 8B930 8009B930 C006828F */  lw         $v0, %gp_rel(demo_record_load)($gp)
    /* 8B934 8009B934 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8B938 8009B938 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8B93C 8009B93C 21808000 */  addu       $s0, $a0, $zero
    /* 8B940 8009B940 03004014 */  bnez       $v0, .L8009B950
    /* 8B944 8009B944 1400BFAF */   sw        $ra, 0x14($sp)
    /* 8B948 8009B948 1C6E020C */  jal        load_demo_pad_data__FUl
    /* 8B94C 8009B94C 00000000 */   nop
  .L8009B950:
    /* 8B950 8009B950 00400424 */  addiu      $a0, $zero, 0x4000
    /* 8B954 8009B954 83030224 */  addiu      $v0, $zero, 0x383
    /* 8B958 8009B958 0A80053C */  lui        $a1, %hi(print_demo_task__FP4TASK)
    /* 8B95C 8009B95C ECB4A524 */  addiu      $a1, $a1, %lo(print_demo_task__FP4TASK)
    /* 8B960 8009B960 00100624 */  addiu      $a2, $zero, 0x1000
    /* 8B964 8009B964 080790AF */  sw         $s0, %gp_rel(demo_level)($gp)
    /* 8B968 8009B968 C80680A3 */  sb         $zero, %gp_rel(demo_fade_finished)($gp)
    /* 8B96C 8009B96C 1280013C */  lui        $at, %hi(demo_finish)
    /* 8B970 8009B970 BCAB20AC */  sw         $zero, %lo(demo_finish)($at)
    /* 8B974 8009B974 1280013C */  lui        $at, %hi(demo_pad_count)
    /* 8B978 8009B978 B8AB20AC */  sw         $zero, %lo(demo_pad_count)($at)
    /* 8B97C 8009B97C 1280013C */  lui        $at, %hi(demo_pad_time)
    /* 8B980 8009B980 B4AB22AC */  sw         $v0, %lo(demo_pad_time)($at)
    /* 8B984 8009B984 0480000C */  jal        TSK_AddTask
    /* 8B988 8009B988 21380000 */   addu      $a3, $zero, $zero
    /* 8B98C 8009B98C 140782AF */  sw         $v0, %gp_rel(DemoTask)($gp)
    /* 8B990 8009B990 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8B994 8009B994 1000B08F */  lw         $s0, 0x10($sp)
    /* 8B998 8009B998 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8B99C 8009B99C 0800E003 */  jr         $ra
    /* 8B9A0 8009B9A0 00000000 */   nop
endlabel set_pad_record_play__Fi
