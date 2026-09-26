.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching read_card_directory__Fi, 0x25C

glabel read_card_directory__Fi
    /* 8DA0 80142998 68FFBD27 */  addiu      $sp, $sp, -0x98
    /* 8DA4 8014299C 8400B5AF */  sw         $s5, 0x84($sp)
    /* 8DA8 801429A0 21A88000 */  addu       $s5, $a0, $zero
    /* 8DAC 801429A4 7000B0AF */  sw         $s0, 0x70($sp)
    /* 8DB0 801429A8 80801500 */  sll        $s0, $s5, 2
    /* 8DB4 801429AC 21101502 */  addu       $v0, $s0, $s5
    /* 8DB8 801429B0 C0110200 */  sll        $v0, $v0, 7
    /* 8DBC 801429B4 1280063C */  lui        $a2, %hi(mem_card_event_handler)
    /* 8DC0 801429B8 74B1C68C */  lw         $a2, %lo(mem_card_event_handler)($a2)
    /* 8DC4 801429BC 1480033C */  lui        $v1, %hi(card_dir)
    /* 8DC8 801429C0 F8E16324 */  addiu      $v1, $v1, %lo(card_dir)
    /* 8DCC 801429C4 7400B1AF */  sw         $s1, 0x74($sp)
    /* 8DD0 801429C8 21884300 */  addu       $s1, $v0, $v1
    /* 8DD4 801429CC 9400BFAF */  sw         $ra, 0x94($sp)
    /* 8DD8 801429D0 9000BEAF */  sw         $fp, 0x90($sp)
    /* 8DDC 801429D4 8C00B7AF */  sw         $s7, 0x8C($sp)
    /* 8DE0 801429D8 8800B6AF */  sw         $s6, 0x88($sp)
    /* 8DE4 801429DC 8000B4AF */  sw         $s4, 0x80($sp)
    /* 8DE8 801429E0 7C00B3AF */  sw         $s3, 0x7C($sp)
    /* 8DEC 801429E4 0400C010 */  beqz       $a2, .L801429F8
    /* 8DF0 801429E8 7800B2AF */   sw        $s2, 0x78($sp)
    /* 8DF4 801429EC 21200000 */  addu       $a0, $zero, $zero
    /* 8DF8 801429F0 09F8C000 */  jalr       $a2
    /* 8DFC 801429F4 2128A002 */   addu      $a1, $s5, $zero
  .L801429F8:
    /* 8E00 801429F8 1280013C */  lui        $at, %hi(card_usable)
    /* 8E04 801429FC 21083000 */  addu       $at, $at, $s0
    /* 8E08 80142A00 E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 8E0C 80142A04 00000000 */  nop
    /* 8E10 80142A08 5D004010 */  beqz       $v0, .L80142B80
    /* 8E14 80142A0C 1000A427 */   addiu     $a0, $sp, 0x10
    /* 8E18 80142A10 1280053C */  lui        $a1, %hi(D_8011B3CC)
    /* 8E1C 80142A14 CCB3A524 */  addiu      $a1, $a1, %lo(D_8011B3CC)
    /* 8E20 80142A18 9767000C */  jal        sprintf
    /* 8E24 80142A1C 2130A002 */   addu      $a2, $s5, $zero
    /* 8E28 80142A20 1280023C */  lui        $v0, %hi(card_files)
    /* 8E2C 80142A24 ECB34224 */  addiu      $v0, $v0, %lo(card_files)
    /* 8E30 80142A28 21800202 */  addu       $s0, $s0, $v0
    /* 8E34 80142A2C 000000AE */  sw         $zero, 0x0($s0)
    /* 8E38 80142A30 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8E3C 80142A34 8346000C */  jal        firstfile
    /* 8E40 80142A38 21282002 */   addu      $a1, $s1, $zero
    /* 8E44 80142A3C 0B004010 */  beqz       $v0, .L80142A6C
    /* 8E48 80142A40 80A01500 */   sll       $s4, $s5, 2
    /* 8E4C 80142A44 28003126 */  addiu      $s1, $s1, 0x28
  .L80142A48:
    /* 8E50 80142A48 0000028E */  lw         $v0, 0x0($s0)
    /* 8E54 80142A4C 21202002 */  addu       $a0, $s1, $zero
    /* 8E58 80142A50 01004224 */  addiu      $v0, $v0, 0x1
    /* 8E5C 80142A54 8746000C */  jal        nextfile
    /* 8E60 80142A58 000002AE */   sw        $v0, 0x0($s0)
    /* 8E64 80142A5C FAFF4014 */  bnez       $v0, .L80142A48
    /* 8E68 80142A60 28003126 */   addiu     $s1, $s1, 0x28
    /* 8E6C 80142A64 D8FF3126 */  addiu      $s1, $s1, -0x28
    /* 8E70 80142A68 80A01500 */  sll        $s4, $s5, 2
  .L80142A6C:
    /* 8E74 80142A6C 1280013C */  lui        $at, %hi(card_files)
    /* 8E78 80142A70 21083400 */  addu       $at, $at, $s4
    /* 8E7C 80142A74 ECB3228C */  lw         $v0, %lo(card_files)($at)
    /* 8E80 80142A78 00000000 */  nop
    /* 8E84 80142A7C 50004018 */  blez       $v0, .L80142BC0
    /* 8E88 80142A80 21980000 */   addu      $s3, $zero, $zero
    /* 8E8C 80142A84 FFFF1E24 */  addiu      $fp, $zero, -0x1
    /* 8E90 80142A88 40431500 */  sll        $t0, $s5, 13
    /* 8E94 80142A8C 6000A8AF */  sw         $t0, 0x60($sp)
    /* 8E98 80142A90 21B80000 */  addu       $s7, $zero, $zero
  .L80142A94:
    /* 8E9C 80142A94 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8EA0 80142A98 1480053C */  lui        $a1, %hi(D_8013E1EC)
    /* 8EA4 80142A9C ECE1A524 */  addiu      $a1, $a1, %lo(D_8013E1EC)
    /* 8EA8 80142AA0 2130A002 */  addu       $a2, $s5, $zero
    /* 8EAC 80142AA4 21B08002 */  addu       $s6, $s4, $zero
    /* 8EB0 80142AA8 2110D502 */  addu       $v0, $s6, $s5
    /* 8EB4 80142AAC C0110200 */  sll        $v0, $v0, 7
    /* 8EB8 80142AB0 1480073C */  lui        $a3, %hi(card_dir)
    /* 8EBC 80142AB4 F8E1E724 */  addiu      $a3, $a3, %lo(card_dir)
    /* 8EC0 80142AB8 2138E702 */  addu       $a3, $s7, $a3
    /* 8EC4 80142ABC 9767000C */  jal        sprintf
    /* 8EC8 80142AC0 21384700 */   addu      $a3, $v0, $a3
    /* 8ECC 80142AC4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8ED0 80142AC8 6F46000C */  jal        open
    /* 8ED4 80142ACC 01000524 */   addiu     $a1, $zero, 0x1
    /* 8ED8 80142AD0 21884000 */  addu       $s1, $v0, $zero
    /* 8EDC 80142AD4 18003E12 */  beq        $s1, $fp, .L80142B38
    /* 8EE0 80142AD8 21202002 */   addu      $a0, $s1, $zero
    /* 8EE4 80142ADC 40821300 */  sll        $s0, $s3, 9
    /* 8EE8 80142AE0 1480023C */  lui        $v0, %hi(card_header)
    /* 8EEC 80142AE4 F8E64224 */  addiu      $v0, $v0, %lo(card_header)
    /* 8EF0 80142AE8 21800202 */  addu       $s0, $s0, $v0
    /* 8EF4 80142AEC 6000A88F */  lw         $t0, 0x60($sp)
    /* 8EF8 80142AF0 00020624 */  addiu      $a2, $zero, 0x200
    /* 8EFC 80142AF4 21801001 */  addu       $s0, $t0, $s0
    /* 8F00 80142AF8 7346000C */  jal        read
    /* 8F04 80142AFC 21280002 */   addu      $a1, $s0, $zero
    /* 8F08 80142B00 04001026 */  addiu      $s0, $s0, 0x4
    /* 8F0C 80142B04 21200002 */  addu       $a0, $s0, $zero
    /* 8F10 80142B08 40000524 */  addiu      $a1, $zero, 0x40
    /* 8F14 80142B0C BE09050C */  jal        endian_swap__FPUci
    /* 8F18 80142B10 21904000 */   addu      $s2, $v0, $zero
    /* 8F1C 80142B14 21200002 */  addu       $a0, $s0, $zero
    /* 8F20 80142B18 440A050C */  jal        sjis_to_ascii__FPUsPc
    /* 8F24 80142B1C 21288000 */   addu      $a1, $a0, $zero
    /* 8F28 80142B20 7B46000C */  jal        close
    /* 8F2C 80142B24 21202002 */   addu      $a0, $s1, $zero
    /* 8F30 80142B28 03003E12 */  beq        $s1, $fp, .L80142B38
    /* 8F34 80142B2C 00000000 */   nop
    /* 8F38 80142B30 07005E16 */  bne        $s2, $fp, .L80142B50
    /* 8F3C 80142B34 01000224 */   addiu     $v0, $zero, 0x1
  .L80142B38:
    /* 8F40 80142B38 A495020C */  jal        card_removed__Fi
    /* 8F44 80142B3C 2120A002 */   addu      $a0, $s5, $zero
    /* 8F48 80142B40 ED99020C */  jal        PantsDelay__Fv
    /* 8F4C 80142B44 00000000 */   nop
    /* 8F50 80142B48 F00A0508 */  j          .L80142BC0
    /* 8F54 80142B4C 00000000 */   nop
  .L80142B50:
    /* 8F58 80142B50 1280013C */  lui        $at, %hi(card_changed)
    /* 8F5C 80142B54 21083400 */  addu       $at, $at, $s4
    /* 8F60 80142B58 F4B322AC */  sw         $v0, %lo(card_changed)($at)
    /* 8F64 80142B5C 1280013C */  lui        $at, %hi(card_files)
    /* 8F68 80142B60 21083600 */  addu       $at, $at, $s6
    /* 8F6C 80142B64 ECB3228C */  lw         $v0, %lo(card_files)($at)
    /* 8F70 80142B68 01007326 */  addiu      $s3, $s3, 0x1
    /* 8F74 80142B6C 2A106202 */  slt        $v0, $s3, $v0
    /* 8F78 80142B70 C8FF4014 */  bnez       $v0, .L80142A94
    /* 8F7C 80142B74 2800F726 */   addiu     $s7, $s7, 0x28
    /* 8F80 80142B78 F00A0508 */  j          .L80142BC0
    /* 8F84 80142B7C 00000000 */   nop
  .L80142B80:
    /* 8F88 80142B80 5C0C828F */  lw         $v0, %gp_rel(card_status)($gp)
    /* 8F8C 80142B84 03000324 */  addiu      $v1, $zero, 0x3
    /* 8F90 80142B88 05004310 */  beq        $v0, $v1, .L80142BA0
    /* 8F94 80142B8C 01000224 */   addiu     $v0, $zero, 0x1
    /* 8F98 80142B90 600C828F */  lw         $v0, %gp_rel(card_status + 0x4)($gp)
    /* 8F9C 80142B94 00000000 */  nop
    /* 8FA0 80142B98 09004314 */  bne        $v0, $v1, .L80142BC0
    /* 8FA4 80142B9C 01000224 */   addiu     $v0, $zero, 0x1
  .L80142BA0:
    /* 8FA8 80142BA0 0500A216 */  bne        $s5, $v0, .L80142BB8
    /* 8FAC 80142BA4 00000000 */   nop
    /* 8FB0 80142BA8 1280013C */  lui        $at, %hi(card_dirty)
    /* 8FB4 80142BAC E8B122AC */  sw         $v0, %lo(card_dirty)($at)
    /* 8FB8 80142BB0 F00A0508 */  j          .L80142BC0
    /* 8FBC 80142BB4 00000000 */   nop
  .L80142BB8:
    /* 8FC0 80142BB8 1280013C */  lui        $at, %hi(card_dirty + 0x4)
    /* 8FC4 80142BBC ECB122AC */  sw         $v0, %lo(card_dirty + 0x4)($at)
  .L80142BC0:
    /* 8FC8 80142BC0 9400BF8F */  lw         $ra, 0x94($sp)
    /* 8FCC 80142BC4 9000BE8F */  lw         $fp, 0x90($sp)
    /* 8FD0 80142BC8 8C00B78F */  lw         $s7, 0x8C($sp)
    /* 8FD4 80142BCC 8800B68F */  lw         $s6, 0x88($sp)
    /* 8FD8 80142BD0 8400B58F */  lw         $s5, 0x84($sp)
    /* 8FDC 80142BD4 8000B48F */  lw         $s4, 0x80($sp)
    /* 8FE0 80142BD8 7C00B38F */  lw         $s3, 0x7C($sp)
    /* 8FE4 80142BDC 7800B28F */  lw         $s2, 0x78($sp)
    /* 8FE8 80142BE0 7400B18F */  lw         $s1, 0x74($sp)
    /* 8FEC 80142BE4 7000B08F */  lw         $s0, 0x70($sp)
    /* 8FF0 80142BE8 9800BD27 */  addiu      $sp, $sp, 0x98
    /* 8FF4 80142BEC 0800E003 */  jr         $ra
    /* 8FF8 80142BF0 00000000 */   nop
endlabel read_card_directory__Fi
