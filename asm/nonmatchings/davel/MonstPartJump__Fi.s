.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MonstPartJump__Fi, 0x120

glabel MonstPartJump__Fi
    /* 8F594 8009F594 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8F598 8009F598 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 8F59C 8009F59C 21988000 */  addu       $s3, $a0, $zero
    /* 8F5A0 8009F5A0 3000BFAF */  sw         $ra, 0x30($sp)
    /* 8F5A4 8009F5A4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 8F5A8 8009F5A8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 8F5AC 8009F5AC 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 8F5B0 8009F5B0 2000B0AF */   sw        $s0, 0x20($sp)
    /* 8F5B4 8009F5B4 21904000 */  addu       $s2, $v0, $zero
    /* 8F5B8 8009F5B8 21204002 */  addu       $a0, $s2, $zero
    /* 8F5BC 8009F5BC 1800A527 */  addiu      $a1, $sp, 0x18
    /* 8F5C0 8009F5C0 A138020C */  jal        GetXY__7CBlocksPiT1
    /* 8F5C4 8009F5C4 1C00A627 */   addiu     $a2, $sp, 0x1C
    /* 8F5C8 8009F5C8 6210053C */  lui        $a1, (0x10624DD3 >> 16)
    /* 8F5CC 8009F5CC 40181300 */  sll        $v1, $s3, 1
    /* 8F5D0 8009F5D0 21187300 */  addu       $v1, $v1, $s3
    /* 8F5D4 8009F5D4 80180300 */  sll        $v1, $v1, 2
    /* 8F5D8 8009F5D8 21187300 */  addu       $v1, $v1, $s3
    /* 8F5DC 8009F5DC C0180300 */  sll        $v1, $v1, 3
    /* 8F5E0 8009F5E0 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 8F5E4 8009F5E4 21082300 */  addu       $at, $at, $v1
    /* 8F5E8 8009F5E8 CF532480 */  lb         $a0, %lo(monster + 0x3B)($at)
    /* 8F5EC 8009F5EC D34DA534 */  ori        $a1, $a1, (0x10624DD3 & 0xFFFF)
    /* 8F5F0 8009F5F0 80100400 */  sll        $v0, $a0, 2
    /* 8F5F4 8009F5F4 21104400 */  addu       $v0, $v0, $a0
    /* 8F5F8 8009F5F8 C0100200 */  sll        $v0, $v0, 3
    /* 8F5FC 8009F5FC 23104400 */  subu       $v0, $v0, $a0
    /* 8F600 8009F600 00110200 */  sll        $v0, $v0, 4
    /* 8F604 8009F604 21104400 */  addu       $v0, $v0, $a0
    /* 8F608 8009F608 18004500 */  mult       $v0, $a1
    /* 8F60C 8009F60C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 8F610 8009F610 21082300 */  addu       $at, $at, $v1
    /* 8F614 8009F614 C8532680 */  lb         $a2, %lo(monster + 0x34)($at)
    /* 8F618 8009F618 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 8F61C 8009F61C 21082300 */  addu       $at, $at, $v1
    /* 8F620 8009F620 C9532380 */  lb         $v1, %lo(monster + 0x35)($at)
    /* 8F624 8009F624 21204002 */  addu       $a0, $s2, $zero
    /* 8F628 8009F628 80280600 */  sll        $a1, $a2, 2
    /* 8F62C 8009F62C 2128A600 */  addu       $a1, $a1, $a2
    /* 8F630 8009F630 80280500 */  sll        $a1, $a1, 2
    /* 8F634 8009F634 80300300 */  sll        $a2, $v1, 2
    /* 8F638 8009F638 2130C300 */  addu       $a2, $a2, $v1
    /* 8F63C 8009F63C 80300600 */  sll        $a2, $a2, 2
    /* 8F640 8009F640 C3170200 */  sra        $v0, $v0, 31
    /* 8F644 8009F644 10400000 */  mfhi       $t0
    /* 8F648 8009F648 83890800 */  sra        $s1, $t0, 6
    /* 8F64C 8009F64C 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 8F650 8009F650 23882202 */   subu      $s1, $s1, $v0
    /* 8F654 8009F654 21204002 */  addu       $a0, $s2, $zero
    /* 8F658 8009F658 1A00A587 */  lh         $a1, 0x1A($sp)
    /* 8F65C 8009F65C 1E00A687 */  lh         $a2, 0x1E($sp)
    /* 8F660 8009F660 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 8F664 8009F664 21804000 */   addu      $s0, $v0, $zero
    /* 8F668 8009F668 21204002 */  addu       $a0, $s2, $zero
    /* 8F66C 8009F66C 21801102 */  addu       $s0, $s0, $s1
    /* 8F670 8009F670 6182020C */  jal        GetOtPos__7CBlocksi_800a0984
    /* 8F674 8009F674 23280202 */   subu      $a1, $s0, $v0
    /* 8F678 8009F678 21206002 */  addu       $a0, $s3, $zero
    /* 8F67C 8009F67C 21280000 */  addu       $a1, $zero, $zero
    /* 8F680 8009F680 00800634 */  ori        $a2, $zero, 0x8000
    /* 8F684 8009F684 6000073C */  lui        $a3, (0x606060 >> 16)
    /* 8F688 8009F688 6060E734 */  ori        $a3, $a3, (0x606060 & 0xFFFF)
    /* 8F68C 8009F68C 107D020C */  jal        StartPartJump__Fiiiii
    /* 8F690 8009F690 1000A2AF */   sw        $v0, 0x10($sp)
    /* 8F694 8009F694 3000BF8F */  lw         $ra, 0x30($sp)
    /* 8F698 8009F698 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 8F69C 8009F69C 2800B28F */  lw         $s2, 0x28($sp)
    /* 8F6A0 8009F6A0 2400B18F */  lw         $s1, 0x24($sp)
    /* 8F6A4 8009F6A4 2000B08F */  lw         $s0, 0x20($sp)
    /* 8F6A8 8009F6A8 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 8F6AC 8009F6AC 0800E003 */  jr         $ra
    /* 8F6B0 8009F6B0 00000000 */   nop
endlabel MonstPartJump__Fi
