.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WinterSales__Fi, 0x23C

glabel WinterSales__Fi
    /* 751C0 800851C0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 751C4 800851C4 3400BFAF */  sw         $ra, 0x34($sp)
    /* 751C8 800851C8 3000BEAF */  sw         $fp, 0x30($sp)
    /* 751CC 800851CC 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 751D0 800851D0 2800B6AF */  sw         $s6, 0x28($sp)
    /* 751D4 800851D4 2400B5AF */  sw         $s5, 0x24($sp)
    /* 751D8 800851D8 2000B4AF */  sw         $s4, 0x20($sp)
    /* 751DC 800851DC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 751E0 800851E0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 751E4 800851E4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 751E8 800851E8 77008010 */  beqz       $a0, .L800853C8
    /* 751EC 800851EC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 751F0 800851F0 21200000 */  addu       $a0, $zero, $zero
    /* 751F4 800851F4 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 751F8 800851F8 01000524 */   addiu     $a1, $zero, 0x1
    /* 751FC 800851FC 01000424 */  addiu      $a0, $zero, 0x1
    /* 75200 80085200 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 75204 80085204 01000524 */   addiu     $a1, $zero, 0x1
    /* 75208 80085208 21B00000 */  addu       $s6, $zero, $zero
    /* 7520C 8008520C 0E80133C */  lui        $s3, %hi(plr + 0x1B0)
    /* 75210 80085210 E8A67326 */  addiu      $s3, $s3, %lo(plr + 0x1B0)
    /* 75214 80085214 06001124 */  addiu      $s1, $zero, 0x6
    /* 75218 80085218 FFFF1424 */  addiu      $s4, $zero, -0x1
    /* 7521C 8008521C 1280153C */  lui        $s5, %hi(PDosh)
    /* 75220 80085220 18ABB526 */  addiu      $s5, $s5, %lo(PDosh)
    /* 75224 80085224 2C007226 */  addiu      $s2, $s3, 0x2C
    /* 75228 80085228 9C0380AF */  sw         $zero, %gp_rel(PDosh + 0x4)($gp)
    /* 7522C 8008522C 980380AF */  sw         $zero, %gp_rel(PDosh)($gp)
  .L80085230:
    /* 75230 80085230 00004286 */  lh         $v0, 0x0($s2)
    /* 75234 80085234 00000000 */  nop
    /* 75238 80085238 0B005410 */  beq        $v0, $s4, .L80085268
    /* 7523C 8008523C 21206002 */   addu      $a0, $s3, $zero
    /* 75240 80085240 D113020C */  jal        DetectDup__FP10ItemStructi
    /* 75244 80085244 01000524 */   addiu     $a1, $zero, 0x1
    /* 75248 80085248 21804000 */  addu       $s0, $v0, $zero
    /* 7524C 8008524C 06000012 */  beqz       $s0, .L80085268
    /* 75250 80085250 00000000 */   nop
    /* 75254 80085254 000054A6 */  sh         $s4, 0x0($s2)
    /* 75258 80085258 0000A28E */  lw         $v0, 0x0($s5)
    /* 7525C 8008525C 00000000 */  nop
    /* 75260 80085260 21105000 */  addu       $v0, $v0, $s0
    /* 75264 80085264 0000A2AE */  sw         $v0, 0x0($s5)
  .L80085268:
    /* 75268 80085268 6C005226 */  addiu      $s2, $s2, 0x6C
    /* 7526C 8008526C FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 75270 80085270 EFFF3416 */  bne        $s1, $s4, .L80085230
    /* 75274 80085274 6C007326 */   addiu     $s3, $s3, 0x6C
  .L80085278:
    /* 75278 80085278 21F00000 */  addu       $fp, $zero, $zero
    /* 7527C 8008527C FFFF1724 */  addiu      $s7, $zero, -0x1
    /* 75280 80085280 01001524 */  addiu      $s5, $zero, 0x1
  .L80085284:
    /* 75284 80085284 21900000 */  addu       $s2, $zero, $zero
    /* 75288 80085288 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 7528C 8008528C 21083E00 */  addu       $at, $at, $fp
    /* 75290 80085290 BCBA318C */  lw         $s1, %lo(plr + 0x1584)($at)
    /* 75294 80085294 0E80023C */  lui        $v0, %hi(plr + 0x4A4)
    /* 75298 80085298 DCA94224 */  addiu      $v0, $v0, %lo(plr + 0x4A4)
    /* 7529C 8008529C FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 752A0 800852A0 1D003712 */  beq        $s1, $s7, .L80085318
    /* 752A4 800852A4 2198C203 */   addu      $s3, $fp, $v0
    /* 752A8 800852A8 1280033C */  lui        $v1, %hi(PDosh)
    /* 752AC 800852AC 18AB6324 */  addiu      $v1, $v1, %lo(PDosh)
    /* 752B0 800852B0 80101600 */  sll        $v0, $s6, 2
    /* 752B4 800852B4 21A04300 */  addu       $s4, $v0, $v1
  .L800852B8:
    /* 752B8 800852B8 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 752BC 800852BC EEFF4010 */  beqz       $v0, .L80085278
    /* 752C0 800852C0 00000000 */   nop
    /* 752C4 800852C4 2C006386 */  lh         $v1, 0x2C($s3)
    /* 752C8 800852C8 00000000 */  nop
    /* 752CC 800852CC 0E007710 */  beq        $v1, $s7, .L80085308
    /* 752D0 800852D0 0B000224 */   addiu     $v0, $zero, 0xB
    /* 752D4 800852D4 0C006210 */  beq        $v1, $v0, .L80085308
    /* 752D8 800852D8 21206002 */   addu      $a0, $s3, $zero
    /* 752DC 800852DC D113020C */  jal        DetectDup__FP10ItemStructi
    /* 752E0 800852E0 01000524 */   addiu     $a1, $zero, 0x1
    /* 752E4 800852E4 21804000 */  addu       $s0, $v0, $zero
    /* 752E8 800852E8 07000012 */  beqz       $s0, .L80085308
    /* 752EC 800852EC 2120C002 */   addu      $a0, $s6, $zero
    /* 752F0 800852F0 5513020C */  jal        RemoveDupInvItem__Fii
    /* 752F4 800852F4 21284002 */   addu      $a1, $s2, $zero
    /* 752F8 800852F8 0000828E */  lw         $v0, 0x0($s4)
    /* 752FC 800852FC 21A80000 */  addu       $s5, $zero, $zero
    /* 75300 80085300 21105000 */  addu       $v0, $v0, $s0
    /* 75304 80085304 000082AE */  sw         $v0, 0x0($s4)
  .L80085308:
    /* 75308 80085308 01005226 */  addiu      $s2, $s2, 0x1
    /* 7530C 8008530C FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 75310 80085310 E9FF3716 */  bne        $s1, $s7, .L800852B8
    /* 75314 80085314 6C007326 */   addiu     $s3, $s3, 0x6C
  .L80085318:
    /* 75318 80085318 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 7531C 8008531C D9FF4010 */  beqz       $v0, .L80085284
    /* 75320 80085320 01001524 */   addiu     $s5, $zero, 0x1
    /* 75324 80085324 0E80133C */  lui        $s3, %hi(plr + 0x15B0)
    /* 75328 80085328 E8BA7326 */  addiu      $s3, $s3, %lo(plr + 0x15B0)
    /* 7532C 8008532C 07001124 */  addiu      $s1, $zero, 0x7
    /* 75330 80085330 FFFF1524 */  addiu      $s5, $zero, -0x1
    /* 75334 80085334 1280033C */  lui        $v1, %hi(PDosh)
    /* 75338 80085338 18AB6324 */  addiu      $v1, $v1, %lo(PDosh)
    /* 7533C 8008533C 80101600 */  sll        $v0, $s6, 2
    /* 75340 80085340 21A04300 */  addu       $s4, $v0, $v1
    /* 75344 80085344 2C007226 */  addiu      $s2, $s3, 0x2C
  .L80085348:
    /* 75348 80085348 00004286 */  lh         $v0, 0x0($s2)
    /* 7534C 8008534C 00000000 */  nop
    /* 75350 80085350 0B005510 */  beq        $v0, $s5, .L80085380
    /* 75354 80085354 21206002 */   addu      $a0, $s3, $zero
    /* 75358 80085358 D113020C */  jal        DetectDup__FP10ItemStructi
    /* 7535C 8008535C 01000524 */   addiu     $a1, $zero, 0x1
    /* 75360 80085360 21804000 */  addu       $s0, $v0, $zero
    /* 75364 80085364 06000012 */  beqz       $s0, .L80085380
    /* 75368 80085368 00000000 */   nop
    /* 7536C 8008536C 000055A6 */  sh         $s5, 0x0($s2)
    /* 75370 80085370 0000828E */  lw         $v0, 0x0($s4)
    /* 75374 80085374 00000000 */  nop
    /* 75378 80085378 21105000 */  addu       $v0, $v0, $s0
    /* 7537C 8008537C 000082AE */  sw         $v0, 0x0($s4)
  .L80085380:
    /* 75380 80085380 6C005226 */  addiu      $s2, $s2, 0x6C
    /* 75384 80085384 FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 75388 80085388 EFFF3516 */  bne        $s1, $s5, .L80085348
    /* 7538C 8008538C 6C007326 */   addiu     $s3, $s3, 0x6C
    /* 75390 80085390 21200000 */  addu       $a0, $zero, $zero
    /* 75394 80085394 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 75398 80085398 01000524 */   addiu     $a1, $zero, 0x1
    /* 7539C 8008539C 01000424 */  addiu      $a0, $zero, 0x1
    /* 753A0 800853A0 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 753A4 800853A4 01000524 */   addiu     $a1, $zero, 0x1
    /* 753A8 800853A8 E221010C */  jal        SpawnStoreGold__Fv
    /* 753AC 800853AC 00000000 */   nop
    /* 753B0 800853B0 9803858F */  lw         $a1, %gp_rel(PDosh)($gp)
    /* 753B4 800853B4 D112020C */  jal        GivePlayerDosh__Fil
    /* 753B8 800853B8 21200000 */   addu      $a0, $zero, $zero
    /* 753BC 800853BC 9C03858F */  lw         $a1, %gp_rel(PDosh + 0x4)($gp)
    /* 753C0 800853C0 D112020C */  jal        GivePlayerDosh__Fil
    /* 753C4 800853C4 01000424 */   addiu     $a0, $zero, 0x1
  .L800853C8:
    /* 753C8 800853C8 3400BF8F */  lw         $ra, 0x34($sp)
    /* 753CC 800853CC 3000BE8F */  lw         $fp, 0x30($sp)
    /* 753D0 800853D0 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 753D4 800853D4 2800B68F */  lw         $s6, 0x28($sp)
    /* 753D8 800853D8 2400B58F */  lw         $s5, 0x24($sp)
    /* 753DC 800853DC 2000B48F */  lw         $s4, 0x20($sp)
    /* 753E0 800853E0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 753E4 800853E4 1800B28F */  lw         $s2, 0x18($sp)
    /* 753E8 800853E8 1400B18F */  lw         $s1, 0x14($sp)
    /* 753EC 800853EC 1000B08F */  lw         $s0, 0x10($sp)
    /* 753F0 800853F0 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 753F4 800853F4 0800E003 */  jr         $ra
    /* 753F8 800853F8 00000000 */   nop
endlabel WinterSales__Fi
