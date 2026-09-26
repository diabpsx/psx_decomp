.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Nova__Fi, 0x2DC

glabel MI_Nova__Fi
    /* EEA4 80148A9C A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* EEA8 80148AA0 5800BEAF */  sw         $fp, 0x58($sp)
    /* EEAC 80148AA4 21F08000 */  addu       $fp, $a0, $zero
    /* EEB0 80148AA8 21280000 */  addu       $a1, $zero, $zero
    /* EEB4 80148AAC 80101E00 */  sll        $v0, $fp, 2
    /* EEB8 80148AB0 21105E00 */  addu       $v0, $v0, $fp
    /* EEBC 80148AB4 80100200 */  sll        $v0, $v0, 2
    /* EEC0 80148AB8 23105E00 */  subu       $v0, $v0, $fp
    /* EEC4 80148ABC 80100200 */  sll        $v0, $v0, 2
    /* EEC8 80148AC0 5C00BFAF */  sw         $ra, 0x5C($sp)
    /* EECC 80148AC4 5400B7AF */  sw         $s7, 0x54($sp)
    /* EED0 80148AC8 5000B6AF */  sw         $s6, 0x50($sp)
    /* EED4 80148ACC 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* EED8 80148AD0 4800B4AF */  sw         $s4, 0x48($sp)
    /* EEDC 80148AD4 4400B3AF */  sw         $s3, 0x44($sp)
    /* EEE0 80148AD8 4000B2AF */  sw         $s2, 0x40($sp)
    /* EEE4 80148ADC 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* EEE8 80148AE0 3800B0AF */  sw         $s0, 0x38($sp)
    /* EEEC 80148AE4 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* EEF0 80148AE8 21082200 */  addu       $at, $at, $v0
    /* EEF4 80148AEC 862C3584 */  lh         $s5, %lo(missile + 0x2E)($at)
    /* EEF8 80148AF0 1080013C */  lui        $at, %hi(missile + 0x10)
    /* EEFC 80148AF4 21082200 */  addu       $at, $at, $v0
    /* EF00 80148AF8 682C288C */  lw         $t0, %lo(missile + 0x10)($at)
    /* EF04 80148AFC FFFF0324 */  addiu      $v1, $zero, -0x1
    /* EF08 80148B00 3000A8AF */  sw         $t0, 0x30($sp)
    /* EF0C 80148B04 1080013C */  lui        $at, %hi(missile + 0x31)
    /* EF10 80148B08 21082200 */  addu       $at, $at, $v0
    /* EF14 80148B0C 892C3380 */  lb         $s3, %lo(missile + 0x31)($at)
    /* EF18 80148B10 1080013C */  lui        $at, %hi(missile + 0x32)
    /* EF1C 80148B14 21082200 */  addu       $at, $at, $v0
    /* EF20 80148B18 8A2C3280 */  lb         $s2, %lo(missile + 0x32)($at)
    /* EF24 80148B1C 0F00A312 */  beq        $s5, $v1, .L80148B5C
    /* EF28 80148B20 21200000 */   addu      $a0, $zero, $zero
    /* EF2C 80148B24 40101500 */  sll        $v0, $s5, 1
    /* EF30 80148B28 21105500 */  addu       $v0, $v0, $s5
    /* EF34 80148B2C 80100200 */  sll        $v0, $v0, 2
    /* EF38 80148B30 21105500 */  addu       $v0, $v0, $s5
    /* EF3C 80148B34 00110200 */  sll        $v0, $v0, 4
    /* EF40 80148B38 23105500 */  subu       $v0, $v0, $s5
    /* EF44 80148B3C 80100200 */  sll        $v0, $v0, 2
    /* EF48 80148B40 21105500 */  addu       $v0, $v0, $s5
    /* EF4C 80148B44 C0100200 */  sll        $v0, $v0, 3
    /* EF50 80148B48 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* EF54 80148B4C 21082200 */  addu       $at, $at, $v0
    /* EF58 80148B50 7AA53680 */  lb         $s6, %lo(plr + 0x42)($at)
    /* EF5C 80148B54 D9220508 */  j          .L80148B64
    /* EF60 80148B58 21100000 */   addu      $v0, $zero, $zero
  .L80148B5C:
    /* EF64 80148B5C 21B00000 */  addu       $s6, $zero, $zero
    /* EF68 80148B60 01000224 */  addiu      $v0, $zero, 0x1
  .L80148B64:
    /* EF6C 80148B64 2800A0AF */  sw         $zero, 0x28($sp)
    /* EF70 80148B68 21B84000 */  addu       $s7, $v0, $zero
    /* EF74 80148B6C 0D80113C */  lui        $s1, %hi(vCrawlTable + 0x7)
    /* EF78 80148B70 1B603126 */  addiu      $s1, $s1, %lo(vCrawlTable + 0x7)
    /* EF7C 80148B74 FFFF3426 */  addiu      $s4, $s1, -0x1
  .L80148B78:
    /* EF80 80148B78 00008392 */  lbu        $v1, 0x0($s4)
    /* EF84 80148B7C 00000000 */  nop
    /* EF88 80148B80 05008314 */  bne        $a0, $v1, .L80148B98
    /* EF8C 80148B84 00000000 */   nop
    /* EF90 80148B88 00002292 */  lbu        $v0, 0x0($s1)
    /* EF94 80148B8C 00000000 */  nop
    /* EF98 80148B90 4F00A210 */  beq        $a1, $v0, .L80148CD0
    /* EF9C 80148B94 00000000 */   nop
  .L80148B98:
    /* EFA0 80148B98 21206002 */  addu       $a0, $s3, $zero
    /* EFA4 80148B9C 21284002 */  addu       $a1, $s2, $zero
    /* EFA8 80148BA0 21306302 */  addu       $a2, $s3, $v1
    /* EFAC 80148BA4 00002792 */  lbu        $a3, 0x0($s1)
    /* EFB0 80148BA8 04000824 */  addiu      $t0, $zero, 0x4
    /* EFB4 80148BAC 80801E00 */  sll        $s0, $fp, 2
    /* EFB8 80148BB0 21801E02 */  addu       $s0, $s0, $fp
    /* EFBC 80148BB4 80801000 */  sll        $s0, $s0, 2
    /* EFC0 80148BB8 23801E02 */  subu       $s0, $s0, $fp
    /* EFC4 80148BBC 1400A8AF */  sw         $t0, 0x14($sp)
    /* EFC8 80148BC0 3000A88F */  lw         $t0, 0x30($sp)
    /* EFCC 80148BC4 80801000 */  sll        $s0, $s0, 2
    /* EFD0 80148BC8 1000B6AF */  sw         $s6, 0x10($sp)
    /* EFD4 80148BCC 1800B7AF */  sw         $s7, 0x18($sp)
    /* EFD8 80148BD0 1C00B5AF */  sw         $s5, 0x1C($sp)
    /* EFDC 80148BD4 2000A8AF */  sw         $t0, 0x20($sp)
    /* EFE0 80148BD8 1080013C */  lui        $at, %hi(missile + 0x40)
    /* EFE4 80148BDC 21083000 */  addu       $at, $at, $s0
    /* EFE8 80148BE0 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* EFEC 80148BE4 21384702 */  addu       $a3, $s2, $a3
    /* EFF0 80148BE8 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* EFF4 80148BEC 2400A2AF */   sw        $v0, 0x24($sp)
    /* EFF8 80148BF0 21206002 */  addu       $a0, $s3, $zero
    /* EFFC 80148BF4 00008692 */  lbu        $a2, 0x0($s4)
    /* F000 80148BF8 00002792 */  lbu        $a3, 0x0($s1)
    /* F004 80148BFC 04000824 */  addiu      $t0, $zero, 0x4
    /* F008 80148C00 1400A8AF */  sw         $t0, 0x14($sp)
    /* F00C 80148C04 3000A88F */  lw         $t0, 0x30($sp)
    /* F010 80148C08 21284002 */  addu       $a1, $s2, $zero
    /* F014 80148C0C 1000B6AF */  sw         $s6, 0x10($sp)
    /* F018 80148C10 1800B7AF */  sw         $s7, 0x18($sp)
    /* F01C 80148C14 1C00B5AF */  sw         $s5, 0x1C($sp)
    /* F020 80148C18 23306602 */  subu       $a2, $s3, $a2
    /* F024 80148C1C 2000A8AF */  sw         $t0, 0x20($sp)
    /* F028 80148C20 1080013C */  lui        $at, %hi(missile + 0x40)
    /* F02C 80148C24 21083000 */  addu       $at, $at, $s0
    /* F030 80148C28 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* F034 80148C2C 23384702 */  subu       $a3, $s2, $a3
    /* F038 80148C30 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* F03C 80148C34 2400A2AF */   sw        $v0, 0x24($sp)
    /* F040 80148C38 21206002 */  addu       $a0, $s3, $zero
    /* F044 80148C3C 00008692 */  lbu        $a2, 0x0($s4)
    /* F048 80148C40 00002792 */  lbu        $a3, 0x0($s1)
    /* F04C 80148C44 04000824 */  addiu      $t0, $zero, 0x4
    /* F050 80148C48 1400A8AF */  sw         $t0, 0x14($sp)
    /* F054 80148C4C 3000A88F */  lw         $t0, 0x30($sp)
    /* F058 80148C50 21284002 */  addu       $a1, $s2, $zero
    /* F05C 80148C54 1000B6AF */  sw         $s6, 0x10($sp)
    /* F060 80148C58 1800B7AF */  sw         $s7, 0x18($sp)
    /* F064 80148C5C 1C00B5AF */  sw         $s5, 0x1C($sp)
    /* F068 80148C60 23306602 */  subu       $a2, $s3, $a2
    /* F06C 80148C64 2000A8AF */  sw         $t0, 0x20($sp)
    /* F070 80148C68 1080013C */  lui        $at, %hi(missile + 0x40)
    /* F074 80148C6C 21083000 */  addu       $at, $at, $s0
    /* F078 80148C70 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* F07C 80148C74 21384702 */  addu       $a3, $s2, $a3
    /* F080 80148C78 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* F084 80148C7C 2400A2AF */   sw        $v0, 0x24($sp)
    /* F088 80148C80 21206002 */  addu       $a0, $s3, $zero
    /* F08C 80148C84 00008692 */  lbu        $a2, 0x0($s4)
    /* F090 80148C88 00002792 */  lbu        $a3, 0x0($s1)
    /* F094 80148C8C 04000824 */  addiu      $t0, $zero, 0x4
    /* F098 80148C90 1400A8AF */  sw         $t0, 0x14($sp)
    /* F09C 80148C94 3000A88F */  lw         $t0, 0x30($sp)
    /* F0A0 80148C98 21284002 */  addu       $a1, $s2, $zero
    /* F0A4 80148C9C 1000B6AF */  sw         $s6, 0x10($sp)
    /* F0A8 80148CA0 1800B7AF */  sw         $s7, 0x18($sp)
    /* F0AC 80148CA4 1C00B5AF */  sw         $s5, 0x1C($sp)
    /* F0B0 80148CA8 21306602 */  addu       $a2, $s3, $a2
    /* F0B4 80148CAC 2000A8AF */  sw         $t0, 0x20($sp)
    /* F0B8 80148CB0 1080013C */  lui        $at, %hi(missile + 0x40)
    /* F0BC 80148CB4 21083000 */  addu       $at, $at, $s0
    /* F0C0 80148CB8 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* F0C4 80148CBC 23384702 */  subu       $a3, $s2, $a3
    /* F0C8 80148CC0 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* F0CC 80148CC4 2400A2AF */   sw        $v0, 0x24($sp)
    /* F0D0 80148CC8 00008492 */  lbu        $a0, 0x0($s4)
    /* F0D4 80148CCC 00002592 */  lbu        $a1, 0x0($s1)
  .L80148CD0:
    /* F0D8 80148CD0 1E003126 */  addiu      $s1, $s1, 0x1E
    /* F0DC 80148CD4 2800A88F */  lw         $t0, 0x28($sp)
    /* F0E0 80148CD8 1E009426 */  addiu      $s4, $s4, 0x1E
    /* F0E4 80148CDC 01000825 */  addiu      $t0, $t0, 0x1
    /* F0E8 80148CE0 17000229 */  slti       $v0, $t0, 0x17
    /* F0EC 80148CE4 A4FF4014 */  bnez       $v0, .L80148B78
    /* F0F0 80148CE8 2800A8AF */   sw        $t0, 0x28($sp)
    /* F0F4 80148CEC 80101E00 */  sll        $v0, $fp, 2
    /* F0F8 80148CF0 21105E00 */  addu       $v0, $v0, $fp
    /* F0FC 80148CF4 80100200 */  sll        $v0, $v0, 2
    /* F100 80148CF8 23105E00 */  subu       $v0, $v0, $fp
    /* F104 80148CFC 80180200 */  sll        $v1, $v0, 2
    /* F108 80148D00 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F10C 80148D04 21082300 */  addu       $at, $at, $v1
    /* F110 80148D08 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* F114 80148D0C 00000000 */  nop
    /* F118 80148D10 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* F11C 80148D14 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F120 80148D18 21082300 */  addu       $at, $at, $v1
    /* F124 80148D1C 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* F128 80148D20 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F12C 80148D24 21082300 */  addu       $at, $at, $v1
    /* F130 80148D28 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* F134 80148D2C 00000000 */  nop
    /* F138 80148D30 04004014 */  bnez       $v0, .L80148D44
    /* F13C 80148D34 01000224 */   addiu     $v0, $zero, 0x1
    /* F140 80148D38 1080013C */  lui        $at, %hi(missile + 0x38)
    /* F144 80148D3C 21082300 */  addu       $at, $at, $v1
    /* F148 80148D40 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
  .L80148D44:
    /* F14C 80148D44 5C00BF8F */  lw         $ra, 0x5C($sp)
    /* F150 80148D48 5800BE8F */  lw         $fp, 0x58($sp)
    /* F154 80148D4C 5400B78F */  lw         $s7, 0x54($sp)
    /* F158 80148D50 5000B68F */  lw         $s6, 0x50($sp)
    /* F15C 80148D54 4C00B58F */  lw         $s5, 0x4C($sp)
    /* F160 80148D58 4800B48F */  lw         $s4, 0x48($sp)
    /* F164 80148D5C 4400B38F */  lw         $s3, 0x44($sp)
    /* F168 80148D60 4000B28F */  lw         $s2, 0x40($sp)
    /* F16C 80148D64 3C00B18F */  lw         $s1, 0x3C($sp)
    /* F170 80148D68 3800B08F */  lw         $s0, 0x38($sp)
    /* F174 80148D6C 6000BD27 */  addiu      $sp, $sp, 0x60
    /* F178 80148D70 0800E003 */  jr         $ra
    /* F17C 80148D74 00000000 */   nop
endlabel MI_Nova__Fi
