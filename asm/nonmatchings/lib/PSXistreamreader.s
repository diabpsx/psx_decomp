.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PSXistreamreader, 0x6C

glabel PSXistreamreader
    /* 1D8FC 8002D8FC 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1D900 8002D900 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D904 8002D904 0C004014 */  bnez       $v0, .L8002D938
    /* 1D908 8002D908 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1D90C 8002D90C 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1D910 8002D910 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1D914 8002D914 1280013C */  lui        $at, %hi(abortfile)
    /* 1D918 8002D918 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1D91C 8002D91C 0F070224 */  addiu      $v0, $zero, 0x70F
    /* 1D920 8002D920 1180043C */  lui        $a0, %hi(D_8010FCF4)
    /* 1D924 8002D924 F4FC8424 */  addiu      $a0, $a0, %lo(D_8010FCF4)
    /* 1D928 8002D928 1280013C */  lui        $at, %hi(abortline)
    /* 1D92C 8002D92C BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1D930 8002D930 0F95000C */  jal        abortmessage
    /* 1D934 8002D934 00000000 */   nop
  .L8002D938:
    /* 1D938 8002D938 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1D93C 8002D93C 00000000 */  nop
    /* 1D940 8002D940 2800438C */  lw         $v1, 0x28($v0)
    /* 1D944 8002D944 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D948 8002D948 03006210 */  beq        $v1, $v0, .L8002D958
    /* 1D94C 8002D94C 00000000 */   nop
    /* 1D950 8002D950 78B6000C */  jal        localstreamreader
    /* 1D954 8002D954 00000000 */   nop
  .L8002D958:
    /* 1D958 8002D958 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1D95C 8002D95C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D960 8002D960 0800E003 */  jr         $ra
    /* 1D964 8002D964 00000000 */   nop
endlabel PSXistreamreader
