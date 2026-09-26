.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFlash2__Fiiiiiicii, 0x1F0

glabel AddFlash2__Fiiiiiicii
    /* 5A54 8013F64C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 5A58 8013F650 4000A283 */  lb         $v0, 0x40($sp)
    /* 5A5C 8013F654 4400A38F */  lw         $v1, 0x44($sp)
    /* 5A60 8013F658 1400B1AF */  sw         $s1, 0x14($sp)
    /* 5A64 8013F65C 21888000 */  addu       $s1, $a0, $zero
    /* 5A68 8013F660 2000BFAF */  sw         $ra, 0x20($sp)
    /* 5A6C 8013F664 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 5A70 8013F668 1800B2AF */  sw         $s2, 0x18($sp)
    /* 5A74 8013F66C 5A004014 */  bnez       $v0, .L8013F7D8
    /* 5A78 8013F670 1000B0AF */   sw        $s0, 0x10($sp)
    /* 5A7C 8013F674 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5A80 8013F678 4D006210 */  beq        $v1, $v0, .L8013F7B0
    /* 5A84 8013F67C 80101100 */   sll       $v0, $s1, 2
    /* 5A88 8013F680 21105100 */  addu       $v0, $v0, $s1
    /* 5A8C 8013F684 80100200 */  sll        $v0, $v0, 2
    /* 5A90 8013F688 23105100 */  subu       $v0, $v0, $s1
    /* 5A94 8013F68C 80200200 */  sll        $a0, $v0, 2
    /* 5A98 8013F690 40100300 */  sll        $v0, $v1, 1
    /* 5A9C 8013F694 21104300 */  addu       $v0, $v0, $v1
    /* 5AA0 8013F698 80100200 */  sll        $v0, $v0, 2
    /* 5AA4 8013F69C 21104300 */  addu       $v0, $v0, $v1
    /* 5AA8 8013F6A0 00110200 */  sll        $v0, $v0, 4
    /* 5AAC 8013F6A4 23104300 */  subu       $v0, $v0, $v1
    /* 5AB0 8013F6A8 80100200 */  sll        $v0, $v0, 2
    /* 5AB4 8013F6AC 21104300 */  addu       $v0, $v0, $v1
    /* 5AB8 8013F6B0 C0180200 */  sll        $v1, $v0, 3
    /* 5ABC 8013F6B4 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5AC0 8013F6B8 21082400 */  addu       $at, $at, $a0
    /* 5AC4 8013F6BC 682C20AC */  sw         $zero, %lo(missile + 0x10)($at)
    /* 5AC8 8013F6C0 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 5ACC 8013F6C4 21082300 */  addu       $at, $at, $v1
    /* 5AD0 8013F6C8 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 5AD4 8013F6CC 00000000 */  nop
    /* 5AD8 8013F6D0 15004004 */  bltz       $v0, .L8013F728
    /* 5ADC 8013F6D4 21800000 */   addu      $s0, $zero, $zero
    /* 5AE0 8013F6D8 21908000 */  addu       $s2, $a0, $zero
    /* 5AE4 8013F6DC 21986000 */  addu       $s3, $v1, $zero
  .L8013F6E0:
    /* 5AE8 8013F6E0 C9F6000C */  jal        ENG_random__Fl
    /* 5AEC 8013F6E4 02000424 */   addiu     $a0, $zero, 0x2
    /* 5AF0 8013F6E8 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5AF4 8013F6EC 21083200 */  addu       $at, $at, $s2
    /* 5AF8 8013F6F0 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 5AFC 8013F6F4 00000000 */  nop
    /* 5B00 8013F6F8 01006324 */  addiu      $v1, $v1, 0x1
    /* 5B04 8013F6FC 21186200 */  addu       $v1, $v1, $v0
    /* 5B08 8013F700 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5B0C 8013F704 21083200 */  addu       $at, $at, $s2
    /* 5B10 8013F708 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 5B14 8013F70C 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 5B18 8013F710 21083300 */  addu       $at, $at, $s3
    /* 5B1C 8013F714 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 5B20 8013F718 01001026 */  addiu      $s0, $s0, 0x1
    /* 5B24 8013F71C 2A105000 */  slt        $v0, $v0, $s0
    /* 5B28 8013F720 EFFF4010 */  beqz       $v0, .L8013F6E0
    /* 5B2C 8013F724 00000000 */   nop
  .L8013F728:
    /* 5B30 8013F728 80101100 */  sll        $v0, $s1, 2
    /* 5B34 8013F72C 21105100 */  addu       $v0, $v0, $s1
    /* 5B38 8013F730 80100200 */  sll        $v0, $v0, 2
    /* 5B3C 8013F734 23105100 */  subu       $v0, $v0, $s1
    /* 5B40 8013F738 80100200 */  sll        $v0, $v0, 2
    /* 5B44 8013F73C 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 5B48 8013F740 21082200 */  addu       $at, $at, $v0
    /* 5B4C 8013F744 982C3080 */  lb         $s0, %lo(missile + 0x40)($at)
    /* 5B50 8013F748 00000000 */  nop
    /* 5B54 8013F74C 0C00001A */  blez       $s0, .L8013F780
    /* 5B58 8013F750 21204000 */   addu      $a0, $v0, $zero
  .L8013F754:
    /* 5B5C 8013F754 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5B60 8013F758 21082400 */  addu       $at, $at, $a0
    /* 5B64 8013F75C 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 5B68 8013F760 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 5B6C 8013F764 C3100300 */  sra        $v0, $v1, 3
    /* 5B70 8013F768 21186200 */  addu       $v1, $v1, $v0
    /* 5B74 8013F76C 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5B78 8013F770 21082400 */  addu       $at, $at, $a0
    /* 5B7C 8013F774 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 5B80 8013F778 F6FF001E */  bgtz       $s0, .L8013F754
    /* 5B84 8013F77C 00000000 */   nop
  .L8013F780:
    /* 5B88 8013F780 80101100 */  sll        $v0, $s1, 2
    /* 5B8C 8013F784 21105100 */  addu       $v0, $v0, $s1
    /* 5B90 8013F788 80100200 */  sll        $v0, $v0, 2
    /* 5B94 8013F78C 23105100 */  subu       $v0, $v0, $s1
    /* 5B98 8013F790 80100200 */  sll        $v0, $v0, 2
    /* 5B9C 8013F794 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5BA0 8013F798 21082200 */  addu       $at, $at, $v0
    /* 5BA4 8013F79C 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 5BA8 8013F7A0 00000000 */  nop
    /* 5BAC 8013F7A4 43200300 */  sra        $a0, $v1, 1
    /* 5BB0 8013F7A8 F3FD0408 */  j          .L8013F7CC
    /* 5BB4 8013F7AC 21186400 */   addu      $v1, $v1, $a0
  .L8013F7B0:
    /* 5BB8 8013F7B0 21105100 */  addu       $v0, $v0, $s1
    /* 5BBC 8013F7B4 80100200 */  sll        $v0, $v0, 2
    /* 5BC0 8013F7B8 23105100 */  subu       $v0, $v0, $s1
    /* 5BC4 8013F7BC 1280033C */  lui        $v1, %hi(currlevel)
    /* 5BC8 8013F7C0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 5BCC 8013F7C4 80100200 */  sll        $v0, $v0, 2
    /* 5BD0 8013F7C8 42180300 */  srl        $v1, $v1, 1
  .L8013F7CC:
    /* 5BD4 8013F7CC 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5BD8 8013F7D0 21082200 */  addu       $at, $at, $v0
    /* 5BDC 8013F7D4 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
  .L8013F7D8:
    /* 5BE0 8013F7D8 80101100 */  sll        $v0, $s1, 2
    /* 5BE4 8013F7DC 21105100 */  addu       $v0, $v0, $s1
    /* 5BE8 8013F7E0 80100200 */  sll        $v0, $v0, 2
    /* 5BEC 8013F7E4 23105100 */  subu       $v0, $v0, $s1
    /* 5BF0 8013F7E8 80100200 */  sll        $v0, $v0, 2
    /* 5BF4 8013F7EC 01000324 */  addiu      $v1, $zero, 0x1
    /* 5BF8 8013F7F0 1080013C */  lui        $at, %hi(missile + 0x3C)
    /* 5BFC 8013F7F4 21082200 */  addu       $at, $at, $v0
    /* 5C00 8013F7F8 942C23A0 */  sb         $v1, %lo(missile + 0x3C)($at)
    /* 5C04 8013F7FC 13000324 */  addiu      $v1, $zero, 0x13
    /* 5C08 8013F800 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 5C0C 8013F804 21082200 */  addu       $at, $at, $v0
    /* 5C10 8013F808 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 5C14 8013F80C 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 5C18 8013F810 D51A82A3 */  sb         $v0, %gp_rel(fadetor)($gp)
    /* 5C1C 8013F814 D61A82A3 */  sb         $v0, %gp_rel(fadetog)($gp)
    /* 5C20 8013F818 D71A82A3 */  sb         $v0, %gp_rel(fadetob)($gp)
    /* 5C24 8013F81C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 5C28 8013F820 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 5C2C 8013F824 1800B28F */  lw         $s2, 0x18($sp)
    /* 5C30 8013F828 1400B18F */  lw         $s1, 0x14($sp)
    /* 5C34 8013F82C 1000B08F */  lw         $s0, 0x10($sp)
    /* 5C38 8013F830 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 5C3C 8013F834 0800E003 */  jr         $ra
    /* 5C40 8013F838 00000000 */   nop
endlabel AddFlash2__Fiiiiiicii
