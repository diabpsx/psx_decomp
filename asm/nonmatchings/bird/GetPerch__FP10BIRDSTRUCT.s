.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPerch__FP10BIRDSTRUCT, 0x54

glabel GetPerch__FP10BIRDSTRUCT
    /* 9BB24 800ABB24 0000828C */  lw         $v0, 0x0($a0)
    /* 9BB28 800ABB28 00000000 */  nop
    /* 9BB2C 800ABB2C 02004010 */  beqz       $v0, .L800ABB38
    /* 9BB30 800ABB30 21180000 */   addu      $v1, $zero, $zero
    /* 9BB34 800ABB34 21204000 */  addu       $a0, $v0, $zero
  .L800ABB38:
    /* 9BB38 800ABB38 0D80053C */  lui        $a1, %hi(BirdList)
    /* 9BB3C 800ABB3C 74D3A524 */  addiu      $a1, $a1, %lo(BirdList)
  .L800ABB40:
    /* 9BB40 800ABB40 0600A414 */  bne        $a1, $a0, .L800ABB5C
    /* 9BB44 800ABB44 00000000 */   nop
    /* 9BB48 800ABB48 02006104 */  bgez       $v1, .L800ABB54
    /* 9BB4C 800ABB4C 21106000 */   addu      $v0, $v1, $zero
    /* 9BB50 800ABB50 03006224 */  addiu      $v0, $v1, 0x3
  .L800ABB54:
    /* 9BB54 800ABB54 DCAE0208 */  j          .L800ABB70
    /* 9BB58 800ABB58 83100200 */   sra       $v0, $v0, 2
  .L800ABB5C:
    /* 9BB5C 800ABB5C 04006324 */  addiu      $v1, $v1, 0x4
    /* 9BB60 800ABB60 10006228 */  slti       $v0, $v1, 0x10
    /* 9BB64 800ABB64 F6FF4014 */  bnez       $v0, .L800ABB40
    /* 9BB68 800ABB68 6000A524 */   addiu     $a1, $a1, 0x60
    /* 9BB6C 800ABB6C 21100000 */  addu       $v0, $zero, $zero
  .L800ABB70:
    /* 9BB70 800ABB70 0800E003 */  jr         $ra
    /* 9BB74 800ABB74 00000000 */   nop
endlabel GetPerch__FP10BIRDSTRUCT
