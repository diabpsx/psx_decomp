.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching checkstreamblocksfree, 0x48

glabel checkstreamblocksfree
    /* 1F408 8002F408 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1F40C 8002F40C 00000000 */  nop
    /* 1F410 8002F410 03004014 */  bnez       $v0, .L8002F420
    /* 1F414 8002F414 00000000 */   nop
    /* 1F418 8002F418 12BD0008 */  j          .L8002F448
    /* 1F41C 8002F41C 21100000 */   addu      $v0, $zero, $zero
  .L8002F420:
    /* 1F420 8002F420 7400428C */  lw         $v0, 0x74($v0)
    /* 1F424 8002F424 07008010 */  beqz       $a0, .L8002F444
    /* 1F428 8002F428 00000000 */   nop
  .L8002F42C:
    /* 1F42C 8002F42C 05004010 */  beqz       $v0, .L8002F444
    /* 1F430 8002F430 00000000 */   nop
    /* 1F434 8002F434 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 1F438 8002F438 9800428C */  lw         $v0, 0x98($v0)
    /* 1F43C 8002F43C FBFF8014 */  bnez       $a0, .L8002F42C
    /* 1F440 8002F440 00000000 */   nop
  .L8002F444:
    /* 1F444 8002F444 0100822C */  sltiu      $v0, $a0, 0x1
  .L8002F448:
    /* 1F448 8002F448 0800E003 */  jr         $ra
    /* 1F44C 8002F44C 00000000 */   nop
endlabel checkstreamblocksfree
