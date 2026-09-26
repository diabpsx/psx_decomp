.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeSelUp__Fi, 0xE8

glabel FeSelUp__Fi
    /* A74 8013A66C 140C858F */  lw         $a1, %gp_rel(FeCurMenu)($gp)
    /* A78 8013A670 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A7C 8013A674 1000BFAF */  sw         $ra, 0x10($sp)
    /* A80 8013A678 0400A68C */  lw         $a2, 0x4($a1)
    /* A84 8013A67C 00000000 */  nop
    /* A88 8013A680 2318C400 */  subu       $v1, $a2, $a0
    /* A8C 8013A684 05006104 */  bgez       $v1, .L8013A69C
    /* A90 8013A688 0400A3AC */   sw        $v1, 0x4($a1)
    /* A94 8013A68C FC0B828F */  lw         $v0, %gp_rel(FeBufferCount)($gp)
    /* A98 8013A690 00000000 */  nop
    /* A9C 8013A694 21106200 */  addu       $v0, $v1, $v0
    /* AA0 8013A698 0400A2AC */  sw         $v0, 0x4($a1)
  .L8013A69C:
    /* AA4 8013A69C 140C848F */  lw         $a0, %gp_rel(FeCurMenu)($gp)
    /* AA8 8013A6A0 00000000 */  nop
    /* AAC 8013A6A4 0400828C */  lw         $v0, 0x4($a0)
    /* AB0 8013A6A8 00000000 */  nop
    /* AB4 8013A6AC 40180200 */  sll        $v1, $v0, 1
    /* AB8 8013A6B0 21186200 */  addu       $v1, $v1, $v0
    /* ABC 8013A6B4 C0180300 */  sll        $v1, $v1, 3
    /* AC0 8013A6B8 0D80013C */  lui        $at, %hi(FeBuffer + 0x14)
    /* AC4 8013A6BC 21082300 */  addu       $at, $at, $v1
    /* AC8 8013A6C0 8CDB228C */  lw         $v0, %lo(FeBuffer + 0x14)($at)
    /* ACC 8013A6C4 00000000 */  nop
    /* AD0 8013A6C8 16004014 */  bnez       $v0, .L8013A724
    /* AD4 8013A6CC 00000000 */   nop
    /* AD8 8013A6D0 FC0B858F */  lw         $a1, %gp_rel(FeBufferCount)($gp)
  .L8013A6D4:
    /* ADC 8013A6D4 0400828C */  lw         $v0, 0x4($a0)
    /* AE0 8013A6D8 00000000 */  nop
    /* AE4 8013A6DC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* AE8 8013A6E0 03004104 */  bgez       $v0, .L8013A6F0
    /* AEC 8013A6E4 040082AC */   sw        $v0, 0x4($a0)
    /* AF0 8013A6E8 21104500 */  addu       $v0, $v0, $a1
    /* AF4 8013A6EC 040082AC */  sw         $v0, 0x4($a0)
  .L8013A6F0:
    /* AF8 8013A6F0 140C848F */  lw         $a0, %gp_rel(FeCurMenu)($gp)
    /* AFC 8013A6F4 00000000 */  nop
    /* B00 8013A6F8 0400828C */  lw         $v0, 0x4($a0)
    /* B04 8013A6FC 00000000 */  nop
    /* B08 8013A700 40180200 */  sll        $v1, $v0, 1
    /* B0C 8013A704 21186200 */  addu       $v1, $v1, $v0
    /* B10 8013A708 C0180300 */  sll        $v1, $v1, 3
    /* B14 8013A70C 0D80013C */  lui        $at, %hi(FeBuffer + 0x14)
    /* B18 8013A710 21082300 */  addu       $at, $at, $v1
    /* B1C 8013A714 8CDB228C */  lw         $v0, %lo(FeBuffer + 0x14)($at)
    /* B20 8013A718 00000000 */  nop
    /* B24 8013A71C EDFF4010 */  beqz       $v0, .L8013A6D4
    /* B28 8013A720 00000000 */   nop
  .L8013A724:
    /* B2C 8013A724 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* B30 8013A728 00000000 */  nop
    /* B34 8013A72C 0400428C */  lw         $v0, 0x4($v0)
    /* B38 8013A730 00000000 */  nop
    /* B3C 8013A734 0300C210 */  beq        $a2, $v0, .L8013A744
    /* B40 8013A738 00000000 */   nop
    /* B44 8013A73C C6F5000C */  jal        PlaySFX__Fi
    /* B48 8013A740 32000424 */   addiu     $a0, $zero, 0x32
  .L8013A744:
    /* B4C 8013A744 1000BF8F */  lw         $ra, 0x10($sp)
    /* B50 8013A748 1800BD27 */  addiu      $sp, $sp, 0x18
    /* B54 8013A74C 0800E003 */  jr         $ra
    /* B58 8013A750 00000000 */   nop
endlabel FeSelUp__Fi
