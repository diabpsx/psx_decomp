.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuSetReverbModeParam, 0x4D4

glabel SpuSetReverbModeParam
    /* 7BEC 80017BEC 78FFBD27 */  addiu      $sp, $sp, -0x88
    /* 7BF0 80017BF0 6800B2AF */  sw         $s2, 0x68($sp)
    /* 7BF4 80017BF4 21908000 */  addu       $s2, $a0, $zero
    /* 7BF8 80017BF8 7C00B7AF */  sw         $s7, 0x7C($sp)
    /* 7BFC 80017BFC 21B80000 */  addu       $s7, $zero, $zero
    /* 7C00 80017C00 7000B4AF */  sw         $s4, 0x70($sp)
    /* 7C04 80017C04 21A00000 */  addu       $s4, $zero, $zero
    /* 7C08 80017C08 7800B6AF */  sw         $s6, 0x78($sp)
    /* 7C0C 80017C0C 21B00000 */  addu       $s6, $zero, $zero
    /* 7C10 80017C10 8400BFAF */  sw         $ra, 0x84($sp)
    /* 7C14 80017C14 8000BEAF */  sw         $fp, 0x80($sp)
    /* 7C18 80017C18 7400B5AF */  sw         $s5, 0x74($sp)
    /* 7C1C 80017C1C 6C00B3AF */  sw         $s3, 0x6C($sp)
    /* 7C20 80017C20 6400B1AF */  sw         $s1, 0x64($sp)
    /* 7C24 80017C24 6000B0AF */  sw         $s0, 0x60($sp)
    /* 7C28 80017C28 5800A0AF */  sw         $zero, 0x58($sp)
    /* 7C2C 80017C2C 0000538E */  lw         $s3, 0x0($s2)
    /* 7C30 80017C30 21F00000 */  addu       $fp, $zero, $zero
    /* 7C34 80017C34 0100752E */  sltiu      $s5, $s3, 0x1
    /* 7C38 80017C38 0400A016 */  bnez       $s5, .L80017C4C
    /* 7C3C 80017C3C 1000A0AF */   sw        $zero, 0x10($sp)
    /* 7C40 80017C40 01006232 */  andi       $v0, $s3, 0x1
    /* 7C44 80017C44 43004010 */  beqz       $v0, .L80017D54
    /* 7C48 80017C48 00000000 */   nop
  .L80017C4C:
    /* 7C4C 80017C4C 0400508E */  lw         $s0, 0x4($s2)
    /* 7C50 80017C50 00000000 */  nop
    /* 7C54 80017C54 00010232 */  andi       $v0, $s0, 0x100
    /* 7C58 80017C58 04004010 */  beqz       $v0, .L80017C6C
    /* 7C5C 80017C5C FFFE0224 */   addiu     $v0, $zero, -0x101
    /* 7C60 80017C60 24800202 */  and        $s0, $s0, $v0
    /* 7C64 80017C64 01000824 */  addiu      $t0, $zero, 0x1
    /* 7C68 80017C68 5800A8AF */  sw         $t0, 0x58($sp)
  .L80017C6C:
    /* 7C6C 80017C6C 0A00022E */  sltiu      $v0, $s0, 0xA
    /* 7C70 80017C70 09004010 */  beqz       $v0, .L80017C98
    /* 7C74 80017C74 80101000 */   sll       $v0, $s0, 2
    /* 7C78 80017C78 0B80043C */  lui        $a0, %hi(_spu_rev_startaddr)
    /* 7C7C 80017C7C 21208200 */  addu       $a0, $a0, $v0
    /* 7C80 80017C80 BC5A848C */  lw         $a0, %lo(_spu_rev_startaddr)($a0)
    /* 7C84 80017C84 0B80113C */  lui        $s1, %hi(_spu_rev_startaddr)
    /* 7C88 80017C88 D75E000C */  jal        _SpuIsInAllocateArea_
    /* 7C8C 80017C8C BC5A3126 */   addiu     $s1, $s1, %lo(_spu_rev_startaddr)
    /* 7C90 80017C90 03004010 */  beqz       $v0, .L80017CA0
    /* 7C94 80017C94 01001424 */   addiu     $s4, $zero, 0x1
  .L80017C98:
    /* 7C98 80017C98 24600008 */  j          .L80018090
    /* 7C9C 80017C9C FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80017CA0:
    /* 7CA0 80017CA0 1000A627 */  addiu      $a2, $sp, 0x10
    /* 7CA4 80017CA4 43000524 */  addiu      $a1, $zero, 0x43
    /* 7CA8 80017CA8 0B80013C */  lui        $at, %hi(D_800B55F0)
    /* 7CAC 80017CAC F05530AC */  sw         $s0, %lo(D_800B55F0)($at)
    /* 7CB0 80017CB0 0B80033C */  lui        $v1, %hi(D_800B55F0)
    /* 7CB4 80017CB4 F055638C */  lw         $v1, %lo(D_800B55F0)($v1)
    /* 7CB8 80017CB8 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 7CBC 80017CBC 80200300 */  sll        $a0, $v1, 2
    /* 7CC0 80017CC0 21209100 */  addu       $a0, $a0, $s1
    /* 7CC4 80017CC4 00110300 */  sll        $v0, $v1, 4
    /* 7CC8 80017CC8 21104300 */  addu       $v0, $v0, $v1
    /* 7CCC 80017CCC 80100200 */  sll        $v0, $v0, 2
    /* 7CD0 80017CD0 0B80033C */  lui        $v1, %hi(_spu_rev_param)
    /* 7CD4 80017CD4 0C5B6324 */  addiu      $v1, $v1, %lo(_spu_rev_param)
    /* 7CD8 80017CD8 0000848C */  lw         $a0, 0x0($a0)
    /* 7CDC 80017CDC 21184300 */  addu       $v1, $v0, $v1
    /* 7CE0 80017CE0 0B80013C */  lui        $at, %hi(_spu_rev_offsetaddr)
    /* 7CE4 80017CE4 E85524AC */  sw         $a0, %lo(_spu_rev_offsetaddr)($at)
  .L80017CE8:
    /* 7CE8 80017CE8 00006290 */  lbu        $v0, 0x0($v1)
    /* 7CEC 80017CEC 01006324 */  addiu      $v1, $v1, 0x1
    /* 7CF0 80017CF0 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 7CF4 80017CF4 0000C2A0 */  sb         $v0, 0x0($a2)
    /* 7CF8 80017CF8 FBFFA714 */  bne        $a1, $a3, .L80017CE8
    /* 7CFC 80017CFC 0100C624 */   addiu     $a2, $a2, 0x1
    /* 7D00 80017D00 0B80043C */  lui        $a0, %hi(D_800B55F0)
    /* 7D04 80017D04 F0558424 */  addiu      $a0, $a0, %lo(D_800B55F0)
    /* 7D08 80017D08 0000838C */  lw         $v1, 0x0($a0)
    /* 7D0C 80017D0C 07000224 */  addiu      $v0, $zero, 0x7
    /* 7D10 80017D10 05006210 */  beq        $v1, $v0, .L80017D28
    /* 7D14 80017D14 08000224 */   addiu     $v0, $zero, 0x8
    /* 7D18 80017D18 07006210 */  beq        $v1, $v0, .L80017D38
    /* 7D1C 80017D1C 7F000224 */   addiu     $v0, $zero, 0x7F
    /* 7D20 80017D20 515F0008 */  j          .L80017D44
    /* 7D24 80017D24 00000000 */   nop
  .L80017D28:
    /* 7D28 80017D28 7F000224 */  addiu      $v0, $zero, 0x7F
    /* 7D2C 80017D2C 0C0082AC */  sw         $v0, 0xC($a0)
    /* 7D30 80017D30 555F0008 */  j          .L80017D54
    /* 7D34 80017D34 080082AC */   sw        $v0, 0x8($a0)
  .L80017D38:
    /* 7D38 80017D38 0C0080AC */  sw         $zero, 0xC($a0)
    /* 7D3C 80017D3C 555F0008 */  j          .L80017D54
    /* 7D40 80017D40 080082AC */   sw        $v0, 0x8($a0)
  .L80017D44:
    /* 7D44 80017D44 0B80023C */  lui        $v0, %hi(D_800B55FC)
    /* 7D48 80017D48 FC554224 */  addiu      $v0, $v0, %lo(D_800B55FC)
    /* 7D4C 80017D4C 000040AC */  sw         $zero, 0x0($v0)
    /* 7D50 80017D50 FCFF40AC */  sw         $zero, -0x4($v0)
  .L80017D54:
    /* 7D54 80017D54 0300A016 */  bnez       $s5, .L80017D64
    /* 7D58 80017D58 08006232 */   andi      $v0, $s3, 0x8
    /* 7D5C 80017D5C 45004010 */  beqz       $v0, .L80017E74
    /* 7D60 80017D60 00000000 */   nop
  .L80017D64:
    /* 7D64 80017D64 0B80033C */  lui        $v1, %hi(D_800B55F0)
    /* 7D68 80017D68 F055638C */  lw         $v1, %lo(D_800B55F0)($v1)
    /* 7D6C 80017D6C 00000000 */  nop
    /* 7D70 80017D70 09006228 */  slti       $v0, $v1, 0x9
    /* 7D74 80017D74 3F004010 */  beqz       $v0, .L80017E74
    /* 7D78 80017D78 07006228 */   slti      $v0, $v1, 0x7
    /* 7D7C 80017D7C 3D004014 */  bnez       $v0, .L80017E74
    /* 7D80 80017D80 00000000 */   nop
    /* 7D84 80017D84 15008016 */  bnez       $s4, .L80017DDC
    /* 7D88 80017D88 01001624 */   addiu     $s6, $zero, 0x1
    /* 7D8C 80017D8C 1000A527 */  addiu      $a1, $sp, 0x10
    /* 7D90 80017D90 43000424 */  addiu      $a0, $zero, 0x43
    /* 7D94 80017D94 0B80023C */  lui        $v0, %hi(D_800B55F0)
    /* 7D98 80017D98 F055428C */  lw         $v0, %lo(D_800B55F0)($v0)
    /* 7D9C 80017D9C FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 7DA0 80017DA0 00190200 */  sll        $v1, $v0, 4
    /* 7DA4 80017DA4 21186200 */  addu       $v1, $v1, $v0
    /* 7DA8 80017DA8 80180300 */  sll        $v1, $v1, 2
    /* 7DAC 80017DAC 0B80023C */  lui        $v0, %hi(_spu_rev_param)
    /* 7DB0 80017DB0 0C5B4224 */  addiu      $v0, $v0, %lo(_spu_rev_param)
    /* 7DB4 80017DB4 21186200 */  addu       $v1, $v1, $v0
  .L80017DB8:
    /* 7DB8 80017DB8 00006290 */  lbu        $v0, 0x0($v1)
    /* 7DBC 80017DBC 01006324 */  addiu      $v1, $v1, 0x1
    /* 7DC0 80017DC0 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 7DC4 80017DC4 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 7DC8 80017DC8 FBFF8614 */  bne        $a0, $a2, .L80017DB8
    /* 7DCC 80017DCC 0100A524 */   addiu     $a1, $a1, 0x1
    /* 7DD0 80017DD0 010C023C */  lui        $v0, (0xC011C00 >> 16)
    /* 7DD4 80017DD4 001C4234 */  ori        $v0, $v0, (0xC011C00 & 0xFFFF)
    /* 7DD8 80017DD8 1000A2AF */  sw         $v0, 0x10($sp)
  .L80017DDC:
    /* 7DDC 80017DDC 0281043C */  lui        $a0, (0x81020409 >> 16)
    /* 7DE0 80017DE0 0C00428E */  lw         $v0, 0xC($s2)
    /* 7DE4 80017DE4 09048434 */  ori        $a0, $a0, (0x81020409 & 0xFFFF)
    /* 7DE8 80017DE8 401B0200 */  sll        $v1, $v0, 13
    /* 7DEC 80017DEC 18006400 */  mult       $v1, $a0
    /* 7DF0 80017DF0 10380000 */  mfhi       $a3
    /* 7DF4 80017DF4 002B0200 */  sll        $a1, $v0, 12
    /* 7DF8 80017DF8 00000000 */  nop
    /* 7DFC 80017DFC 1800A400 */  mult       $a1, $a0
    /* 7E00 80017E00 0B80013C */  lui        $at, %hi(D_800B55F8)
    /* 7E04 80017E04 F85522AC */  sw         $v0, %lo(D_800B55F8)($at)
    /* 7E08 80017E08 2110E300 */  addu       $v0, $a3, $v1
    /* 7E0C 80017E0C 83110200 */  sra        $v0, $v0, 6
    /* 7E10 80017E10 C31F0300 */  sra        $v1, $v1, 31
    /* 7E14 80017E14 23104300 */  subu       $v0, $v0, $v1
    /* 7E18 80017E18 1400A497 */  lhu        $a0, 0x14($sp)
    /* 7E1C 80017E1C 3600A397 */  lhu        $v1, 0x36($sp)
    /* 7E20 80017E20 23104400 */  subu       $v0, $v0, $a0
    /* 7E24 80017E24 2800A2A7 */  sh         $v0, 0x28($sp)
    /* 7E28 80017E28 1600A297 */  lhu        $v0, 0x16($sp)
    /* 7E2C 80017E2C 10300000 */  mfhi       $a2
    /* 7E30 80017E30 2120C500 */  addu       $a0, $a2, $a1
    /* 7E34 80017E34 83210400 */  sra        $a0, $a0, 6
    /* 7E38 80017E38 C32F0500 */  sra        $a1, $a1, 31
    /* 7E3C 80017E3C 23208500 */  subu       $a0, $a0, $a1
    /* 7E40 80017E40 23108200 */  subu       $v0, $a0, $v0
    /* 7E44 80017E44 2A00A2A7 */  sh         $v0, 0x2A($sp)
    /* 7E48 80017E48 2E00A297 */  lhu        $v0, 0x2E($sp)
    /* 7E4C 80017E4C 21186400 */  addu       $v1, $v1, $a0
    /* 7E50 80017E50 3400A3A7 */  sh         $v1, 0x34($sp)
    /* 7E54 80017E54 4E00A397 */  lhu        $v1, 0x4E($sp)
    /* 7E58 80017E58 21104400 */  addu       $v0, $v0, $a0
    /* 7E5C 80017E5C 2C00A2A7 */  sh         $v0, 0x2C($sp)
    /* 7E60 80017E60 4C00A297 */  lhu        $v0, 0x4C($sp)
    /* 7E64 80017E64 21186400 */  addu       $v1, $v1, $a0
    /* 7E68 80017E68 4A00A3A7 */  sh         $v1, 0x4A($sp)
    /* 7E6C 80017E6C 21104400 */  addu       $v0, $v0, $a0
    /* 7E70 80017E70 4800A2A7 */  sh         $v0, 0x48($sp)
  .L80017E74:
    /* 7E74 80017E74 0300A016 */  bnez       $s5, .L80017E84
    /* 7E78 80017E78 10006232 */   andi      $v0, $s3, 0x10
    /* 7E7C 80017E7C 32004010 */  beqz       $v0, .L80017F48
    /* 7E80 80017E80 00000000 */   nop
  .L80017E84:
    /* 7E84 80017E84 0B80033C */  lui        $v1, %hi(D_800B55F0)
    /* 7E88 80017E88 F055638C */  lw         $v1, %lo(D_800B55F0)($v1)
    /* 7E8C 80017E8C 00000000 */  nop
    /* 7E90 80017E90 09006228 */  slti       $v0, $v1, 0x9
    /* 7E94 80017E94 2C004010 */  beqz       $v0, .L80017F48
    /* 7E98 80017E98 07006228 */   slti      $v0, $v1, 0x7
    /* 7E9C 80017E9C 2A004014 */  bnez       $v0, .L80017F48
    /* 7EA0 80017EA0 00000000 */   nop
    /* 7EA4 80017EA4 19008016 */  bnez       $s4, .L80017F0C
    /* 7EA8 80017EA8 01001E24 */   addiu     $fp, $zero, 0x1
    /* 7EAC 80017EAC 1300C016 */  bnez       $s6, .L80017EFC
    /* 7EB0 80017EB0 1000A527 */   addiu     $a1, $sp, 0x10
    /* 7EB4 80017EB4 43000424 */  addiu      $a0, $zero, 0x43
    /* 7EB8 80017EB8 0B80023C */  lui        $v0, %hi(D_800B55F0)
    /* 7EBC 80017EBC F055428C */  lw         $v0, %lo(D_800B55F0)($v0)
    /* 7EC0 80017EC0 FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 7EC4 80017EC4 00190200 */  sll        $v1, $v0, 4
    /* 7EC8 80017EC8 21186200 */  addu       $v1, $v1, $v0
    /* 7ECC 80017ECC 80180300 */  sll        $v1, $v1, 2
    /* 7ED0 80017ED0 0B80023C */  lui        $v0, %hi(_spu_rev_param)
    /* 7ED4 80017ED4 0C5B4224 */  addiu      $v0, $v0, %lo(_spu_rev_param)
    /* 7ED8 80017ED8 21186200 */  addu       $v1, $v1, $v0
  .L80017EDC:
    /* 7EDC 80017EDC 00006290 */  lbu        $v0, 0x0($v1)
    /* 7EE0 80017EE0 01006324 */  addiu      $v1, $v1, 0x1
    /* 7EE4 80017EE4 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 7EE8 80017EE8 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 7EEC 80017EEC FBFF8614 */  bne        $a0, $a2, .L80017EDC
    /* 7EF0 80017EF0 0100A524 */   addiu     $a1, $a1, 0x1
    /* 7EF4 80017EF4 C25F0008 */  j          .L80017F08
    /* 7EF8 80017EF8 80000224 */   addiu     $v0, $zero, 0x80
  .L80017EFC:
    /* 7EFC 80017EFC 1000A28F */  lw         $v0, 0x10($sp)
    /* 7F00 80017F00 00000000 */  nop
    /* 7F04 80017F04 80004234 */  ori        $v0, $v0, 0x80
  .L80017F08:
    /* 7F08 80017F08 1000A2AF */  sw         $v0, 0x10($sp)
  .L80017F0C:
    /* 7F0C 80017F0C 0281043C */  lui        $a0, (0x81020409 >> 16)
    /* 7F10 80017F10 1000438E */  lw         $v1, 0x10($s2)
    /* 7F14 80017F14 09048434 */  ori        $a0, $a0, (0x81020409 & 0xFFFF)
    /* 7F18 80017F18 C0110300 */  sll        $v0, $v1, 7
    /* 7F1C 80017F1C 21104300 */  addu       $v0, $v0, $v1
    /* 7F20 80017F20 00120200 */  sll        $v0, $v0, 8
    /* 7F24 80017F24 18004400 */  mult       $v0, $a0
    /* 7F28 80017F28 0B80013C */  lui        $at, %hi(D_800B55FC)
    /* 7F2C 80017F2C FC5523AC */  sw         $v1, %lo(D_800B55FC)($at)
    /* 7F30 80017F30 10400000 */  mfhi       $t0
    /* 7F34 80017F34 21180201 */  addu       $v1, $t0, $v0
    /* 7F38 80017F38 83190300 */  sra        $v1, $v1, 6
    /* 7F3C 80017F3C C3170200 */  sra        $v0, $v0, 31
    /* 7F40 80017F40 23186200 */  subu       $v1, $v1, $v0
    /* 7F44 80017F44 2200A3A7 */  sh         $v1, 0x22($sp)
  .L80017F48:
    /* 7F48 80017F48 0F008012 */  beqz       $s4, .L80017F88
    /* 7F4C 80017F4C 00000000 */   nop
    /* 7F50 80017F50 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 7F54 80017F54 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 7F58 80017F58 00000000 */  nop
    /* 7F5C 80017F5C AA016294 */  lhu        $v0, 0x1AA($v1)
    /* 7F60 80017F60 00000000 */  nop
    /* 7F64 80017F64 C2110200 */  srl        $v0, $v0, 7
    /* 7F68 80017F68 01005730 */  andi       $s7, $v0, 0x1
    /* 7F6C 80017F6C 1F00E012 */  beqz       $s7, .L80017FEC
    /* 7F70 80017F70 00000000 */   nop
    /* 7F74 80017F74 AA016294 */  lhu        $v0, 0x1AA($v1)
    /* 7F78 80017F78 00000000 */  nop
    /* 7F7C 80017F7C 7FFF4230 */  andi       $v0, $v0, 0xFF7F
    /* 7F80 80017F80 FB5F0008 */  j          .L80017FEC
    /* 7F84 80017F84 AA0162A4 */   sh        $v0, 0x1AA($v1)
  .L80017F88:
    /* 7F88 80017F88 0300A016 */  bnez       $s5, .L80017F98
    /* 7F8C 80017F8C 02006232 */   andi      $v0, $s3, 0x2
    /* 7F90 80017F90 09004010 */  beqz       $v0, .L80017FB8
    /* 7F94 80017F94 00000000 */   nop
  .L80017F98:
    /* 7F98 80017F98 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 7F9C 80017F9C 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 7FA0 80017FA0 08004396 */  lhu        $v1, 0x8($s2)
    /* 7FA4 80017FA4 00000000 */  nop
    /* 7FA8 80017FA8 840143A4 */  sh         $v1, 0x184($v0)
    /* 7FAC 80017FAC 08004296 */  lhu        $v0, 0x8($s2)
    /* 7FB0 80017FB0 0B80013C */  lui        $at, %hi(D_800B55F4)
    /* 7FB4 80017FB4 F45522A4 */  sh         $v0, %lo(D_800B55F4)($at)
  .L80017FB8:
    /* 7FB8 80017FB8 0300A016 */  bnez       $s5, .L80017FC8
    /* 7FBC 80017FBC 04006232 */   andi      $v0, $s3, 0x4
    /* 7FC0 80017FC0 13004010 */  beqz       $v0, .L80018010
    /* 7FC4 80017FC4 00000000 */   nop
  .L80017FC8:
    /* 7FC8 80017FC8 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 7FCC 80017FCC 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 7FD0 80017FD0 0A004396 */  lhu        $v1, 0xA($s2)
    /* 7FD4 80017FD4 00000000 */  nop
    /* 7FD8 80017FD8 860143A4 */  sh         $v1, 0x186($v0)
    /* 7FDC 80017FDC 0A004296 */  lhu        $v0, 0xA($s2)
    /* 7FE0 80017FE0 0B80013C */  lui        $at, %hi(D_800B55F6)
    /* 7FE4 80017FE4 04600008 */  j          .L80018010
    /* 7FE8 80017FE8 F65522A4 */   sh        $v0, %lo(D_800B55F6)($at)
  .L80017FEC:
    /* 7FEC 80017FEC 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 7FF0 80017FF0 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 7FF4 80017FF4 00000000 */  nop
    /* 7FF8 80017FF8 840140A4 */  sh         $zero, 0x184($v0)
    /* 7FFC 80017FFC 860140A4 */  sh         $zero, 0x186($v0)
    /* 8000 80018000 0B80023C */  lui        $v0, %hi(D_800B55F4)
    /* 8004 80018004 F4554224 */  addiu      $v0, $v0, %lo(D_800B55F4)
    /* 8008 80018008 000040A4 */  sh         $zero, 0x0($v0)
    /* 800C 8001800C 020040A4 */  sh         $zero, 0x2($v0)
  .L80018010:
    /* 8010 80018010 05008016 */  bnez       $s4, .L80018028
    /* 8014 80018014 00000000 */   nop
    /* 8018 80018018 0300C016 */  bnez       $s6, .L80018028
    /* 801C 8001801C 00000000 */   nop
    /* 8020 80018020 0300C013 */  beqz       $fp, .L80018030
    /* 8024 80018024 00000000 */   nop
  .L80018028:
    /* 8028 80018028 3360000C */  jal        _spu_setReverbAttr
    /* 802C 8001802C 1000A427 */   addiu     $a0, $sp, 0x10
  .L80018030:
    /* 8030 80018030 5800A88F */  lw         $t0, 0x58($sp)
    /* 8034 80018034 00000000 */  nop
    /* 8038 80018038 05000011 */  beqz       $t0, .L80018050
    /* 803C 8001803C 00000000 */   nop
    /* 8040 80018040 0B80043C */  lui        $a0, %hi(D_800B55F0)
    /* 8044 80018044 F055848C */  lw         $a0, %lo(D_800B55F0)($a0)
    /* 8048 80018048 5762000C */  jal        SpuClearReverbWorkArea
    /* 804C 8001804C 00000000 */   nop
  .L80018050:
    /* 8050 80018050 0E008012 */  beqz       $s4, .L8001808C
    /* 8054 80018054 D1000424 */   addiu     $a0, $zero, 0xD1
    /* 8058 80018058 0B80053C */  lui        $a1, %hi(_spu_rev_offsetaddr)
    /* 805C 8001805C E855A58C */  lw         $a1, %lo(_spu_rev_offsetaddr)($a1)
    /* 8060 80018060 3A5C000C */  jal        _spu_FsetRXX
    /* 8064 80018064 21300000 */   addu      $a2, $zero, $zero
    /* 8068 80018068 0900E012 */  beqz       $s7, .L80018090
    /* 806C 8001806C 21100000 */   addu      $v0, $zero, $zero
    /* 8070 80018070 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 8074 80018074 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 8078 80018078 00000000 */  nop
    /* 807C 8001807C AA016294 */  lhu        $v0, 0x1AA($v1)
    /* 8080 80018080 00000000 */  nop
    /* 8084 80018084 80004234 */  ori        $v0, $v0, 0x80
    /* 8088 80018088 AA0162A4 */  sh         $v0, 0x1AA($v1)
  .L8001808C:
    /* 808C 8001808C 21100000 */  addu       $v0, $zero, $zero
  .L80018090:
    /* 8090 80018090 8400BF8F */  lw         $ra, 0x84($sp)
    /* 8094 80018094 8000BE8F */  lw         $fp, 0x80($sp)
    /* 8098 80018098 7C00B78F */  lw         $s7, 0x7C($sp)
    /* 809C 8001809C 7800B68F */  lw         $s6, 0x78($sp)
    /* 80A0 800180A0 7400B58F */  lw         $s5, 0x74($sp)
    /* 80A4 800180A4 7000B48F */  lw         $s4, 0x70($sp)
    /* 80A8 800180A8 6C00B38F */  lw         $s3, 0x6C($sp)
    /* 80AC 800180AC 6800B28F */  lw         $s2, 0x68($sp)
    /* 80B0 800180B0 6400B18F */  lw         $s1, 0x64($sp)
    /* 80B4 800180B4 6000B08F */  lw         $s0, 0x60($sp)
    /* 80B8 800180B8 0800E003 */  jr         $ra
    /* 80BC 800180BC 8800BD27 */   addiu     $sp, $sp, 0x88
endlabel SpuSetReverbModeParam
    /* 80C0 800180C0 00000000 */  nop
    /* 80C4 800180C4 00000000 */  nop
    /* 80C8 800180C8 00000000 */  nop
