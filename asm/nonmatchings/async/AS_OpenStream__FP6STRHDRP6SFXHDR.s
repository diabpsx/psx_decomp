.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AS_OpenStream__FP6STRHDRP6SFXHDR, 0xA0

glabel AS_OpenStream__FP6STRHDRP6SFXHDR
    /* 8AB54 8009AB54 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8AB58 8009AB58 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8AB5C 8009AB5C 21808000 */  addu       $s0, $a0, $zero
    /* 8AB60 8009AB60 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8AB64 8009AB64 2188A000 */  addu       $s1, $a1, $zero
    /* 8AB68 8009AB68 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8AB6C 8009AB6C 1000028E */  lw         $v0, 0x10($s0)
    /* 8AB70 8009AB70 0B80043C */  lui        $a0, %hi(STREAM_BIN)
    /* 8AB74 8009AB74 B4798424 */  addiu      $a0, $a0, %lo(STREAM_BIN)
    /* 8AB78 8009AB78 698F000C */  jal        setasyncfile
    /* 8AB7C 8009AB7C 640022AE */   sw        $v0, 0x64($s1)
    /* 8AB80 8009AB80 53BE000C */  jal        systemtask
    /* 8AB84 8009AB84 21200000 */   addu      $a0, $zero, $zero
    /* 8AB88 8009AB88 1000228E */  lw         $v0, 0x10($s1)
    /* 8AB8C 8009AB8C 00000000 */  nop
    /* 8AB90 8009AB90 07004014 */  bnez       $v0, .L8009ABB0
    /* 8AB94 8009AB94 00300624 */   addiu     $a2, $zero, 0x3000
    /* 8AB98 8009AB98 0C00048E */  lw         $a0, 0xC($s0)
    /* 8AB9C 8009AB9C 6800258E */  lw         $a1, 0x68($s1)
    /* 8ABA0 8009ABA0 0A80073C */  lui        $a3, %hi(AS_CallBack0__Fi)
    /* 8ABA4 8009ABA4 B4A9E724 */  addiu      $a3, $a3, %lo(AS_CallBack0__Fi)
    /* 8ABA8 8009ABA8 F06A0208 */  j          .L8009ABC0
    /* 8ABAC 8009ABAC 00000000 */   nop
  .L8009ABB0:
    /* 8ABB0 8009ABB0 0C00048E */  lw         $a0, 0xC($s0)
    /* 8ABB4 8009ABB4 6800258E */  lw         $a1, 0x68($s1)
    /* 8ABB8 8009ABB8 0A80073C */  lui        $a3, %hi(AS_CallBack1__Fi)
    /* 8ABBC 8009ABBC 20AAE724 */  addiu      $a3, $a3, %lo(AS_CallBack1__Fi)
  .L8009ABC0:
    /* 8ABC0 8009ABC0 E28F000C */  jal        asyncloadsegmentcallback
    /* 8ABC4 8009ABC4 00000000 */   nop
    /* 8ABC8 8009ABC8 21804000 */  addu       $s0, $v0, $zero
    /* 8ABCC 8009ABCC 53BE000C */  jal        systemtask
    /* 8ABD0 8009ABD0 21200000 */   addu      $a0, $zero, $zero
    /* 8ABD4 8009ABD4 540030AE */  sw         $s0, 0x54($s1)
    /* 8ABD8 8009ABD8 21100002 */  addu       $v0, $s0, $zero
    /* 8ABDC 8009ABDC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8ABE0 8009ABE0 1400B18F */  lw         $s1, 0x14($sp)
    /* 8ABE4 8009ABE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 8ABE8 8009ABE8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8ABEC 8009ABEC 0800E003 */  jr         $ra
    /* 8ABF0 8009ABF0 00000000 */   nop
endlabel AS_OpenStream__FP6STRHDRP6SFXHDR
