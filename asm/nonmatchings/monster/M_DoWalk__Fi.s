.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoWalk__Fi, 0x270

glabel M_DoWalk__Fi
    /* 12EF8 8014CAF0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 12EFC 8014CAF4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 12F00 8014CAF8 21888000 */  addu       $s1, $a0, $zero
    /* 12F04 8014CAFC 40101100 */  sll        $v0, $s1, 1
    /* 12F08 8014CB00 21105100 */  addu       $v0, $v0, $s1
    /* 12F0C 8014CB04 80100200 */  sll        $v0, $v0, 2
    /* 12F10 8014CB08 21105100 */  addu       $v0, $v0, $s1
    /* 12F14 8014CB0C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 12F18 8014CB10 C0800200 */  sll        $s0, $v0, 3
    /* 12F1C 8014CB14 2000BFAF */  sw         $ra, 0x20($sp)
    /* 12F20 8014CB18 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 12F24 8014CB1C 21083000 */  addu       $at, $at, $s0
    /* 12F28 8014CB20 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 12F2C 8014CB24 1080013C */  lui        $at, %hi(monster + 0x26)
    /* 12F30 8014CB28 21083000 */  addu       $at, $at, $s0
    /* 12F34 8014CB2C BA532384 */  lh         $v1, %lo(monster + 0x26)($at)
    /* 12F38 8014CB30 06004280 */  lb         $v0, 0x6($v0)
    /* 12F3C 8014CB34 00000000 */  nop
    /* 12F40 8014CB38 49006214 */  bne        $v1, $v0, .L8014CC60
    /* 12F44 8014CB3C 21206000 */   addu      $a0, $v1, $zero
    /* 12F48 8014CB40 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 12F4C 8014CB44 21083000 */  addu       $at, $at, $s0
    /* 12F50 8014CB48 C9532380 */  lb         $v1, %lo(monster + 0x35)($at)
    /* 12F54 8014CB4C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 12F58 8014CB50 21083000 */  addu       $at, $at, $s0
    /* 12F5C 8014CB54 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 12F60 8014CB58 C0180300 */  sll        $v1, $v1, 3
    /* 12F64 8014CB5C C0100400 */  sll        $v0, $a0, 3
    /* 12F68 8014CB60 23104400 */  subu       $v0, $v0, $a0
    /* 12F6C 8014CB64 C0110200 */  sll        $v0, $v0, 7
    /* 12F70 8014CB68 21186200 */  addu       $v1, $v1, $v0
    /* 12F74 8014CB6C 0E80013C */  lui        $at, %hi(dung_map)
    /* 12F78 8014CB70 21082300 */  addu       $at, $at, $v1
    /* 12F7C 8014CB74 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 12F80 8014CB78 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 12F84 8014CB7C 21083000 */  addu       $at, $at, $s0
    /* 12F88 8014CB80 C8532290 */  lbu        $v0, %lo(monster + 0x34)($at)
    /* 12F8C 8014CB84 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 12F90 8014CB88 21083000 */  addu       $at, $at, $s0
    /* 12F94 8014CB8C AC532490 */  lbu        $a0, %lo(monster + 0x18)($at)
    /* 12F98 8014CB90 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 12F9C 8014CB94 21083000 */  addu       $at, $at, $s0
    /* 12FA0 8014CB98 C9532390 */  lbu        $v1, %lo(monster + 0x35)($at)
    /* 12FA4 8014CB9C 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 12FA8 8014CBA0 21083000 */  addu       $at, $at, $s0
    /* 12FAC 8014CBA4 AE532590 */  lbu        $a1, %lo(monster + 0x1A)($at)
    /* 12FB0 8014CBA8 21104400 */  addu       $v0, $v0, $a0
    /* 12FB4 8014CBAC 21186500 */  addu       $v1, $v1, $a1
    /* 12FB8 8014CBB0 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 12FBC 8014CBB4 21083000 */  addu       $at, $at, $s0
    /* 12FC0 8014CBB8 C95323A0 */  sb         $v1, %lo(monster + 0x35)($at)
    /* 12FC4 8014CBBC 001E0300 */  sll        $v1, $v1, 24
    /* 12FC8 8014CBC0 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 12FCC 8014CBC4 21083000 */  addu       $at, $at, $s0
    /* 12FD0 8014CBC8 C85322A0 */  sb         $v0, %lo(monster + 0x34)($at)
    /* 12FD4 8014CBCC 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 12FD8 8014CBD0 21083000 */  addu       $at, $at, $s0
    /* 12FDC 8014CBD4 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 12FE0 8014CBD8 431D0300 */  sra        $v1, $v1, 21
    /* 12FE4 8014CBDC C0100400 */  sll        $v0, $a0, 3
    /* 12FE8 8014CBE0 23104400 */  subu       $v0, $v0, $a0
    /* 12FEC 8014CBE4 C0110200 */  sll        $v0, $v0, 7
    /* 12FF0 8014CBE8 21186200 */  addu       $v1, $v1, $v0
    /* 12FF4 8014CBEC 01002226 */  addiu      $v0, $s1, 0x1
    /* 12FF8 8014CBF0 0E80013C */  lui        $at, %hi(dung_map)
    /* 12FFC 8014CBF4 21082300 */  addu       $at, $at, $v1
    /* 13000 8014CBF8 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 13004 8014CBFC 1080013C */  lui        $at, %hi(monster + 0x4F)
    /* 13008 8014CC00 21083000 */  addu       $at, $at, $s0
    /* 1300C 8014CC04 E3532290 */  lbu        $v0, %lo(monster + 0x4F)($at)
    /* 13010 8014CC08 00000000 */  nop
    /* 13014 8014CC0C 0D004010 */  beqz       $v0, .L8014CC44
    /* 13018 8014CC10 21202002 */   addu      $a0, $s1, $zero
    /* 1301C 8014CC14 1080013C */  lui        $at, %hi(monster + 0x59)
    /* 13020 8014CC18 21083000 */  addu       $at, $at, $s0
    /* 13024 8014CC1C ED532490 */  lbu        $a0, %lo(monster + 0x59)($at)
    /* 13028 8014CC20 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 1302C 8014CC24 21083000 */  addu       $at, $at, $s0
    /* 13030 8014CC28 C8532580 */  lb         $a1, %lo(monster + 0x34)($at)
    /* 13034 8014CC2C 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 13038 8014CC30 21083000 */  addu       $at, $at, $s0
    /* 1303C 8014CC34 C9532680 */  lb         $a2, %lo(monster + 0x35)($at)
    /* 13040 8014CC38 E134010C */  jal        ChangeLightXY__Fiii
    /* 13044 8014CC3C 00000000 */   nop
    /* 13048 8014CC40 21202002 */  addu       $a0, $s1, $zero
  .L8014CC44:
    /* 1304C 8014CC44 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 13050 8014CC48 21083000 */  addu       $at, $at, $s0
    /* 13054 8014CC4C D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 13058 8014CC50 9CFF010C */  jal        M_StartStand__Fii
    /* 1305C 8014CC54 01001024 */   addiu     $s0, $zero, 0x1
    /* 13060 8014CC58 45330508 */  j          .L8014CD14
    /* 13064 8014CC5C 40101100 */   sll       $v0, $s1, 1
  .L8014CC60:
    /* 13068 8014CC60 1080013C */  lui        $at, %hi(monster + 0x3F)
    /* 1306C 8014CC64 21083000 */  addu       $at, $at, $s0
    /* 13070 8014CC68 D3532280 */  lb         $v0, %lo(monster + 0x3F)($at)
    /* 13074 8014CC6C 00000000 */  nop
    /* 13078 8014CC70 26004014 */  bnez       $v0, .L8014CD0C
    /* 1307C 8014CC74 01008224 */   addiu     $v0, $a0, 0x1
    /* 13080 8014CC78 1080013C */  lui        $at, %hi(monster + 0x26)
    /* 13084 8014CC7C 21083000 */  addu       $at, $at, $s0
    /* 13088 8014CC80 BA5322A4 */  sh         $v0, %lo(monster + 0x26)($at)
    /* 1308C 8014CC84 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 13090 8014CC88 21083000 */  addu       $at, $at, $s0
    /* 13094 8014CC8C B6532294 */  lhu        $v0, %lo(monster + 0x22)($at)
    /* 13098 8014CC90 1080013C */  lui        $at, %hi(monster + 0x28)
    /* 1309C 8014CC94 21083000 */  addu       $at, $at, $s0
    /* 130A0 8014CC98 BC532494 */  lhu        $a0, %lo(monster + 0x28)($at)
    /* 130A4 8014CC9C 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 130A8 8014CCA0 21083000 */  addu       $at, $at, $s0
    /* 130AC 8014CCA4 B8532394 */  lhu        $v1, %lo(monster + 0x24)($at)
    /* 130B0 8014CCA8 1080013C */  lui        $at, %hi(monster + 0x2A)
    /* 130B4 8014CCAC 21083000 */  addu       $at, $at, $s0
    /* 130B8 8014CCB0 BE532594 */  lhu        $a1, %lo(monster + 0x2A)($at)
    /* 130BC 8014CCB4 21104400 */  addu       $v0, $v0, $a0
    /* 130C0 8014CCB8 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 130C4 8014CCBC 21083000 */  addu       $at, $at, $s0
    /* 130C8 8014CCC0 B65322A4 */  sh         $v0, %lo(monster + 0x22)($at)
    /* 130CC 8014CCC4 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 130D0 8014CCC8 21083000 */  addu       $at, $at, $s0
    /* 130D4 8014CCCC B6532294 */  lhu        $v0, %lo(monster + 0x22)($at)
    /* 130D8 8014CCD0 21186500 */  addu       $v1, $v1, $a1
    /* 130DC 8014CCD4 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 130E0 8014CCD8 21083000 */  addu       $at, $at, $s0
    /* 130E4 8014CCDC B85323A4 */  sh         $v1, %lo(monster + 0x24)($at)
    /* 130E8 8014CCE0 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 130EC 8014CCE4 21083000 */  addu       $at, $at, $s0
    /* 130F0 8014CCE8 B8532394 */  lhu        $v1, %lo(monster + 0x24)($at)
    /* 130F4 8014CCEC 02110200 */  srl        $v0, $v0, 4
    /* 130F8 8014CCF0 02190300 */  srl        $v1, $v1, 4
    /* 130FC 8014CCF4 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 13100 8014CCF8 21083000 */  addu       $at, $at, $s0
    /* 13104 8014CCFC CE5322A0 */  sb         $v0, %lo(monster + 0x3A)($at)
    /* 13108 8014CD00 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 1310C 8014CD04 21083000 */  addu       $at, $at, $s0
    /* 13110 8014CD08 CF5323A0 */  sb         $v1, %lo(monster + 0x3B)($at)
  .L8014CD0C:
    /* 13114 8014CD0C 21800000 */  addu       $s0, $zero, $zero
    /* 13118 8014CD10 40101100 */  sll        $v0, $s1, 1
  .L8014CD14:
    /* 1311C 8014CD14 21105100 */  addu       $v0, $v0, $s1
    /* 13120 8014CD18 80100200 */  sll        $v0, $v0, 2
    /* 13124 8014CD1C 21105100 */  addu       $v0, $v0, $s1
    /* 13128 8014CD20 C0100200 */  sll        $v0, $v0, 3
    /* 1312C 8014CD24 1080013C */  lui        $at, %hi(monster + 0x4F)
    /* 13130 8014CD28 21082200 */  addu       $at, $at, $v0
    /* 13134 8014CD2C E3532290 */  lbu        $v0, %lo(monster + 0x4F)($at)
    /* 13138 8014CD30 00000000 */  nop
    /* 1313C 8014CD34 04004010 */  beqz       $v0, .L8014CD48
    /* 13140 8014CD38 21100002 */   addu      $v0, $s0, $zero
    /* 13144 8014CD3C 4A32050C */  jal        M_ChangeLightOffset__Fi
    /* 13148 8014CD40 21202002 */   addu      $a0, $s1, $zero
    /* 1314C 8014CD44 21100002 */  addu       $v0, $s0, $zero
  .L8014CD48:
    /* 13150 8014CD48 2000BF8F */  lw         $ra, 0x20($sp)
    /* 13154 8014CD4C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 13158 8014CD50 1800B08F */  lw         $s0, 0x18($sp)
    /* 1315C 8014CD54 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 13160 8014CD58 0800E003 */  jr         $ra
    /* 13164 8014CD5C 00000000 */   nop
endlabel M_DoWalk__Fi
