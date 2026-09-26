.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Acidsplat__Fi, 0x1AC

glabel MI_Acidsplat__Fi
    /* D7CC 801473C4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* D7D0 801473C8 21308000 */  addu       $a2, $a0, $zero
    /* D7D4 801473CC 80100600 */  sll        $v0, $a2, 2
    /* D7D8 801473D0 21104600 */  addu       $v0, $v0, $a2
    /* D7DC 801473D4 80100200 */  sll        $v0, $v0, 2
    /* D7E0 801473D8 23104600 */  subu       $v0, $v0, $a2
    /* D7E4 801473DC 80380200 */  sll        $a3, $v0, 2
    /* D7E8 801473E0 2800BFAF */  sw         $ra, 0x28($sp)
    /* D7EC 801473E4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D7F0 801473E8 21082700 */  addu       $at, $at, $a3
    /* D7F4 801473EC 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* D7F8 801473F0 1080013C */  lui        $at, %hi(missile + 0x42)
    /* D7FC 801473F4 21082700 */  addu       $at, $at, $a3
    /* D800 801473F8 9A2C2280 */  lb         $v0, %lo(missile + 0x42)($at)
    /* D804 801473FC 00000000 */  nop
    /* D808 80147400 17006214 */  bne        $v1, $v0, .L80147460
    /* D80C 80147404 00000000 */   nop
    /* D810 80147408 1080033C */  lui        $v1, %hi(missile)
    /* D814 8014740C 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* D818 80147410 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D81C 80147414 21082700 */  addu       $at, $at, $a3
    /* D820 80147418 892C2290 */  lbu        $v0, %lo(missile + 0x31)($at)
    /* D824 8014741C 2118E300 */  addu       $v1, $a3, $v1
    /* D828 80147420 01004224 */  addiu      $v0, $v0, 0x1
    /* D82C 80147424 310062A0 */  sb         $v0, 0x31($v1)
    /* D830 80147428 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D834 8014742C 21082700 */  addu       $at, $at, $a3
    /* D838 80147430 8A2C2290 */  lbu        $v0, %lo(missile + 0x32)($at)
    /* D83C 80147434 00000000 */  nop
    /* D840 80147438 01004224 */  addiu      $v0, $v0, 0x1
    /* D844 8014743C 320062A0 */  sb         $v0, 0x32($v1)
    /* D848 80147440 1080013C */  lui        $at, %hi(missile + 0x34)
    /* D84C 80147444 21082700 */  addu       $at, $at, $a3
    /* D850 80147448 8C2C2290 */  lbu        $v0, %lo(missile + 0x34)($at)
    /* D854 8014744C 00000000 */  nop
    /* D858 80147450 E0FF4224 */  addiu      $v0, $v0, -0x20
    /* D85C 80147454 1080013C */  lui        $at, %hi(missile + 0x34)
    /* D860 80147458 21082700 */  addu       $at, $at, $a3
    /* D864 8014745C 8C2C22A0 */  sb         $v0, %lo(missile + 0x34)($at)
  .L80147460:
    /* D868 80147460 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D86C 80147464 21082700 */  addu       $at, $at, $a3
    /* D870 80147468 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* D874 8014746C 00000000 */  nop
    /* D878 80147470 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* D87C 80147474 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D880 80147478 21082700 */  addu       $at, $at, $a3
    /* D884 8014747C 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* D888 80147480 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D88C 80147484 21082700 */  addu       $at, $at, $a3
    /* D890 80147488 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* D894 8014748C 00000000 */  nop
    /* D898 80147490 31004014 */  bnez       $v0, .L80147558
    /* D89C 80147494 01000224 */   addiu     $v0, $zero, 0x1
    /* D8A0 80147498 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* D8A4 8014749C 21082700 */  addu       $at, $at, $a3
    /* D8A8 801474A0 862C2384 */  lh         $v1, %lo(missile + 0x2E)($at)
    /* D8AC 801474A4 1080013C */  lui        $at, %hi(missile + 0x38)
    /* D8B0 801474A8 21082700 */  addu       $at, $at, $a3
    /* D8B4 801474AC 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* D8B8 801474B0 40100300 */  sll        $v0, $v1, 1
    /* D8BC 801474B4 21104300 */  addu       $v0, $v0, $v1
    /* D8C0 801474B8 80100200 */  sll        $v0, $v0, 2
    /* D8C4 801474BC 21104300 */  addu       $v0, $v0, $v1
    /* D8C8 801474C0 C0100200 */  sll        $v0, $v0, 3
    /* D8CC 801474C4 1080013C */  lui        $at, %hi(monster + 0x64)
    /* D8D0 801474C8 21082200 */  addu       $at, $at, $v0
    /* D8D4 801474CC F853228C */  lw         $v0, %lo(monster + 0x64)($at)
    /* D8D8 801474D0 00000000 */  nop
    /* D8DC 801474D4 1A004280 */  lb         $v0, 0x1A($v0)
    /* D8E0 801474D8 00000000 */  nop
    /* D8E4 801474DC 02004228 */  slti       $v0, $v0, 0x2
    /* D8E8 801474E0 02004010 */  beqz       $v0, .L801474EC
    /* D8EC 801474E4 02000824 */   addiu     $t0, $zero, 0x2
    /* D8F0 801474E8 01000824 */  addiu      $t0, $zero, 0x1
  .L801474EC:
    /* D8F4 801474EC 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D8F8 801474F0 21082700 */  addu       $at, $at, $a3
    /* D8FC 801474F4 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* D900 801474F8 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D904 801474FC 21082700 */  addu       $at, $at, $a3
    /* D908 80147500 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* D90C 80147504 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* D910 80147508 21082700 */  addu       $at, $at, $a3
    /* D914 8014750C 972C2380 */  lb         $v1, %lo(missile + 0x3F)($at)
    /* D918 80147510 3B000224 */  addiu      $v0, $zero, 0x3B
    /* D91C 80147514 1400A2AF */  sw         $v0, 0x14($sp)
    /* D920 80147518 01000224 */  addiu      $v0, $zero, 0x1
    /* D924 8014751C 1800A2AF */  sw         $v0, 0x18($sp)
    /* D928 80147520 1000A3AF */  sw         $v1, 0x10($sp)
    /* D92C 80147524 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* D930 80147528 21082700 */  addu       $at, $at, $a3
    /* D934 8014752C 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* D938 80147530 2000A8AF */  sw         $t0, 0x20($sp)
    /* D93C 80147534 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* D940 80147538 1080013C */  lui        $at, %hi(missile + 0x40)
    /* D944 8014753C 21082700 */  addu       $at, $at, $a3
    /* D948 80147540 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* D94C 80147544 21380000 */  addu       $a3, $zero, $zero
    /* D950 80147548 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* D954 8014754C 2400A2AF */   sw        $v0, 0x24($sp)
    /* D958 80147550 581D0508 */  j          .L80147560
    /* D95C 80147554 00000000 */   nop
  .L80147558:
    /* D960 80147558 D1EA040C */  jal        PutMissile__Fi
    /* D964 8014755C 2120C000 */   addu      $a0, $a2, $zero
  .L80147560:
    /* D968 80147560 2800BF8F */  lw         $ra, 0x28($sp)
    /* D96C 80147564 3000BD27 */  addiu      $sp, $sp, 0x30
    /* D970 80147568 0800E003 */  jr         $ra
    /* D974 8014756C 00000000 */   nop
endlabel MI_Acidsplat__Fi
