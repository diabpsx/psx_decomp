.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching loadfiletopup, 0xAC

glabel loadfiletopup
    /* 191FC 800291FC FC1C838F */  lw         $v1, %gp_rel(async_iotaskstatus)($gp)
    /* 19200 80029200 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19204 80029204 1000B0AF */  sw         $s0, 0x10($sp)
    /* 19208 80029208 01000224 */  addiu      $v0, $zero, 0x1
    /* 1920C 8002920C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 19210 80029210 041D82AF */  sw         $v0, %gp_rel(loadfilewaiting)($gp)
    /* 19214 80029214 0C006010 */  beqz       $v1, .L80029248
    /* 19218 80029218 21808000 */   addu      $s0, $a0, $zero
  .L8002921C:
    /* 1921C 8002921C FC1C828F */  lw         $v0, %gp_rel(async_iotaskstatus)($gp)
    /* 19220 80029220 00000000 */  nop
    /* 19224 80029224 09F84000 */  jalr       $v0
    /* 19228 80029228 00000000 */   nop
    /* 1922C 8002922C 05004010 */  beqz       $v0, .L80029244
    /* 19230 80029230 01000224 */   addiu     $v0, $zero, 0x1
    /* 19234 80029234 53BE000C */  jal        systemtask
    /* 19238 80029238 21200000 */   addu      $a0, $zero, $zero
    /* 1923C 8002923C 87A40008 */  j          .L8002921C
    /* 19240 80029240 00000000 */   nop
  .L80029244:
    /* 19244 80029244 041D82AF */  sw         $v0, %gp_rel(loadfilewaiting)($gp)
  .L80029248:
    /* 19248 80029248 D81C80AF */  sw         $zero, %gp_rel(relinquishio)($gp)
    /* 1924C 8002924C 4BA4000C */  jal        topupstream
    /* 19250 80029250 21200002 */   addu      $a0, $s0, $zero
    /* 19254 80029254 01001024 */  addiu      $s0, $zero, 0x1
  .L80029258:
    /* 19258 80029258 71A4000C */  jal        streamtoppedup
    /* 1925C 8002925C 00000000 */   nop
    /* 19260 80029260 08004014 */  bnez       $v0, .L80029284
    /* 19264 80029264 00000000 */   nop
    /* 19268 80029268 041D90AF */  sw         $s0, %gp_rel(loadfilewaiting)($gp)
    /* 1926C 8002926C 53BE000C */  jal        systemtask
    /* 19270 80029270 21200000 */   addu      $a0, $zero, $zero
    /* 19274 80029274 96A40008 */  j          .L80029258
    /* 19278 80029278 00000000 */   nop
  .L8002927C:
    /* 1927C 8002927C 53BE000C */  jal        systemtask
    /* 19280 80029280 21200000 */   addu      $a0, $zero, $zero
  .L80029284:
    /* 19284 80029284 041D828F */  lw         $v0, %gp_rel(loadfilewaiting)($gp)
    /* 19288 80029288 00000000 */  nop
    /* 1928C 8002928C FBFF4014 */  bnez       $v0, .L8002927C
    /* 19290 80029290 00000000 */   nop
    /* 19294 80029294 1400BF8F */  lw         $ra, 0x14($sp)
    /* 19298 80029298 1000B08F */  lw         $s0, 0x10($sp)
    /* 1929C 8002929C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 192A0 800292A0 0800E003 */  jr         $ra
    /* 192A4 800292A4 00000000 */   nop
endlabel loadfiletopup
