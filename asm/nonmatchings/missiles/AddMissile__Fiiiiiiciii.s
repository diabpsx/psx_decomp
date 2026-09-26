.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddMissile__Fiiiiiiciii, 0x48C

glabel AddMissile__Fiiiiiiciii
    /* 8E0C 80142A04 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 8E10 80142A08 8000B6AF */  sw         $s6, 0x80($sp)
    /* 8E14 80142A0C A000B68F */  lw         $s6, 0xA0($sp)
    /* 8E18 80142A10 7800B4AF */  sw         $s4, 0x78($sp)
    /* 8E1C 80142A14 21A08000 */  addu       $s4, $a0, $zero
    /* 8E20 80142A18 7C00B5AF */  sw         $s5, 0x7C($sp)
    /* 8E24 80142A1C 21A8A000 */  addu       $s5, $a1, $zero
    /* 8E28 80142A20 8800BEAF */  sw         $fp, 0x88($sp)
    /* 8E2C 80142A24 21F0C000 */  addu       $fp, $a2, $zero
    /* 8E30 80142A28 8400B7AF */  sw         $s7, 0x84($sp)
    /* 8E34 80142A2C 21B8E000 */  addu       $s7, $a3, $zero
    /* 8E38 80142A30 6C00B1AF */  sw         $s1, 0x6C($sp)
    /* 8E3C 80142A34 A400B18F */  lw         $s1, 0xA4($sp)
    /* 8E40 80142A38 2800A727 */  addiu      $a3, $sp, 0x28
    /* 8E44 80142A3C 7000B2AF */  sw         $s2, 0x70($sp)
    /* 8E48 80142A40 AC00B28F */  lw         $s2, 0xAC($sp)
    /* 8E4C 80142A44 B400A98F */  lw         $t1, 0xB4($sp)
    /* 8E50 80142A48 1280063C */  lui        $a2, %hi(D_8011A080)
    /* 8E54 80142A4C 80A0C624 */  addiu      $a2, $a2, %lo(D_8011A080)
    /* 8E58 80142A50 7400B3AF */  sw         $s3, 0x74($sp)
    /* 8E5C 80142A54 A800B393 */  lbu        $s3, 0xA8($sp)
    /* 8E60 80142A58 4000C824 */  addiu      $t0, $a2, 0x40
    /* 8E64 80142A5C 8C00BFAF */  sw         $ra, 0x8C($sp)
    /* 8E68 80142A60 6800B0AF */  sw         $s0, 0x68($sp)
  .L80142A64:
    /* 8E6C 80142A64 0000C28C */  lw         $v0, 0x0($a2)
    /* 8E70 80142A68 0400C38C */  lw         $v1, 0x4($a2)
    /* 8E74 80142A6C 0800C48C */  lw         $a0, 0x8($a2)
    /* 8E78 80142A70 0C00C58C */  lw         $a1, 0xC($a2)
    /* 8E7C 80142A74 0000E2AC */  sw         $v0, 0x0($a3)
    /* 8E80 80142A78 0400E3AC */  sw         $v1, 0x4($a3)
    /* 8E84 80142A7C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 8E88 80142A80 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 8E8C 80142A84 1000C624 */  addiu      $a2, $a2, 0x10
    /* 8E90 80142A88 F6FFC814 */  bne        $a2, $t0, .L80142A64
    /* 8E94 80142A8C 1000E724 */   addiu     $a3, $a3, 0x10
    /* 8E98 80142A90 081B868F */  lw         $a2, %gp_rel(nummissiles)($gp)
    /* 8E9C 80142A94 00000000 */  nop
    /* 8EA0 80142A98 7D00C228 */  slti       $v0, $a2, 0x7D
    /* 8EA4 80142A9C 03004014 */  bnez       $v0, .L80142AAC
    /* 8EA8 80142AA0 002E1300 */   sll       $a1, $s3, 24
    /* 8EAC 80142AA4 970B0508 */  j          .L80142E5C
    /* 8EB0 80142AA8 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80142AAC:
    /* 8EB4 80142AAC 032E0500 */  sra        $a1, $a1, 24
    /* 8EB8 80142AB0 1080033C */  lui        $v1, %hi(missileavail)
    /* 8EBC 80142AB4 5C2B6324 */  addiu      $v1, $v1, %lo(missileavail)
    /* 8EC0 80142AB8 7C000224 */  addiu      $v0, $zero, 0x7C
    /* 8EC4 80142ABC 23104600 */  subu       $v0, $v0, $a2
    /* 8EC8 80142AC0 40100200 */  sll        $v0, $v0, 1
    /* 8ECC 80142AC4 21104300 */  addu       $v0, $v0, $v1
    /* 8ED0 80142AC8 00007084 */  lh         $s0, 0x0($v1)
    /* 8ED4 80142ACC 00004494 */  lhu        $a0, 0x0($v0)
    /* 8ED8 80142AD0 0100C224 */  addiu      $v0, $a2, 0x1
    /* 8EDC 80142AD4 081B82AF */  sw         $v0, %gp_rel(nummissiles)($gp)
    /* 8EE0 80142AD8 40100600 */  sll        $v0, $a2, 1
    /* 8EE4 80142ADC 000064A4 */  sh         $a0, 0x0($v1)
    /* 8EE8 80142AE0 1080013C */  lui        $at, %hi(missileactive)
    /* 8EEC 80142AE4 21082200 */  addu       $at, $at, $v0
    /* 8EF0 80142AE8 602A30A4 */  sh         $s0, %lo(missileactive)($at)
    /* 8EF4 80142AEC 80101000 */  sll        $v0, $s0, 2
    /* 8EF8 80142AF0 21105000 */  addu       $v0, $v0, $s0
    /* 8EFC 80142AF4 80100200 */  sll        $v0, $v0, 2
    /* 8F00 80142AF8 23105000 */  subu       $v0, $v0, $s0
    /* 8F04 80142AFC 80181100 */  sll        $v1, $s1, 2
    /* 8F08 80142B00 0D80013C */  lui        $at, %hi(MissPrintRoutines)
    /* 8F0C 80142B04 21082300 */  addu       $at, $at, $v1
    /* 8F10 80142B08 506E238C */  lw         $v1, %lo(MissPrintRoutines)($at)
    /* 8F14 80142B0C 80100200 */  sll        $v0, $v0, 2
    /* 8F18 80142B10 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 8F1C 80142B14 21082200 */  addu       $at, $at, $v0
    /* 8F20 80142B18 882C31A0 */  sb         $s1, %lo(missile + 0x30)($at)
    /* 8F24 80142B1C 1080013C */  lui        $at, %hi(missile + 0x1A)
    /* 8F28 80142B20 21082200 */  addu       $at, $at, $v0
    /* 8F2C 80142B24 722C25A4 */  sh         $a1, %lo(missile + 0x1A)($at)
    /* 8F30 80142B28 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 8F34 80142B2C 21082200 */  addu       $at, $at, $v0
    /* 8F38 80142B30 862C32A4 */  sh         $s2, %lo(missile + 0x2E)($at)
    /* 8F3C 80142B34 1080013C */  lui        $at, %hi(missile + 0x48)
    /* 8F40 80142B38 21082200 */  addu       $at, $at, $v0
    /* 8F44 80142B3C A02C23AC */  sw         $v1, %lo(missile + 0x48)($at)
    /* 8F48 80142B40 40181100 */  sll        $v1, $s1, 1
    /* 8F4C 80142B44 21187100 */  addu       $v1, $v1, $s1
    /* 8F50 80142B48 C0180300 */  sll        $v1, $v1, 3
    /* 8F54 80142B4C 0D80013C */  lui        $at, %hi(missiledata + 0xF)
    /* 8F58 80142B50 21082300 */  addu       $at, $at, $v1
    /* 8F5C 80142B54 FF672490 */  lbu        $a0, %lo(missiledata + 0xF)($at)
    /* 8F60 80142B58 1080013C */  lui        $at, %hi(missile + 0x37)
    /* 8F64 80142B5C 21082200 */  addu       $at, $at, $v0
    /* 8F68 80142B60 8F2C24A0 */  sb         $a0, %lo(missile + 0x37)($at)
    /* 8F6C 80142B64 0D80013C */  lui        $at, %hi(missiledata + 0xC)
    /* 8F70 80142B68 21082300 */  addu       $at, $at, $v1
    /* 8F74 80142B6C FC672390 */  lbu        $v1, %lo(missiledata + 0xC)($at)
    /* 8F78 80142B70 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 8F7C 80142B74 21082200 */  addu       $at, $at, $v0
    /* 8F80 80142B78 982C29A0 */  sb         $t1, %lo(missile + 0x40)($at)
    /* 8F84 80142B7C 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* 8F88 80142B80 21082200 */  addu       $at, $at, $v0
    /* 8F8C 80142B84 972C36A0 */  sb         $s6, %lo(missile + 0x3F)($at)
    /* 8F90 80142B88 1080013C */  lui        $at, %hi(missile + 0x3A)
    /* 8F94 80142B8C 21082200 */  addu       $at, $at, $v0
    /* 8F98 80142B90 922C23A0 */  sb         $v1, %lo(missile + 0x3A)($at)
    /* 8F9C 80142B94 1080013C */  lui        $at, %hi(missile + 0x37)
    /* 8FA0 80142B98 21082200 */  addu       $at, $at, $v0
    /* 8FA4 80142B9C 8F2C2390 */  lbu        $v1, %lo(missile + 0x37)($at)
    /* 8FA8 80142BA0 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 8FAC 80142BA4 0B006210 */  beq        $v1, $v0, .L80142BD4
    /* 8FB0 80142BA8 80100300 */   sll       $v0, $v1, 2
    /* 8FB4 80142BAC 21104300 */  addu       $v0, $v0, $v1
    /* 8FB8 80142BB0 0D80013C */  lui        $at, %hi(misfiledata + 0x1)
    /* 8FBC 80142BB4 21082200 */  addu       $at, $at, $v0
    /* 8FC0 80142BB8 616F2290 */  lbu        $v0, %lo(misfiledata + 0x1)($at)
    /* 8FC4 80142BBC 00000000 */  nop
    /* 8FC8 80142BC0 0800422C */  sltiu      $v0, $v0, 0x8
    /* 8FCC 80142BC4 04004014 */  bnez       $v0, .L80142BD8
    /* 8FD0 80142BC8 21200002 */   addu      $a0, $s0, $zero
    /* 8FD4 80142BCC F70A0508 */  j          .L80142BDC
    /* 8FD8 80142BD0 2128C002 */   addu      $a1, $s6, $zero
  .L80142BD4:
    /* 8FDC 80142BD4 21200002 */  addu       $a0, $s0, $zero
  .L80142BD8:
    /* 8FE0 80142BD8 21280000 */  addu       $a1, $zero, $zero
  .L80142BDC:
    /* 8FE4 80142BDC 09F5040C */  jal        SetMissDir__Fii
    /* 8FE8 80142BE0 00000000 */   nop
    /* 8FEC 80142BE4 80101000 */  sll        $v0, $s0, 2
    /* 8FF0 80142BE8 21105000 */  addu       $v0, $v0, $s0
    /* 8FF4 80142BEC 80100200 */  sll        $v0, $v0, 2
    /* 8FF8 80142BF0 23105000 */  subu       $v0, $v0, $s0
    /* 8FFC 80142BF4 80300200 */  sll        $a2, $v0, 2
    /* 9000 80142BF8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 9004 80142BFC 21082600 */  addu       $at, $at, $a2
    /* 9008 80142C00 892C34A0 */  sb         $s4, %lo(missile + 0x31)($at)
    /* 900C 80142C04 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 9010 80142C08 21082600 */  addu       $at, $at, $a2
    /* 9014 80142C0C 8A2C35A0 */  sb         $s5, %lo(missile + 0x32)($at)
    /* 9018 80142C10 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 901C 80142C14 21082600 */  addu       $at, $at, $a2
    /* 9020 80142C18 8D2C34A0 */  sb         $s4, %lo(missile + 0x35)($at)
    /* 9024 80142C1C 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 9028 80142C20 21082600 */  addu       $at, $at, $a2
    /* 902C 80142C24 8E2C35A0 */  sb         $s5, %lo(missile + 0x36)($at)
    /* 9030 80142C28 30006016 */  bnez       $s3, .L80142CEC
    /* 9034 80142C2C 80101000 */   sll       $v0, $s0, 2
    /* 9038 80142C30 2C000224 */  addiu      $v0, $zero, 0x2C
    /* 903C 80142C34 2C002212 */  beq        $s1, $v0, .L80142CE8
    /* 9040 80142C38 31000224 */   addiu     $v0, $zero, 0x31
    /* 9044 80142C3C 2A002212 */  beq        $s1, $v0, .L80142CE8
    /* 9048 80142C40 40101200 */   sll       $v0, $s2, 1
    /* 904C 80142C44 21105200 */  addu       $v0, $v0, $s2
    /* 9050 80142C48 80100200 */  sll        $v0, $v0, 2
    /* 9054 80142C4C 21105200 */  addu       $v0, $v0, $s2
    /* 9058 80142C50 00110200 */  sll        $v0, $v0, 4
    /* 905C 80142C54 23105200 */  subu       $v0, $v0, $s2
    /* 9060 80142C58 80100200 */  sll        $v0, $v0, 2
    /* 9064 80142C5C 21105200 */  addu       $v0, $v0, $s2
    /* 9068 80142C60 C0100200 */  sll        $v0, $v0, 3
    /* 906C 80142C64 2800A527 */  addiu      $a1, $sp, 0x28
    /* 9070 80142C68 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* 9074 80142C6C 21082200 */  addu       $at, $at, $v0
    /* 9078 80142C70 7AA52480 */  lb         $a0, %lo(plr + 0x42)($at)
    /* 907C 80142C74 0E80013C */  lui        $at, %hi(plr + 0x3C)
    /* 9080 80142C78 21082200 */  addu       $at, $at, $v0
    /* 9084 80142C7C 74A52380 */  lb         $v1, %lo(plr + 0x3C)($at)
    /* 9088 80142C80 C0200400 */  sll        $a0, $a0, 3
    /* 908C 80142C84 21208500 */  addu       $a0, $a0, $a1
    /* 9090 80142C88 0000848C */  lw         $a0, 0x0($a0)
    /* 9094 80142C8C 00000000 */  nop
    /* 9098 80142C90 21186400 */  addu       $v1, $v1, $a0
    /* 909C 80142C94 43180300 */  sra        $v1, $v1, 1
    /* 90A0 80142C98 1080013C */  lui        $at, %hi(missile + 0x28)
    /* 90A4 80142C9C 21082600 */  addu       $at, $at, $a2
    /* 90A8 80142CA0 802C23A4 */  sh         $v1, %lo(missile + 0x28)($at)
    /* 90AC 80142CA4 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* 90B0 80142CA8 21082200 */  addu       $at, $at, $v0
    /* 90B4 80142CAC 7AA52380 */  lb         $v1, %lo(plr + 0x42)($at)
    /* 90B8 80142CB0 0E80013C */  lui        $at, %hi(plr + 0x3D)
    /* 90BC 80142CB4 21082200 */  addu       $at, $at, $v0
    /* 90C0 80142CB8 75A52280 */  lb         $v0, %lo(plr + 0x3D)($at)
    /* 90C4 80142CBC C0180300 */  sll        $v1, $v1, 3
    /* 90C8 80142CC0 21186500 */  addu       $v1, $v1, $a1
    /* 90CC 80142CC4 0400638C */  lw         $v1, 0x4($v1)
    /* 90D0 80142CC8 00000000 */  nop
    /* 90D4 80142CCC 21104300 */  addu       $v0, $v0, $v1
    /* 90D8 80142CD0 43100200 */  sra        $v0, $v0, 1
    /* 90DC 80142CD4 1080013C */  lui        $at, %hi(missile + 0x2A)
    /* 90E0 80142CD8 21082600 */  addu       $at, $at, $a2
    /* 90E4 80142CDC 822C22A4 */  sh         $v0, %lo(missile + 0x2A)($at)
    /* 90E8 80142CE0 460B0508 */  j          .L80142D18
    /* 90EC 80142CE4 80101000 */   sll       $v0, $s0, 2
  .L80142CE8:
    /* 90F0 80142CE8 80101000 */  sll        $v0, $s0, 2
  .L80142CEC:
    /* 90F4 80142CEC 21105000 */  addu       $v0, $v0, $s0
    /* 90F8 80142CF0 80100200 */  sll        $v0, $v0, 2
    /* 90FC 80142CF4 23105000 */  subu       $v0, $v0, $s0
    /* 9100 80142CF8 80100200 */  sll        $v0, $v0, 2
    /* 9104 80142CFC 1080013C */  lui        $at, %hi(missile + 0x28)
    /* 9108 80142D00 21082200 */  addu       $at, $at, $v0
    /* 910C 80142D04 802C20A4 */  sh         $zero, %lo(missile + 0x28)($at)
    /* 9110 80142D08 1080013C */  lui        $at, %hi(missile + 0x2A)
    /* 9114 80142D0C 21082200 */  addu       $at, $at, $v0
    /* 9118 80142D10 822C20A4 */  sh         $zero, %lo(missile + 0x2A)($at)
    /* 911C 80142D14 80101000 */  sll        $v0, $s0, 2
  .L80142D18:
    /* 9120 80142D18 21105000 */  addu       $v0, $v0, $s0
    /* 9124 80142D1C 80100200 */  sll        $v0, $v0, 2
    /* 9128 80142D20 23105000 */  subu       $v0, $v0, $s0
    /* 912C 80142D24 80180200 */  sll        $v1, $v0, 2
    /* 9130 80142D28 01000224 */  addiu      $v0, $zero, 0x1
    /* 9134 80142D2C 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 9138 80142D30 21082300 */  addu       $at, $at, $v1
    /* 913C 80142D34 602C20AC */  sw         $zero, %lo(missile + 0x8)($at)
    /* 9140 80142D38 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 9144 80142D3C 21082300 */  addu       $at, $at, $v1
    /* 9148 80142D40 642C20AC */  sw         $zero, %lo(missile + 0xC)($at)
    /* 914C 80142D44 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 9150 80142D48 21082300 */  addu       $at, $at, $v1
    /* 9154 80142D4C 8B2C20A0 */  sb         $zero, %lo(missile + 0x33)($at)
    /* 9158 80142D50 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 915C 80142D54 21082300 */  addu       $at, $at, $v1
    /* 9160 80142D58 8C2C20A0 */  sb         $zero, %lo(missile + 0x34)($at)
    /* 9164 80142D5C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 9168 80142D60 21082300 */  addu       $at, $at, $v1
    /* 916C 80142D64 902C20A0 */  sb         $zero, %lo(missile + 0x38)($at)
    /* 9170 80142D68 1080013C */  lui        $at, %hi(missile + 0x46)
    /* 9174 80142D6C 21082300 */  addu       $at, $at, $v1
    /* 9178 80142D70 9E2C22A0 */  sb         $v0, %lo(missile + 0x46)($at)
    /* 917C 80142D74 1080013C */  lui        $at, %hi(missile + 0x3B)
    /* 9180 80142D78 21082300 */  addu       $at, $at, $v1
    /* 9184 80142D7C 932C20A0 */  sb         $zero, %lo(missile + 0x3B)($at)
    /* 9188 80142D80 1080013C */  lui        $at, %hi(missile + 0x3C)
    /* 918C 80142D84 21082300 */  addu       $at, $at, $v1
    /* 9190 80142D88 942C20A0 */  sb         $zero, %lo(missile + 0x3C)($at)
    /* 9194 80142D8C B000AA8F */  lw         $t2, 0xB0($sp)
    /* 9198 80142D90 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 919C 80142D94 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 91A0 80142D98 21082300 */  addu       $at, $at, $v1
    /* 91A4 80142D9C 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 91A8 80142DA0 40101100 */  sll        $v0, $s1, 1
    /* 91AC 80142DA4 21105100 */  addu       $v0, $v0, $s1
    /* 91B0 80142DA8 C0880200 */  sll        $s1, $v0, 3
    /* 91B4 80142DAC 1080013C */  lui        $at, %hi(missile + 0x3D)
    /* 91B8 80142DB0 21082300 */  addu       $at, $at, $v1
    /* 91BC 80142DB4 952C20A0 */  sb         $zero, %lo(missile + 0x3D)($at)
    /* 91C0 80142DB8 1080013C */  lui        $at, %hi(missile + 0x1C)
    /* 91C4 80142DBC 21082300 */  addu       $at, $at, $v1
    /* 91C8 80142DC0 742C20A4 */  sh         $zero, %lo(missile + 0x1C)($at)
    /* 91CC 80142DC4 1080013C */  lui        $at, %hi(missile + 0x14)
    /* 91D0 80142DC8 21082300 */  addu       $at, $at, $v1
    /* 91D4 80142DCC 6C2C20AC */  sw         $zero, %lo(missile + 0x14)($at)
    /* 91D8 80142DD0 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 91DC 80142DD4 21082300 */  addu       $at, $at, $v1
    /* 91E0 80142DD8 682C2AAC */  sw         $t2, %lo(missile + 0x10)($at)
    /* 91E4 80142DDC 0D80013C */  lui        $at, %hi(missiledata + 0x10)
    /* 91E8 80142DE0 21083100 */  addu       $at, $at, $s1
    /* 91EC 80142DE4 0068248C */  lw         $a0, %lo(missiledata + 0x10)($at)
    /* 91F0 80142DE8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 91F4 80142DEC 09008210 */  beq        $a0, $v0, .L80142E14
    /* 91F8 80142DF0 00000000 */   nop
    /* 91FC 80142DF4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 9200 80142DF8 21082300 */  addu       $at, $at, $v1
    /* 9204 80142DFC 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* 9208 80142E00 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 920C 80142E04 21082300 */  addu       $at, $at, $v1
    /* 9210 80142E08 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* 9214 80142E0C E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 9218 80142E10 00000000 */   nop
  .L80142E14:
    /* 921C 80142E14 21200002 */  addu       $a0, $s0, $zero
    /* 9220 80142E18 21288002 */  addu       $a1, $s4, $zero
    /* 9224 80142E1C 2130A002 */  addu       $a2, $s5, $zero
    /* 9228 80142E20 00161300 */  sll        $v0, $s3, 24
    /* 922C 80142E24 B000AA8F */  lw         $t2, 0xB0($sp)
    /* 9230 80142E28 03160200 */  sra        $v0, $v0, 24
    /* 9234 80142E2C 1000B7AF */  sw         $s7, 0x10($sp)
    /* 9238 80142E30 1400B6AF */  sw         $s6, 0x14($sp)
    /* 923C 80142E34 1800A2AF */  sw         $v0, 0x18($sp)
    /* 9240 80142E38 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 9244 80142E3C 2000AAAF */  sw         $t2, 0x20($sp)
    /* 9248 80142E40 0D80013C */  lui        $at, %hi(missiledata + 0x4)
    /* 924C 80142E44 21083100 */  addu       $at, $at, $s1
    /* 9250 80142E48 F467228C */  lw         $v0, %lo(missiledata + 0x4)($at)
    /* 9254 80142E4C 00000000 */  nop
    /* 9258 80142E50 09F84000 */  jalr       $v0
    /* 925C 80142E54 2138C003 */   addu      $a3, $fp, $zero
    /* 9260 80142E58 21100002 */  addu       $v0, $s0, $zero
  .L80142E5C:
    /* 9264 80142E5C 8C00BF8F */  lw         $ra, 0x8C($sp)
    /* 9268 80142E60 8800BE8F */  lw         $fp, 0x88($sp)
    /* 926C 80142E64 8400B78F */  lw         $s7, 0x84($sp)
    /* 9270 80142E68 8000B68F */  lw         $s6, 0x80($sp)
    /* 9274 80142E6C 7C00B58F */  lw         $s5, 0x7C($sp)
    /* 9278 80142E70 7800B48F */  lw         $s4, 0x78($sp)
    /* 927C 80142E74 7400B38F */  lw         $s3, 0x74($sp)
    /* 9280 80142E78 7000B28F */  lw         $s2, 0x70($sp)
    /* 9284 80142E7C 6C00B18F */  lw         $s1, 0x6C($sp)
    /* 9288 80142E80 6800B08F */  lw         $s0, 0x68($sp)
    /* 928C 80142E84 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 9290 80142E88 0800E003 */  jr         $ra
    /* 9294 80142E8C 00000000 */   nop
endlabel AddMissile__Fiiiiiiciii
