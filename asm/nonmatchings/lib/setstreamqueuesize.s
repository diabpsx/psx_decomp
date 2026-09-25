.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setstreamqueuesize, 0x58

glabel setstreamqueuesize
    /* 1CBBC 8002CBBC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CBC0 8002CBC0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CBC4 8002CBC4 21808000 */  addu       $s0, $a0, $zero
    /* 1CBC8 8002CBC8 0C00001E */  bgtz       $s0, .L8002CBFC
    /* 1CBCC 8002CBCC 1400BFAF */   sw        $ra, 0x14($sp)
    /* 1CBD0 8002CBD0 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1CBD4 8002CBD4 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1CBD8 8002CBD8 1280013C */  lui        $at, %hi(abortfile)
    /* 1CBDC 8002CBDC B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1CBE0 8002CBE0 B7000224 */  addiu      $v0, $zero, 0xB7
    /* 1CBE4 8002CBE4 1180043C */  lui        $a0, %hi(D_8010FB08)
    /* 1CBE8 8002CBE8 08FB8424 */  addiu      $a0, $a0, %lo(D_8010FB08)
    /* 1CBEC 8002CBEC 1280013C */  lui        $at, %hi(abortline)
    /* 1CBF0 8002CBF0 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1CBF4 8002CBF4 0F95000C */  jal        abortmessage
    /* 1CBF8 8002CBF8 21280002 */   addu      $a1, $s0, $zero
  .L8002CBFC:
    /* 1CBFC 8002CBFC 641D90AF */  sw         $s0, %gp_rel(maxstreamblocks)($gp)
    /* 1CC00 8002CC00 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1CC04 8002CC04 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CC08 8002CC08 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CC0C 8002CC0C 0800E003 */  jr         $ra
    /* 1CC10 8002CC10 00000000 */   nop
endlabel setstreamqueuesize
