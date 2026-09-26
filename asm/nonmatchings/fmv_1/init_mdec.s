.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching init_mdec, 0x70

glabel init_mdec
    /* 1CD68 80156960 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CD6C 80156964 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CD70 80156968 21808000 */  addu       $s0, $a0, $zero
    /* 1CD74 8015696C 2120A000 */  addu       $a0, $a1, $zero
    /* 1CD78 80156970 80000224 */  addiu      $v0, $zero, 0x80
    /* 1CD7C 80156974 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1CD80 80156978 600E82AF */  sw         $v0, %gp_rel(ordertab_length)($gp)
    /* 1CD84 8015697C 1C0D80AF */  sw         $zero, %gp_rel(mbuf)($gp)
    /* 1CD88 80156980 4C0E84AF */  sw         $a0, %gp_rel(vlctab)($gp)
    /* 1CD8C 80156984 BBED040C */  jal        func_8013B6EC
    /* 1CD90 80156988 00000000 */   nop
    /* 1CD94 8015698C 0FEB040C */  jal        func_8013AC3C
    /* 1CD98 80156990 21200000 */   addu      $a0, $zero, $zero
    /* 1CD9C 80156994 1580043C */  lui        $a0, %hi(DCT_out_handler)
    /* 1CDA0 80156998 B0688424 */  addiu      $a0, $a0, %lo(DCT_out_handler)
    /* 1CDA4 8015699C B6EB040C */  jal        func_8013AED8
    /* 1CDA8 801569A0 00000000 */   nop
    /* 1CDAC 801569A4 10000224 */  addiu      $v0, $zero, 0x10
    /* 1CDB0 801569A8 E80D82A7 */  sh         $v0, %gp_rel(slice + 0x4)($gp)
    /* 1CDB4 801569AC 60EA0234 */  ori        $v0, $zero, 0xEA60
    /* 1CDB8 801569B0 D80D90AF */  sw         $s0, %gp_rel(vlcbuf)($gp)
    /* 1CDBC 801569B4 21800202 */  addu       $s0, $s0, $v0
    /* 1CDC0 801569B8 DC0D90AF */  sw         $s0, %gp_rel(vlcbuf + 0x4)($gp)
    /* 1CDC4 801569BC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1CDC8 801569C0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CDCC 801569C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CDD0 801569C8 0800E003 */  jr         $ra
    /* 1CDD4 801569CC 00000000 */   nop
endlabel init_mdec
