.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDirection__Fiiii, 0xA4

glabel GetDirection__Fiiii
    /* 2DA28 8003DA28 2330C400 */  subu       $a2, $a2, $a0
    /* 2DA2C 8003DA2C 1000C004 */  bltz       $a2, .L8003DA70
    /* 2DA30 8003DA30 2338E500 */   subu      $a3, $a3, $a1
    /* 2DA34 8003DA34 0300E004 */  bltz       $a3, .L8003DA44
    /* 2DA38 8003DA38 40100600 */   sll       $v0, $a2, 1
    /* 2DA3C 8003DA3C 96F60008 */  j          .L8003DA58
    /* 2DA40 8003DA40 2A184700 */   slt       $v1, $v0, $a3
  .L8003DA44:
    /* 2DA44 8003DA44 23380700 */  negu       $a3, $a3
    /* 2DA48 8003DA48 2A104700 */  slt        $v0, $v0, $a3
    /* 2DA4C 8003DA4C 02004010 */  beqz       $v0, .L8003DA58
    /* 2DA50 8003DA50 06000324 */   addiu     $v1, $zero, 0x6
    /* 2DA54 8003DA54 05000324 */  addiu      $v1, $zero, 0x5
  .L8003DA58:
    /* 2DA58 8003DA58 40100700 */  sll        $v0, $a3, 1
    /* 2DA5C 8003DA5C 2A104600 */  slt        $v0, $v0, $a2
    /* 2DA60 8003DA60 18004010 */  beqz       $v0, .L8003DAC4
    /* 2DA64 8003DA64 00000000 */   nop
    /* 2DA68 8003DA68 B1F60008 */  j          .L8003DAC4
    /* 2DA6C 8003DA6C 07000324 */   addiu     $v1, $zero, 0x7
  .L8003DA70:
    /* 2DA70 8003DA70 0800E004 */  bltz       $a3, .L8003DA94
    /* 2DA74 8003DA74 00000000 */   nop
    /* 2DA78 8003DA78 23300600 */  negu       $a2, $a2
    /* 2DA7C 8003DA7C 40100600 */  sll        $v0, $a2, 1
    /* 2DA80 8003DA80 2A104700 */  slt        $v0, $v0, $a3
    /* 2DA84 8003DA84 0A004010 */  beqz       $v0, .L8003DAB0
    /* 2DA88 8003DA88 02000324 */   addiu     $v1, $zero, 0x2
    /* 2DA8C 8003DA8C ACF60008 */  j          .L8003DAB0
    /* 2DA90 8003DA90 01000324 */   addiu     $v1, $zero, 0x1
  .L8003DA94:
    /* 2DA94 8003DA94 23300600 */  negu       $a2, $a2
    /* 2DA98 8003DA98 23380700 */  negu       $a3, $a3
    /* 2DA9C 8003DA9C 40100600 */  sll        $v0, $a2, 1
    /* 2DAA0 8003DAA0 2A104700 */  slt        $v0, $v0, $a3
    /* 2DAA4 8003DAA4 02004010 */  beqz       $v0, .L8003DAB0
    /* 2DAA8 8003DAA8 04000324 */   addiu     $v1, $zero, 0x4
    /* 2DAAC 8003DAAC 05000324 */  addiu      $v1, $zero, 0x5
  .L8003DAB0:
    /* 2DAB0 8003DAB0 40100700 */  sll        $v0, $a3, 1
    /* 2DAB4 8003DAB4 2A104600 */  slt        $v0, $v0, $a2
    /* 2DAB8 8003DAB8 02004010 */  beqz       $v0, .L8003DAC4
    /* 2DABC 8003DABC 00000000 */   nop
    /* 2DAC0 8003DAC0 03000324 */  addiu      $v1, $zero, 0x3
  .L8003DAC4:
    /* 2DAC4 8003DAC4 0800E003 */  jr         $ra
    /* 2DAC8 8003DAC8 21106000 */   addu      $v0, $v1, $zero
endlabel GetDirection__Fiiii
