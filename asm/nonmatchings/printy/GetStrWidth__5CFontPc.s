.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetStrWidth__5CFontPc, 0x7C

glabel GetStrWidth__5CFontPc
    /* 7AAA4 8008AAA4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 7AAA8 8008AAA8 2800B2AF */  sw         $s2, 0x28($sp)
    /* 7AAAC 8008AAAC 21908000 */  addu       $s2, $a0, $zero
    /* 7AAB0 8008AAB0 2000B0AF */  sw         $s0, 0x20($sp)
    /* 7AAB4 8008AAB4 2180A000 */  addu       $s0, $a1, $zero
    /* 7AAB8 8008AAB8 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 7AABC 8008AABC D2EC010C */  jal        LANG_GetLang__Fv
    /* 7AAC0 8008AAC0 2400B1AF */   sw        $s1, 0x24($sp)
    /* 7AAC4 8008AAC4 BC2A0208 */  j          .L8008AAF0
    /* 7AAC8 8008AAC8 21880000 */   addu      $s1, $zero, $zero
  .L8008AACC:
    /* 7AACC 8008AACC 04004010 */  beqz       $v0, .L8008AAE0
    /* 7AAD0 8008AAD0 00000000 */   nop
    /* 7AAD4 8008AAD4 01001026 */  addiu      $s0, $s0, 0x1
    /* 7AAD8 8008AAD8 BB2A0208 */  j          .L8008AAEC
    /* 7AADC 8008AADC 0C003126 */   addiu     $s1, $s1, 0xC
  .L8008AAE0:
    /* 7AAE0 8008AAE0 EB2A020C */  jal        GetCharWidth__5CFontUc
    /* 7AAE4 8008AAE4 21204002 */   addu      $a0, $s2, $zero
    /* 7AAE8 8008AAE8 21882202 */  addu       $s1, $s1, $v0
  .L8008AAEC:
    /* 7AAEC 8008AAEC 01001026 */  addiu      $s0, $s0, 0x1
  .L8008AAF0:
    /* 7AAF0 8008AAF0 00000282 */  lb         $v0, 0x0($s0)
    /* 7AAF4 8008AAF4 00000592 */  lbu        $a1, 0x0($s0)
    /* 7AAF8 8008AAF8 F4FF4014 */  bnez       $v0, .L8008AACC
    /* 7AAFC 8008AAFC 8000A230 */   andi      $v0, $a1, 0x80
    /* 7AB00 8008AB00 21102002 */  addu       $v0, $s1, $zero
    /* 7AB04 8008AB04 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 7AB08 8008AB08 2800B28F */  lw         $s2, 0x28($sp)
    /* 7AB0C 8008AB0C 2400B18F */  lw         $s1, 0x24($sp)
    /* 7AB10 8008AB10 2000B08F */  lw         $s0, 0x20($sp)
    /* 7AB14 8008AB14 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 7AB18 8008AB18 0800E003 */  jr         $ra
    /* 7AB1C 8008AB1C 00000000 */   nop
endlabel GetStrWidth__5CFontPc
