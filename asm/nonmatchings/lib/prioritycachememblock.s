.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching prioritycachememblock, 0x164

glabel prioritycachememblock
    /* 19BA0 80029BA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 19BA4 80029BA4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 19BA8 80029BA8 21808000 */  addu       $s0, $a0, $zero
    /* 19BAC 80029BAC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 19BB0 80029BB0 2190A000 */  addu       $s2, $a1, $zero
    /* 19BB4 80029BB4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 19BB8 80029BB8 21880002 */  addu       $s1, $s0, $zero
    /* 19BBC 80029BBC 0C000016 */  bnez       $s0, .L80029BF0
    /* 19BC0 80029BC0 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 19BC4 80029BC4 1180043C */  lui        $a0, %hi(D_8010F340)
    /* 19BC8 80029BC8 40F38424 */  addiu      $a0, $a0, %lo(D_8010F340)
    /* 19BCC 80029BCC 1180023C */  lui        $v0, %hi(D_8010F334)
    /* 19BD0 80029BD0 34F34224 */  addiu      $v0, $v0, %lo(D_8010F334)
    /* 19BD4 80029BD4 1280013C */  lui        $at, %hi(abortfile)
    /* 19BD8 80029BD8 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 19BDC 80029BDC 5A000224 */  addiu      $v0, $zero, 0x5A
    /* 19BE0 80029BE0 1280013C */  lui        $at, %hi(abortline)
    /* 19BE4 80029BE4 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 19BE8 80029BE8 0F95000C */  jal        abortmessage
    /* 19BEC 80029BEC 00000000 */   nop
  .L80029BF0:
    /* 19BF0 80029BF0 1800028E */  lw         $v0, 0x18($s0)
    /* 19BF4 80029BF4 00000000 */  nop
    /* 19BF8 80029BF8 00204230 */  andi       $v0, $v0, 0x2000
    /* 19BFC 80029BFC 06004010 */  beqz       $v0, .L80029C18
    /* 19C00 80029C00 00000000 */   nop
    /* 19C04 80029C04 1280023C */  lui        $v0, %hi(membreak)
    /* 19C08 80029C08 C0C4428C */  lw         $v0, %lo(membreak)($v0)
    /* 19C0C 80029C0C 00000000 */  nop
    /* 19C10 80029C10 09F84000 */  jalr       $v0
    /* 19C14 80029C14 21200002 */   addu      $a0, $s0, $zero
  .L80029C18:
    /* 19C18 80029C18 1800028E */  lw         $v0, 0x18($s0)
    /* 19C1C 80029C1C 00000000 */  nop
    /* 19C20 80029C20 00804230 */  andi       $v0, $v0, 0x8000
    /* 19C24 80029C24 0C004010 */  beqz       $v0, .L80029C58
    /* 19C28 80029C28 00000000 */   nop
    /* 19C2C 80029C2C 1180043C */  lui        $a0, %hi(D_8010F360)
    /* 19C30 80029C30 60F38424 */  addiu      $a0, $a0, %lo(D_8010F360)
    /* 19C34 80029C34 1180023C */  lui        $v0, %hi(D_8010F334)
    /* 19C38 80029C38 34F34224 */  addiu      $v0, $v0, %lo(D_8010F334)
    /* 19C3C 80029C3C 1280013C */  lui        $at, %hi(abortfile)
    /* 19C40 80029C40 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 19C44 80029C44 5C000224 */  addiu      $v0, $zero, 0x5C
    /* 19C48 80029C48 1280013C */  lui        $at, %hi(abortline)
    /* 19C4C 80029C4C BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 19C50 80029C50 0F95000C */  jal        abortmessage
    /* 19C54 80029C54 00000000 */   nop
  .L80029C58:
    /* 19C58 80029C58 1800028E */  lw         $v0, 0x18($s0)
    /* 19C5C 80029C5C 00000000 */  nop
    /* 19C60 80029C60 00404230 */  andi       $v0, $v0, 0x4000
    /* 19C64 80029C64 12004010 */  beqz       $v0, .L80029CB0
    /* 19C68 80029C68 00000000 */   nop
    /* 19C6C 80029C6C 1BB1000C */  jal        checksentinelz
    /* 19C70 80029C70 21200002 */   addu      $a0, $s0, $zero
    /* 19C74 80029C74 0E004014 */  bnez       $v0, .L80029CB0
    /* 19C78 80029C78 00000000 */   nop
    /* 19C7C 80029C7C 0000068E */  lw         $a2, 0x0($s0)
    /* 19C80 80029C80 1400078E */  lw         $a3, 0x14($s0)
    /* 19C84 80029C84 1180043C */  lui        $a0, %hi(D_8010F390)
    /* 19C88 80029C88 90F38424 */  addiu      $a0, $a0, %lo(D_8010F390)
    /* 19C8C 80029C8C 1180023C */  lui        $v0, %hi(D_8010F334)
    /* 19C90 80029C90 34F34224 */  addiu      $v0, $v0, %lo(D_8010F334)
    /* 19C94 80029C94 1280013C */  lui        $at, %hi(abortfile)
    /* 19C98 80029C98 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 19C9C 80029C9C 62000224 */  addiu      $v0, $zero, 0x62
    /* 19CA0 80029CA0 1280013C */  lui        $at, %hi(abortline)
    /* 19CA4 80029CA4 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 19CA8 80029CA8 0F95000C */  jal        abortmessage
    /* 19CAC 80029CAC 04000526 */   addiu     $a1, $s0, 0x4
  .L80029CB0:
    /* 19CB0 80029CB0 1280043C */  lui        $a0, %hi(_lv)
    /* 19CB4 80029CB4 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 19CB8 80029CB8 E8BD000C */  jal        locksemaphore
    /* 19CBC 80029CBC 00000000 */   nop
    /* 19CC0 80029CC0 1800228E */  lw         $v0, 0x18($s1)
    /* 19CC4 80029CC4 1280043C */  lui        $a0, %hi(_lv)
    /* 19CC8 80029CC8 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 19CCC 80029CCC F8FF0324 */  addiu      $v1, $zero, -0x8
    /* 19CD0 80029CD0 24104300 */  and        $v0, $v0, $v1
    /* 19CD4 80029CD4 08004336 */  ori        $v1, $s2, 0x8
    /* 19CD8 80029CD8 25104300 */  or         $v0, $v0, $v1
    /* 19CDC 80029CDC F3BD000C */  jal        unlocksemaphore
    /* 19CE0 80029CE0 180022AE */   sw        $v0, 0x18($s1)
    /* 19CE4 80029CE4 21100002 */  addu       $v0, $s0, $zero
    /* 19CE8 80029CE8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 19CEC 80029CEC 1800B28F */  lw         $s2, 0x18($sp)
    /* 19CF0 80029CF0 1400B18F */  lw         $s1, 0x14($sp)
    /* 19CF4 80029CF4 1000B08F */  lw         $s0, 0x10($sp)
    /* 19CF8 80029CF8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 19CFC 80029CFC 0800E003 */  jr         $ra
    /* 19D00 80029D00 00000000 */   nop
endlabel prioritycachememblock
