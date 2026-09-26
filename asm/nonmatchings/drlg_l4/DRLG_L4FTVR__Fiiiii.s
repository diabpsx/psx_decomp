.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4FTVR__Fiiiii, 0x4A8

glabel DRLG_L4FTVR__Fiiiii
    /* 19E38 80153A30 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 19E3C 80153A34 4400B7AF */  sw         $s7, 0x44($sp)
    /* 19E40 80153A38 21B8A000 */  addu       $s7, $a1, $zero
    /* 19E44 80153A3C 2800B0AF */  sw         $s0, 0x28($sp)
    /* 19E48 80153A40 2180C000 */  addu       $s0, $a2, $zero
    /* 19E4C 80153A44 4800BEAF */  sw         $fp, 0x48($sp)
    /* 19E50 80153A48 21F0E000 */  addu       $fp, $a3, $zero
    /* 19E54 80153A4C F817828F */  lw         $v0, %gp_rel(D_8011BF78)($gp)
    /* 19E58 80153A50 6000A58F */  lw         $a1, 0x60($sp)
    /* 19E5C 80153A54 C0481E00 */  sll        $t1, $fp, 3
    /* 19E60 80153A58 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 19E64 80153A5C 4000B6AF */  sw         $s6, 0x40($sp)
    /* 19E68 80153A60 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 19E6C 80153A64 3800B4AF */  sw         $s4, 0x38($sp)
    /* 19E70 80153A68 3400B3AF */  sw         $s3, 0x34($sp)
    /* 19E74 80153A6C 3000B2AF */  sw         $s2, 0x30($sp)
    /* 19E78 80153A70 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 19E7C 80153A74 01004224 */  addiu      $v0, $v0, 0x1
    /* 19E80 80153A78 F81782AF */  sw         $v0, %gp_rel(D_8011BF78)($gp)
    /* 19E84 80153A7C C0101000 */  sll        $v0, $s0, 3
    /* 19E88 80153A80 23105000 */  subu       $v0, $v0, $s0
    /* 19E8C 80153A84 C0510200 */  sll        $t2, $v0, 7
    /* 19E90 80153A88 21402A01 */  addu       $t0, $t1, $t2
    /* 19E94 80153A8C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 19E98 80153A90 21082800 */  addu       $at, $at, $t0
    /* 19E9C 80153A94 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 19EA0 80153A98 00000000 */  nop
    /* 19EA4 80153A9C 6C004014 */  bnez       $v0, .L80153C50
    /* 19EA8 80153AA0 21888000 */   addu      $s1, $a0, $zero
    /* 19EAC 80153AA4 0E80033C */  lui        $v1, %hi(dungeon)
    /* 19EB0 80153AA8 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 19EB4 80153AAC 40101100 */  sll        $v0, $s1, 1
    /* 19EB8 80153AB0 21105100 */  addu       $v0, $v0, $s1
    /* 19EBC 80153AB4 40110200 */  sll        $v0, $v0, 5
    /* 19EC0 80153AB8 21104300 */  addu       $v0, $v0, $v1
    /* 19EC4 80153ABC 40181700 */  sll        $v1, $s7, 1
    /* 19EC8 80153AC0 21186200 */  addu       $v1, $v1, $v0
    /* 19ECC 80153AC4 00006394 */  lhu        $v1, 0x0($v1)
    /* 19ED0 80153AC8 06000224 */  addiu      $v0, $zero, 0x6
    /* 19ED4 80153ACC 60006214 */  bne        $v1, $v0, .L80153C50
    /* 19ED8 80153AD0 1800A3AF */   sw        $v1, 0x18($sp)
    /* 19EDC 80153AD4 01002B26 */  addiu      $t3, $s1, 0x1
    /* 19EE0 80153AD8 2128E002 */  addu       $a1, $s7, $zero
    /* 19EE4 80153ADC 02001626 */  addiu      $s6, $s0, 0x2
    /* 19EE8 80153AE0 2130C002 */  addu       $a2, $s6, $zero
    /* 19EEC 80153AE4 2000ABAF */  sw         $t3, 0x20($sp)
    /* 19EF0 80153AE8 2000A48F */  lw         $a0, 0x20($sp)
    /* 19EF4 80153AEC 1280023C */  lui        $v0, %hi(TransVal)
    /* 19EF8 80153AF0 48C14290 */  lbu        $v0, %lo(TransVal)($v0)
    /* 19EFC 80153AF4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 19F00 80153AF8 21082800 */  addu       $at, $at, $t0
    /* 19F04 80153AFC 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 19F08 80153B00 01000226 */  addiu      $v0, $s0, 0x1
    /* 19F0C 80153B04 C0400200 */  sll        $t0, $v0, 3
    /* 19F10 80153B08 23400201 */  subu       $t0, $t0, $v0
    /* 19F14 80153B0C C0410800 */  sll        $t0, $t0, 7
    /* 19F18 80153B10 1280033C */  lui        $v1, %hi(TransVal)
    /* 19F1C 80153B14 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 19F20 80153B18 21102801 */  addu       $v0, $t1, $t0
    /* 19F24 80153B1C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 19F28 80153B20 21082200 */  addu       $at, $at, $v0
    /* 19F2C 80153B24 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 19F30 80153B28 0100C227 */  addiu      $v0, $fp, 0x1
    /* 19F34 80153B2C C0100200 */  sll        $v0, $v0, 3
    /* 19F38 80153B30 1280093C */  lui        $t1, %hi(TransVal)
    /* 19F3C 80153B34 48C12991 */  lbu        $t1, %lo(TransVal)($t1)
    /* 19F40 80153B38 21184A00 */  addu       $v1, $v0, $t2
    /* 19F44 80153B3C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 19F48 80153B40 21082300 */  addu       $at, $at, $v1
    /* 19F4C 80153B44 2F7A29A0 */  sb         $t1, %lo(dung_map + 0x7)($at)
    /* 19F50 80153B48 1280033C */  lui        $v1, %hi(TransVal)
    /* 19F54 80153B4C 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 19F58 80153B50 21104800 */  addu       $v0, $v0, $t0
    /* 19F5C 80153B54 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 19F60 80153B58 21082200 */  addu       $at, $at, $v0
    /* 19F64 80153B5C 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 19F68 80153B60 01000224 */  addiu      $v0, $zero, 0x1
    /* 19F6C 80153B64 8C4E050C */  jal        DRLG_L4FTVR__Fiiiii
    /* 19F70 80153B68 1000A2AF */   sw        $v0, 0x10($sp)
    /* 19F74 80153B6C FFFF3526 */  addiu      $s5, $s1, -0x1
    /* 19F78 80153B70 2120A002 */  addu       $a0, $s5, $zero
    /* 19F7C 80153B74 2128E002 */  addu       $a1, $s7, $zero
    /* 19F80 80153B78 FEFF1426 */  addiu      $s4, $s0, -0x2
    /* 19F84 80153B7C 21308002 */  addu       $a2, $s4, $zero
    /* 19F88 80153B80 2138C003 */  addu       $a3, $fp, $zero
    /* 19F8C 80153B84 02000224 */  addiu      $v0, $zero, 0x2
    /* 19F90 80153B88 8C4E050C */  jal        DRLG_L4FTVR__Fiiiii
    /* 19F94 80153B8C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 19F98 80153B90 21202002 */  addu       $a0, $s1, $zero
    /* 19F9C 80153B94 0100F326 */  addiu      $s3, $s7, 0x1
    /* 19FA0 80153B98 21286002 */  addu       $a1, $s3, $zero
    /* 19FA4 80153B9C 21300002 */  addu       $a2, $s0, $zero
    /* 19FA8 80153BA0 0200D227 */  addiu      $s2, $fp, 0x2
    /* 19FAC 80153BA4 21384002 */  addu       $a3, $s2, $zero
    /* 19FB0 80153BA8 03000224 */  addiu      $v0, $zero, 0x3
    /* 19FB4 80153BAC 8C4E050C */  jal        DRLG_L4FTVR__Fiiiii
    /* 19FB8 80153BB0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 19FBC 80153BB4 21202002 */  addu       $a0, $s1, $zero
    /* 19FC0 80153BB8 FFFFF126 */  addiu      $s1, $s7, -0x1
    /* 19FC4 80153BBC 21282002 */  addu       $a1, $s1, $zero
    /* 19FC8 80153BC0 21300002 */  addu       $a2, $s0, $zero
    /* 19FCC 80153BC4 FEFFD027 */  addiu      $s0, $fp, -0x2
    /* 19FD0 80153BC8 21380002 */  addu       $a3, $s0, $zero
    /* 19FD4 80153BCC 04000224 */  addiu      $v0, $zero, 0x4
    /* 19FD8 80153BD0 8C4E050C */  jal        DRLG_L4FTVR__Fiiiii
    /* 19FDC 80153BD4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 19FE0 80153BD8 2120A002 */  addu       $a0, $s5, $zero
    /* 19FE4 80153BDC 21282002 */  addu       $a1, $s1, $zero
    /* 19FE8 80153BE0 21308002 */  addu       $a2, $s4, $zero
    /* 19FEC 80153BE4 21380002 */  addu       $a3, $s0, $zero
    /* 19FF0 80153BE8 05000224 */  addiu      $v0, $zero, 0x5
    /* 19FF4 80153BEC 8C4E050C */  jal        DRLG_L4FTVR__Fiiiii
    /* 19FF8 80153BF0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 19FFC 80153BF4 21282002 */  addu       $a1, $s1, $zero
    /* 1A000 80153BF8 2130C002 */  addu       $a2, $s6, $zero
    /* 1A004 80153BFC 2000A48F */  lw         $a0, 0x20($sp)
    /* 1A008 80153C00 1800AB8F */  lw         $t3, 0x18($sp)
    /* 1A00C 80153C04 21380002 */  addu       $a3, $s0, $zero
    /* 1A010 80153C08 8C4E050C */  jal        DRLG_L4FTVR__Fiiiii
    /* 1A014 80153C0C 1000ABAF */   sw        $t3, 0x10($sp)
    /* 1A018 80153C10 2120A002 */  addu       $a0, $s5, $zero
    /* 1A01C 80153C14 21286002 */  addu       $a1, $s3, $zero
    /* 1A020 80153C18 21308002 */  addu       $a2, $s4, $zero
    /* 1A024 80153C1C 21384002 */  addu       $a3, $s2, $zero
    /* 1A028 80153C20 07000224 */  addiu      $v0, $zero, 0x7
    /* 1A02C 80153C24 8C4E050C */  jal        DRLG_L4FTVR__Fiiiii
    /* 1A030 80153C28 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1A034 80153C2C 21286002 */  addu       $a1, $s3, $zero
    /* 1A038 80153C30 2130C002 */  addu       $a2, $s6, $zero
    /* 1A03C 80153C34 21384002 */  addu       $a3, $s2, $zero
    /* 1A040 80153C38 2000A48F */  lw         $a0, 0x20($sp)
    /* 1A044 80153C3C 08000224 */  addiu      $v0, $zero, 0x8
    /* 1A048 80153C40 8C4E050C */  jal        DRLG_L4FTVR__Fiiiii
    /* 1A04C 80153C44 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1A050 80153C48 A54F0508 */  j          .L80153E94
    /* 1A054 80153C4C 00000000 */   nop
  .L80153C50:
    /* 1A058 80153C50 01000224 */  addiu      $v0, $zero, 0x1
    /* 1A05C 80153C54 1400A214 */  bne        $a1, $v0, .L80153CA8
    /* 1A060 80153C58 02000224 */   addiu     $v0, $zero, 0x2
    /* 1A064 80153C5C C0101E00 */  sll        $v0, $fp, 3
    /* 1A068 80153C60 C0181000 */  sll        $v1, $s0, 3
    /* 1A06C 80153C64 23187000 */  subu       $v1, $v1, $s0
    /* 1A070 80153C68 C0190300 */  sll        $v1, $v1, 7
    /* 1A074 80153C6C 1280043C */  lui        $a0, %hi(TransVal)
    /* 1A078 80153C70 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 1A07C 80153C74 21104300 */  addu       $v0, $v0, $v1
    /* 1A080 80153C78 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A084 80153C7C 21082200 */  addu       $at, $at, $v0
    /* 1A088 80153C80 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 1A08C 80153C84 0100C227 */  addiu      $v0, $fp, 0x1
    /* 1A090 80153C88 C0100200 */  sll        $v0, $v0, 3
    /* 1A094 80153C8C 1280043C */  lui        $a0, %hi(TransVal)
    /* 1A098 80153C90 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 1A09C 80153C94 21104300 */  addu       $v0, $v0, $v1
    /* 1A0A0 80153C98 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A0A4 80153C9C 21082200 */  addu       $at, $at, $v0
    /* 1A0A8 80153CA0 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 1A0AC 80153CA4 02000224 */  addiu      $v0, $zero, 0x2
  .L80153CA8:
    /* 1A0B0 80153CA8 1500A214 */  bne        $a1, $v0, .L80153D00
    /* 1A0B4 80153CAC 03000224 */   addiu     $v0, $zero, 0x3
    /* 1A0B8 80153CB0 C0201E00 */  sll        $a0, $fp, 3
    /* 1A0BC 80153CB4 01000226 */  addiu      $v0, $s0, 0x1
    /* 1A0C0 80153CB8 C0180200 */  sll        $v1, $v0, 3
    /* 1A0C4 80153CBC 23186200 */  subu       $v1, $v1, $v0
    /* 1A0C8 80153CC0 C0190300 */  sll        $v1, $v1, 7
    /* 1A0CC 80153CC4 1280023C */  lui        $v0, %hi(TransVal)
    /* 1A0D0 80153CC8 48C14290 */  lbu        $v0, %lo(TransVal)($v0)
    /* 1A0D4 80153CCC 21208300 */  addu       $a0, $a0, $v1
    /* 1A0D8 80153CD0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A0DC 80153CD4 21082400 */  addu       $at, $at, $a0
    /* 1A0E0 80153CD8 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 1A0E4 80153CDC 0100C227 */  addiu      $v0, $fp, 0x1
    /* 1A0E8 80153CE0 C0100200 */  sll        $v0, $v0, 3
    /* 1A0EC 80153CE4 1280043C */  lui        $a0, %hi(TransVal)
    /* 1A0F0 80153CE8 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 1A0F4 80153CEC 21104300 */  addu       $v0, $v0, $v1
    /* 1A0F8 80153CF0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A0FC 80153CF4 21082200 */  addu       $at, $at, $v0
    /* 1A100 80153CF8 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 1A104 80153CFC 03000224 */  addiu      $v0, $zero, 0x3
  .L80153D00:
    /* 1A108 80153D00 1600A214 */  bne        $a1, $v0, .L80153D5C
    /* 1A10C 80153D04 04000224 */   addiu     $v0, $zero, 0x4
    /* 1A110 80153D08 C0201E00 */  sll        $a0, $fp, 3
    /* 1A114 80153D0C C0101000 */  sll        $v0, $s0, 3
    /* 1A118 80153D10 23105000 */  subu       $v0, $v0, $s0
    /* 1A11C 80153D14 C0110200 */  sll        $v0, $v0, 7
    /* 1A120 80153D18 1280033C */  lui        $v1, %hi(TransVal)
    /* 1A124 80153D1C 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 1A128 80153D20 21108200 */  addu       $v0, $a0, $v0
    /* 1A12C 80153D24 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A130 80153D28 21082200 */  addu       $at, $at, $v0
    /* 1A134 80153D2C 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A138 80153D30 01000326 */  addiu      $v1, $s0, 0x1
    /* 1A13C 80153D34 C0100300 */  sll        $v0, $v1, 3
    /* 1A140 80153D38 23104300 */  subu       $v0, $v0, $v1
    /* 1A144 80153D3C C0110200 */  sll        $v0, $v0, 7
    /* 1A148 80153D40 1280033C */  lui        $v1, %hi(TransVal)
    /* 1A14C 80153D44 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 1A150 80153D48 21208200 */  addu       $a0, $a0, $v0
    /* 1A154 80153D4C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A158 80153D50 21082400 */  addu       $at, $at, $a0
    /* 1A15C 80153D54 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A160 80153D58 04000224 */  addiu      $v0, $zero, 0x4
  .L80153D5C:
    /* 1A164 80153D5C 1700A214 */  bne        $a1, $v0, .L80153DBC
    /* 1A168 80153D60 05000224 */   addiu     $v0, $zero, 0x5
    /* 1A16C 80153D64 0100C427 */  addiu      $a0, $fp, 0x1
    /* 1A170 80153D68 C0200400 */  sll        $a0, $a0, 3
    /* 1A174 80153D6C C0101000 */  sll        $v0, $s0, 3
    /* 1A178 80153D70 23105000 */  subu       $v0, $v0, $s0
    /* 1A17C 80153D74 C0110200 */  sll        $v0, $v0, 7
    /* 1A180 80153D78 1280033C */  lui        $v1, %hi(TransVal)
    /* 1A184 80153D7C 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 1A188 80153D80 21108200 */  addu       $v0, $a0, $v0
    /* 1A18C 80153D84 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A190 80153D88 21082200 */  addu       $at, $at, $v0
    /* 1A194 80153D8C 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A198 80153D90 01000326 */  addiu      $v1, $s0, 0x1
    /* 1A19C 80153D94 C0100300 */  sll        $v0, $v1, 3
    /* 1A1A0 80153D98 23104300 */  subu       $v0, $v0, $v1
    /* 1A1A4 80153D9C C0110200 */  sll        $v0, $v0, 7
    /* 1A1A8 80153DA0 1280033C */  lui        $v1, %hi(TransVal)
    /* 1A1AC 80153DA4 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 1A1B0 80153DA8 21208200 */  addu       $a0, $a0, $v0
    /* 1A1B4 80153DAC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A1B8 80153DB0 21082400 */  addu       $at, $at, $a0
    /* 1A1BC 80153DB4 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A1C0 80153DB8 05000224 */  addiu      $v0, $zero, 0x5
  .L80153DBC:
    /* 1A1C4 80153DBC 0E00A214 */  bne        $a1, $v0, .L80153DF8
    /* 1A1C8 80153DC0 06000224 */   addiu     $v0, $zero, 0x6
    /* 1A1CC 80153DC4 0100C327 */  addiu      $v1, $fp, 0x1
    /* 1A1D0 80153DC8 C0180300 */  sll        $v1, $v1, 3
    /* 1A1D4 80153DCC 01000426 */  addiu      $a0, $s0, 0x1
    /* 1A1D8 80153DD0 C0100400 */  sll        $v0, $a0, 3
    /* 1A1DC 80153DD4 23104400 */  subu       $v0, $v0, $a0
    /* 1A1E0 80153DD8 C0110200 */  sll        $v0, $v0, 7
    /* 1A1E4 80153DDC 1280043C */  lui        $a0, %hi(TransVal)
    /* 1A1E8 80153DE0 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 1A1EC 80153DE4 21186200 */  addu       $v1, $v1, $v0
    /* 1A1F0 80153DE8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A1F4 80153DEC 21082300 */  addu       $at, $at, $v1
    /* 1A1F8 80153DF0 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 1A1FC 80153DF4 06000224 */  addiu      $v0, $zero, 0x6
  .L80153DF8:
    /* 1A200 80153DF8 0D00A214 */  bne        $a1, $v0, .L80153E30
    /* 1A204 80153DFC 07000224 */   addiu     $v0, $zero, 0x7
    /* 1A208 80153E00 0100C227 */  addiu      $v0, $fp, 0x1
    /* 1A20C 80153E04 C0100200 */  sll        $v0, $v0, 3
    /* 1A210 80153E08 C0181000 */  sll        $v1, $s0, 3
    /* 1A214 80153E0C 23187000 */  subu       $v1, $v1, $s0
    /* 1A218 80153E10 C0190300 */  sll        $v1, $v1, 7
    /* 1A21C 80153E14 1280043C */  lui        $a0, %hi(TransVal)
    /* 1A220 80153E18 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 1A224 80153E1C 21104300 */  addu       $v0, $v0, $v1
    /* 1A228 80153E20 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A22C 80153E24 21082200 */  addu       $at, $at, $v0
    /* 1A230 80153E28 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 1A234 80153E2C 07000224 */  addiu      $v0, $zero, 0x7
  .L80153E30:
    /* 1A238 80153E30 0D00A214 */  bne        $a1, $v0, .L80153E68
    /* 1A23C 80153E34 08000224 */   addiu     $v0, $zero, 0x8
    /* 1A240 80153E38 C0201E00 */  sll        $a0, $fp, 3
    /* 1A244 80153E3C 01000326 */  addiu      $v1, $s0, 0x1
    /* 1A248 80153E40 C0100300 */  sll        $v0, $v1, 3
    /* 1A24C 80153E44 23104300 */  subu       $v0, $v0, $v1
    /* 1A250 80153E48 C0110200 */  sll        $v0, $v0, 7
    /* 1A254 80153E4C 1280033C */  lui        $v1, %hi(TransVal)
    /* 1A258 80153E50 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 1A25C 80153E54 21208200 */  addu       $a0, $a0, $v0
    /* 1A260 80153E58 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A264 80153E5C 21082400 */  addu       $at, $at, $a0
    /* 1A268 80153E60 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A26C 80153E64 08000224 */  addiu      $v0, $zero, 0x8
  .L80153E68:
    /* 1A270 80153E68 0A00A214 */  bne        $a1, $v0, .L80153E94
    /* 1A274 80153E6C C0101E00 */   sll       $v0, $fp, 3
    /* 1A278 80153E70 C0181000 */  sll        $v1, $s0, 3
    /* 1A27C 80153E74 23187000 */  subu       $v1, $v1, $s0
    /* 1A280 80153E78 C0190300 */  sll        $v1, $v1, 7
    /* 1A284 80153E7C 1280043C */  lui        $a0, %hi(TransVal)
    /* 1A288 80153E80 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* 1A28C 80153E84 21104300 */  addu       $v0, $v0, $v1
    /* 1A290 80153E88 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A294 80153E8C 21082200 */  addu       $at, $at, $v0
    /* 1A298 80153E90 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
  .L80153E94:
    /* 1A29C 80153E94 F817828F */  lw         $v0, %gp_rel(D_8011BF78)($gp)
    /* 1A2A0 80153E98 00000000 */  nop
    /* 1A2A4 80153E9C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1A2A8 80153EA0 F81782AF */  sw         $v0, %gp_rel(D_8011BF78)($gp)
    /* 1A2AC 80153EA4 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 1A2B0 80153EA8 4800BE8F */  lw         $fp, 0x48($sp)
    /* 1A2B4 80153EAC 4400B78F */  lw         $s7, 0x44($sp)
    /* 1A2B8 80153EB0 4000B68F */  lw         $s6, 0x40($sp)
    /* 1A2BC 80153EB4 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 1A2C0 80153EB8 3800B48F */  lw         $s4, 0x38($sp)
    /* 1A2C4 80153EBC 3400B38F */  lw         $s3, 0x34($sp)
    /* 1A2C8 80153EC0 3000B28F */  lw         $s2, 0x30($sp)
    /* 1A2CC 80153EC4 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 1A2D0 80153EC8 2800B08F */  lw         $s0, 0x28($sp)
    /* 1A2D4 80153ECC 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 1A2D8 80153ED0 0800E003 */  jr         $ra
    /* 1A2DC 80153ED4 00000000 */   nop
endlabel DRLG_L4FTVR__Fiiiii
