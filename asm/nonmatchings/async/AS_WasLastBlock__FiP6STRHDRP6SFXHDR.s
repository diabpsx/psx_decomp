.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AS_WasLastBlock__FiP6STRHDRP6SFXHDR, 0xC8

glabel AS_WasLastBlock__FiP6STRHDRP6SFXHDR
    /* 8AA8C 8009AA8C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8AA90 8009AA90 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8AA94 8009AA94 2188C000 */  addu       $s1, $a2, $zero
    /* 8AA98 8009AA98 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 8AA9C 8009AA9C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8AAA0 8009AAA0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8AAA4 8009AAA4 6400228E */  lw         $v0, 0x64($s1)
    /* 8AAA8 8009AAA8 2190A000 */  addu       $s2, $a1, $zero
    /* 8AAAC 8009AAAC 80D04224 */  addiu      $v0, $v0, -0x2F80
    /* 8AAB0 8009AAB0 21004018 */  blez       $v0, .L8009AB38
    /* 8AAB4 8009AAB4 640022AE */   sw        $v0, 0x64($s1)
    /* 8AAB8 8009AAB8 0B80043C */  lui        $a0, %hi(STREAM_BIN)
    /* 8AABC 8009AABC B4798424 */  addiu      $a0, $a0, %lo(STREAM_BIN)
    /* 8AAC0 8009AAC0 2000228E */  lw         $v0, 0x20($s1)
    /* 8AAC4 8009AAC4 6800308E */  lw         $s0, 0x68($s1)
    /* 8AAC8 8009AAC8 40180200 */  sll        $v1, $v0, 1
    /* 8AACC 8009AACC 21186200 */  addu       $v1, $v1, $v0
    /* 8AAD0 8009AAD0 001B0300 */  sll        $v1, $v1, 12
    /* 8AAD4 8009AAD4 698F000C */  jal        setasyncfile
    /* 8AAD8 8009AAD8 21800302 */   addu      $s0, $s0, $v1
    /* 8AADC 8009AADC 53BE000C */  jal        systemtask
    /* 8AAE0 8009AAE0 21200000 */   addu      $a0, $zero, $zero
    /* 8AAE4 8009AAE4 1000228E */  lw         $v0, 0x10($s1)
    /* 8AAE8 8009AAE8 00000000 */  nop
    /* 8AAEC 8009AAEC 07004014 */  bnez       $v0, .L8009AB0C
    /* 8AAF0 8009AAF0 21280002 */   addu      $a1, $s0, $zero
    /* 8AAF4 8009AAF4 0C00428E */  lw         $v0, 0xC($s2)
    /* 8AAF8 8009AAF8 2800248E */  lw         $a0, 0x28($s1)
    /* 8AAFC 8009AAFC 0A80073C */  lui        $a3, %hi(AS_CallBack0__Fi)
    /* 8AB00 8009AB00 B4A9E724 */  addiu      $a3, $a3, %lo(AS_CallBack0__Fi)
    /* 8AB04 8009AB04 C86A0208 */  j          .L8009AB20
    /* 8AB08 8009AB08 00300624 */   addiu     $a2, $zero, 0x3000
  .L8009AB0C:
    /* 8AB0C 8009AB0C 00300624 */  addiu      $a2, $zero, 0x3000
    /* 8AB10 8009AB10 0C00428E */  lw         $v0, 0xC($s2)
    /* 8AB14 8009AB14 2800248E */  lw         $a0, 0x28($s1)
    /* 8AB18 8009AB18 0A80073C */  lui        $a3, %hi(AS_CallBack1__Fi)
    /* 8AB1C 8009AB1C 20AAE724 */  addiu      $a3, $a3, %lo(AS_CallBack1__Fi)
  .L8009AB20:
    /* 8AB20 8009AB20 E28F000C */  jal        asyncloadsegmentcallback
    /* 8AB24 8009AB24 21204400 */   addu      $a0, $v0, $a0
    /* 8AB28 8009AB28 21804000 */  addu       $s0, $v0, $zero
    /* 8AB2C 8009AB2C 53BE000C */  jal        systemtask
    /* 8AB30 8009AB30 21200000 */   addu      $a0, $zero, $zero
    /* 8AB34 8009AB34 540030AE */  sw         $s0, 0x54($s1)
  .L8009AB38:
    /* 8AB38 8009AB38 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 8AB3C 8009AB3C 1800B28F */  lw         $s2, 0x18($sp)
    /* 8AB40 8009AB40 1400B18F */  lw         $s1, 0x14($sp)
    /* 8AB44 8009AB44 1000B08F */  lw         $s0, 0x10($sp)
    /* 8AB48 8009AB48 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8AB4C 8009AB4C 0800E003 */  jr         $ra
    /* 8AB50 8009AB50 00000000 */   nop
endlabel AS_WasLastBlock__FiP6STRHDRP6SFXHDR
