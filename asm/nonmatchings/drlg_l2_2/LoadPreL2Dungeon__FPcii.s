.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadPreL2Dungeon__FPcii, 0x1F4

glabel LoadPreL2Dungeon__FPcii
    /* E760 80148358 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* E764 8014835C 2000B0AF */  sw         $s0, 0x20($sp)
    /* E768 80148360 2400BFAF */  sw         $ra, 0x24($sp)
    /* E76C 80148364 910F050C */  jal        InitDungeon__Fv
    /* E770 80148368 21808000 */   addu      $s0, $a0, $zero
    /* E774 8014836C 1C68050C */  jal        DRLG_InitTrans__Fv
    /* E778 80148370 00000000 */   nop
    /* E77C 80148374 21200002 */  addu       $a0, $s0, $zero
    /* E780 80148378 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* E784 8014837C 21280000 */   addu      $a1, $zero, $zero
    /* E788 80148380 21784000 */  addu       $t7, $v0, $zero
    /* E78C 80148384 2140E001 */  addu       $t0, $t7, $zero
    /* E790 80148388 21380000 */  addu       $a3, $zero, $zero
    /* E794 8014838C 0E800D3C */  lui        $t5, %hi(dungeon)
    /* E798 80148390 C440AD25 */  addiu      $t5, $t5, %lo(dungeon)
    /* E79C 80148394 0C000C24 */  addiu      $t4, $zero, 0xC
    /* E7A0 80148398 21580000 */  addu       $t3, $zero, $zero
  .L8014839C:
    /* E7A4 8014839C 21280000 */  addu       $a1, $zero, $zero
    /* E7A8 801483A0 40500700 */  sll        $t2, $a3, 1
    /* E7AC 801483A4 21486001 */  addu       $t1, $t3, $zero
    /* E7B0 801483A8 2130A001 */  addu       $a2, $t5, $zero
  .L801483AC:
    /* E7B4 801483AC 21204601 */  addu       $a0, $t2, $a2
    /* E7B8 801483B0 21182501 */  addu       $v1, $t1, $a1
    /* E7BC 801483B4 1280023C */  lui        $v0, %hi(mydflags)
    /* E7C0 801483B8 D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* E7C4 801483BC 0100A524 */  addiu      $a1, $a1, 0x1
    /* E7C8 801483C0 00008CA4 */  sh         $t4, 0x0($a0)
    /* E7CC 801483C4 21104300 */  addu       $v0, $v0, $v1
    /* E7D0 801483C8 000040A0 */  sb         $zero, 0x0($v0)
    /* E7D4 801483CC 2800A228 */  slti       $v0, $a1, 0x28
    /* E7D8 801483D0 F6FF4014 */  bnez       $v0, .L801483AC
    /* E7DC 801483D4 6000C624 */   addiu     $a2, $a2, 0x60
    /* E7E0 801483D8 0100E724 */  addiu      $a3, $a3, 0x1
    /* E7E4 801483DC 2800E228 */  slti       $v0, $a3, 0x28
    /* E7E8 801483E0 EEFF4014 */  bnez       $v0, .L8014839C
    /* E7EC 801483E4 28006B25 */   addiu     $t3, $t3, 0x28
    /* E7F0 801483E8 00000B91 */  lbu        $t3, 0x0($t0)
    /* E7F4 801483EC 21380000 */  addu       $a3, $zero, $zero
    /* E7F8 801483F0 02000825 */  addiu      $t0, $t0, 0x2
    /* E7FC 801483F4 00000C91 */  lbu        $t4, 0x0($t0)
    /* E800 801483F8 00000000 */  nop
    /* E804 801483FC 23008011 */  beqz       $t4, .L8014848C
    /* E808 80148400 02000825 */   addiu     $t0, $t0, 0x2
    /* E80C 80148404 0E800E3C */  lui        $t6, %hi(dungeon)
    /* E810 80148408 C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* E814 8014840C 03000D24 */  addiu      $t5, $zero, 0x3
    /* E818 80148410 21500000 */  addu       $t2, $zero, $zero
  .L80148414:
    /* E81C 80148414 18006011 */  beqz       $t3, .L80148478
    /* E820 80148418 21280000 */   addu      $a1, $zero, $zero
    /* E824 8014841C 40300700 */  sll        $a2, $a3, 1
    /* E828 80148420 21484001 */  addu       $t1, $t2, $zero
    /* E82C 80148424 2120C001 */  addu       $a0, $t6, $zero
  .L80148428:
    /* E830 80148428 00000391 */  lbu        $v1, 0x0($t0)
    /* E834 8014842C 00000000 */  nop
    /* E838 80148430 0B006010 */  beqz       $v1, .L80148460
    /* E83C 80148434 2110C400 */   addu      $v0, $a2, $a0
    /* E840 80148438 000043A4 */  sh         $v1, 0x0($v0)
    /* E844 8014843C 1280033C */  lui        $v1, %hi(mydflags)
    /* E848 80148440 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* E84C 80148444 21102501 */  addu       $v0, $t1, $a1
    /* E850 80148448 21186200 */  addu       $v1, $v1, $v0
    /* E854 8014844C 00006290 */  lbu        $v0, 0x0($v1)
    /* E858 80148450 00000000 */  nop
    /* E85C 80148454 80004234 */  ori        $v0, $v0, 0x80
    /* E860 80148458 19210508 */  j          .L80148464
    /* E864 8014845C 000062A0 */   sb        $v0, 0x0($v1)
  .L80148460:
    /* E868 80148460 00004DA4 */  sh         $t5, 0x0($v0)
  .L80148464:
    /* E86C 80148464 02000825 */  addiu      $t0, $t0, 0x2
    /* E870 80148468 0100A524 */  addiu      $a1, $a1, 0x1
    /* E874 8014846C 2A10AB00 */  slt        $v0, $a1, $t3
    /* E878 80148470 EDFF4014 */  bnez       $v0, .L80148428
    /* E87C 80148474 60008424 */   addiu     $a0, $a0, 0x60
  .L80148478:
    /* E880 80148478 0100E724 */  addiu      $a3, $a3, 0x1
    /* E884 8014847C 2A10EC00 */  slt        $v0, $a3, $t4
    /* E888 80148480 E4FF4014 */  bnez       $v0, .L80148414
    /* E88C 80148484 28004A25 */   addiu     $t2, $t2, 0x28
    /* E890 80148488 21380000 */  addu       $a3, $zero, $zero
  .L8014848C:
    /* E894 8014848C 0E80093C */  lui        $t1, %hi(dungeon)
    /* E898 80148490 C4402925 */  addiu      $t1, $t1, %lo(dungeon)
    /* E89C 80148494 0C000824 */  addiu      $t0, $zero, 0xC
    /* E8A0 80148498 21280000 */  addu       $a1, $zero, $zero
  .L8014849C:
    /* E8A4 8014849C 40300700 */  sll        $a2, $a3, 1
    /* E8A8 801484A0 21202001 */  addu       $a0, $t1, $zero
  .L801484A4:
    /* E8AC 801484A4 2118C400 */  addu       $v1, $a2, $a0
    /* E8B0 801484A8 00006294 */  lhu        $v0, 0x0($v1)
    /* E8B4 801484AC 00000000 */  nop
    /* E8B8 801484B0 02004014 */  bnez       $v0, .L801484BC
    /* E8BC 801484B4 00000000 */   nop
    /* E8C0 801484B8 000068A4 */  sh         $t0, 0x0($v1)
  .L801484BC:
    /* E8C4 801484BC 0100A524 */  addiu      $a1, $a1, 0x1
    /* E8C8 801484C0 2800A228 */  slti       $v0, $a1, 0x28
    /* E8CC 801484C4 F7FF4014 */  bnez       $v0, .L801484A4
    /* E8D0 801484C8 60008424 */   addiu     $a0, $a0, 0x60
    /* E8D4 801484CC 0100E724 */  addiu      $a3, $a3, 0x1
    /* E8D8 801484D0 2800E228 */  slti       $v0, $a3, 0x28
    /* E8DC 801484D4 F1FF4014 */  bnez       $v0, .L8014849C
    /* E8E0 801484D8 21280000 */   addu      $a1, $zero, $zero
    /* E8E4 801484DC 21380000 */  addu       $a3, $zero, $zero
    /* E8E8 801484E0 0E800A3C */  lui        $t2, %hi(pdungeon)
    /* E8EC 801484E4 C4524A25 */  addiu      $t2, $t2, %lo(pdungeon)
    /* E8F0 801484E8 0E80093C */  lui        $t1, %hi(dungeon)
    /* E8F4 801484EC C4402925 */  addiu      $t1, $t1, %lo(dungeon)
  .L801484F0:
    /* E8F8 801484F0 40400700 */  sll        $t0, $a3, 1
    /* E8FC 801484F4 21302001 */  addu       $a2, $t1, $zero
    /* E900 801484F8 21204001 */  addu       $a0, $t2, $zero
  .L801484FC:
    /* E904 801484FC 21100601 */  addu       $v0, $t0, $a2
    /* E908 80148500 6000C624 */  addiu      $a2, $a2, 0x60
    /* E90C 80148504 21188700 */  addu       $v1, $a0, $a3
    /* E910 80148508 00004294 */  lhu        $v0, 0x0($v0)
    /* E914 8014850C 0100A524 */  addiu      $a1, $a1, 0x1
    /* E918 80148510 000062A0 */  sb         $v0, 0x0($v1)
    /* E91C 80148514 2800A228 */  slti       $v0, $a1, 0x28
    /* E920 80148518 F8FF4014 */  bnez       $v0, .L801484FC
    /* E924 8014851C 28008424 */   addiu     $a0, $a0, 0x28
    /* E928 80148520 0100E724 */  addiu      $a3, $a3, 0x1
    /* E92C 80148524 2800E228 */  slti       $v0, $a3, 0x28
    /* E930 80148528 F1FF4014 */  bnez       $v0, .L801484F0
    /* E934 8014852C 21280000 */   addu      $a1, $zero, $zero
    /* E938 80148530 F7F6000C */  jal        mem_free_dbg__FPv
    /* E93C 80148534 2120E001 */   addu      $a0, $t7, $zero
    /* E940 80148538 2400BF8F */  lw         $ra, 0x24($sp)
    /* E944 8014853C 2000B08F */  lw         $s0, 0x20($sp)
    /* E948 80148540 2800BD27 */  addiu      $sp, $sp, 0x28
    /* E94C 80148544 0800E003 */  jr         $ra
    /* E950 80148548 00000000 */   nop
endlabel LoadPreL2Dungeon__FPcii
