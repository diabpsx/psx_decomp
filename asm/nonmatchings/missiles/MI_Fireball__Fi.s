.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Fireball__Fi, 0x97C

glabel MI_Fireball__Fi
    /* AFB4 80144BAC B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* AFB8 80144BB0 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* AFBC 80144BB4 21888000 */  addu       $s1, $a0, $zero
    /* AFC0 80144BB8 80101100 */  sll        $v0, $s1, 2
    /* AFC4 80144BBC 21105100 */  addu       $v0, $v0, $s1
    /* AFC8 80144BC0 80100200 */  sll        $v0, $v0, 2
    /* AFCC 80144BC4 23105100 */  subu       $v0, $v0, $s1
    /* AFD0 80144BC8 80100200 */  sll        $v0, $v0, 2
    /* AFD4 80144BCC 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* AFD8 80144BD0 4800BEAF */  sw         $fp, 0x48($sp)
    /* AFDC 80144BD4 4400B7AF */  sw         $s7, 0x44($sp)
    /* AFE0 80144BD8 4000B6AF */  sw         $s6, 0x40($sp)
    /* AFE4 80144BDC 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* AFE8 80144BE0 3800B4AF */  sw         $s4, 0x38($sp)
    /* AFEC 80144BE4 3400B3AF */  sw         $s3, 0x34($sp)
    /* AFF0 80144BE8 3000B2AF */  sw         $s2, 0x30($sp)
    /* AFF4 80144BEC 2800B0AF */  sw         $s0, 0x28($sp)
    /* AFF8 80144BF0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AFFC 80144BF4 21082200 */  addu       $at, $at, $v0
    /* B000 80144BF8 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* B004 80144BFC 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* B008 80144C00 21082200 */  addu       $at, $at, $v0
    /* B00C 80144C04 862C2484 */  lh         $a0, %lo(missile + 0x2E)($at)
    /* B010 80144C08 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* B014 80144C0C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* B018 80144C10 21082200 */  addu       $at, $at, $v0
    /* B01C 80144C14 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* B020 80144C18 1080013C */  lui        $at, %hi(missile + 0x1A)
    /* B024 80144C1C 21082200 */  addu       $at, $at, $v0
    /* B028 80144C20 722C2394 */  lhu        $v1, %lo(missile + 0x1A)($at)
    /* B02C 80144C24 1080013C */  lui        $at, %hi(missile + 0x10)
    /* B030 80144C28 21082200 */  addu       $at, $at, $v0
    /* B034 80144C2C 682C328C */  lw         $s2, %lo(missile + 0x10)($at)
    /* B038 80144C30 11006014 */  bnez       $v1, .L80144C78
    /* B03C 80144C34 40100400 */   sll       $v0, $a0, 1
    /* B040 80144C38 21104400 */  addu       $v0, $v0, $a0
    /* B044 80144C3C 80100200 */  sll        $v0, $v0, 2
    /* B048 80144C40 21104400 */  addu       $v0, $v0, $a0
    /* B04C 80144C44 00110200 */  sll        $v0, $v0, 4
    /* B050 80144C48 23104400 */  subu       $v0, $v0, $a0
    /* B054 80144C4C 80100200 */  sll        $v0, $v0, 2
    /* B058 80144C50 21104400 */  addu       $v0, $v0, $a0
    /* B05C 80144C54 C0100200 */  sll        $v0, $v0, 3
    /* B060 80144C58 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* B064 80144C5C 21082200 */  addu       $at, $at, $v0
    /* B068 80144C60 68A53E84 */  lh         $fp, %lo(plr + 0x30)($at)
    /* B06C 80144C64 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* B070 80144C68 21082200 */  addu       $at, $at, $v0
    /* B074 80144C6C 6AA53784 */  lh         $s7, %lo(plr + 0x32)($at)
    /* B078 80144C70 29130508 */  j          .L80144CA4
    /* B07C 80144C74 80101100 */   sll       $v0, $s1, 2
  .L80144C78:
    /* B080 80144C78 21104400 */  addu       $v0, $v0, $a0
    /* B084 80144C7C 80100200 */  sll        $v0, $v0, 2
    /* B088 80144C80 21104400 */  addu       $v0, $v0, $a0
    /* B08C 80144C84 C0100200 */  sll        $v0, $v0, 3
    /* B090 80144C88 1080013C */  lui        $at, %hi(monster + 0x34)
    /* B094 80144C8C 21082200 */  addu       $at, $at, $v0
    /* B098 80144C90 C8533E80 */  lb         $fp, %lo(monster + 0x34)($at)
    /* B09C 80144C94 1080013C */  lui        $at, %hi(monster + 0x35)
    /* B0A0 80144C98 21082200 */  addu       $at, $at, $v0
    /* B0A4 80144C9C C9533780 */  lb         $s7, %lo(monster + 0x35)($at)
    /* B0A8 80144CA0 80101100 */  sll        $v0, $s1, 2
  .L80144CA4:
    /* B0AC 80144CA4 21105100 */  addu       $v0, $v0, $s1
    /* B0B0 80144CA8 80100200 */  sll        $v0, $v0, 2
    /* B0B4 80144CAC 23105100 */  subu       $v0, $v0, $s1
    /* B0B8 80144CB0 80800200 */  sll        $s0, $v0, 2
    /* B0BC 80144CB4 1080013C */  lui        $at, %hi(missile + 0x37)
    /* B0C0 80144CB8 21083000 */  addu       $at, $at, $s0
    /* B0C4 80144CBC 8F2C2390 */  lbu        $v1, %lo(missile + 0x37)($at)
    /* B0C8 80144CC0 13000224 */  addiu      $v0, $zero, 0x13
    /* B0CC 80144CC4 11006214 */  bne        $v1, $v0, .L80144D0C
    /* B0D0 80144CC8 00000000 */   nop
    /* B0D4 80144CCC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* B0D8 80144CD0 21083000 */  addu       $at, $at, $s0
    /* B0DC 80144CD4 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* B0E0 80144CD8 00000000 */  nop
    /* B0E4 80144CDC 03024014 */  bnez       $v0, .L801454EC
    /* B0E8 80144CE0 01000224 */   addiu     $v0, $zero, 0x1
    /* B0EC 80144CE4 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* B0F0 80144CE8 21083000 */  addu       $at, $at, $s0
    /* B0F4 80144CEC 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* B0F8 80144CF0 1080013C */  lui        $at, %hi(missile + 0x38)
    /* B0FC 80144CF4 21083000 */  addu       $at, $at, $s0
    /* B100 80144CF8 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* B104 80144CFC D034010C */  jal        AddUnLight__Fi
    /* B108 80144D00 00000000 */   nop
    /* B10C 80144D04 3B150508 */  j          .L801454EC
    /* B110 80144D08 00000000 */   nop
  .L80144D0C:
    /* B114 80144D0C 1080013C */  lui        $at, %hi(missile + 0x8)
    /* B118 80144D10 21083000 */  addu       $at, $at, $s0
    /* B11C 80144D14 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* B120 80144D18 1080013C */  lui        $at, %hi(missile)
    /* B124 80144D1C 21083000 */  addu       $at, $at, $s0
    /* B128 80144D20 582C258C */  lw         $a1, %lo(missile)($at)
    /* B12C 80144D24 1080013C */  lui        $at, %hi(missile + 0xC)
    /* B130 80144D28 21083000 */  addu       $at, $at, $s0
    /* B134 80144D2C 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* B138 80144D30 1080013C */  lui        $at, %hi(missile + 0x4)
    /* B13C 80144D34 21083000 */  addu       $at, $at, $s0
    /* B140 80144D38 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* B144 80144D3C 21104500 */  addu       $v0, $v0, $a1
    /* B148 80144D40 21186600 */  addu       $v1, $v1, $a2
    /* B14C 80144D44 1080013C */  lui        $at, %hi(missile + 0x8)
    /* B150 80144D48 21083000 */  addu       $at, $at, $s0
    /* B154 80144D4C 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* B158 80144D50 1080013C */  lui        $at, %hi(missile + 0xC)
    /* B15C 80144D54 21083000 */  addu       $at, $at, $s0
    /* B160 80144D58 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* B164 80144D5C 68EB040C */  jal        GetMissilePos__Fi
    /* B168 80144D60 21202002 */   addu      $a0, $s1, $zero
    /* B16C 80144D64 1080013C */  lui        $at, %hi(missile + 0x31)
    /* B170 80144D68 21083000 */  addu       $at, $at, $s0
    /* B174 80144D6C 892C2780 */  lb         $a3, %lo(missile + 0x31)($at)
    /* B178 80144D70 1080013C */  lui        $at, %hi(missile + 0x35)
    /* B17C 80144D74 21083000 */  addu       $at, $at, $s0
    /* B180 80144D78 8D2C2280 */  lb         $v0, %lo(missile + 0x35)($at)
    /* B184 80144D7C 00000000 */  nop
    /* B188 80144D80 0A00E214 */  bne        $a3, $v0, .L80144DAC
    /* B18C 80144D84 00000000 */   nop
    /* B190 80144D88 1080013C */  lui        $at, %hi(missile + 0x32)
    /* B194 80144D8C 21083000 */  addu       $at, $at, $s0
    /* B198 80144D90 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* B19C 80144D94 1080013C */  lui        $at, %hi(missile + 0x36)
    /* B1A0 80144D98 21083000 */  addu       $at, $at, $s0
    /* B1A4 80144D9C 8E2C2280 */  lb         $v0, %lo(missile + 0x36)($at)
    /* B1A8 80144DA0 00000000 */  nop
    /* B1AC 80144DA4 0F006210 */  beq        $v1, $v0, .L80144DE4
    /* B1B0 80144DA8 80101100 */   sll       $v0, $s1, 2
  .L80144DAC:
    /* B1B4 80144DAC 21202002 */  addu       $a0, $s1, $zero
    /* B1B8 80144DB0 21284002 */  addu       $a1, $s2, $zero
    /* B1BC 80144DB4 21304002 */  addu       $a2, $s2, $zero
    /* B1C0 80144DB8 1000A7AF */  sw         $a3, 0x10($sp)
    /* B1C4 80144DBC 21380000 */  addu       $a3, $zero, $zero
    /* B1C8 80144DC0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* B1CC 80144DC4 21083000 */  addu       $at, $at, $s0
    /* B1D0 80144DC8 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* B1D4 80144DCC 01000224 */  addiu      $v0, $zero, 0x1
    /* B1D8 80144DD0 1800A0AF */  sw         $zero, 0x18($sp)
    /* B1DC 80144DD4 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* B1E0 80144DD8 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* B1E4 80144DDC 1400A3AF */   sw        $v1, 0x14($sp)
    /* B1E8 80144DE0 80101100 */  sll        $v0, $s1, 2
  .L80144DE4:
    /* B1EC 80144DE4 21105100 */  addu       $v0, $v0, $s1
    /* B1F0 80144DE8 80100200 */  sll        $v0, $v0, 2
    /* B1F4 80144DEC 23105100 */  subu       $v0, $v0, $s1
    /* B1F8 80144DF0 80400200 */  sll        $t0, $v0, 2
    /* B1FC 80144DF4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* B200 80144DF8 21082800 */  addu       $at, $at, $t0
    /* B204 80144DFC 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* B208 80144E00 00000000 */  nop
    /* B20C 80144E04 90014014 */  bnez       $v0, .L80145448
    /* B210 80144E08 95000724 */   addiu     $a3, $zero, 0x95
    /* B214 80144E0C 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* B218 80144E10 21082800 */  addu       $at, $at, $t0
    /* B21C 80144E14 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* B220 80144E18 1080013C */  lui        $at, %hi(missile + 0x31)
    /* B224 80144E1C 21082800 */  addu       $at, $at, $t0
    /* B228 80144E20 892C3380 */  lb         $s3, %lo(missile + 0x31)($at)
    /* B22C 80144E24 1080013C */  lui        $at, %hi(missile + 0x32)
    /* B230 80144E28 21082800 */  addu       $at, $at, $t0
    /* B234 80144E2C 8A2C3480 */  lb         $s4, %lo(missile + 0x32)($at)
    /* B238 80144E30 21286002 */  addu       $a1, $s3, $zero
    /* B23C 80144E34 F834010C */  jal        ChangeLight__Fiiii
    /* B240 80144E38 21308002 */   addu      $a2, $s4, $zero
    /* B244 80144E3C 2120C003 */  addu       $a0, $fp, $zero
    /* B248 80144E40 2128E002 */  addu       $a1, $s7, $zero
    /* B24C 80144E44 21306002 */  addu       $a2, $s3, $zero
    /* B250 80144E48 7FE8040C */  jal        CheckBlock__Fiiii
    /* B254 80144E4C 21388002 */   addu      $a3, $s4, $zero
    /* B258 80144E50 0C004014 */  bnez       $v0, .L80144E84
    /* B25C 80144E54 2120C003 */   addu      $a0, $fp, $zero
    /* B260 80144E58 21202002 */  addu       $a0, $s1, $zero
    /* B264 80144E5C 21284002 */  addu       $a1, $s2, $zero
    /* B268 80144E60 21304002 */  addu       $a2, $s2, $zero
    /* B26C 80144E64 21380000 */  addu       $a3, $zero, $zero
    /* B270 80144E68 01000224 */  addiu      $v0, $zero, 0x1
    /* B274 80144E6C 1000B3AF */  sw         $s3, 0x10($sp)
    /* B278 80144E70 1400B4AF */  sw         $s4, 0x14($sp)
    /* B27C 80144E74 1800A2AF */  sw         $v0, 0x18($sp)
    /* B280 80144E78 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* B284 80144E7C 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* B288 80144E80 2120C003 */  addu       $a0, $fp, $zero
  .L80144E84:
    /* B28C 80144E84 2128E002 */  addu       $a1, $s7, $zero
    /* B290 80144E88 21306002 */  addu       $a2, $s3, $zero
    /* B294 80144E8C 01009626 */  addiu      $s6, $s4, 0x1
    /* B298 80144E90 7FE8040C */  jal        CheckBlock__Fiiii
    /* B29C 80144E94 2138C002 */   addu      $a3, $s6, $zero
    /* B2A0 80144E98 0C004014 */  bnez       $v0, .L80144ECC
    /* B2A4 80144E9C 2120C003 */   addu      $a0, $fp, $zero
    /* B2A8 80144EA0 21202002 */  addu       $a0, $s1, $zero
    /* B2AC 80144EA4 21284002 */  addu       $a1, $s2, $zero
    /* B2B0 80144EA8 21304002 */  addu       $a2, $s2, $zero
    /* B2B4 80144EAC 21380000 */  addu       $a3, $zero, $zero
    /* B2B8 80144EB0 01000224 */  addiu      $v0, $zero, 0x1
    /* B2BC 80144EB4 1000B3AF */  sw         $s3, 0x10($sp)
    /* B2C0 80144EB8 1400B6AF */  sw         $s6, 0x14($sp)
    /* B2C4 80144EBC 1800A2AF */  sw         $v0, 0x18($sp)
    /* B2C8 80144EC0 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* B2CC 80144EC4 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* B2D0 80144EC8 2120C003 */  addu       $a0, $fp, $zero
  .L80144ECC:
    /* B2D4 80144ECC 2128E002 */  addu       $a1, $s7, $zero
    /* B2D8 80144ED0 21306002 */  addu       $a2, $s3, $zero
    /* B2DC 80144ED4 FFFF9526 */  addiu      $s5, $s4, -0x1
    /* B2E0 80144ED8 7FE8040C */  jal        CheckBlock__Fiiii
    /* B2E4 80144EDC 2138A002 */   addu      $a3, $s5, $zero
    /* B2E8 80144EE0 0C004014 */  bnez       $v0, .L80144F14
    /* B2EC 80144EE4 2120C003 */   addu      $a0, $fp, $zero
    /* B2F0 80144EE8 21202002 */  addu       $a0, $s1, $zero
    /* B2F4 80144EEC 21284002 */  addu       $a1, $s2, $zero
    /* B2F8 80144EF0 21304002 */  addu       $a2, $s2, $zero
    /* B2FC 80144EF4 21380000 */  addu       $a3, $zero, $zero
    /* B300 80144EF8 01000224 */  addiu      $v0, $zero, 0x1
    /* B304 80144EFC 1000B3AF */  sw         $s3, 0x10($sp)
    /* B308 80144F00 1400B5AF */  sw         $s5, 0x14($sp)
    /* B30C 80144F04 1800A2AF */  sw         $v0, 0x18($sp)
    /* B310 80144F08 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* B314 80144F0C 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* B318 80144F10 2120C003 */  addu       $a0, $fp, $zero
  .L80144F14:
    /* B31C 80144F14 2128E002 */  addu       $a1, $s7, $zero
    /* B320 80144F18 01007026 */  addiu      $s0, $s3, 0x1
    /* B324 80144F1C 21300002 */  addu       $a2, $s0, $zero
    /* B328 80144F20 7FE8040C */  jal        CheckBlock__Fiiii
    /* B32C 80144F24 21388002 */   addu      $a3, $s4, $zero
    /* B330 80144F28 0C004014 */  bnez       $v0, .L80144F5C
    /* B334 80144F2C 2120C003 */   addu      $a0, $fp, $zero
    /* B338 80144F30 21202002 */  addu       $a0, $s1, $zero
    /* B33C 80144F34 21284002 */  addu       $a1, $s2, $zero
    /* B340 80144F38 21304002 */  addu       $a2, $s2, $zero
    /* B344 80144F3C 21380000 */  addu       $a3, $zero, $zero
    /* B348 80144F40 01000224 */  addiu      $v0, $zero, 0x1
    /* B34C 80144F44 1000B0AF */  sw         $s0, 0x10($sp)
    /* B350 80144F48 1400B4AF */  sw         $s4, 0x14($sp)
    /* B354 80144F4C 1800A2AF */  sw         $v0, 0x18($sp)
    /* B358 80144F50 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* B35C 80144F54 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* B360 80144F58 2120C003 */  addu       $a0, $fp, $zero
  .L80144F5C:
    /* B364 80144F5C 2128E002 */  addu       $a1, $s7, $zero
    /* B368 80144F60 21300002 */  addu       $a2, $s0, $zero
    /* B36C 80144F64 7FE8040C */  jal        CheckBlock__Fiiii
    /* B370 80144F68 2138A002 */   addu      $a3, $s5, $zero
    /* B374 80144F6C 0C004014 */  bnez       $v0, .L80144FA0
    /* B378 80144F70 2120C003 */   addu      $a0, $fp, $zero
    /* B37C 80144F74 21202002 */  addu       $a0, $s1, $zero
    /* B380 80144F78 21284002 */  addu       $a1, $s2, $zero
    /* B384 80144F7C 21304002 */  addu       $a2, $s2, $zero
    /* B388 80144F80 21380000 */  addu       $a3, $zero, $zero
    /* B38C 80144F84 01000224 */  addiu      $v0, $zero, 0x1
    /* B390 80144F88 1000B0AF */  sw         $s0, 0x10($sp)
    /* B394 80144F8C 1400B5AF */  sw         $s5, 0x14($sp)
    /* B398 80144F90 1800A2AF */  sw         $v0, 0x18($sp)
    /* B39C 80144F94 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* B3A0 80144F98 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* B3A4 80144F9C 2120C003 */  addu       $a0, $fp, $zero
  .L80144FA0:
    /* B3A8 80144FA0 2128E002 */  addu       $a1, $s7, $zero
    /* B3AC 80144FA4 21300002 */  addu       $a2, $s0, $zero
    /* B3B0 80144FA8 7FE8040C */  jal        CheckBlock__Fiiii
    /* B3B4 80144FAC 2138C002 */   addu      $a3, $s6, $zero
    /* B3B8 80144FB0 0C004014 */  bnez       $v0, .L80144FE4
    /* B3BC 80144FB4 2120C003 */   addu      $a0, $fp, $zero
    /* B3C0 80144FB8 21202002 */  addu       $a0, $s1, $zero
    /* B3C4 80144FBC 21284002 */  addu       $a1, $s2, $zero
    /* B3C8 80144FC0 21304002 */  addu       $a2, $s2, $zero
    /* B3CC 80144FC4 21380000 */  addu       $a3, $zero, $zero
    /* B3D0 80144FC8 01000224 */  addiu      $v0, $zero, 0x1
    /* B3D4 80144FCC 1000B0AF */  sw         $s0, 0x10($sp)
    /* B3D8 80144FD0 1400B6AF */  sw         $s6, 0x14($sp)
    /* B3DC 80144FD4 1800A2AF */  sw         $v0, 0x18($sp)
    /* B3E0 80144FD8 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* B3E4 80144FDC 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* B3E8 80144FE0 2120C003 */  addu       $a0, $fp, $zero
  .L80144FE4:
    /* B3EC 80144FE4 2128E002 */  addu       $a1, $s7, $zero
    /* B3F0 80144FE8 FFFF7026 */  addiu      $s0, $s3, -0x1
    /* B3F4 80144FEC 21300002 */  addu       $a2, $s0, $zero
    /* B3F8 80144FF0 7FE8040C */  jal        CheckBlock__Fiiii
    /* B3FC 80144FF4 21388002 */   addu      $a3, $s4, $zero
    /* B400 80144FF8 0C004014 */  bnez       $v0, .L8014502C
    /* B404 80144FFC 2120C003 */   addu      $a0, $fp, $zero
    /* B408 80145000 21202002 */  addu       $a0, $s1, $zero
    /* B40C 80145004 21284002 */  addu       $a1, $s2, $zero
    /* B410 80145008 21304002 */  addu       $a2, $s2, $zero
    /* B414 8014500C 21380000 */  addu       $a3, $zero, $zero
    /* B418 80145010 01000224 */  addiu      $v0, $zero, 0x1
    /* B41C 80145014 1000B0AF */  sw         $s0, 0x10($sp)
    /* B420 80145018 1400B4AF */  sw         $s4, 0x14($sp)
    /* B424 8014501C 1800A2AF */  sw         $v0, 0x18($sp)
    /* B428 80145020 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* B42C 80145024 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* B430 80145028 2120C003 */  addu       $a0, $fp, $zero
  .L8014502C:
    /* B434 8014502C 2128E002 */  addu       $a1, $s7, $zero
    /* B438 80145030 21300002 */  addu       $a2, $s0, $zero
    /* B43C 80145034 7FE8040C */  jal        CheckBlock__Fiiii
    /* B440 80145038 2138C002 */   addu      $a3, $s6, $zero
    /* B444 8014503C 0C004014 */  bnez       $v0, .L80145070
    /* B448 80145040 2120C003 */   addu      $a0, $fp, $zero
    /* B44C 80145044 21202002 */  addu       $a0, $s1, $zero
    /* B450 80145048 21284002 */  addu       $a1, $s2, $zero
    /* B454 8014504C 21304002 */  addu       $a2, $s2, $zero
    /* B458 80145050 21380000 */  addu       $a3, $zero, $zero
    /* B45C 80145054 01000224 */  addiu      $v0, $zero, 0x1
    /* B460 80145058 1000B0AF */  sw         $s0, 0x10($sp)
    /* B464 8014505C 1400B6AF */  sw         $s6, 0x14($sp)
    /* B468 80145060 1800A2AF */  sw         $v0, 0x18($sp)
    /* B46C 80145064 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* B470 80145068 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* B474 8014506C 2120C003 */  addu       $a0, $fp, $zero
  .L80145070:
    /* B478 80145070 2128E002 */  addu       $a1, $s7, $zero
    /* B47C 80145074 21300002 */  addu       $a2, $s0, $zero
    /* B480 80145078 7FE8040C */  jal        CheckBlock__Fiiii
    /* B484 8014507C 2138A002 */   addu      $a3, $s5, $zero
    /* B488 80145080 0C004014 */  bnez       $v0, .L801450B4
    /* B48C 80145084 C0181400 */   sll       $v1, $s4, 3
    /* B490 80145088 21202002 */  addu       $a0, $s1, $zero
    /* B494 8014508C 21284002 */  addu       $a1, $s2, $zero
    /* B498 80145090 2130A000 */  addu       $a2, $a1, $zero
    /* B49C 80145094 21380000 */  addu       $a3, $zero, $zero
    /* B4A0 80145098 01000224 */  addiu      $v0, $zero, 0x1
    /* B4A4 8014509C 1000B0AF */  sw         $s0, 0x10($sp)
    /* B4A8 801450A0 1400B5AF */  sw         $s5, 0x14($sp)
    /* B4AC 801450A4 1800A2AF */  sw         $v0, 0x18($sp)
    /* B4B0 801450A8 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* B4B4 801450AC 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* B4B8 801450B0 C0181400 */  sll        $v1, $s4, 3
  .L801450B4:
    /* B4BC 801450B4 C0101300 */  sll        $v0, $s3, 3
    /* B4C0 801450B8 23105300 */  subu       $v0, $v0, $s3
    /* B4C4 801450BC C0810200 */  sll        $s0, $v0, 7
    /* B4C8 801450C0 21187000 */  addu       $v1, $v1, $s0
    /* B4CC 801450C4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* B4D0 801450C8 21082300 */  addu       $at, $at, $v1
    /* B4D4 801450CC 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* B4D8 801450D0 0E80013C */  lui        $at, %hi(TransList)
    /* B4DC 801450D4 21082200 */  addu       $at, $at, $v0
    /* B4E0 801450D8 28792290 */  lbu        $v0, %lo(TransList)($at)
    /* B4E4 801450DC 00000000 */  nop
    /* B4E8 801450E0 2D004010 */  beqz       $v0, .L80145198
    /* B4EC 801450E4 80101100 */   sll       $v0, $s1, 2
    /* B4F0 801450E8 21105100 */  addu       $v0, $v0, $s1
    /* B4F4 801450EC 80100200 */  sll        $v0, $v0, 2
    /* B4F8 801450F0 23105100 */  subu       $v0, $v0, $s1
    /* B4FC 801450F4 80100200 */  sll        $v0, $v0, 2
    /* B500 801450F8 1080013C */  lui        $at, %hi(missile)
    /* B504 801450FC 21082200 */  addu       $at, $at, $v0
    /* B508 80145100 582C228C */  lw         $v0, %lo(missile)($at)
    /* B50C 80145104 00000000 */  nop
    /* B510 80145108 3F004104 */  bgez       $v0, .L80145208
    /* B514 8014510C 80101100 */   sll       $v0, $s1, 2
    /* B518 80145110 C0101600 */  sll        $v0, $s6, 3
    /* B51C 80145114 21105000 */  addu       $v0, $v0, $s0
    /* B520 80145118 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* B524 8014511C 21082200 */  addu       $at, $at, $v0
    /* B528 80145120 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* B52C 80145124 0E80013C */  lui        $at, %hi(TransList)
    /* B530 80145128 21082200 */  addu       $at, $at, $v0
    /* B534 8014512C 28792290 */  lbu        $v0, %lo(TransList)($at)
    /* B538 80145130 00000000 */  nop
    /* B53C 80145134 06004010 */  beqz       $v0, .L80145150
    /* B540 80145138 21900000 */   addu      $s2, $zero, $zero
    /* B544 8014513C 21206002 */  addu       $a0, $s3, $zero
    /* B548 80145140 380B020C */  jal        GetSOLID__Fii
    /* B54C 80145144 2128C002 */   addu      $a1, $s6, $zero
    /* B550 80145148 10004014 */  bnez       $v0, .L8014518C
    /* B554 8014514C 00000000 */   nop
  .L80145150:
    /* B558 80145150 C0101500 */  sll        $v0, $s5, 3
    /* B55C 80145154 21105000 */  addu       $v0, $v0, $s0
    /* B560 80145158 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* B564 8014515C 21082200 */  addu       $at, $at, $v0
    /* B568 80145160 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* B56C 80145164 0E80013C */  lui        $at, %hi(TransList)
    /* B570 80145168 21082200 */  addu       $at, $at, $v0
    /* B574 8014516C 28792290 */  lbu        $v0, %lo(TransList)($at)
    /* B578 80145170 00000000 */  nop
    /* B57C 80145174 06004010 */  beqz       $v0, .L80145190
    /* B580 80145178 21206002 */   addu      $a0, $s3, $zero
    /* B584 8014517C 380B020C */  jal        GetSOLID__Fii
    /* B588 80145180 2128A002 */   addu      $a1, $s5, $zero
    /* B58C 80145184 02004010 */  beqz       $v0, .L80145190
    /* B590 80145188 00000000 */   nop
  .L8014518C:
    /* B594 8014518C 01001224 */  addiu      $s2, $zero, 0x1
  .L80145190:
    /* B598 80145190 1D004012 */  beqz       $s2, .L80145208
    /* B59C 80145194 80101100 */   sll       $v0, $s1, 2
  .L80145198:
    /* B5A0 80145198 80181100 */  sll        $v1, $s1, 2
    /* B5A4 8014519C 21187100 */  addu       $v1, $v1, $s1
    /* B5A8 801451A0 80180300 */  sll        $v1, $v1, 2
    /* B5AC 801451A4 23187100 */  subu       $v1, $v1, $s1
    /* B5B0 801451A8 80180300 */  sll        $v1, $v1, 2
    /* B5B4 801451AC 1080043C */  lui        $a0, %hi(missile)
    /* B5B8 801451B0 582C8424 */  addiu      $a0, $a0, %lo(missile)
    /* B5BC 801451B4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* B5C0 801451B8 21082300 */  addu       $at, $at, $v1
    /* B5C4 801451BC 892C2290 */  lbu        $v0, %lo(missile + 0x31)($at)
    /* B5C8 801451C0 21206400 */  addu       $a0, $v1, $a0
    /* B5CC 801451C4 01004224 */  addiu      $v0, $v0, 0x1
    /* B5D0 801451C8 310082A0 */  sb         $v0, 0x31($a0)
    /* B5D4 801451CC 1080013C */  lui        $at, %hi(missile + 0x32)
    /* B5D8 801451D0 21082300 */  addu       $at, $at, $v1
    /* B5DC 801451D4 8A2C2290 */  lbu        $v0, %lo(missile + 0x32)($at)
    /* B5E0 801451D8 00000000 */  nop
    /* B5E4 801451DC 01004224 */  addiu      $v0, $v0, 0x1
    /* B5E8 801451E0 320082A0 */  sb         $v0, 0x32($a0)
    /* B5EC 801451E4 1080013C */  lui        $at, %hi(missile + 0x34)
    /* B5F0 801451E8 21082300 */  addu       $at, $at, $v1
    /* B5F4 801451EC 8C2C2290 */  lbu        $v0, %lo(missile + 0x34)($at)
    /* B5F8 801451F0 00000000 */  nop
    /* B5FC 801451F4 E0FF4224 */  addiu      $v0, $v0, -0x20
    /* B600 801451F8 1080013C */  lui        $at, %hi(missile + 0x34)
    /* B604 801451FC 21082300 */  addu       $at, $at, $v1
    /* B608 80145200 8C2C22A0 */  sb         $v0, %lo(missile + 0x34)($at)
    /* B60C 80145204 80101100 */  sll        $v0, $s1, 2
  .L80145208:
    /* B610 80145208 21105100 */  addu       $v0, $v0, $s1
    /* B614 8014520C 80100200 */  sll        $v0, $v0, 2
    /* B618 80145210 23105100 */  subu       $v0, $v0, $s1
    /* B61C 80145214 80100200 */  sll        $v0, $v0, 2
    /* B620 80145218 1080013C */  lui        $at, %hi(missile + 0x4)
    /* B624 8014521C 21082200 */  addu       $at, $at, $v0
    /* B628 80145220 5C2C228C */  lw         $v0, %lo(missile + 0x4)($at)
    /* B62C 80145224 00000000 */  nop
    /* B630 80145228 34004018 */  blez       $v0, .L801452FC
    /* B634 8014522C C0801400 */   sll       $s0, $s4, 3
    /* B638 80145230 01006426 */  addiu      $a0, $s3, 0x1
    /* B63C 80145234 C0100400 */  sll        $v0, $a0, 3
    /* B640 80145238 23104400 */  subu       $v0, $v0, $a0
    /* B644 8014523C C0110200 */  sll        $v0, $v0, 7
    /* B648 80145240 21100202 */  addu       $v0, $s0, $v0
    /* B64C 80145244 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* B650 80145248 21082200 */  addu       $at, $at, $v0
    /* B654 8014524C 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* B658 80145250 0E80013C */  lui        $at, %hi(TransList)
    /* B65C 80145254 21082200 */  addu       $at, $at, $v0
    /* B660 80145258 28792290 */  lbu        $v0, %lo(TransList)($at)
    /* B664 8014525C 00000000 */  nop
    /* B668 80145260 05004010 */  beqz       $v0, .L80145278
    /* B66C 80145264 21900000 */   addu      $s2, $zero, $zero
    /* B670 80145268 380B020C */  jal        GetSOLID__Fii
    /* B674 8014526C 21288002 */   addu      $a1, $s4, $zero
    /* B678 80145270 13004014 */  bnez       $v0, .L801452C0
    /* B67C 80145274 00000000 */   nop
  .L80145278:
    /* B680 80145278 FFFF6426 */  addiu      $a0, $s3, -0x1
    /* B684 8014527C C0100400 */  sll        $v0, $a0, 3
    /* B688 80145280 23104400 */  subu       $v0, $v0, $a0
    /* B68C 80145284 C0110200 */  sll        $v0, $v0, 7
    /* B690 80145288 21100202 */  addu       $v0, $s0, $v0
    /* B694 8014528C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* B698 80145290 21082200 */  addu       $at, $at, $v0
    /* B69C 80145294 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* B6A0 80145298 0E80013C */  lui        $at, %hi(TransList)
    /* B6A4 8014529C 21082200 */  addu       $at, $at, $v0
    /* B6A8 801452A0 28792290 */  lbu        $v0, %lo(TransList)($at)
    /* B6AC 801452A4 00000000 */  nop
    /* B6B0 801452A8 06004010 */  beqz       $v0, .L801452C4
    /* B6B4 801452AC 00000000 */   nop
    /* B6B8 801452B0 380B020C */  jal        GetSOLID__Fii
    /* B6BC 801452B4 21288002 */   addu      $a1, $s4, $zero
    /* B6C0 801452B8 02004010 */  beqz       $v0, .L801452C4
    /* B6C4 801452BC 00000000 */   nop
  .L801452C0:
    /* B6C8 801452C0 01001224 */  addiu      $s2, $zero, 0x1
  .L801452C4:
    /* B6CC 801452C4 0D004012 */  beqz       $s2, .L801452FC
    /* B6D0 801452C8 80101100 */   sll       $v0, $s1, 2
    /* B6D4 801452CC 21105100 */  addu       $v0, $v0, $s1
    /* B6D8 801452D0 80100200 */  sll        $v0, $v0, 2
    /* B6DC 801452D4 23105100 */  subu       $v0, $v0, $s1
    /* B6E0 801452D8 80100200 */  sll        $v0, $v0, 2
    /* B6E4 801452DC 1080013C */  lui        $at, %hi(missile + 0x34)
    /* B6E8 801452E0 21082200 */  addu       $at, $at, $v0
    /* B6EC 801452E4 8C2C2390 */  lbu        $v1, %lo(missile + 0x34)($at)
    /* B6F0 801452E8 00000000 */  nop
    /* B6F4 801452EC E0FF6324 */  addiu      $v1, $v1, -0x20
    /* B6F8 801452F0 1080013C */  lui        $at, %hi(missile + 0x34)
    /* B6FC 801452F4 21082200 */  addu       $at, $at, $v0
    /* B700 801452F8 8C2C23A0 */  sb         $v1, %lo(missile + 0x34)($at)
  .L801452FC:
    /* B704 801452FC 80101100 */  sll        $v0, $s1, 2
    /* B708 80145300 21105100 */  addu       $v0, $v0, $s1
    /* B70C 80145304 80100200 */  sll        $v0, $v0, 2
    /* B710 80145308 23105100 */  subu       $v0, $v0, $s1
    /* B714 8014530C 80100200 */  sll        $v0, $v0, 2
    /* B718 80145310 1080013C */  lui        $at, %hi(missile)
    /* B71C 80145314 21082200 */  addu       $at, $at, $v0
    /* B720 80145318 582C228C */  lw         $v0, %lo(missile)($at)
    /* B724 8014531C 00000000 */  nop
    /* B728 80145320 32004018 */  blez       $v0, .L801453EC
    /* B72C 80145324 01008526 */   addiu     $a1, $s4, 0x1
    /* B730 80145328 C0180500 */  sll        $v1, $a1, 3
    /* B734 8014532C C0101300 */  sll        $v0, $s3, 3
    /* B738 80145330 23105300 */  subu       $v0, $v0, $s3
    /* B73C 80145334 C0810200 */  sll        $s0, $v0, 7
    /* B740 80145338 21187000 */  addu       $v1, $v1, $s0
    /* B744 8014533C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* B748 80145340 21082300 */  addu       $at, $at, $v1
    /* B74C 80145344 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* B750 80145348 0E80013C */  lui        $at, %hi(TransList)
    /* B754 8014534C 21082200 */  addu       $at, $at, $v0
    /* B758 80145350 28792290 */  lbu        $v0, %lo(TransList)($at)
    /* B75C 80145354 00000000 */  nop
    /* B760 80145358 05004010 */  beqz       $v0, .L80145370
    /* B764 8014535C 21900000 */   addu      $s2, $zero, $zero
    /* B768 80145360 380B020C */  jal        GetSOLID__Fii
    /* B76C 80145364 21206002 */   addu      $a0, $s3, $zero
    /* B770 80145368 11004014 */  bnez       $v0, .L801453B0
    /* B774 8014536C 00000000 */   nop
  .L80145370:
    /* B778 80145370 FFFF8526 */  addiu      $a1, $s4, -0x1
    /* B77C 80145374 C0100500 */  sll        $v0, $a1, 3
    /* B780 80145378 21105000 */  addu       $v0, $v0, $s0
    /* B784 8014537C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* B788 80145380 21082200 */  addu       $at, $at, $v0
    /* B78C 80145384 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* B790 80145388 0E80013C */  lui        $at, %hi(TransList)
    /* B794 8014538C 21082200 */  addu       $at, $at, $v0
    /* B798 80145390 28792290 */  lbu        $v0, %lo(TransList)($at)
    /* B79C 80145394 00000000 */  nop
    /* B7A0 80145398 06004010 */  beqz       $v0, .L801453B4
    /* B7A4 8014539C 00000000 */   nop
    /* B7A8 801453A0 380B020C */  jal        GetSOLID__Fii
    /* B7AC 801453A4 21206002 */   addu      $a0, $s3, $zero
    /* B7B0 801453A8 02004010 */  beqz       $v0, .L801453B4
    /* B7B4 801453AC 00000000 */   nop
  .L801453B0:
    /* B7B8 801453B0 01001224 */  addiu      $s2, $zero, 0x1
  .L801453B4:
    /* B7BC 801453B4 0D004012 */  beqz       $s2, .L801453EC
    /* B7C0 801453B8 80101100 */   sll       $v0, $s1, 2
    /* B7C4 801453BC 21105100 */  addu       $v0, $v0, $s1
    /* B7C8 801453C0 80100200 */  sll        $v0, $v0, 2
    /* B7CC 801453C4 23105100 */  subu       $v0, $v0, $s1
    /* B7D0 801453C8 80100200 */  sll        $v0, $v0, 2
    /* B7D4 801453CC 1080013C */  lui        $at, %hi(missile + 0x33)
    /* B7D8 801453D0 21082200 */  addu       $at, $at, $v0
    /* B7DC 801453D4 8B2C2390 */  lbu        $v1, %lo(missile + 0x33)($at)
    /* B7E0 801453D8 00000000 */  nop
    /* B7E4 801453DC E0FF6324 */  addiu      $v1, $v1, -0x20
    /* B7E8 801453E0 1080013C */  lui        $at, %hi(missile + 0x33)
    /* B7EC 801453E4 21082200 */  addu       $at, $at, $v0
    /* B7F0 801453E8 8B2C23A0 */  sb         $v1, %lo(missile + 0x33)($at)
  .L801453EC:
    /* B7F4 801453EC 21202002 */  addu       $a0, $s1, $zero
    /* B7F8 801453F0 80801100 */  sll        $s0, $s1, 2
    /* B7FC 801453F4 21801102 */  addu       $s0, $s0, $s1
    /* B800 801453F8 80801000 */  sll        $s0, $s0, 2
    /* B804 801453FC 23801102 */  subu       $s0, $s0, $s1
    /* B808 80145400 80801000 */  sll        $s0, $s0, 2
    /* B80C 80145404 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* B810 80145408 21083000 */  addu       $at, $at, $s0
    /* B814 8014540C 972C20A0 */  sb         $zero, %lo(missile + 0x3F)($at)
    /* B818 80145410 D3F4040C */  jal        SetMissAnim__Fii
    /* B81C 80145414 13000524 */   addiu     $a1, $zero, 0x13
    /* B820 80145418 1080013C */  lui        $at, %hi(missile + 0x42)
    /* B824 8014541C 21083000 */  addu       $at, $at, $s0
    /* B828 80145420 9A2C2290 */  lbu        $v0, %lo(missile + 0x42)($at)
    /* B82C 80145424 00000000 */  nop
    /* B830 80145428 00160200 */  sll        $v0, $v0, 24
    /* B834 8014542C 03160200 */  sra        $v0, $v0, 24
    /* B838 80145430 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* B83C 80145434 1080013C */  lui        $at, %hi(missile + 0x18)
    /* B840 80145438 21083000 */  addu       $at, $at, $s0
    /* B844 8014543C 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* B848 80145440 3B150508 */  j          .L801454EC
    /* B84C 80145444 00000000 */   nop
  .L80145448:
    /* B850 80145448 1080013C */  lui        $at, %hi(missile + 0x31)
    /* B854 8014544C 21082800 */  addu       $at, $at, $t0
    /* B858 80145450 892C2290 */  lbu        $v0, %lo(missile + 0x31)($at)
    /* B85C 80145454 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* B860 80145458 21082800 */  addu       $at, $at, $t0
    /* B864 8014545C 762C2384 */  lh         $v1, %lo(missile + 0x1E)($at)
    /* B868 80145460 00160200 */  sll        $v0, $v0, 24
    /* B86C 80145464 032E0200 */  sra        $a1, $v0, 24
    /* B870 80145468 03160200 */  sra        $v0, $v0, 24
    /* B874 8014546C 0A004314 */  bne        $v0, $v1, .L80145498
    /* B878 80145470 00000000 */   nop
    /* B87C 80145474 1080013C */  lui        $at, %hi(missile + 0x32)
    /* B880 80145478 21082800 */  addu       $at, $at, $t0
    /* B884 8014547C 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* B888 80145480 1080013C */  lui        $at, %hi(missile + 0x20)
    /* B88C 80145484 21082800 */  addu       $at, $at, $t0
    /* B890 80145488 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* B894 8014548C 00000000 */  nop
    /* B898 80145490 16006210 */  beq        $v1, $v0, .L801454EC
    /* B89C 80145494 00000000 */   nop
  .L80145498:
    /* B8A0 80145498 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* B8A4 8014549C 21082800 */  addu       $at, $at, $t0
    /* B8A8 801454A0 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* B8AC 801454A4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* B8B0 801454A8 21082800 */  addu       $at, $at, $t0
    /* B8B4 801454AC 8A2C2290 */  lbu        $v0, %lo(missile + 0x32)($at)
    /* B8B8 801454B0 95000724 */  addiu      $a3, $zero, 0x95
    /* B8BC 801454B4 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* B8C0 801454B8 21082800 */  addu       $at, $at, $t0
    /* B8C4 801454BC 762C25A4 */  sh         $a1, %lo(missile + 0x1E)($at)
    /* B8C8 801454C0 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* B8CC 801454C4 21082800 */  addu       $at, $at, $t0
    /* B8D0 801454C8 762C2584 */  lh         $a1, %lo(missile + 0x1E)($at)
    /* B8D4 801454CC 00160200 */  sll        $v0, $v0, 24
    /* B8D8 801454D0 03160200 */  sra        $v0, $v0, 24
    /* B8DC 801454D4 00340200 */  sll        $a2, $v0, 16
    /* B8E0 801454D8 1080013C */  lui        $at, %hi(missile + 0x20)
    /* B8E4 801454DC 21082800 */  addu       $at, $at, $t0
    /* B8E8 801454E0 782C22A4 */  sh         $v0, %lo(missile + 0x20)($at)
    /* B8EC 801454E4 F834010C */  jal        ChangeLight__Fiiii
    /* B8F0 801454E8 03340600 */   sra       $a2, $a2, 16
  .L801454EC:
    /* B8F4 801454EC D1EA040C */  jal        PutMissile__Fi
    /* B8F8 801454F0 21202002 */   addu      $a0, $s1, $zero
    /* B8FC 801454F4 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* B900 801454F8 4800BE8F */  lw         $fp, 0x48($sp)
    /* B904 801454FC 4400B78F */  lw         $s7, 0x44($sp)
    /* B908 80145500 4000B68F */  lw         $s6, 0x40($sp)
    /* B90C 80145504 3C00B58F */  lw         $s5, 0x3C($sp)
    /* B910 80145508 3800B48F */  lw         $s4, 0x38($sp)
    /* B914 8014550C 3400B38F */  lw         $s3, 0x34($sp)
    /* B918 80145510 3000B28F */  lw         $s2, 0x30($sp)
    /* B91C 80145514 2C00B18F */  lw         $s1, 0x2C($sp)
    /* B920 80145518 2800B08F */  lw         $s0, 0x28($sp)
    /* B924 8014551C 5000BD27 */  addiu      $sp, $sp, 0x50
    /* B928 80145520 0800E003 */  jr         $ra
    /* B92C 80145524 00000000 */   nop
endlabel MI_Fireball__Fi
