.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80015D38, 0x28C

glabel func_80015D38
    /* 5D38 80015D38 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5D3C 80015D3C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5D40 80015D40 21808000 */  addu       $s0, $a0, $zero
    /* 5D44 80015D44 1400BFAF */  sw         $ra, 0x14($sp)
    /* 5D48 80015D48 FE48000C */  jal        SetIntrMask
    /* 5D4C 80015D4C 21200000 */   addu      $a0, $zero, $zero
    /* 5D50 80015D50 0B80013C */  lui        $at, %hi(_qout)
    /* 5D54 80015D54 A85520AC */  sw         $zero, %lo(_qout)($at)
    /* 5D58 80015D58 0B80033C */  lui        $v1, %hi(_qout)
    /* 5D5C 80015D5C A855638C */  lw         $v1, %lo(_qout)($v1)
    /* 5D60 80015D60 0B80013C */  lui        $at, %hi(D_800B55B4)
    /* 5D64 80015D64 B45522AC */  sw         $v0, %lo(D_800B55B4)($at)
    /* 5D68 80015D68 01000224 */  addiu      $v0, $zero, 0x1
    /* 5D6C 80015D6C 0B80013C */  lui        $at, %hi(_qin)
    /* 5D70 80015D70 A45523AC */  sw         $v1, %lo(_qin)($at)
    /* 5D74 80015D74 07000332 */  andi       $v1, $s0, 0x7
    /* 5D78 80015D78 23006210 */  beq        $v1, $v0, .L80015E08
    /* 5D7C 80015D7C 02006228 */   slti      $v0, $v1, 0x2
    /* 5D80 80015D80 05004010 */  beqz       $v0, .L80015D98
    /* 5D84 80015D84 03000224 */   addiu     $v0, $zero, 0x3
    /* 5D88 80015D88 07006010 */  beqz       $v1, .L80015DA8
    /* 5D8C 80015D8C 00000000 */   nop
    /* 5D90 80015D90 95570008 */  j          .L80015E54
    /* 5D94 80015D94 00000000 */   nop
  .L80015D98:
    /* 5D98 80015D98 1B006210 */  beq        $v1, $v0, .L80015E08
    /* 5D9C 80015D9C 05000224 */   addiu     $v0, $zero, 0x5
    /* 5DA0 80015DA0 2C006214 */  bne        $v1, $v0, .L80015E54
    /* 5DA4 80015DA4 00000000 */   nop
  .L80015DA8:
    /* 5DA8 80015DA8 0B80033C */  lui        $v1, %hi(D_800B5590)
    /* 5DAC 80015DAC 9055638C */  lw         $v1, %lo(D_800B5590)($v1)
    /* 5DB0 80015DB0 01040224 */  addiu      $v0, $zero, 0x401
    /* 5DB4 80015DB4 000062AC */  sw         $v0, 0x0($v1)
    /* 5DB8 80015DB8 0B80033C */  lui        $v1, %hi(D_800B55A0)
    /* 5DBC 80015DBC A055638C */  lw         $v1, %lo(D_800B55A0)($v1)
    /* 5DC0 80015DC0 1380043C */  lui        $a0, %hi(D_80130018)
    /* 5DC4 80015DC4 18008424 */  addiu      $a0, $a0, %lo(D_80130018)
    /* 5DC8 80015DC8 0000628C */  lw         $v0, 0x0($v1)
    /* 5DCC 80015DCC 21280000 */  addu       $a1, $zero, $zero
    /* 5DD0 80015DD0 00084234 */  ori        $v0, $v0, 0x800
    /* 5DD4 80015DD4 000062AC */  sw         $v0, 0x0($v1)
    /* 5DD8 80015DD8 0B80023C */  lui        $v0, %hi(D_800B5584)
    /* 5DDC 80015DDC 8455428C */  lw         $v0, %lo(D_800B5584)($v0)
    /* 5DE0 80015DE0 00010624 */  addiu      $a2, $zero, 0x100
    /* 5DE4 80015DE4 8759000C */  jal        func_8001661C
    /* 5DE8 80015DE8 000040AC */   sw        $zero, 0x0($v0)
    /* 5DEC 80015DEC 1480043C */  lui        $a0, %hi(_que)
    /* 5DF0 80015DF0 B8838424 */  addiu      $a0, $a0, %lo(_que)
    /* 5DF4 80015DF4 21280000 */  addu       $a1, $zero, $zero
    /* 5DF8 80015DF8 8759000C */  jal        func_8001661C
    /* 5DFC 80015DFC 00180624 */   addiu     $a2, $zero, 0x1800
    /* 5E00 80015E00 95570008 */  j          .L80015E54
    /* 5E04 80015E04 00000000 */   nop
  .L80015E08:
    /* 5E08 80015E08 0B80033C */  lui        $v1, %hi(D_800B5590)
    /* 5E0C 80015E0C 9055638C */  lw         $v1, %lo(D_800B5590)($v1)
    /* 5E10 80015E10 01040224 */  addiu      $v0, $zero, 0x401
    /* 5E14 80015E14 000062AC */  sw         $v0, 0x0($v1)
    /* 5E18 80015E18 0B80033C */  lui        $v1, %hi(D_800B55A0)
    /* 5E1C 80015E1C A055638C */  lw         $v1, %lo(D_800B55A0)($v1)
    /* 5E20 80015E20 00000000 */  nop
    /* 5E24 80015E24 0000628C */  lw         $v0, 0x0($v1)
    /* 5E28 80015E28 00000000 */  nop
    /* 5E2C 80015E2C 00084234 */  ori        $v0, $v0, 0x800
    /* 5E30 80015E30 000062AC */  sw         $v0, 0x0($v1)
    /* 5E34 80015E34 0B80033C */  lui        $v1, %hi(D_800B5584)
    /* 5E38 80015E38 8455638C */  lw         $v1, %lo(D_800B5584)($v1)
    /* 5E3C 80015E3C 0002023C */  lui        $v0, (0x2000000 >> 16)
    /* 5E40 80015E40 000062AC */  sw         $v0, 0x0($v1)
    /* 5E44 80015E44 0B80033C */  lui        $v1, %hi(D_800B5584)
    /* 5E48 80015E48 8455638C */  lw         $v1, %lo(D_800B5584)($v1)
    /* 5E4C 80015E4C 0001023C */  lui        $v0, (0x1000000 >> 16)
    /* 5E50 80015E50 000062AC */  sw         $v0, 0x0($v1)
  .L80015E54:
    /* 5E54 80015E54 0B80043C */  lui        $a0, %hi(D_800B55B4)
    /* 5E58 80015E58 B455848C */  lw         $a0, %lo(D_800B55B4)($a0)
    /* 5E5C 80015E5C FE48000C */  jal        SetIntrMask
    /* 5E60 80015E60 00000000 */   nop
    /* 5E64 80015E64 07000232 */  andi       $v0, $s0, 0x7
    /* 5E68 80015E68 03004014 */  bnez       $v0, .L80015E78
    /* 5E6C 80015E6C 21100000 */   addu      $v0, $zero, $zero
    /* 5E70 80015E70 4F58000C */  jal        func_8001613C
    /* 5E74 80015E74 21200002 */   addu      $a0, $s0, $zero
  .L80015E78:
    /* 5E78 80015E78 1400BF8F */  lw         $ra, 0x14($sp)
    /* 5E7C 80015E7C 1000B08F */  lw         $s0, 0x10($sp)
    /* 5E80 80015E80 0800E003 */  jr         $ra
    /* 5E84 80015E84 1800BD27 */   addiu     $sp, $sp, 0x18
    /* 5E88 80015E88 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5E8C 80015E8C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 5E90 80015E90 2A008014 */  bnez       $a0, .L80015F3C
    /* 5E94 80015E94 1000B0AF */   sw        $s0, 0x10($sp)
    /* 5E98 80015E98 F157000C */  jal        func_80015FC4
    /* 5E9C 80015E9C 00000000 */   nop
    /* 5EA0 80015EA0 B0570008 */  j          .L80015EC0
    /* 5EA4 80015EA4 00000000 */   nop
  .L80015EA8:
    /* 5EA8 80015EA8 B656000C */  jal        func_80015AD8
    /* 5EAC 80015EAC 00000000 */   nop
    /* 5EB0 80015EB0 FE57000C */  jal        func_80015FF8
    /* 5EB4 80015EB4 00000000 */   nop
    /* 5EB8 80015EB8 3E004014 */  bnez       $v0, .L80015FB4
    /* 5EBC 80015EBC FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80015EC0:
    /* 5EC0 80015EC0 0B80033C */  lui        $v1, %hi(_qin)
    /* 5EC4 80015EC4 A455638C */  lw         $v1, %lo(_qin)($v1)
    /* 5EC8 80015EC8 0B80023C */  lui        $v0, %hi(_qout)
    /* 5ECC 80015ECC A855428C */  lw         $v0, %lo(_qout)($v0)
    /* 5ED0 80015ED0 00000000 */  nop
    /* 5ED4 80015ED4 07006210 */  beq        $v1, $v0, .L80015EF4
    /* 5ED8 80015ED8 00000000 */   nop
    /* 5EDC 80015EDC AA570008 */  j          .L80015EA8
    /* 5EE0 80015EE0 00000000 */   nop
  .L80015EE4:
    /* 5EE4 80015EE4 FE57000C */  jal        func_80015FF8
    /* 5EE8 80015EE8 00000000 */   nop
    /* 5EEC 80015EEC 31004014 */  bnez       $v0, .L80015FB4
    /* 5EF0 80015EF0 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80015EF4:
    /* 5EF4 80015EF4 0B80023C */  lui        $v0, %hi(D_800B5590)
    /* 5EF8 80015EF8 9055428C */  lw         $v0, %lo(D_800B5590)($v0)
    /* 5EFC 80015EFC 00000000 */  nop
    /* 5F00 80015F00 0000428C */  lw         $v0, 0x0($v0)
    /* 5F04 80015F04 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* 5F08 80015F08 24104300 */  and        $v0, $v0, $v1
    /* 5F0C 80015F0C F5FF4014 */  bnez       $v0, .L80015EE4
    /* 5F10 80015F10 00000000 */   nop
    /* 5F14 80015F14 0B80023C */  lui        $v0, %hi(D_800B5584)
    /* 5F18 80015F18 8455428C */  lw         $v0, %lo(D_800B5584)($v0)
    /* 5F1C 80015F1C 00000000 */  nop
    /* 5F20 80015F20 0000428C */  lw         $v0, 0x0($v0)
    /* 5F24 80015F24 0004033C */  lui        $v1, (0x4000000 >> 16)
    /* 5F28 80015F28 24104300 */  and        $v0, $v0, $v1
    /* 5F2C 80015F2C EDFF4010 */  beqz       $v0, .L80015EE4
    /* 5F30 80015F30 21100000 */   addu      $v0, $zero, $zero
    /* 5F34 80015F34 ED570008 */  j          .L80015FB4
    /* 5F38 80015F38 00000000 */   nop
  .L80015F3C:
    /* 5F3C 80015F3C 0B80023C */  lui        $v0, %hi(_qin)
    /* 5F40 80015F40 A455428C */  lw         $v0, %lo(_qin)($v0)
    /* 5F44 80015F44 0B80033C */  lui        $v1, %hi(_qout)
    /* 5F48 80015F48 A855638C */  lw         $v1, %lo(_qout)($v1)
    /* 5F4C 80015F4C 00000000 */  nop
    /* 5F50 80015F50 23104300 */  subu       $v0, $v0, $v1
    /* 5F54 80015F54 3F005030 */  andi       $s0, $v0, 0x3F
    /* 5F58 80015F58 03000012 */  beqz       $s0, .L80015F68
    /* 5F5C 80015F5C 00000000 */   nop
    /* 5F60 80015F60 B656000C */  jal        func_80015AD8
    /* 5F64 80015F64 00000000 */   nop
  .L80015F68:
    /* 5F68 80015F68 0B80023C */  lui        $v0, %hi(D_800B5590)
    /* 5F6C 80015F6C 9055428C */  lw         $v0, %lo(D_800B5590)($v0)
    /* 5F70 80015F70 00000000 */  nop
    /* 5F74 80015F74 0000428C */  lw         $v0, 0x0($v0)
    /* 5F78 80015F78 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* 5F7C 80015F7C 24104300 */  and        $v0, $v0, $v1
    /* 5F80 80015F80 09004014 */  bnez       $v0, .L80015FA8
    /* 5F84 80015F84 00000000 */   nop
    /* 5F88 80015F88 0B80023C */  lui        $v0, %hi(D_800B5584)
    /* 5F8C 80015F8C 8455428C */  lw         $v0, %lo(D_800B5584)($v0)
    /* 5F90 80015F90 00000000 */  nop
    /* 5F94 80015F94 0000428C */  lw         $v0, 0x0($v0)
    /* 5F98 80015F98 0004033C */  lui        $v1, (0x4000000 >> 16)
    /* 5F9C 80015F9C 24104300 */  and        $v0, $v0, $v1
    /* 5FA0 80015FA0 04004014 */  bnez       $v0, .L80015FB4
    /* 5FA4 80015FA4 21100002 */   addu      $v0, $s0, $zero
  .L80015FA8:
    /* 5FA8 80015FA8 02000016 */  bnez       $s0, .L80015FB4
    /* 5FAC 80015FAC 21100002 */   addu      $v0, $s0, $zero
    /* 5FB0 80015FB0 01000224 */  addiu      $v0, $zero, 0x1
  .L80015FB4:
    /* 5FB4 80015FB4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 5FB8 80015FB8 1000B08F */  lw         $s0, 0x10($sp)
    /* 5FBC 80015FBC 0800E003 */  jr         $ra
    /* 5FC0 80015FC0 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel func_80015D38
