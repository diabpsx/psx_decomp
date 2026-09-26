.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddGolem__Fiiiiiicii, 0x340

glabel AddGolem__Fiiiiiicii
    /* 6D0C 80140904 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 6D10 80140908 6400B7AF */  sw         $s7, 0x64($sp)
    /* 6D14 8014090C 8C00B78F */  lw         $s7, 0x8C($sp)
    /* 6D18 80140910 21408000 */  addu       $t0, $a0, $zero
    /* 6D1C 80140914 6800BEAF */  sw         $fp, 0x68($sp)
    /* 6D20 80140918 21F0A000 */  addu       $fp, $a1, $zero
    /* 6D24 8014091C 6C00BFAF */  sw         $ra, 0x6C($sp)
    /* 6D28 80140920 6000B6AF */  sw         $s6, 0x60($sp)
    /* 6D2C 80140924 5C00B5AF */  sw         $s5, 0x5C($sp)
    /* 6D30 80140928 5800B4AF */  sw         $s4, 0x58($sp)
    /* 6D34 8014092C 5400B3AF */  sw         $s3, 0x54($sp)
    /* 6D38 80140930 5000B2AF */  sw         $s2, 0x50($sp)
    /* 6D3C 80140934 4C00B1AF */  sw         $s1, 0x4C($sp)
    /* 6D40 80140938 4800B0AF */  sw         $s0, 0x48($sp)
    /* 6D44 8014093C 2800A6AF */  sw         $a2, 0x28($sp)
    /* 6D48 80140940 3000A7AF */  sw         $a3, 0x30($sp)
    /* 6D4C 80140944 1280053C */  lui        $a1, %hi(D_8011A030)
    /* 6D50 80140948 30A0A524 */  addiu      $a1, $a1, %lo(D_8011A030)
    /* 6D54 8014094C 0000A28C */  lw         $v0, 0x0($a1)
    /* 6D58 80140950 0400A38C */  lw         $v1, 0x4($a1)
    /* 6D5C 80140954 0800A48C */  lw         $a0, 0x8($a1)
    /* 6D60 80140958 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6D64 8014095C 1400A3AF */  sw         $v1, 0x14($sp)
    /* 6D68 80140960 1800A4AF */  sw         $a0, 0x18($sp)
    /* 6D6C 80140964 0C00A28C */  lw         $v0, 0xC($a1)
    /* 6D70 80140968 1000A38C */  lw         $v1, 0x10($a1)
    /* 6D74 8014096C 1400A48C */  lw         $a0, 0x14($a1)
    /* 6D78 80140970 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6D7C 80140974 2000A3AF */  sw         $v1, 0x20($sp)
    /* 6D80 80140978 2400A4AF */  sw         $a0, 0x24($sp)
    /* 6D84 8014097C 80100800 */  sll        $v0, $t0, 2
    /* 6D88 80140980 21104800 */  addu       $v0, $v0, $t0
    /* 6D8C 80140984 80100200 */  sll        $v0, $v0, 2
    /* 6D90 80140988 23104800 */  subu       $v0, $v0, $t0
    /* 6D94 8014098C 80180200 */  sll        $v1, $v0, 2
    /* 6D98 80140990 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 6D9C 80140994 21082300 */  addu       $at, $at, $v1
    /* 6DA0 80140998 902C20A0 */  sb         $zero, %lo(missile + 0x38)($at)
    /* 6DA4 8014099C 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* 6DA8 801409A0 00000000 */  nop
    /* 6DAC 801409A4 25004018 */  blez       $v0, .L80140A3C
    /* 6DB0 801409A8 21980000 */   addu      $s3, $zero, $zero
    /* 6DB4 801409AC 21000924 */  addiu      $t1, $zero, 0x21
    /* 6DB8 801409B0 21306000 */  addu       $a2, $v1, $zero
    /* 6DBC 801409B4 01000724 */  addiu      $a3, $zero, 0x1
    /* 6DC0 801409B8 1080053C */  lui        $a1, %hi(missileactive)
    /* 6DC4 801409BC 602AA524 */  addiu      $a1, $a1, %lo(missileactive)
  .L801409C0:
    /* 6DC8 801409C0 0000A384 */  lh         $v1, 0x0($a1)
    /* 6DCC 801409C4 00000000 */  nop
    /* 6DD0 801409C8 80100300 */  sll        $v0, $v1, 2
    /* 6DD4 801409CC 21104300 */  addu       $v0, $v0, $v1
    /* 6DD8 801409D0 80100200 */  sll        $v0, $v0, 2
    /* 6DDC 801409D4 23104300 */  subu       $v0, $v0, $v1
    /* 6DE0 801409D8 80200200 */  sll        $a0, $v0, 2
    /* 6DE4 801409DC 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 6DE8 801409E0 21082400 */  addu       $at, $at, $a0
    /* 6DEC 801409E4 882C2280 */  lb         $v0, %lo(missile + 0x30)($at)
    /* 6DF0 801409E8 00000000 */  nop
    /* 6DF4 801409EC 0E004914 */  bne        $v0, $t1, .L80140A28
    /* 6DF8 801409F0 00000000 */   nop
    /* 6DFC 801409F4 0C006810 */  beq        $v1, $t0, .L80140A28
    /* 6E00 801409F8 00000000 */   nop
    /* 6E04 801409FC 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 6E08 80140A00 21082400 */  addu       $at, $at, $a0
    /* 6E0C 80140A04 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* 6E10 80140A08 00000000 */  nop
    /* 6E14 80140A0C 06005714 */  bne        $v0, $s7, .L80140A28
    /* 6E18 80140A10 00000000 */   nop
    /* 6E1C 80140A14 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 6E20 80140A18 21082600 */  addu       $at, $at, $a2
    /* 6E24 80140A1C 902C27A0 */  sb         $a3, %lo(missile + 0x38)($at)
    /* 6E28 80140A20 04030508 */  j          .L80140C10
    /* 6E2C 80140A24 00000000 */   nop
  .L80140A28:
    /* 6E30 80140A28 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* 6E34 80140A2C 01007326 */  addiu      $s3, $s3, 0x1
    /* 6E38 80140A30 2A106202 */  slt        $v0, $s3, $v0
    /* 6E3C 80140A34 E2FF4014 */  bnez       $v0, .L801409C0
    /* 6E40 80140A38 0200A524 */   addiu     $a1, $a1, 0x2
  .L80140A3C:
    /* 6E44 80140A3C 21B00000 */  addu       $s6, $zero, $zero
    /* 6E48 80140A40 80100800 */  sll        $v0, $t0, 2
    /* 6E4C 80140A44 21104800 */  addu       $v0, $v0, $t0
    /* 6E50 80140A48 80100200 */  sll        $v0, $v0, 2
    /* 6E54 80140A4C 23104800 */  subu       $v0, $v0, $t0
    /* 6E58 80140A50 3800A2AF */  sw         $v0, 0x38($sp)
  .L80140A54:
    /* 6E5C 80140A54 0600C22A */  slti       $v0, $s6, 0x6
    /* 6E60 80140A58 6D004010 */  beqz       $v0, .L80140C10
    /* 6E64 80140A5C 80101600 */   sll       $v0, $s6, 2
    /* 6E68 80140A60 2110A203 */  addu       $v0, $sp, $v0
    /* 6E6C 80140A64 3800AA8F */  lw         $t2, 0x38($sp)
    /* 6E70 80140A68 1000428C */  lw         $v0, 0x10($v0)
    /* 6E74 80140A6C 80A80A00 */  sll        $s5, $t2, 2
    /* 6E78 80140A70 01005424 */  addiu      $s4, $v0, 0x1
    /* 6E7C 80140A74 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 6E80 80140A78 21082200 */  addu       $at, $at, $v0
    /* 6E84 80140A7C 54553390 */  lbu        $s3, %lo(CrawlTable)($at)
  .L80140A80:
    /* 6E88 80140A80 00000000 */  nop
    /* 6E8C 80140A84 6000601A */  blez       $s3, .L80140C08
    /* 6E90 80140A88 00000000 */   nop
    /* 6E94 80140A8C 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 6E98 80140A90 21083400 */  addu       $at, $at, $s4
    /* 6E9C 80140A94 54552280 */  lb         $v0, %lo(CrawlTable)($at)
    /* 6EA0 80140A98 3000AA8F */  lw         $t2, 0x30($sp)
    /* 6EA4 80140A9C 0D80013C */  lui        $at, %hi(CrawlTable + 0x1)
    /* 6EA8 80140AA0 21083400 */  addu       $at, $at, $s4
    /* 6EAC 80140AA4 55552380 */  lb         $v1, %lo(CrawlTable + 0x1)($at)
    /* 6EB0 80140AA8 21884201 */  addu       $s1, $t2, $v0
    /* 6EB4 80140AAC FFFF2226 */  addiu      $v0, $s1, -0x1
    /* 6EB8 80140AB0 8000AA8F */  lw         $t2, 0x80($sp)
    /* 6EBC 80140AB4 5F00422C */  sltiu      $v0, $v0, 0x5F
    /* 6EC0 80140AB8 50004010 */  beqz       $v0, .L80140BFC
    /* 6EC4 80140ABC 21904301 */   addu      $s2, $t2, $v1
    /* 6EC8 80140AC0 FFFF4226 */  addiu      $v0, $s2, -0x1
    /* 6ECC 80140AC4 5F00422C */  sltiu      $v0, $v0, 0x5F
    /* 6ED0 80140AC8 4C004010 */  beqz       $v0, .L80140BFC
    /* 6ED4 80140ACC 21800000 */   addu      $s0, $zero, $zero
    /* 6ED8 80140AD0 2120C003 */  addu       $a0, $fp, $zero
    /* 6EDC 80140AD4 2800A58F */  lw         $a1, 0x28($sp)
    /* 6EE0 80140AD8 21302002 */  addu       $a2, $s1, $zero
    /* 6EE4 80140ADC 1E55050C */  jal        LineClear__Fiiii
    /* 6EE8 80140AE0 21384002 */   addu      $a3, $s2, $zero
    /* 6EEC 80140AE4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 6EF0 80140AE8 17004010 */  beqz       $v0, .L80140B48
    /* 6EF4 80140AEC 21202002 */   addu      $a0, $s1, $zero
    /* 6EF8 80140AF0 380B020C */  jal        GetSOLID__Fii
    /* 6EFC 80140AF4 21284002 */   addu      $a1, $s2, $zero
    /* 6F00 80140AF8 21202002 */  addu       $a0, $s1, $zero
    /* 6F04 80140AFC 21284002 */  addu       $a1, $s2, $zero
    /* 6F08 80140B00 447F010C */  jal        IsDplayer__Fii
    /* 6F0C 80140B04 21804000 */   addu      $s0, $v0, $zero
    /* 6F10 80140B08 C0201200 */  sll        $a0, $s2, 3
    /* 6F14 80140B0C C0181100 */  sll        $v1, $s1, 3
    /* 6F18 80140B10 23187100 */  subu       $v1, $v1, $s1
    /* 6F1C 80140B14 C0190300 */  sll        $v1, $v1, 7
    /* 6F20 80140B18 21208300 */  addu       $a0, $a0, $v1
    /* 6F24 80140B1C FF004230 */  andi       $v0, $v0, 0xFF
    /* 6F28 80140B20 0E80013C */  lui        $at, %hi(dung_map)
    /* 6F2C 80140B24 21082400 */  addu       $at, $at, $a0
    /* 6F30 80140B28 287A2384 */  lh         $v1, %lo(dung_map)($at)
    /* 6F34 80140B2C 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 6F38 80140B30 21082400 */  addu       $at, $at, $a0
    /* 6F3C 80140B34 2B7A2480 */  lb         $a0, %lo(dung_map + 0x3)($at)
    /* 6F40 80140B38 25800302 */  or         $s0, $s0, $v1
    /* 6F44 80140B3C 25800402 */  or         $s0, $s0, $a0
    /* 6F48 80140B40 25800202 */  or         $s0, $s0, $v0
    /* 6F4C 80140B44 0100102E */  sltiu      $s0, $s0, 0x1
  .L80140B48:
    /* 6F50 80140B48 2C000012 */  beqz       $s0, .L80140BFC
    /* 6F54 80140B4C 40101700 */   sll       $v0, $s7, 1
    /* 6F58 80140B50 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 6F5C 80140B54 21083500 */  addu       $at, $at, $s5
    /* 6F60 80140B58 762C3EA4 */  sh         $fp, %lo(missile + 0x1E)($at)
    /* 6F64 80140B5C 21105700 */  addu       $v0, $v0, $s7
    /* 6F68 80140B60 80100200 */  sll        $v0, $v0, 2
    /* 6F6C 80140B64 21105700 */  addu       $v0, $v0, $s7
    /* 6F70 80140B68 2800AA97 */  lhu        $t2, 0x28($sp)
    /* 6F74 80140B6C C0200200 */  sll        $a0, $v0, 3
    /* 6F78 80140B70 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 6F7C 80140B74 21083500 */  addu       $at, $at, $s5
    /* 6F80 80140B78 782C2AA4 */  sh         $t2, %lo(missile + 0x20)($at)
    /* 6F84 80140B7C 3000AA97 */  lhu        $t2, 0x30($sp)
    /* 6F88 80140B80 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 6F8C 80140B84 21083500 */  addu       $at, $at, $s5
    /* 6F90 80140B88 7C2C2AA4 */  sh         $t2, %lo(missile + 0x24)($at)
    /* 6F94 80140B8C 8000AA97 */  lhu        $t2, 0x80($sp)
    /* 6F98 80140B90 1080013C */  lui        $at, %hi(missile + 0x26)
    /* 6F9C 80140B94 21083500 */  addu       $at, $at, $s5
    /* 6FA0 80140B98 7E2C2AA4 */  sh         $t2, %lo(missile + 0x26)($at)
    /* 6FA4 80140B9C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 6FA8 80140BA0 21082400 */  addu       $at, $at, $a0
    /* 6FAC 80140BA4 C8532380 */  lb         $v1, %lo(monster + 0x34)($at)
    /* 6FB0 80140BA8 01000224 */  addiu      $v0, $zero, 0x1
    /* 6FB4 80140BAC 07006214 */  bne        $v1, $v0, .L80140BCC
    /* 6FB8 80140BB0 00000000 */   nop
    /* 6FBC 80140BB4 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 6FC0 80140BB8 21082400 */  addu       $at, $at, $a0
    /* 6FC4 80140BBC C9532280 */  lb         $v0, %lo(monster + 0x35)($at)
    /* 6FC8 80140BC0 00000000 */  nop
    /* 6FCC 80140BC4 09004010 */  beqz       $v0, .L80140BEC
    /* 6FD0 80140BC8 2120E002 */   addu      $a0, $s7, $zero
  .L80140BCC:
    /* 6FD4 80140BCC 1280023C */  lui        $v0, %hi(myplr)
    /* 6FD8 80140BD0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 6FDC 80140BD4 00000000 */  nop
    /* 6FE0 80140BD8 0400E216 */  bne        $s7, $v0, .L80140BEC
    /* 6FE4 80140BDC 2120E002 */   addu      $a0, $s7, $zero
    /* 6FE8 80140BE0 F630050C */  jal        M_StartKill__Fii
    /* 6FEC 80140BE4 2128E002 */   addu      $a1, $s7, $zero
    /* 6FF0 80140BE8 2120E002 */  addu       $a0, $s7, $zero
  .L80140BEC:
    /* 6FF4 80140BEC C2DC010C */  jal        UseMana__Fii
    /* 6FF8 80140BF0 15000524 */   addiu     $a1, $zero, 0x15
    /* 6FFC 80140BF4 02030508 */  j          .L80140C08
    /* 7000 80140BF8 06001624 */   addiu     $s6, $zero, 0x6
  .L80140BFC:
    /* 7004 80140BFC 02009426 */  addiu      $s4, $s4, 0x2
    /* 7008 80140C00 A0020508 */  j          .L80140A80
    /* 700C 80140C04 FFFF7326 */   addiu     $s3, $s3, -0x1
  .L80140C08:
    /* 7010 80140C08 95020508 */  j          .L80140A54
    /* 7014 80140C0C 0100D626 */   addiu     $s6, $s6, 0x1
  .L80140C10:
    /* 7018 80140C10 6C00BF8F */  lw         $ra, 0x6C($sp)
    /* 701C 80140C14 6800BE8F */  lw         $fp, 0x68($sp)
    /* 7020 80140C18 6400B78F */  lw         $s7, 0x64($sp)
    /* 7024 80140C1C 6000B68F */  lw         $s6, 0x60($sp)
    /* 7028 80140C20 5C00B58F */  lw         $s5, 0x5C($sp)
    /* 702C 80140C24 5800B48F */  lw         $s4, 0x58($sp)
    /* 7030 80140C28 5400B38F */  lw         $s3, 0x54($sp)
    /* 7034 80140C2C 5000B28F */  lw         $s2, 0x50($sp)
    /* 7038 80140C30 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 703C 80140C34 4800B08F */  lw         $s0, 0x48($sp)
    /* 7040 80140C38 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 7044 80140C3C 0800E003 */  jr         $ra
    /* 7048 80140C40 00000000 */   nop
endlabel AddGolem__Fiiiiiicii
