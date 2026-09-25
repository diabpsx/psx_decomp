.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakeOffsetTab__C9CBlockHdr, 0x12C

glabel MakeOffsetTab__C9CBlockHdr
    /* 823B4 800923B4 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 823B8 800923B8 3000B6AF */  sw         $s6, 0x30($sp)
    /* 823BC 800923BC 21B08000 */  addu       $s6, $a0, $zero
    /* 823C0 800923C0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 823C4 800923C4 0000D18E */  lw         $s1, 0x0($s6)
    /* 823C8 800923C8 2000B2AF */  sw         $s2, 0x20($sp)
    /* 823CC 800923CC 0400D226 */  addiu      $s2, $s6, 0x4
    /* 823D0 800923D0 3400BFAF */  sw         $ra, 0x34($sp)
    /* 823D4 800923D4 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 823D8 800923D8 2800B4AF */  sw         $s4, 0x28($sp)
    /* 823DC 800923DC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 823E0 800923E0 06002016 */  bnez       $s1, .L800923FC
    /* 823E4 800923E4 1800B0AF */   sw        $s0, 0x18($sp)
    /* 823E8 800923E8 21200000 */  addu       $a0, $zero, $zero
    /* 823EC 800923EC 1180053C */  lui        $a1, %hi(D_80110598)
    /* 823F0 800923F0 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 823F4 800923F4 A583000C */  jal        DBG_Error
    /* 823F8 800923F8 7D010624 */   addiu     $a2, $zero, 0x17D
  .L800923FC:
    /* 823FC 800923FC 80201100 */  sll        $a0, $s1, 2
    /* 82400 80092400 1280063C */  lui        $a2, %hi(D_8011AD00)
    /* 82404 80092404 00ADC624 */  addiu      $a2, $a2, %lo(D_8011AD00)
    /* 82408 80092408 7785000C */  jal        GAL_Alloc
    /* 8240C 8009240C 01800534 */   ori       $a1, $zero, 0x8001
    /* 82410 80092410 21A84000 */  addu       $s5, $v0, $zero
    /* 82414 80092414 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 82418 80092418 0500A216 */  bne        $s5, $v0, .L80092430
    /* 8241C 8009241C 21200000 */   addu      $a0, $zero, $zero
    /* 82420 80092420 1180053C */  lui        $a1, %hi(D_80110598)
    /* 82424 80092424 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 82428 80092428 A583000C */  jal        DBG_Error
    /* 8242C 8009242C 80010624 */   addiu     $a2, $zero, 0x180
  .L80092430:
    /* 82430 80092430 DD85000C */  jal        GAL_Lock
    /* 82434 80092434 2120A002 */   addu      $a0, $s5, $zero
    /* 82438 80092438 21984000 */  addu       $s3, $v0, $zero
    /* 8243C 8009243C 05006016 */  bnez       $s3, .L80092454
    /* 82440 80092440 21200000 */   addu      $a0, $zero, $zero
    /* 82444 80092444 1180053C */  lui        $a1, %hi(D_80110598)
    /* 82448 80092448 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 8244C 8009244C A583000C */  jal        DBG_Error
    /* 82450 80092450 83010624 */   addiu     $a2, $zero, 0x183
  .L80092454:
    /* 82454 80092454 0C002012 */  beqz       $s1, .L80092488
    /* 82458 80092458 21800000 */   addu      $s0, $zero, $zero
    /* 8245C 8009245C 21A02002 */  addu       $s4, $s1, $zero
    /* 82460 80092460 21886002 */  addu       $s1, $s3, $zero
  .L80092464:
    /* 82464 80092464 23105602 */  subu       $v0, $s2, $s6
    /* 82468 80092468 000022AE */  sw         $v0, 0x0($s1)
    /* 8246C 8009246C F954020C */  jal        GetSize__C6CBlock
    /* 82470 80092470 21204002 */   addu      $a0, $s2, $zero
    /* 82474 80092474 21904202 */  addu       $s2, $s2, $v0
    /* 82478 80092478 01001026 */  addiu      $s0, $s0, 0x1
    /* 8247C 8009247C 2B101402 */  sltu       $v0, $s0, $s4
    /* 82480 80092480 F8FF4014 */  bnez       $v0, .L80092464
    /* 82484 80092484 04003126 */   addiu     $s1, $s1, 0x4
  .L80092488:
    /* 82488 80092488 F785000C */  jal        GAL_Unlock
    /* 8248C 8009248C 2120A002 */   addu      $a0, $s5, $zero
    /* 82490 80092490 FF004230 */  andi       $v0, $v0, 0xFF
    /* 82494 80092494 07004014 */  bnez       $v0, .L800924B4
    /* 82498 80092498 2110A002 */   addu      $v0, $s5, $zero
    /* 8249C 8009249C 21200000 */  addu       $a0, $zero, $zero
    /* 824A0 800924A0 1180053C */  lui        $a1, %hi(D_80110598)
    /* 824A4 800924A4 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 824A8 800924A8 A583000C */  jal        DBG_Error
    /* 824AC 800924AC 8C010624 */   addiu     $a2, $zero, 0x18C
    /* 824B0 800924B0 2110A002 */  addu       $v0, $s5, $zero
  .L800924B4:
    /* 824B4 800924B4 3400BF8F */  lw         $ra, 0x34($sp)
    /* 824B8 800924B8 3000B68F */  lw         $s6, 0x30($sp)
    /* 824BC 800924BC 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 824C0 800924C0 2800B48F */  lw         $s4, 0x28($sp)
    /* 824C4 800924C4 2400B38F */  lw         $s3, 0x24($sp)
    /* 824C8 800924C8 2000B28F */  lw         $s2, 0x20($sp)
    /* 824CC 800924CC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 824D0 800924D0 1800B08F */  lw         $s0, 0x18($sp)
    /* 824D4 800924D4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 824D8 800924D8 0800E003 */  jr         $ra
    /* 824DC 800924DC 00000000 */   nop
endlabel MakeOffsetTab__C9CBlockHdr
