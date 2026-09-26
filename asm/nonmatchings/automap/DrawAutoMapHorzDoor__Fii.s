.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawAutoMapHorzDoor__Fii, 0x1C0

glabel DrawAutoMapHorzDoor__Fii
    /* 28A54 8016264C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 28A58 80162650 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28A5C 80162654 E81B918F */  lw         $s1, %gp_rel(AutoMapScale)($gp)
    /* 28A60 80162658 00000000 */  nop
    /* 28A64 8016265C 18009100 */  mult       $a0, $s1
    /* 28A68 80162660 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28A6C 80162664 12800000 */  mflo       $s0
    /* 28A70 80162668 00000000 */  nop
    /* 28A74 8016266C 00000000 */  nop
    /* 28A78 80162670 1800B100 */  mult       $a1, $s1
    /* 28A7C 80162674 101C838F */  lw         $v1, %gp_rel(AMPlayerY)($gp)
    /* 28A80 80162678 38000624 */  addiu      $a2, $zero, 0x38
    /* 28A84 8016267C 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 28A88 80162680 2800B6AF */  sw         $s6, 0x28($sp)
    /* 28A8C 80162684 2400B5AF */  sw         $s5, 0x24($sp)
    /* 28A90 80162688 2000B4AF */  sw         $s4, 0x20($sp)
    /* 28A94 8016268C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 28A98 80162690 1800B2AF */  sw         $s2, 0x18($sp)
    /* 28A9C 80162694 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 28AA0 80162698 58000524 */  addiu      $a1, $zero, 0x58
    /* 28AA4 8016269C 12100000 */  mflo       $v0
    /* 28AA8 801626A0 21A05000 */  addu       $s4, $v0, $s0
    /* 28AAC 801626A4 23800202 */  subu       $s0, $s0, $v0
    /* 28AB0 801626A8 40801000 */  sll        $s0, $s0, 1
    /* 28AB4 801626AC 0C1C828F */  lw         $v0, %gp_rel(AMPlayerX)($gp)
    /* 28AB8 801626B0 21A08302 */  addu       $s4, $s4, $v1
    /* 28ABC 801626B4 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28AC0 801626B8 21800202 */   addu      $s0, $s0, $v0
    /* 28AC4 801626BC 21484000 */  addu       $t1, $v0, $zero
    /* 28AC8 801626C0 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 28ACC 801626C4 58000524 */  addiu      $a1, $zero, 0x58
    /* 28AD0 801626C8 38000624 */  addiu      $a2, $zero, 0x38
    /* 28AD4 801626CC 43901100 */  sra        $s2, $s1, 1
    /* 28AD8 801626D0 21101202 */  addu       $v0, $s0, $s2
    /* 28ADC 801626D4 C28F1100 */  srl        $s1, $s1, 31
    /* 28AE0 801626D8 21885102 */  addu       $s1, $s2, $s1
    /* 28AE4 801626DC 43881100 */  sra        $s1, $s1, 1
    /* 28AE8 801626E0 0C0022A5 */  sh         $v0, 0xC($t1)
    /* 28AEC 801626E4 21109102 */  addu       $v0, $s4, $s1
    /* 28AF0 801626E8 080030A5 */  sh         $s0, 0x8($t1)
    /* 28AF4 801626EC 0A0034A5 */  sh         $s4, 0xA($t1)
    /* 28AF8 801626F0 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28AFC 801626F4 0E0022A5 */   sh        $v0, 0xE($t1)
    /* 28B00 801626F8 21484000 */  addu       $t1, $v0, $zero
    /* 28B04 801626FC 7F000424 */  addiu      $a0, $zero, 0x7F
    /* 28B08 80162700 7F000524 */  addiu      $a1, $zero, 0x7F
    /* 28B0C 80162704 64000624 */  addiu      $a2, $zero, 0x64
    /* 28B10 80162708 E81B958F */  lw         $s5, %gp_rel(AutoMapScale)($gp)
    /* 28B14 8016270C 40181200 */  sll        $v1, $s2, 1
    /* 28B18 80162710 40981500 */  sll        $s3, $s5, 1
    /* 28B1C 80162714 21401302 */  addu       $t0, $s0, $s3
    /* 28B20 80162718 21800302 */  addu       $s0, $s0, $v1
    /* 28B24 8016271C 21389502 */  addu       $a3, $s4, $s5
    /* 28B28 80162720 23A09202 */  subu       $s4, $s4, $s2
    /* 28B2C 80162724 23101201 */  subu       $v0, $t0, $s2
    /* 28B30 80162728 2388F100 */  subu       $s1, $a3, $s1
    /* 28B34 8016272C 0A0031A5 */  sh         $s1, 0xA($t1)
    /* 28B38 80162730 23881302 */  subu       $s1, $s0, $s3
    /* 28B3C 80162734 21882302 */  addu       $s1, $s1, $v1
    /* 28B40 80162738 21A89502 */  addu       $s5, $s4, $s5
    /* 28B44 8016273C 21B09302 */  addu       $s6, $s4, $s3
    /* 28B48 80162740 23B0D202 */  subu       $s6, $s6, $s2
    /* 28B4C 80162744 21981302 */  addu       $s3, $s0, $s3
    /* 28B50 80162748 23986302 */  subu       $s3, $s3, $v1
    /* 28B54 8016274C 080022A5 */  sh         $v0, 0x8($t1)
    /* 28B58 80162750 0C0028A5 */  sh         $t0, 0xC($t1)
    /* 28B5C 80162754 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28B60 80162758 0E0027A5 */   sh        $a3, 0xE($t1)
    /* 28B64 8016275C 21484000 */  addu       $t1, $v0, $zero
    /* 28B68 80162760 7F000424 */  addiu      $a0, $zero, 0x7F
    /* 28B6C 80162764 7F000524 */  addiu      $a1, $zero, 0x7F
    /* 28B70 80162768 64000624 */  addiu      $a2, $zero, 0x64
    /* 28B74 8016276C 21A09202 */  addu       $s4, $s4, $s2
    /* 28B78 80162770 080030A5 */  sh         $s0, 0x8($t1)
    /* 28B7C 80162774 0A0034A5 */  sh         $s4, 0xA($t1)
    /* 28B80 80162778 0C0031A5 */  sh         $s1, 0xC($t1)
    /* 28B84 8016277C FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28B88 80162780 0E0035A5 */   sh        $s5, 0xE($t1)
    /* 28B8C 80162784 21484000 */  addu       $t1, $v0, $zero
    /* 28B90 80162788 7F000424 */  addiu      $a0, $zero, 0x7F
    /* 28B94 8016278C 7F000524 */  addiu      $a1, $zero, 0x7F
    /* 28B98 80162790 64000624 */  addiu      $a2, $zero, 0x64
    /* 28B9C 80162794 080031A5 */  sh         $s1, 0x8($t1)
    /* 28BA0 80162798 0A0035A5 */  sh         $s5, 0xA($t1)
    /* 28BA4 8016279C 0C0030A5 */  sh         $s0, 0xC($t1)
    /* 28BA8 801627A0 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28BAC 801627A4 0E0036A5 */   sh        $s6, 0xE($t1)
    /* 28BB0 801627A8 21484000 */  addu       $t1, $v0, $zero
    /* 28BB4 801627AC 7F000424 */  addiu      $a0, $zero, 0x7F
    /* 28BB8 801627B0 7F000524 */  addiu      $a1, $zero, 0x7F
    /* 28BBC 801627B4 64000624 */  addiu      $a2, $zero, 0x64
    /* 28BC0 801627B8 080030A5 */  sh         $s0, 0x8($t1)
    /* 28BC4 801627BC 0A0036A5 */  sh         $s6, 0xA($t1)
    /* 28BC8 801627C0 0C0033A5 */  sh         $s3, 0xC($t1)
    /* 28BCC 801627C4 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28BD0 801627C8 0E0035A5 */   sh        $s5, 0xE($t1)
    /* 28BD4 801627CC 21484000 */  addu       $t1, $v0, $zero
    /* 28BD8 801627D0 080033A5 */  sh         $s3, 0x8($t1)
    /* 28BDC 801627D4 0A0035A5 */  sh         $s5, 0xA($t1)
    /* 28BE0 801627D8 0C0030A5 */  sh         $s0, 0xC($t1)
    /* 28BE4 801627DC 0E0034A5 */  sh         $s4, 0xE($t1)
    /* 28BE8 801627E0 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 28BEC 801627E4 2800B68F */  lw         $s6, 0x28($sp)
    /* 28BF0 801627E8 2400B58F */  lw         $s5, 0x24($sp)
    /* 28BF4 801627EC 2000B48F */  lw         $s4, 0x20($sp)
    /* 28BF8 801627F0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 28BFC 801627F4 1800B28F */  lw         $s2, 0x18($sp)
    /* 28C00 801627F8 1400B18F */  lw         $s1, 0x14($sp)
    /* 28C04 801627FC 1000B08F */  lw         $s0, 0x10($sp)
    /* 28C08 80162800 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 28C0C 80162804 0800E003 */  jr         $ra
    /* 28C10 80162808 00000000 */   nop
endlabel DrawAutoMapHorzDoor__Fii
