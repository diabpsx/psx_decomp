.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncreadblockcallback, 0x74

glabel asyncreadblockcallback
    /* 16910 80026910 FC22858F */  lw         $a1, %gp_rel(asyncblockcallbackfunc)($gp)
    /* 16914 80026914 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 16918 80026918 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1691C 8002691C 21808000 */  addu       $s0, $a0, $zero
    /* 16920 80026920 1200A010 */  beqz       $a1, .L8002696C
    /* 16924 80026924 1400BFAF */   sw        $ra, 0x14($sp)
    /* 16928 80026928 1000B010 */  beq        $a1, $s0, .L8002696C
    /* 1692C 8002692C 00000000 */   nop
    /* 16930 80026930 581C838F */  lw         $v1, %gp_rel(asyncblockstatus)($gp)
    /* 16934 80026934 01000224 */  addiu      $v0, $zero, 0x1
    /* 16938 80026938 0C006214 */  bne        $v1, $v0, .L8002696C
    /* 1693C 8002693C 00000000 */   nop
    /* 16940 80026940 1180023C */  lui        $v0, %hi(D_8010ED58)
    /* 16944 80026944 58ED4224 */  addiu      $v0, $v0, %lo(D_8010ED58)
    /* 16948 80026948 1280013C */  lui        $at, %hi(abortfile)
    /* 1694C 8002694C B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 16950 80026950 94020224 */  addiu      $v0, $zero, 0x294
    /* 16954 80026954 1180043C */  lui        $a0, %hi(D_8010EE10)
    /* 16958 80026958 10EE8424 */  addiu      $a0, $a0, %lo(D_8010EE10)
    /* 1695C 8002695C 1280013C */  lui        $at, %hi(abortline)
    /* 16960 80026960 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 16964 80026964 0F95000C */  jal        abortmessage
    /* 16968 80026968 21300002 */   addu      $a2, $s0, $zero
  .L8002696C:
    /* 1696C 8002696C FC2290AF */  sw         $s0, %gp_rel(asyncblockcallbackfunc)($gp)
    /* 16970 80026970 1400BF8F */  lw         $ra, 0x14($sp)
    /* 16974 80026974 1000B08F */  lw         $s0, 0x10($sp)
    /* 16978 80026978 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1697C 8002697C 0800E003 */  jr         $ra
    /* 16980 80026980 00000000 */   nop
endlabel asyncreadblockcallback
