.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WeaponAutoPlace__Fi, 0x294

glabel WeaponAutoPlace__Fi
    /* 20ED0 8015AAC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 20ED4 8015AACC 40100400 */  sll        $v0, $a0, 1
    /* 20ED8 8015AAD0 21104400 */  addu       $v0, $v0, $a0
    /* 20EDC 8015AAD4 80100200 */  sll        $v0, $v0, 2
    /* 20EE0 8015AAD8 21104400 */  addu       $v0, $v0, $a0
    /* 20EE4 8015AADC 00110200 */  sll        $v0, $v0, 4
    /* 20EE8 8015AAE0 23104400 */  subu       $v0, $v0, $a0
    /* 20EEC 8015AAE4 80100200 */  sll        $v0, $v0, 2
    /* 20EF0 8015AAE8 21104400 */  addu       $v0, $v0, $a0
    /* 20EF4 8015AAEC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 20EF8 8015AAF0 C0800200 */  sll        $s0, $v0, 3
    /* 20EFC 8015AAF4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 20F00 8015AAF8 0E80013C */  lui        $at, %hi(plr + 0x1964)
    /* 20F04 8015AAFC 21083000 */  addu       $at, $at, $s0
    /* 20F08 8015AB00 9CBE2380 */  lb         $v1, %lo(plr + 0x1964)($at)
    /* 20F0C 8015AB04 02000224 */  addiu      $v0, $zero, 0x2
    /* 20F10 8015AB08 67006210 */  beq        $v1, $v0, .L8015ACA8
    /* 20F14 8015AB0C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 20F18 8015AB10 0E80013C */  lui        $at, %hi(plr + 0x38C)
    /* 20F1C 8015AB14 21083000 */  addu       $at, $at, $s0
    /* 20F20 8015AB18 C4A82384 */  lh         $v1, %lo(plr + 0x38C)($at)
    /* 20F24 8015AB1C 00000000 */  nop
    /* 20F28 8015AB20 07006210 */  beq        $v1, $v0, .L8015AB40
    /* 20F2C 8015AB24 01000224 */   addiu     $v0, $zero, 0x1
    /* 20F30 8015AB28 0E80013C */  lui        $at, %hi(plr + 0x3B5)
    /* 20F34 8015AB2C 21083000 */  addu       $at, $at, $s0
    /* 20F38 8015AB30 EDA82380 */  lb         $v1, %lo(plr + 0x3B5)($at)
    /* 20F3C 8015AB34 00000000 */  nop
    /* 20F40 8015AB38 83006210 */  beq        $v1, $v0, .L8015AD48
    /* 20F44 8015AB3C 21100000 */   addu      $v0, $zero, $zero
  .L8015AB40:
    /* 20F48 8015AB40 40100400 */  sll        $v0, $a0, 1
    /* 20F4C 8015AB44 21104400 */  addu       $v0, $v0, $a0
    /* 20F50 8015AB48 80100200 */  sll        $v0, $v0, 2
    /* 20F54 8015AB4C 21104400 */  addu       $v0, $v0, $a0
    /* 20F58 8015AB50 00110200 */  sll        $v0, $v0, 4
    /* 20F5C 8015AB54 23104400 */  subu       $v0, $v0, $a0
    /* 20F60 8015AB58 80100200 */  sll        $v0, $v0, 2
    /* 20F64 8015AB5C 21104400 */  addu       $v0, $v0, $a0
    /* 20F68 8015AB60 C0280200 */  sll        $a1, $v0, 3
    /* 20F6C 8015AB64 0E80013C */  lui        $at, %hi(plr + 0x3F8)
    /* 20F70 8015AB68 21082500 */  addu       $at, $at, $a1
    /* 20F74 8015AB6C 30A92384 */  lh         $v1, %lo(plr + 0x3F8)($at)
    /* 20F78 8015AB70 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 20F7C 8015AB74 07006210 */  beq        $v1, $v0, .L8015AB94
    /* 20F80 8015AB78 01000224 */   addiu     $v0, $zero, 0x1
    /* 20F84 8015AB7C 0E80013C */  lui        $at, %hi(plr + 0x421)
    /* 20F88 8015AB80 21082500 */  addu       $at, $at, $a1
    /* 20F8C 8015AB84 59A92380 */  lb         $v1, %lo(plr + 0x421)($at)
    /* 20F90 8015AB88 00000000 */  nop
    /* 20F94 8015AB8C 6E006210 */  beq        $v1, $v0, .L8015AD48
    /* 20F98 8015AB90 21100000 */   addu      $v0, $zero, $zero
  .L8015AB94:
    /* 20F9C 8015AB94 40100400 */  sll        $v0, $a0, 1
    /* 20FA0 8015AB98 21104400 */  addu       $v0, $v0, $a0
    /* 20FA4 8015AB9C 80100200 */  sll        $v0, $v0, 2
    /* 20FA8 8015ABA0 21104400 */  addu       $v0, $v0, $a0
    /* 20FAC 8015ABA4 00110200 */  sll        $v0, $v0, 4
    /* 20FB0 8015ABA8 23104400 */  subu       $v0, $v0, $a0
    /* 20FB4 8015ABAC 80100200 */  sll        $v0, $v0, 2
    /* 20FB8 8015ABB0 21104400 */  addu       $v0, $v0, $a0
    /* 20FBC 8015ABB4 C0800200 */  sll        $s0, $v0, 3
    /* 20FC0 8015ABB8 0E80013C */  lui        $at, %hi(plr + 0x38C)
    /* 20FC4 8015ABBC 21083000 */  addu       $at, $at, $s0
    /* 20FC8 8015ABC0 C4A82284 */  lh         $v0, %lo(plr + 0x38C)($at)
    /* 20FCC 8015ABC4 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 20FD0 8015ABC8 16004314 */  bne        $v0, $v1, .L8015AC24
    /* 20FD4 8015ABCC 01000424 */   addiu     $a0, $zero, 0x1
    /* 20FD8 8015ABD0 3D3F010C */  jal        NetSendCmdChItem__FUcUc
    /* 20FDC 8015ABD4 04000524 */   addiu     $a1, $zero, 0x4
    /* 20FE0 8015ABD8 0E80023C */  lui        $v0, %hi(plr + 0x360)
    /* 20FE4 8015ABDC 98A84224 */  addiu      $v0, $v0, %lo(plr + 0x360)
    /* 20FE8 8015ABE0 21380202 */  addu       $a3, $s0, $v0
    /* 20FEC 8015ABE4 B0154224 */  addiu      $v0, $v0, 0x15B0
    /* 20FF0 8015ABE8 21300202 */  addu       $a2, $s0, $v0
    /* 20FF4 8015ABEC 6000C824 */  addiu      $t0, $a2, 0x60
  .L8015ABF0:
    /* 20FF8 8015ABF0 0000C28C */  lw         $v0, 0x0($a2)
    /* 20FFC 8015ABF4 0400C38C */  lw         $v1, 0x4($a2)
    /* 21000 8015ABF8 0800C48C */  lw         $a0, 0x8($a2)
    /* 21004 8015ABFC 0C00C58C */  lw         $a1, 0xC($a2)
    /* 21008 8015AC00 0000E2AC */  sw         $v0, 0x0($a3)
    /* 2100C 8015AC04 0400E3AC */  sw         $v1, 0x4($a3)
    /* 21010 8015AC08 0800E4AC */  sw         $a0, 0x8($a3)
    /* 21014 8015AC0C 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 21018 8015AC10 1000C624 */  addiu      $a2, $a2, 0x10
    /* 2101C 8015AC14 F6FFC814 */  bne        $a2, $t0, .L8015ABF0
    /* 21020 8015AC18 1000E724 */   addiu     $a3, $a3, 0x10
    /* 21024 8015AC1C 4B6B0508 */  j          .L8015AD2C
    /* 21028 8015AC20 00000000 */   nop
  .L8015AC24:
    /* 2102C 8015AC24 0E80013C */  lui        $at, %hi(plr + 0x3F8)
    /* 21030 8015AC28 21083000 */  addu       $at, $at, $s0
    /* 21034 8015AC2C 30A92284 */  lh         $v0, %lo(plr + 0x3F8)($at)
    /* 21038 8015AC30 00000000 */  nop
    /* 2103C 8015AC34 44004314 */  bne        $v0, $v1, .L8015AD48
    /* 21040 8015AC38 21100000 */   addu      $v0, $zero, $zero
    /* 21044 8015AC3C 0E80013C */  lui        $at, %hi(plr + 0x3B4)
    /* 21048 8015AC40 21083000 */  addu       $at, $at, $s0
    /* 2104C 8015AC44 ECA82380 */  lb         $v1, %lo(plr + 0x3B4)($at)
    /* 21050 8015AC48 02000224 */  addiu      $v0, $zero, 0x2
    /* 21054 8015AC4C 22006210 */  beq        $v1, $v0, .L8015ACD8
    /* 21058 8015AC50 01000424 */   addiu     $a0, $zero, 0x1
    /* 2105C 8015AC54 3D3F010C */  jal        NetSendCmdChItem__FUcUc
    /* 21060 8015AC58 05000524 */   addiu     $a1, $zero, 0x5
    /* 21064 8015AC5C 0E80023C */  lui        $v0, %hi(plr + 0x3CC)
    /* 21068 8015AC60 04A94224 */  addiu      $v0, $v0, %lo(plr + 0x3CC)
    /* 2106C 8015AC64 21380202 */  addu       $a3, $s0, $v0
    /* 21070 8015AC68 44154224 */  addiu      $v0, $v0, 0x1544
    /* 21074 8015AC6C 21300202 */  addu       $a2, $s0, $v0
    /* 21078 8015AC70 6000C824 */  addiu      $t0, $a2, 0x60
  .L8015AC74:
    /* 2107C 8015AC74 0000C28C */  lw         $v0, 0x0($a2)
    /* 21080 8015AC78 0400C38C */  lw         $v1, 0x4($a2)
    /* 21084 8015AC7C 0800C48C */  lw         $a0, 0x8($a2)
    /* 21088 8015AC80 0C00C58C */  lw         $a1, 0xC($a2)
    /* 2108C 8015AC84 0000E2AC */  sw         $v0, 0x0($a3)
    /* 21090 8015AC88 0400E3AC */  sw         $v1, 0x4($a3)
    /* 21094 8015AC8C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 21098 8015AC90 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 2109C 8015AC94 1000C624 */  addiu      $a2, $a2, 0x10
    /* 210A0 8015AC98 F6FFC814 */  bne        $a2, $t0, .L8015AC74
    /* 210A4 8015AC9C 1000E724 */   addiu     $a3, $a3, 0x10
    /* 210A8 8015ACA0 4B6B0508 */  j          .L8015AD2C
    /* 210AC 8015ACA4 00000000 */   nop
  .L8015ACA8:
    /* 210B0 8015ACA8 0E80013C */  lui        $at, %hi(plr + 0x38C)
    /* 210B4 8015ACAC 21083000 */  addu       $at, $at, $s0
    /* 210B8 8015ACB0 C4A82384 */  lh         $v1, %lo(plr + 0x38C)($at)
    /* 210BC 8015ACB4 00000000 */  nop
    /* 210C0 8015ACB8 23006214 */  bne        $v1, $v0, .L8015AD48
    /* 210C4 8015ACBC 21100000 */   addu      $v0, $zero, $zero
    /* 210C8 8015ACC0 0E80013C */  lui        $at, %hi(plr + 0x3F8)
    /* 210CC 8015ACC4 21083000 */  addu       $at, $at, $s0
    /* 210D0 8015ACC8 30A92284 */  lh         $v0, %lo(plr + 0x3F8)($at)
    /* 210D4 8015ACCC 00000000 */  nop
    /* 210D8 8015ACD0 03004310 */  beq        $v0, $v1, .L8015ACE0
    /* 210DC 8015ACD4 01000424 */   addiu     $a0, $zero, 0x1
  .L8015ACD8:
    /* 210E0 8015ACD8 526B0508 */  j          .L8015AD48
    /* 210E4 8015ACDC 21100000 */   addu      $v0, $zero, $zero
  .L8015ACE0:
    /* 210E8 8015ACE0 3D3F010C */  jal        NetSendCmdChItem__FUcUc
    /* 210EC 8015ACE4 04000524 */   addiu     $a1, $zero, 0x4
    /* 210F0 8015ACE8 0E80023C */  lui        $v0, %hi(plr + 0x360)
    /* 210F4 8015ACEC 98A84224 */  addiu      $v0, $v0, %lo(plr + 0x360)
    /* 210F8 8015ACF0 21380202 */  addu       $a3, $s0, $v0
    /* 210FC 8015ACF4 B0154224 */  addiu      $v0, $v0, 0x15B0
    /* 21100 8015ACF8 21300202 */  addu       $a2, $s0, $v0
    /* 21104 8015ACFC 6000C824 */  addiu      $t0, $a2, 0x60
  .L8015AD00:
    /* 21108 8015AD00 0000C28C */  lw         $v0, 0x0($a2)
    /* 2110C 8015AD04 0400C38C */  lw         $v1, 0x4($a2)
    /* 21110 8015AD08 0800C48C */  lw         $a0, 0x8($a2)
    /* 21114 8015AD0C 0C00C58C */  lw         $a1, 0xC($a2)
    /* 21118 8015AD10 0000E2AC */  sw         $v0, 0x0($a3)
    /* 2111C 8015AD14 0400E3AC */  sw         $v1, 0x4($a3)
    /* 21120 8015AD18 0800E4AC */  sw         $a0, 0x8($a3)
    /* 21124 8015AD1C 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 21128 8015AD20 1000C624 */  addiu      $a2, $a2, 0x10
    /* 2112C 8015AD24 F6FFC814 */  bne        $a2, $t0, .L8015AD00
    /* 21130 8015AD28 1000E724 */   addiu     $a3, $a3, 0x10
  .L8015AD2C:
    /* 21134 8015AD2C 0000C28C */  lw         $v0, 0x0($a2)
    /* 21138 8015AD30 0400C38C */  lw         $v1, 0x4($a2)
    /* 2113C 8015AD34 0800C48C */  lw         $a0, 0x8($a2)
    /* 21140 8015AD38 0000E2AC */  sw         $v0, 0x0($a3)
    /* 21144 8015AD3C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 21148 8015AD40 0800E4AC */  sw         $a0, 0x8($a3)
    /* 2114C 8015AD44 01000224 */  addiu      $v0, $zero, 0x1
  .L8015AD48:
    /* 21150 8015AD48 1400BF8F */  lw         $ra, 0x14($sp)
    /* 21154 8015AD4C 1000B08F */  lw         $s0, 0x10($sp)
    /* 21158 8015AD50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2115C 8015AD54 0800E003 */  jr         $ra
    /* 21160 8015AD58 00000000 */   nop
endlabel WeaponAutoPlace__Fi
