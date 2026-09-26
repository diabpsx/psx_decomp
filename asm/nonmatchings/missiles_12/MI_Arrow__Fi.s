.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Arrow__Fi, 0x244

glabel MI_Arrow__Fi
    /* 9F5C 80143B54 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 9F60 80143B58 2400B1AF */  sw         $s1, 0x24($sp)
    /* 9F64 80143B5C 21888000 */  addu       $s1, $a0, $zero
    /* 9F68 80143B60 80101100 */  sll        $v0, $s1, 2
    /* 9F6C 80143B64 21105100 */  addu       $v0, $v0, $s1
    /* 9F70 80143B68 80100200 */  sll        $v0, $v0, 2
    /* 9F74 80143B6C 23105100 */  subu       $v0, $v0, $s1
    /* 9F78 80143B70 2000B0AF */  sw         $s0, 0x20($sp)
    /* 9F7C 80143B74 80800200 */  sll        $s0, $v0, 2
    /* 9F80 80143B78 1080033C */  lui        $v1, %hi(missile)
    /* 9F84 80143B7C 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* 9F88 80143B80 2800BFAF */  sw         $ra, 0x28($sp)
    /* 9F8C 80143B84 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 9F90 80143B88 21083000 */  addu       $at, $at, $s0
    /* 9F94 80143B8C 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 9F98 80143B90 21180302 */  addu       $v1, $s0, $v1
    /* 9F9C 80143B94 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9FA0 80143B98 180062A4 */  sh         $v0, 0x18($v1)
    /* 9FA4 80143B9C 1080013C */  lui        $at, %hi(missile + 0x1C)
    /* 9FA8 80143BA0 21083000 */  addu       $at, $at, $s0
    /* 9FAC 80143BA4 742C2294 */  lhu        $v0, %lo(missile + 0x1C)($at)
    /* 9FB0 80143BA8 00000000 */  nop
    /* 9FB4 80143BAC 01004224 */  addiu      $v0, $v0, 0x1
    /* 9FB8 80143BB0 1C0062A4 */  sh         $v0, 0x1C($v1)
    /* 9FBC 80143BB4 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 9FC0 80143BB8 21083000 */  addu       $at, $at, $s0
    /* 9FC4 80143BBC 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* 9FC8 80143BC0 1080013C */  lui        $at, %hi(missile)
    /* 9FCC 80143BC4 21083000 */  addu       $at, $at, $s0
    /* 9FD0 80143BC8 582C258C */  lw         $a1, %lo(missile)($at)
    /* 9FD4 80143BCC 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 9FD8 80143BD0 21083000 */  addu       $at, $at, $s0
    /* 9FDC 80143BD4 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* 9FE0 80143BD8 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 9FE4 80143BDC 21083000 */  addu       $at, $at, $s0
    /* 9FE8 80143BE0 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* 9FEC 80143BE4 21104500 */  addu       $v0, $v0, $a1
    /* 9FF0 80143BE8 21186600 */  addu       $v1, $v1, $a2
    /* 9FF4 80143BEC 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 9FF8 80143BF0 21083000 */  addu       $at, $at, $s0
    /* 9FFC 80143BF4 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* A000 80143BF8 1080013C */  lui        $at, %hi(missile + 0xC)
    /* A004 80143BFC 21083000 */  addu       $at, $at, $s0
    /* A008 80143C00 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* A00C 80143C04 68EB040C */  jal        GetMissilePos__Fi
    /* A010 80143C08 00000000 */   nop
    /* A014 80143C0C 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* A018 80143C10 21083000 */  addu       $at, $at, $s0
    /* A01C 80143C14 862C2384 */  lh         $v1, %lo(missile + 0x2E)($at)
    /* A020 80143C18 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* A024 80143C1C 23006210 */  beq        $v1, $v0, .L80143CAC
    /* A028 80143C20 80101100 */   sll       $v0, $s1, 2
    /* A02C 80143C24 1080013C */  lui        $at, %hi(missile + 0x1A)
    /* A030 80143C28 21083000 */  addu       $at, $at, $s0
    /* A034 80143C2C 722C2294 */  lhu        $v0, %lo(missile + 0x1A)($at)
    /* A038 80143C30 00000000 */  nop
    /* A03C 80143C34 11004014 */  bnez       $v0, .L80143C7C
    /* A040 80143C38 40100300 */   sll       $v0, $v1, 1
    /* A044 80143C3C 21104300 */  addu       $v0, $v0, $v1
    /* A048 80143C40 80100200 */  sll        $v0, $v0, 2
    /* A04C 80143C44 21104300 */  addu       $v0, $v0, $v1
    /* A050 80143C48 00110200 */  sll        $v0, $v0, 4
    /* A054 80143C4C 23104300 */  subu       $v0, $v0, $v1
    /* A058 80143C50 80100200 */  sll        $v0, $v0, 2
    /* A05C 80143C54 21104300 */  addu       $v0, $v0, $v1
    /* A060 80143C58 C0100200 */  sll        $v0, $v0, 3
    /* A064 80143C5C 0E80013C */  lui        $at, %hi(plr + 0x1990)
    /* A068 80143C60 21082200 */  addu       $at, $at, $v0
    /* A06C 80143C64 C8BE258C */  lw         $a1, %lo(plr + 0x1990)($at)
    /* A070 80143C68 0E80013C */  lui        $at, %hi(plr + 0x1994)
    /* A074 80143C6C 21082200 */  addu       $at, $at, $v0
    /* A078 80143C70 CCBE268C */  lw         $a2, %lo(plr + 0x1994)($at)
    /* A07C 80143C74 2F0F0508 */  j          .L80143CBC
    /* A080 80143C78 80101100 */   sll       $v0, $s1, 2
  .L80143C7C:
    /* A084 80143C7C 21104300 */  addu       $v0, $v0, $v1
    /* A088 80143C80 80100200 */  sll        $v0, $v0, 2
    /* A08C 80143C84 21104300 */  addu       $v0, $v0, $v1
    /* A090 80143C88 C0100200 */  sll        $v0, $v0, 3
    /* A094 80143C8C 1080013C */  lui        $at, %hi(monster + 0x51)
    /* A098 80143C90 21082200 */  addu       $at, $at, $v0
    /* A09C 80143C94 E5532590 */  lbu        $a1, %lo(monster + 0x51)($at)
    /* A0A0 80143C98 1080013C */  lui        $at, %hi(monster + 0x52)
    /* A0A4 80143C9C 21082200 */  addu       $at, $at, $v0
    /* A0A8 80143CA0 E6532690 */  lbu        $a2, %lo(monster + 0x52)($at)
    /* A0AC 80143CA4 2F0F0508 */  j          .L80143CBC
    /* A0B0 80143CA8 80101100 */   sll       $v0, $s1, 2
  .L80143CAC:
    /* A0B4 80143CAC 1280053C */  lui        $a1, %hi(currlevel)
    /* A0B8 80143CB0 0CC1A590 */  lbu        $a1, %lo(currlevel)($a1)
    /* A0BC 80143CB4 00000000 */  nop
    /* A0C0 80143CB8 40300500 */  sll        $a2, $a1, 1
  .L80143CBC:
    /* A0C4 80143CBC 21105100 */  addu       $v0, $v0, $s1
    /* A0C8 80143CC0 80100200 */  sll        $v0, $v0, 2
    /* A0CC 80143CC4 23105100 */  subu       $v0, $v0, $s1
    /* A0D0 80143CC8 80200200 */  sll        $a0, $v0, 2
    /* A0D4 80143CCC 1080013C */  lui        $at, %hi(missile + 0x31)
    /* A0D8 80143CD0 21082400 */  addu       $at, $at, $a0
    /* A0DC 80143CD4 892C2780 */  lb         $a3, %lo(missile + 0x31)($at)
    /* A0E0 80143CD8 1080013C */  lui        $at, %hi(missile + 0x35)
    /* A0E4 80143CDC 21082400 */  addu       $at, $at, $a0
    /* A0E8 80143CE0 8D2C2280 */  lb         $v0, %lo(missile + 0x35)($at)
    /* A0EC 80143CE4 00000000 */  nop
    /* A0F0 80143CE8 0A00E214 */  bne        $a3, $v0, .L80143D14
    /* A0F4 80143CEC 00000000 */   nop
    /* A0F8 80143CF0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A0FC 80143CF4 21082400 */  addu       $at, $at, $a0
    /* A100 80143CF8 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* A104 80143CFC 1080013C */  lui        $at, %hi(missile + 0x36)
    /* A108 80143D00 21082400 */  addu       $at, $at, $a0
    /* A10C 80143D04 8E2C2280 */  lb         $v0, %lo(missile + 0x36)($at)
    /* A110 80143D08 00000000 */  nop
    /* A114 80143D0C 0D006210 */  beq        $v1, $v0, .L80143D44
    /* A118 80143D10 80101100 */   sll       $v0, $s1, 2
  .L80143D14:
    /* A11C 80143D14 1000A7AF */  sw         $a3, 0x10($sp)
    /* A120 80143D18 1080013C */  lui        $at, %hi(missile + 0x32)
    /* A124 80143D1C 21082400 */  addu       $at, $at, $a0
    /* A128 80143D20 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* A12C 80143D24 21202002 */  addu       $a0, $s1, $zero
    /* A130 80143D28 01000224 */  addiu      $v0, $zero, 0x1
    /* A134 80143D2C 21380000 */  addu       $a3, $zero, $zero
    /* A138 80143D30 1800A0AF */  sw         $zero, 0x18($sp)
    /* A13C 80143D34 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* A140 80143D38 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* A144 80143D3C 1400A3AF */   sw        $v1, 0x14($sp)
    /* A148 80143D40 80101100 */  sll        $v0, $s1, 2
  .L80143D44:
    /* A14C 80143D44 21105100 */  addu       $v0, $v0, $s1
    /* A150 80143D48 80100200 */  sll        $v0, $v0, 2
    /* A154 80143D4C 23105100 */  subu       $v0, $v0, $s1
    /* A158 80143D50 80180200 */  sll        $v1, $v0, 2
    /* A15C 80143D54 1080013C */  lui        $at, %hi(missile + 0x18)
    /* A160 80143D58 21082300 */  addu       $at, $at, $v1
    /* A164 80143D5C 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* A168 80143D60 00000000 */  nop
    /* A16C 80143D64 04004014 */  bnez       $v0, .L80143D78
    /* A170 80143D68 01000224 */   addiu     $v0, $zero, 0x1
    /* A174 80143D6C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* A178 80143D70 21082300 */  addu       $at, $at, $v1
    /* A17C 80143D74 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
  .L80143D78:
    /* A180 80143D78 D1EA040C */  jal        PutMissile__Fi
    /* A184 80143D7C 21202002 */   addu      $a0, $s1, $zero
    /* A188 80143D80 2800BF8F */  lw         $ra, 0x28($sp)
    /* A18C 80143D84 2400B18F */  lw         $s1, 0x24($sp)
    /* A190 80143D88 2000B08F */  lw         $s0, 0x20($sp)
    /* A194 80143D8C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* A198 80143D90 0800E003 */  jr         $ra
    /* A19C 80143D94 00000000 */   nop
endlabel MI_Arrow__Fi
