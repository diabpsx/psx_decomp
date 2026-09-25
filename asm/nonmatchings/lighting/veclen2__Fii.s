.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching veclen2__Fii, 0x68

glabel veclen2__Fii
    /* 3BC68 8004BC68 21188000 */  addu       $v1, $a0, $zero
    /* 3BC6C 8004BC6C 02006104 */  bgez       $v1, .L8004BC78
    /* 3BC70 8004BC70 21106000 */   addu      $v0, $v1, $zero
    /* 3BC74 8004BC74 23100300 */  negu       $v0, $v1
  .L8004BC78:
    /* 3BC78 8004BC78 21184000 */  addu       $v1, $v0, $zero
    /* 3BC7C 8004BC7C 0200A104 */  bgez       $a1, .L8004BC88
    /* 3BC80 8004BC80 2110A000 */   addu      $v0, $a1, $zero
    /* 3BC84 8004BC84 23100500 */  negu       $v0, $a1
  .L8004BC88:
    /* 3BC88 8004BC88 21284000 */  addu       $a1, $v0, $zero
    /* 3BC8C 8004BC8C 2A106500 */  slt        $v0, $v1, $a1
    /* 3BC90 8004BC90 05004010 */  beqz       $v0, .L8004BCA8
    /* 3BC94 8004BC94 43200500 */   sra       $a0, $a1, 1
    /* 3BC98 8004BC98 26186500 */  xor        $v1, $v1, $a1
    /* 3BC9C 8004BC9C 2628A300 */  xor        $a1, $a1, $v1
    /* 3BCA0 8004BCA0 26186500 */  xor        $v1, $v1, $a1
    /* 3BCA4 8004BCA4 43200500 */  sra        $a0, $a1, 1
  .L8004BCA8:
    /* 3BCA8 8004BCA8 2120A400 */  addu       $a0, $a1, $a0
    /* 3BCAC 8004BCAC 43110300 */  sra        $v0, $v1, 5
    /* 3BCB0 8004BCB0 23106200 */  subu       $v0, $v1, $v0
    /* 3BCB4 8004BCB4 C3190300 */  sra        $v1, $v1, 7
    /* 3BCB8 8004BCB8 23104300 */  subu       $v0, $v0, $v1
    /* 3BCBC 8004BCBC 83180400 */  sra        $v1, $a0, 2
    /* 3BCC0 8004BCC0 21104300 */  addu       $v0, $v0, $v1
    /* 3BCC4 8004BCC4 83210400 */  sra        $a0, $a0, 6
    /* 3BCC8 8004BCC8 0800E003 */  jr         $ra
    /* 3BCCC 8004BCCC 21104400 */   addu      $v0, $v0, $a0
endlabel veclen2__Fii
