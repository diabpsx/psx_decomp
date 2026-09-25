.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_MemBase, 0x54

glabel GAL_MemBase
    /* 12334 80022334 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12338 80022338 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1233C 8002233C 21800000 */  addu       $s0, $zero, $zero
    /* 12340 80022340 FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 12344 80022344 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 12348 80022348 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1234C 8002234C 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 12350 80022350 24208200 */   and       $a0, $a0, $v0
    /* 12354 80022354 04004010 */  beqz       $v0, .L80022368
    /* 12358 80022358 00000000 */   nop
    /* 1235C 8002235C 0000508C */  lw         $s0, 0x0($v0)
    /* 12360 80022360 DD880008 */  j          .L80022374
    /* 12364 80022364 21100002 */   addu      $v0, $s0, $zero
  .L80022368:
    /* 12368 80022368 0389000C */  jal        GSetError
    /* 1236C 8002236C 04000434 */   ori       $a0, $zero, 0x4
    /* 12370 80022370 21100002 */  addu       $v0, $s0, $zero
  .L80022374:
    /* 12374 80022374 1400BF8F */  lw         $ra, 0x14($sp)
    /* 12378 80022378 1000B08F */  lw         $s0, 0x10($sp)
    /* 1237C 8002237C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12380 80022380 0800E003 */  jr         $ra
    /* 12384 80022384 00000000 */   nop
endlabel GAL_MemBase
