.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeSelDown__Fi, 0xE8

glabel FeSelDown__Fi
    /* B5C 8013A754 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* B60 8013A758 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* B64 8013A75C 1000BFAF */  sw         $ra, 0x10($sp)
    /* B68 8013A760 0400668C */  lw         $a2, 0x4($v1)
    /* B6C 8013A764 FC0B828F */  lw         $v0, %gp_rel(FeBufferCount)($gp)
    /* B70 8013A768 2120C400 */  addu       $a0, $a2, $a0
    /* B74 8013A76C 040064AC */  sw         $a0, 0x4($v1)
    /* B78 8013A770 2A208200 */  slt        $a0, $a0, $v0
    /* B7C 8013A774 02008014 */  bnez       $a0, .L8013A780
    /* B80 8013A778 00000000 */   nop
    /* B84 8013A77C 040060AC */  sw         $zero, 0x4($v1)
  .L8013A780:
    /* B88 8013A780 140C848F */  lw         $a0, %gp_rel(FeCurMenu)($gp)
    /* B8C 8013A784 00000000 */  nop
    /* B90 8013A788 0400828C */  lw         $v0, 0x4($a0)
    /* B94 8013A78C 00000000 */  nop
    /* B98 8013A790 40180200 */  sll        $v1, $v0, 1
    /* B9C 8013A794 21186200 */  addu       $v1, $v1, $v0
    /* BA0 8013A798 C0180300 */  sll        $v1, $v1, 3
    /* BA4 8013A79C 0D80013C */  lui        $at, %hi(FeBuffer + 0x14)
    /* BA8 8013A7A0 21082300 */  addu       $at, $at, $v1
    /* BAC 8013A7A4 8CDB228C */  lw         $v0, %lo(FeBuffer + 0x14)($at)
    /* BB0 8013A7A8 00000000 */  nop
    /* BB4 8013A7AC 17004014 */  bnez       $v0, .L8013A80C
    /* BB8 8013A7B0 00000000 */   nop
    /* BBC 8013A7B4 FC0B858F */  lw         $a1, %gp_rel(FeBufferCount)($gp)
  .L8013A7B8:
    /* BC0 8013A7B8 0400828C */  lw         $v0, 0x4($a0)
    /* BC4 8013A7BC 00000000 */  nop
    /* BC8 8013A7C0 01004324 */  addiu      $v1, $v0, 0x1
    /* BCC 8013A7C4 2A106500 */  slt        $v0, $v1, $a1
    /* BD0 8013A7C8 03004014 */  bnez       $v0, .L8013A7D8
    /* BD4 8013A7CC 040083AC */   sw        $v1, 0x4($a0)
    /* BD8 8013A7D0 23106500 */  subu       $v0, $v1, $a1
    /* BDC 8013A7D4 040082AC */  sw         $v0, 0x4($a0)
  .L8013A7D8:
    /* BE0 8013A7D8 140C848F */  lw         $a0, %gp_rel(FeCurMenu)($gp)
    /* BE4 8013A7DC 00000000 */  nop
    /* BE8 8013A7E0 0400828C */  lw         $v0, 0x4($a0)
    /* BEC 8013A7E4 00000000 */  nop
    /* BF0 8013A7E8 40180200 */  sll        $v1, $v0, 1
    /* BF4 8013A7EC 21186200 */  addu       $v1, $v1, $v0
    /* BF8 8013A7F0 C0180300 */  sll        $v1, $v1, 3
    /* BFC 8013A7F4 0D80013C */  lui        $at, %hi(FeBuffer + 0x14)
    /* C00 8013A7F8 21082300 */  addu       $at, $at, $v1
    /* C04 8013A7FC 8CDB228C */  lw         $v0, %lo(FeBuffer + 0x14)($at)
    /* C08 8013A800 00000000 */  nop
    /* C0C 8013A804 ECFF4010 */  beqz       $v0, .L8013A7B8
    /* C10 8013A808 00000000 */   nop
  .L8013A80C:
    /* C14 8013A80C 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* C18 8013A810 00000000 */  nop
    /* C1C 8013A814 0400428C */  lw         $v0, 0x4($v0)
    /* C20 8013A818 00000000 */  nop
    /* C24 8013A81C 0300C210 */  beq        $a2, $v0, .L8013A82C
    /* C28 8013A820 00000000 */   nop
    /* C2C 8013A824 C6F5000C */  jal        PlaySFX__Fi
    /* C30 8013A828 32000424 */   addiu     $a0, $zero, 0x32
  .L8013A82C:
    /* C34 8013A82C 1000BF8F */  lw         $ra, 0x10($sp)
    /* C38 8013A830 1800BD27 */  addiu      $sp, $sp, 0x18
    /* C3C 8013A834 0800E003 */  jr         $ra
    /* C40 8013A838 00000000 */   nop
endlabel FeSelDown__Fi
