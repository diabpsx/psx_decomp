.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_800121D4, 0x98

glabel func_800121D4
    /* 21D4 800121D4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 21D8 800121D8 C02B0500 */  sll        $a1, $a1, 15
    /* 21DC 800121DC 1000A5AF */  sw         $a1, 0x10($sp)
    /* 21E0 800121E0 0B80023C */  lui        $v0, %hi(Vcount)
    /* 21E4 800121E4 0C54428C */  lw         $v0, %lo(Vcount)($v0)
    /* 21E8 800121E8 00000000 */  nop
    /* 21EC 800121EC 2A104400 */  slt        $v0, $v0, $a0
    /* 21F0 800121F0 1A004010 */  beqz       $v0, .L8001225C
    /* 21F4 800121F4 1800BFAF */   sw        $ra, 0x18($sp)
    /* 21F8 800121F8 FFFF0324 */  addiu      $v1, $zero, -0x1
  .L800121FC:
    /* 21FC 800121FC 1000A28F */  lw         $v0, 0x10($sp)
    /* 2200 80012200 00000000 */  nop
    /* 2204 80012204 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 2208 80012208 1000A2AF */  sw         $v0, 0x10($sp)
    /* 220C 8001220C 1000A28F */  lw         $v0, 0x10($sp)
    /* 2210 80012210 00000000 */  nop
    /* 2214 80012214 0B004314 */  bne        $v0, $v1, .L80012244
    /* 2218 80012218 00000000 */   nop
    /* 221C 8001221C 1180043C */  lui        $a0, %hi(D_8010DCF8)
    /* 2220 80012220 7567000C */  jal        puts
    /* 2224 80012224 F8DC8424 */   addiu     $a0, $a0, %lo(D_8010DCF8)
    /* 2228 80012228 9346000C */  jal        ChangeClearPAD
    /* 222C 8001222C 21200000 */   addu      $a0, $zero, $zero
    /* 2230 80012230 03000424 */  addiu      $a0, $zero, 0x3
    /* 2234 80012234 9B48000C */  jal        ChangeClearRCnt
    /* 2238 80012238 21280000 */   addu      $a1, $zero, $zero
    /* 223C 8001223C 97480008 */  j          .L8001225C
    /* 2240 80012240 00000000 */   nop
  .L80012244:
    /* 2244 80012244 0B80023C */  lui        $v0, %hi(Vcount)
    /* 2248 80012248 0C54428C */  lw         $v0, %lo(Vcount)($v0)
    /* 224C 8001224C 00000000 */  nop
    /* 2250 80012250 2A104400 */  slt        $v0, $v0, $a0
    /* 2254 80012254 E9FF4014 */  bnez       $v0, .L800121FC
    /* 2258 80012258 00000000 */   nop
  .L8001225C:
    /* 225C 8001225C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 2260 80012260 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2264 80012264 0800E003 */  jr         $ra
    /* 2268 80012268 00000000 */   nop
endlabel func_800121D4
