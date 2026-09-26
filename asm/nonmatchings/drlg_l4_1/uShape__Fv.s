.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching uShape__Fv, 0x29C

glabel uShape__Fv
    /* 18D9C 80152994 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 18DA0 80152998 1000BFAF */  sw         $ra, 0x10($sp)
    /* 18DA4 8015299C 13000624 */  addiu      $a2, $zero, 0x13
    /* 18DA8 801529A0 01000924 */  addiu      $t1, $zero, 0x1
    /* 18DAC 801529A4 15800A3C */  lui        $t2, %hi(dung)
    /* 18DB0 801529A8 74D84A25 */  addiu      $t2, $t2, %lo(dung)
    /* 18DB4 801529AC 14004B25 */  addiu      $t3, $t2, 0x14
    /* 18DB8 801529B0 1580083C */  lui        $t0, %hi(hallok + 0x13)
    /* 18DBC 801529B4 17DA0825 */  addiu      $t0, $t0, %lo(hallok + 0x13)
  .L801529B8:
    /* 18DC0 801529B8 13000724 */  addiu      $a3, $zero, 0x13
    /* 18DC4 801529BC 7C016525 */  addiu      $a1, $t3, 0x17C
    /* 18DC8 801529C0 7C014425 */  addiu      $a0, $t2, 0x17C
  .L801529C4:
    /* 18DCC 801529C4 21188600 */  addu       $v1, $a0, $a2
    /* 18DD0 801529C8 00006290 */  lbu        $v0, 0x0($v1)
    /* 18DD4 801529CC 00000000 */  nop
    /* 18DD8 801529D0 06004910 */  beq        $v0, $t1, .L801529EC
    /* 18DDC 801529D4 00000000 */   nop
    /* 18DE0 801529D8 000000A1 */  sb         $zero, 0x0($t0)
    /* 18DE4 801529DC 00006290 */  lbu        $v0, 0x0($v1)
    /* 18DE8 801529E0 00000000 */  nop
    /* 18DEC 801529E4 0F004914 */  bne        $v0, $t1, .L80152A24
    /* 18DF0 801529E8 00000000 */   nop
  .L801529EC:
    /* 18DF4 801529EC 01006290 */  lbu        $v0, 0x1($v1)
    /* 18DF8 801529F0 00000000 */  nop
    /* 18DFC 801529F4 07004914 */  bne        $v0, $t1, .L80152A14
    /* 18E00 801529F8 2110A600 */   addu      $v0, $a1, $a2
    /* 18E04 801529FC 01004290 */  lbu        $v0, 0x1($v0)
    /* 18E08 80152A00 00000000 */  nop
    /* 18E0C 80152A04 03004014 */  bnez       $v0, .L80152A14
    /* 18E10 80152A08 00000000 */   nop
    /* 18E14 80152A0C 864A0508 */  j          .L80152A18
    /* 18E18 80152A10 000009A1 */   sb        $t1, 0x0($t0)
  .L80152A14:
    /* 18E1C 80152A14 000000A1 */  sb         $zero, 0x0($t0)
  .L80152A18:
    /* 18E20 80152A18 21286001 */  addu       $a1, $t3, $zero
    /* 18E24 80152A1C 21204001 */  addu       $a0, $t2, $zero
    /* 18E28 80152A20 21380000 */  addu       $a3, $zero, $zero
  .L80152A24:
    /* 18E2C 80152A24 ECFFA524 */  addiu      $a1, $a1, -0x14
    /* 18E30 80152A28 FFFFE724 */  addiu      $a3, $a3, -0x1
    /* 18E34 80152A2C E5FFE104 */  bgez       $a3, .L801529C4
    /* 18E38 80152A30 ECFF8424 */   addiu     $a0, $a0, -0x14
    /* 18E3C 80152A34 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 18E40 80152A38 DFFFC104 */  bgez       $a2, .L801529B8
    /* 18E44 80152A3C FFFF0825 */   addiu     $t0, $t0, -0x1
    /* 18E48 80152A40 C9F6000C */  jal        ENG_random__Fl
    /* 18E4C 80152A44 13000424 */   addiu     $a0, $zero, 0x13
    /* 18E50 80152A48 01004424 */  addiu      $a0, $v0, 0x1
    /* 18E54 80152A4C 1580083C */  lui        $t0, %hi(dung)
    /* 18E58 80152A50 74D80825 */  addiu      $t0, $t0, %lo(dung)
    /* 18E5C 80152A54 01000624 */  addiu      $a2, $zero, 0x1
  .L80152A58:
    /* 18E60 80152A58 1580013C */  lui        $at, %hi(hallok)
    /* 18E64 80152A5C 21082400 */  addu       $at, $at, $a0
    /* 18E68 80152A60 04DA2290 */  lbu        $v0, %lo(hallok)($at)
    /* 18E6C 80152A64 00000000 */  nop
    /* 18E70 80152A68 12004010 */  beqz       $v0, .L80152AB4
    /* 18E74 80152A6C 13000724 */   addiu     $a3, $zero, 0x13
    /* 18E78 80152A70 7C010525 */  addiu      $a1, $t0, 0x17C
  .L80152A74:
    /* 18E7C 80152A74 2118A400 */  addu       $v1, $a1, $a0
    /* 18E80 80152A78 00006290 */  lbu        $v0, 0x0($v1)
    /* 18E84 80152A7C 00000000 */  nop
    /* 18E88 80152A80 05004614 */  bne        $v0, $a2, .L80152A98
    /* 18E8C 80152A84 00000000 */   nop
    /* 18E90 80152A88 ECFF0525 */  addiu      $a1, $t0, -0x14
    /* 18E94 80152A8C FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 18E98 80152A90 A84A0508 */  j          .L80152AA0
    /* 18E9C 80152A94 21200000 */   addu      $a0, $zero, $zero
  .L80152A98:
    /* 18EA0 80152A98 000066A0 */  sb         $a2, 0x0($v1)
    /* 18EA4 80152A9C 010066A0 */  sb         $a2, 0x1($v1)
  .L80152AA0:
    /* 18EA8 80152AA0 FFFFE724 */  addiu      $a3, $a3, -0x1
    /* 18EAC 80152AA4 F3FFE104 */  bgez       $a3, .L80152A74
    /* 18EB0 80152AA8 ECFFA524 */   addiu     $a1, $a1, -0x14
    /* 18EB4 80152AAC B24A0508 */  j          .L80152AC8
    /* 18EB8 80152AB0 00000000 */   nop
  .L80152AB4:
    /* 18EBC 80152AB4 01008424 */  addiu      $a0, $a0, 0x1
    /* 18EC0 80152AB8 14000224 */  addiu      $v0, $zero, 0x14
    /* 18EC4 80152ABC 02008214 */  bne        $a0, $v0, .L80152AC8
    /* 18EC8 80152AC0 00000000 */   nop
    /* 18ECC 80152AC4 01000424 */  addiu      $a0, $zero, 0x1
  .L80152AC8:
    /* 18ED0 80152AC8 E3FF8014 */  bnez       $a0, .L80152A58
    /* 18ED4 80152ACC 13000724 */   addiu     $a3, $zero, 0x13
    /* 18ED8 80152AD0 01000A24 */  addiu      $t2, $zero, 0x1
    /* 18EDC 80152AD4 1580053C */  lui        $a1, %hi(hallok + 0x13)
    /* 18EE0 80152AD8 17DAA524 */  addiu      $a1, $a1, %lo(hallok + 0x13)
    /* 18EE4 80152ADC 1580023C */  lui        $v0, %hi(dung)
    /* 18EE8 80152AE0 74D84224 */  addiu      $v0, $v0, %lo(dung)
    /* 18EEC 80152AE4 90014924 */  addiu      $t1, $v0, 0x190
    /* 18EF0 80152AE8 7C014824 */  addiu      $t0, $v0, 0x17C
  .L80152AEC:
    /* 18EF4 80152AEC 13000624 */  addiu      $a2, $zero, 0x13
    /* 18EF8 80152AF0 21600001 */  addu       $t4, $t0, $zero
    /* 18EFC 80152AF4 21582001 */  addu       $t3, $t1, $zero
    /* 18F00 80152AF8 13002425 */  addiu      $a0, $t1, 0x13
    /* 18F04 80152AFC 13000325 */  addiu      $v1, $t0, 0x13
  .L80152B00:
    /* 18F08 80152B00 00006290 */  lbu        $v0, 0x0($v1)
    /* 18F0C 80152B04 00000000 */  nop
    /* 18F10 80152B08 06004A10 */  beq        $v0, $t2, .L80152B24
    /* 18F14 80152B0C 00000000 */   nop
    /* 18F18 80152B10 0000A0A0 */  sb         $zero, 0x0($a1)
    /* 18F1C 80152B14 00006290 */  lbu        $v0, 0x0($v1)
    /* 18F20 80152B18 00000000 */  nop
    /* 18F24 80152B1C 0F004A14 */  bne        $v0, $t2, .L80152B5C
    /* 18F28 80152B20 00000000 */   nop
  .L80152B24:
    /* 18F2C 80152B24 00008290 */  lbu        $v0, 0x0($a0)
    /* 18F30 80152B28 00000000 */  nop
    /* 18F34 80152B2C 07004A14 */  bne        $v0, $t2, .L80152B4C
    /* 18F38 80152B30 00000000 */   nop
    /* 18F3C 80152B34 01008290 */  lbu        $v0, 0x1($a0)
    /* 18F40 80152B38 00000000 */  nop
    /* 18F44 80152B3C 03004014 */  bnez       $v0, .L80152B4C
    /* 18F48 80152B40 00000000 */   nop
    /* 18F4C 80152B44 D44A0508 */  j          .L80152B50
    /* 18F50 80152B48 0000AAA0 */   sb        $t2, 0x0($a1)
  .L80152B4C:
    /* 18F54 80152B4C 0000A0A0 */  sb         $zero, 0x0($a1)
  .L80152B50:
    /* 18F58 80152B50 21206001 */  addu       $a0, $t3, $zero
    /* 18F5C 80152B54 21188001 */  addu       $v1, $t4, $zero
    /* 18F60 80152B58 21300000 */  addu       $a2, $zero, $zero
  .L80152B5C:
    /* 18F64 80152B5C FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 18F68 80152B60 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 18F6C 80152B64 E6FFC104 */  bgez       $a2, .L80152B00
    /* 18F70 80152B68 FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 18F74 80152B6C FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 18F78 80152B70 ECFF2925 */  addiu      $t1, $t1, -0x14
    /* 18F7C 80152B74 FFFFE724 */  addiu      $a3, $a3, -0x1
    /* 18F80 80152B78 DCFFE104 */  bgez       $a3, .L80152AEC
    /* 18F84 80152B7C ECFF0825 */   addiu     $t0, $t0, -0x14
    /* 18F88 80152B80 C9F6000C */  jal        ENG_random__Fl
    /* 18F8C 80152B84 13000424 */   addiu     $a0, $zero, 0x13
    /* 18F90 80152B88 01004424 */  addiu      $a0, $v0, 0x1
    /* 18F94 80152B8C 01000724 */  addiu      $a3, $zero, 0x1
    /* 18F98 80152B90 1580083C */  lui        $t0, %hi(dung)
    /* 18F9C 80152B94 74D80825 */  addiu      $t0, $t0, %lo(dung)
    /* 18FA0 80152B98 14000925 */  addiu      $t1, $t0, 0x14
  .L80152B9C:
    /* 18FA4 80152B9C 1580013C */  lui        $at, %hi(hallok)
    /* 18FA8 80152BA0 21082400 */  addu       $at, $at, $a0
    /* 18FAC 80152BA4 04DA2290 */  lbu        $v0, %lo(hallok)($at)
    /* 18FB0 80152BA8 00000000 */  nop
    /* 18FB4 80152BAC 15004010 */  beqz       $v0, .L80152C04
    /* 18FB8 80152BB0 13000624 */   addiu     $a2, $zero, 0x13
    /* 18FBC 80152BB4 80100400 */  sll        $v0, $a0, 2
  .L80152BB8:
    /* 18FC0 80152BB8 21104400 */  addu       $v0, $v0, $a0
    /* 18FC4 80152BBC 80280200 */  sll        $a1, $v0, 2
    /* 18FC8 80152BC0 2110A800 */  addu       $v0, $a1, $t0
    /* 18FCC 80152BC4 21184600 */  addu       $v1, $v0, $a2
    /* 18FD0 80152BC8 00006290 */  lbu        $v0, 0x0($v1)
    /* 18FD4 80152BCC 00000000 */  nop
    /* 18FD8 80152BD0 04004714 */  bne        $v0, $a3, .L80152BE4
    /* 18FDC 80152BD4 2110A900 */   addu      $v0, $a1, $t1
    /* 18FE0 80152BD8 FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 18FE4 80152BDC FC4A0508 */  j          .L80152BF0
    /* 18FE8 80152BE0 21200000 */   addu      $a0, $zero, $zero
  .L80152BE4:
    /* 18FEC 80152BE4 21104600 */  addu       $v0, $v0, $a2
    /* 18FF0 80152BE8 000067A0 */  sb         $a3, 0x0($v1)
    /* 18FF4 80152BEC 000047A0 */  sb         $a3, 0x0($v0)
  .L80152BF0:
    /* 18FF8 80152BF0 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 18FFC 80152BF4 F0FFC104 */  bgez       $a2, .L80152BB8
    /* 19000 80152BF8 80100400 */   sll       $v0, $a0, 2
    /* 19004 80152BFC 064B0508 */  j          .L80152C18
    /* 19008 80152C00 00000000 */   nop
  .L80152C04:
    /* 1900C 80152C04 01008424 */  addiu      $a0, $a0, 0x1
    /* 19010 80152C08 14000224 */  addiu      $v0, $zero, 0x14
    /* 19014 80152C0C 02008214 */  bne        $a0, $v0, .L80152C18
    /* 19018 80152C10 00000000 */   nop
    /* 1901C 80152C14 01000424 */  addiu      $a0, $zero, 0x1
  .L80152C18:
    /* 19020 80152C18 E0FF8014 */  bnez       $a0, .L80152B9C
    /* 19024 80152C1C 00000000 */   nop
    /* 19028 80152C20 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1902C 80152C24 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 19030 80152C28 0800E003 */  jr         $ra
    /* 19034 80152C2C 00000000 */   nop
endlabel uShape__Fv
