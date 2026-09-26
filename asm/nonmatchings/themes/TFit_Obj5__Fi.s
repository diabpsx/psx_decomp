.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TFit_Obj5__Fi, 0x1C4

glabel TFit_Obj5__Fi
    /* 22304 8015BEFC C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 22308 8015BF00 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2230C 8015BF04 21808000 */  addu       $s0, $a0, $zero
    /* 22310 8015BF08 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 22314 8015BF0C 21980000 */  addu       $s3, $zero, $zero
    /* 22318 8015BF10 2000B4AF */  sw         $s4, 0x20($sp)
    /* 2231C 8015BF14 21A00000 */  addu       $s4, $zero, $zero
    /* 22320 8015BF18 05000424 */  addiu      $a0, $zero, 0x5
    /* 22324 8015BF1C 3400BFAF */  sw         $ra, 0x34($sp)
    /* 22328 8015BF20 3000BEAF */  sw         $fp, 0x30($sp)
    /* 2232C 8015BF24 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 22330 8015BF28 2800B6AF */  sw         $s6, 0x28($sp)
    /* 22334 8015BF2C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 22338 8015BF30 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2233C 8015BF34 C9F6000C */  jal        ENG_random__Fl
    /* 22340 8015BF38 1400B1AF */   sw        $s1, 0x14($sp)
    /* 22344 8015BF3C 01005624 */  addiu      $s6, $v0, 0x1
    /* 22348 8015BF40 4F00C01A */  blez       $s6, .L8015C080
    /* 2234C 8015BF44 21F0C002 */   addu      $fp, $s6, $zero
    /* 22350 8015BF48 C0B81000 */  sll        $s7, $s0, 3
    /* 22354 8015BF4C C0181400 */  sll        $v1, $s4, 3
  .L8015BF50:
    /* 22358 8015BF50 C0101300 */  sll        $v0, $s3, 3
    /* 2235C 8015BF54 23105300 */  subu       $v0, $v0, $s3
    /* 22360 8015BF58 C0110200 */  sll        $v0, $v0, 7
    /* 22364 8015BF5C 21186200 */  addu       $v1, $v1, $v0
    /* 22368 8015BF60 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 2236C 8015BF64 21082300 */  addu       $at, $at, $v1
    /* 22370 8015BF68 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 22374 8015BF6C 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 22378 8015BF70 21083700 */  addu       $at, $at, $s7
    /* 2237C 8015BF74 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 22380 8015BF78 00000000 */  nop
    /* 22384 8015BF7C 30006214 */  bne        $v1, $v0, .L8015C040
    /* 22388 8015BF80 21A80000 */   addu      $s5, $zero, $zero
    /* 2238C 8015BF84 21206002 */  addu       $a0, $s3, $zero
    /* 22390 8015BF88 380B020C */  jal        GetSOLID__Fii
    /* 22394 8015BF8C 21288002 */   addu      $a1, $s4, $zero
    /* 22398 8015BF90 01004238 */  xori       $v0, $v0, 0x1
    /* 2239C 8015BF94 2B004010 */  beqz       $v0, .L8015C044
    /* 223A0 8015BF98 FF00A232 */   andi      $v0, $s5, 0xFF
    /* 223A4 8015BF9C 01001524 */  addiu      $s5, $zero, 0x1
    /* 223A8 8015BFA0 21900000 */  addu       $s2, $zero, $zero
    /* 223AC 8015BFA4 1080113C */  lui        $s1, %hi(trm5x)
    /* 223B0 8015BFA8 38273126 */  addiu      $s1, $s1, %lo(trm5x)
  .L8015BFAC:
    /* 223B4 8015BFAC 1900422A */  slti       $v0, $s2, 0x19
    /* 223B8 8015BFB0 23004010 */  beqz       $v0, .L8015C040
    /* 223BC 8015BFB4 80181200 */   sll       $v1, $s2, 2
    /* 223C0 8015BFB8 1080023C */  lui        $v0, %hi(trm5y)
    /* 223C4 8015BFBC 9C274224 */  addiu      $v0, $v0, %lo(trm5y)
    /* 223C8 8015BFC0 21806200 */  addu       $s0, $v1, $v0
    /* 223CC 8015BFC4 0000248E */  lw         $a0, 0x0($s1)
    /* 223D0 8015BFC8 0000058E */  lw         $a1, 0x0($s0)
    /* 223D4 8015BFCC 21206402 */  addu       $a0, $s3, $a0
    /* 223D8 8015BFD0 380B020C */  jal        GetSOLID__Fii
    /* 223DC 8015BFD4 21288502 */   addu      $a1, $s4, $a1
    /* 223E0 8015BFD8 02004010 */  beqz       $v0, .L8015BFE4
    /* 223E4 8015BFDC 00000000 */   nop
    /* 223E8 8015BFE0 21A80000 */  addu       $s5, $zero, $zero
  .L8015BFE4:
    /* 223EC 8015BFE4 0000048E */  lw         $a0, 0x0($s0)
    /* 223F0 8015BFE8 0000238E */  lw         $v1, 0x0($s1)
    /* 223F4 8015BFEC 21208402 */  addu       $a0, $s4, $a0
    /* 223F8 8015BFF0 C0200400 */  sll        $a0, $a0, 3
    /* 223FC 8015BFF4 21186302 */  addu       $v1, $s3, $v1
    /* 22400 8015BFF8 C0100300 */  sll        $v0, $v1, 3
    /* 22404 8015BFFC 23104300 */  subu       $v0, $v0, $v1
    /* 22408 8015C000 C0110200 */  sll        $v0, $v0, 7
    /* 2240C 8015C004 21208200 */  addu       $a0, $a0, $v0
    /* 22410 8015C008 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 22414 8015C00C 21082400 */  addu       $at, $at, $a0
    /* 22418 8015C010 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 2241C 8015C014 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 22420 8015C018 21083700 */  addu       $at, $at, $s7
    /* 22424 8015C01C 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 22428 8015C020 00000000 */  nop
    /* 2242C 8015C024 02006210 */  beq        $v1, $v0, .L8015C030
    /* 22430 8015C028 00000000 */   nop
    /* 22434 8015C02C 21A80000 */  addu       $s5, $zero, $zero
  .L8015C030:
    /* 22438 8015C030 04003126 */  addiu      $s1, $s1, 0x4
    /* 2243C 8015C034 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 22440 8015C038 DCFF4014 */  bnez       $v0, .L8015BFAC
    /* 22444 8015C03C 01005226 */   addiu     $s2, $s2, 0x1
  .L8015C040:
    /* 22448 8015C040 FF00A232 */  andi       $v0, $s5, 0xFF
  .L8015C044:
    /* 2244C 8015C044 0B004014 */  bnez       $v0, .L8015C074
    /* 22450 8015C048 60000224 */   addiu     $v0, $zero, 0x60
    /* 22454 8015C04C 01007326 */  addiu      $s3, $s3, 0x1
    /* 22458 8015C050 09006216 */  bne        $s3, $v0, .L8015C078
    /* 2245C 8015C054 00000000 */   nop
    /* 22460 8015C058 01009426 */  addiu      $s4, $s4, 0x1
    /* 22464 8015C05C 06008216 */  bne        $s4, $v0, .L8015C078
    /* 22468 8015C060 21980000 */   addu      $s3, $zero, $zero
    /* 2246C 8015C064 0400DE16 */  bne        $s6, $fp, .L8015C078
    /* 22470 8015C068 21A00000 */   addu      $s4, $zero, $zero
    /* 22474 8015C06C 23700508 */  j          .L8015C08C
    /* 22478 8015C070 21100000 */   addu      $v0, $zero, $zero
  .L8015C074:
    /* 2247C 8015C074 FFFFD626 */  addiu      $s6, $s6, -0x1
  .L8015C078:
    /* 22480 8015C078 B5FFC01E */  bgtz       $s6, .L8015BF50
    /* 22484 8015C07C C0181400 */   sll       $v1, $s4, 3
  .L8015C080:
    /* 22488 8015C080 01000224 */  addiu      $v0, $zero, 0x1
    /* 2248C 8015C084 181A93AF */  sw         $s3, %gp_rel(themex)($gp)
    /* 22490 8015C088 1C1A94AF */  sw         $s4, %gp_rel(themey)($gp)
  .L8015C08C:
    /* 22494 8015C08C 3400BF8F */  lw         $ra, 0x34($sp)
    /* 22498 8015C090 3000BE8F */  lw         $fp, 0x30($sp)
    /* 2249C 8015C094 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 224A0 8015C098 2800B68F */  lw         $s6, 0x28($sp)
    /* 224A4 8015C09C 2400B58F */  lw         $s5, 0x24($sp)
    /* 224A8 8015C0A0 2000B48F */  lw         $s4, 0x20($sp)
    /* 224AC 8015C0A4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 224B0 8015C0A8 1800B28F */  lw         $s2, 0x18($sp)
    /* 224B4 8015C0AC 1400B18F */  lw         $s1, 0x14($sp)
    /* 224B8 8015C0B0 1000B08F */  lw         $s0, 0x10($sp)
    /* 224BC 8015C0B4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 224C0 8015C0B8 0800E003 */  jr         $ra
    /* 224C4 8015C0BC 00000000 */   nop
endlabel TFit_Obj5__Fi
