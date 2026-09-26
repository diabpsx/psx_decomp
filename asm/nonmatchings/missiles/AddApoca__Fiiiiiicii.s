.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddApoca__Fiiiiiicii, 0x268

glabel AddApoca__Fiiiiiicii
    /* 7EA8 80141AA0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 7EAC 80141AA4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 7EB0 80141AA8 21A08000 */  addu       $s4, $a0, $zero
    /* 7EB4 80141AAC 80101400 */  sll        $v0, $s4, 2
    /* 7EB8 80141AB0 21105400 */  addu       $v0, $v0, $s4
    /* 7EBC 80141AB4 80100200 */  sll        $v0, $v0, 2
    /* 7EC0 80141AB8 23105400 */  subu       $v0, $v0, $s4
    /* 7EC4 80141ABC 80200200 */  sll        $a0, $v0, 2
    /* 7EC8 80141AC0 09000224 */  addiu      $v0, $zero, 0x9
    /* 7ECC 80141AC4 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 7ED0 80141AC8 2400B3AF */  sw         $s3, 0x24($sp)
    /* 7ED4 80141ACC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 7ED8 80141AD0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 7EDC 80141AD4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 7EE0 80141AD8 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 7EE4 80141ADC 21082400 */  addu       $at, $at, $a0
    /* 7EE8 80141AE0 762C22A4 */  sh         $v0, %lo(missile + 0x1E)($at)
    /* 7EEC 80141AE4 F7FFC224 */  addiu      $v0, $a2, -0x9
    /* 7EF0 80141AE8 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 7EF4 80141AEC 21082400 */  addu       $at, $at, $a0
    /* 7EF8 80141AF0 782C22A4 */  sh         $v0, %lo(missile + 0x20)($at)
    /* 7EFC 80141AF4 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 7F00 80141AF8 21082400 */  addu       $at, $at, $a0
    /* 7F04 80141AFC 762C2294 */  lhu        $v0, %lo(missile + 0x1E)($at)
    /* 7F08 80141B00 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 7F0C 80141B04 21082400 */  addu       $at, $at, $a0
    /* 7F10 80141B08 762C2394 */  lhu        $v1, %lo(missile + 0x1E)($at)
    /* 7F14 80141B0C 21104600 */  addu       $v0, $v0, $a2
    /* 7F18 80141B10 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 7F1C 80141B14 21082400 */  addu       $at, $at, $a0
    /* 7F20 80141B18 7A2C22A4 */  sh         $v0, %lo(missile + 0x22)($at)
    /* 7F24 80141B1C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 7F28 80141B20 21082400 */  addu       $at, $at, $a0
    /* 7F2C 80141B24 762C2294 */  lhu        $v0, %lo(missile + 0x1E)($at)
    /* 7F30 80141B28 2318A300 */  subu       $v1, $a1, $v1
    /* 7F34 80141B2C 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 7F38 80141B30 21082400 */  addu       $at, $at, $a0
    /* 7F3C 80141B34 7C2C23A4 */  sh         $v1, %lo(missile + 0x24)($at)
    /* 7F40 80141B38 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 7F44 80141B3C 21082400 */  addu       $at, $at, $a0
    /* 7F48 80141B40 7C2C2394 */  lhu        $v1, %lo(missile + 0x24)($at)
    /* 7F4C 80141B44 21104500 */  addu       $v0, $v0, $a1
    /* 7F50 80141B48 1080013C */  lui        $at, %hi(missile + 0x26)
    /* 7F54 80141B4C 21082400 */  addu       $at, $at, $a0
    /* 7F58 80141B50 7E2C22A4 */  sh         $v0, %lo(missile + 0x26)($at)
    /* 7F5C 80141B54 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 7F60 80141B58 21082400 */  addu       $at, $at, $a0
    /* 7F64 80141B5C 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* 7F68 80141B60 1080013C */  lui        $at, %hi(missile + 0x28)
    /* 7F6C 80141B64 21082400 */  addu       $at, $at, $a0
    /* 7F70 80141B68 802C23A4 */  sh         $v1, %lo(missile + 0x28)($at)
    /* 7F74 80141B6C 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 7F78 80141B70 0400401C */  bgtz       $v0, .L80141B84
    /* 7F7C 80141B74 01000224 */   addiu     $v0, $zero, 0x1
    /* 7F80 80141B78 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 7F84 80141B7C 21082400 */  addu       $at, $at, $a0
    /* 7F88 80141B80 782C22A4 */  sh         $v0, %lo(missile + 0x20)($at)
  .L80141B84:
    /* 7F8C 80141B84 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 7F90 80141B88 21082400 */  addu       $at, $at, $a0
    /* 7F94 80141B8C 7A2C2284 */  lh         $v0, %lo(missile + 0x22)($at)
    /* 7F98 80141B90 00000000 */  nop
    /* 7F9C 80141B94 60004228 */  slti       $v0, $v0, 0x60
    /* 7FA0 80141B98 04004014 */  bnez       $v0, .L80141BAC
    /* 7FA4 80141B9C 5F000224 */   addiu     $v0, $zero, 0x5F
    /* 7FA8 80141BA0 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 7FAC 80141BA4 21082400 */  addu       $at, $at, $a0
    /* 7FB0 80141BA8 7A2C22A4 */  sh         $v0, %lo(missile + 0x22)($at)
  .L80141BAC:
    /* 7FB4 80141BAC 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 7FB8 80141BB0 21082400 */  addu       $at, $at, $a0
    /* 7FBC 80141BB4 7C2C2284 */  lh         $v0, %lo(missile + 0x24)($at)
    /* 7FC0 80141BB8 00000000 */  nop
    /* 7FC4 80141BBC 0400401C */  bgtz       $v0, .L80141BD0
    /* 7FC8 80141BC0 01000224 */   addiu     $v0, $zero, 0x1
    /* 7FCC 80141BC4 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 7FD0 80141BC8 21082400 */  addu       $at, $at, $a0
    /* 7FD4 80141BCC 7C2C22A4 */  sh         $v0, %lo(missile + 0x24)($at)
  .L80141BD0:
    /* 7FD8 80141BD0 1080013C */  lui        $at, %hi(missile + 0x26)
    /* 7FDC 80141BD4 21082400 */  addu       $at, $at, $a0
    /* 7FE0 80141BD8 7E2C2284 */  lh         $v0, %lo(missile + 0x26)($at)
    /* 7FE4 80141BDC 00000000 */  nop
    /* 7FE8 80141BE0 70004228 */  slti       $v0, $v0, 0x70
    /* 7FEC 80141BE4 06004014 */  bnez       $v0, .L80141C00
    /* 7FF0 80141BE8 40101300 */   sll       $v0, $s3, 1
    /* 7FF4 80141BEC 6F000224 */  addiu      $v0, $zero, 0x6F
    /* 7FF8 80141BF0 1080013C */  lui        $at, %hi(missile + 0x26)
    /* 7FFC 80141BF4 21082400 */  addu       $at, $at, $a0
    /* 8000 80141BF8 7E2C22A4 */  sh         $v0, %lo(missile + 0x26)($at)
    /* 8004 80141BFC 40101300 */  sll        $v0, $s3, 1
  .L80141C00:
    /* 8008 80141C00 21105300 */  addu       $v0, $v0, $s3
    /* 800C 80141C04 80100200 */  sll        $v0, $v0, 2
    /* 8010 80141C08 21105300 */  addu       $v0, $v0, $s3
    /* 8014 80141C0C 00110200 */  sll        $v0, $v0, 4
    /* 8018 80141C10 23105300 */  subu       $v0, $v0, $s3
    /* 801C 80141C14 80100200 */  sll        $v0, $v0, 2
    /* 8020 80141C18 21105300 */  addu       $v0, $v0, $s3
    /* 8024 80141C1C C0180200 */  sll        $v1, $v0, 3
    /* 8028 80141C20 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 802C 80141C24 21082300 */  addu       $at, $at, $v1
    /* 8030 80141C28 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 8034 80141C2C 00000000 */  nop
    /* 8038 80141C30 15004018 */  blez       $v0, .L80141C88
    /* 803C 80141C34 21800000 */   addu      $s0, $zero, $zero
    /* 8040 80141C38 21888000 */  addu       $s1, $a0, $zero
    /* 8044 80141C3C 21906000 */  addu       $s2, $v1, $zero
  .L80141C40:
    /* 8048 80141C40 C9F6000C */  jal        ENG_random__Fl
    /* 804C 80141C44 06000424 */   addiu     $a0, $zero, 0x6
    /* 8050 80141C48 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 8054 80141C4C 21083100 */  addu       $at, $at, $s1
    /* 8058 80141C50 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 805C 80141C54 00000000 */  nop
    /* 8060 80141C58 01006324 */  addiu      $v1, $v1, 0x1
    /* 8064 80141C5C 21186200 */  addu       $v1, $v1, $v0
    /* 8068 80141C60 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 806C 80141C64 21083100 */  addu       $at, $at, $s1
    /* 8070 80141C68 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 8074 80141C6C 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 8078 80141C70 21083200 */  addu       $at, $at, $s2
    /* 807C 80141C74 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 8080 80141C78 01001026 */  addiu      $s0, $s0, 0x1
    /* 8084 80141C7C 2A100202 */  slt        $v0, $s0, $v0
    /* 8088 80141C80 EFFF4014 */  bnez       $v0, .L80141C40
    /* 808C 80141C84 00000000 */   nop
  .L80141C88:
    /* 8090 80141C88 21206002 */  addu       $a0, $s3, $zero
    /* 8094 80141C8C 80101400 */  sll        $v0, $s4, 2
    /* 8098 80141C90 21105400 */  addu       $v0, $v0, $s4
    /* 809C 80141C94 80100200 */  sll        $v0, $v0, 2
    /* 80A0 80141C98 23105400 */  subu       $v0, $v0, $s4
    /* 80A4 80141C9C 80100200 */  sll        $v0, $v0, 2
    /* 80A8 80141CA0 FF000324 */  addiu      $v1, $zero, 0xFF
    /* 80AC 80141CA4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 80B0 80141CA8 21082200 */  addu       $at, $at, $v0
    /* 80B4 80141CAC 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 80B8 80141CB0 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 80BC 80141CB4 21082200 */  addu       $at, $at, $v0
    /* 80C0 80141CB8 902C20A0 */  sb         $zero, %lo(missile + 0x38)($at)
    /* 80C4 80141CBC C2DC010C */  jal        UseMana__Fii
    /* 80C8 80141CC0 18000524 */   addiu     $a1, $zero, 0x18
    /* 80CC 80141CC4 0F000424 */  addiu      $a0, $zero, 0xF
    /* 80D0 80141CC8 296F020C */  jal        GLUE_DoQuake__Fii
    /* 80D4 80141CCC 02000524 */   addiu     $a1, $zero, 0x2
    /* 80D8 80141CD0 21200000 */  addu       $a0, $zero, $zero
    /* 80DC 80141CD4 21286002 */  addu       $a1, $s3, $zero
    /* 80E0 80141CD8 0A000624 */  addiu      $a2, $zero, 0xA
    /* 80E4 80141CDC 98C0020C */  jal        SPL_Arrow__F6TARGETiii
    /* 80E8 80141CE0 14000724 */   addiu     $a3, $zero, 0x14
    /* 80EC 80141CE4 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 80F0 80141CE8 2800B48F */  lw         $s4, 0x28($sp)
    /* 80F4 80141CEC 2400B38F */  lw         $s3, 0x24($sp)
    /* 80F8 80141CF0 2000B28F */  lw         $s2, 0x20($sp)
    /* 80FC 80141CF4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8100 80141CF8 1800B08F */  lw         $s0, 0x18($sp)
    /* 8104 80141CFC 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 8108 80141D00 0800E003 */  jr         $ra
    /* 810C 80141D04 00000000 */   nop
endlabel AddApoca__Fiiiiiicii
