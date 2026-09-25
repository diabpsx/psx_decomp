.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SPL_Arrow__F6TARGETiii, 0x80

glabel SPL_Arrow__F6TARGETiii
    /* A0260 800B0260 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* A0264 800B0264 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* A0268 800B0268 21988000 */  addu       $s3, $a0, $zero
    /* A026C 800B026C 1000B0AF */  sw         $s0, 0x10($sp)
    /* A0270 800B0270 2180A000 */  addu       $s0, $a1, $zero
    /* A0274 800B0274 1400B1AF */  sw         $s1, 0x14($sp)
    /* A0278 800B0278 2188C000 */  addu       $s1, $a2, $zero
    /* A027C 800B027C 1800B2AF */  sw         $s2, 0x18($sp)
    /* A0280 800B0280 2190E000 */  addu       $s2, $a3, $zero
    /* A0284 800B0284 00800434 */  ori        $a0, $zero, 0x8000
    /* A0288 800B0288 0B80053C */  lui        $a1, %hi(ArrowTask__FP4TASK)
    /* A028C 800B028C B0FEA524 */  addiu      $a1, $a1, %lo(ArrowTask__FP4TASK)
    /* A0290 800B0290 00040624 */  addiu      $a2, $zero, 0x400
    /* A0294 800B0294 2000BFAF */  sw         $ra, 0x20($sp)
    /* A0298 800B0298 0480000C */  jal        TSK_AddTask
    /* A029C 800B029C 10000724 */   addiu     $a3, $zero, 0x10
    /* A02A0 800B02A0 07004010 */  beqz       $v0, .L800B02C0
    /* A02A4 800B02A4 00000000 */   nop
    /* A02A8 800B02A8 1C00428C */  lw         $v0, 0x1C($v0)
    /* A02AC 800B02AC 00000000 */  nop
    /* A02B0 800B02B0 000050AC */  sw         $s0, 0x0($v0)
    /* A02B4 800B02B4 040051AC */  sw         $s1, 0x4($v0)
    /* A02B8 800B02B8 080052AC */  sw         $s2, 0x8($v0)
    /* A02BC 800B02BC 0C0053AC */  sw         $s3, 0xC($v0)
  .L800B02C0:
    /* A02C0 800B02C0 2000BF8F */  lw         $ra, 0x20($sp)
    /* A02C4 800B02C4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* A02C8 800B02C8 1800B28F */  lw         $s2, 0x18($sp)
    /* A02CC 800B02CC 1400B18F */  lw         $s1, 0x14($sp)
    /* A02D0 800B02D0 1000B08F */  lw         $s0, 0x10($sp)
    /* A02D4 800B02D4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* A02D8 800B02D8 0800E003 */  jr         $ra
    /* A02DC 800B02DC 00000000 */   nop
endlabel SPL_Arrow__F6TARGETiii
