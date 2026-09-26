.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013ADA0, 0x7C

glabel func_8013ADA0
    /* 11A8 8013ADA0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 11AC 8013ADA4 0100A230 */  andi       $v0, $a1, 0x1
    /* 11B0 8013ADA8 06004010 */  beqz       $v0, .L8013ADC4
    /* 11B4 8013ADAC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 11B8 8013ADB0 FFF7033C */  lui        $v1, (0xF7FFFFFF >> 16)
    /* 11BC 8013ADB4 0000828C */  lw         $v0, 0x0($a0)
    /* 11C0 8013ADB8 FFFF6334 */  ori        $v1, $v1, (0xF7FFFFFF & 0xFFFF)
    /* 11C4 8013ADBC 74EB0408 */  j          .L8013ADD0
    /* 11C8 8013ADC0 24104300 */   and       $v0, $v0, $v1
  .L8013ADC4:
    /* 11CC 8013ADC4 0000828C */  lw         $v0, 0x0($a0)
    /* 11D0 8013ADC8 0008033C */  lui        $v1, (0x8000000 >> 16)
    /* 11D4 8013ADCC 25104300 */  or         $v0, $v0, $v1
  .L8013ADD0:
    /* 11D8 8013ADD0 000082AC */  sw         $v0, 0x0($a0)
    /* 11DC 8013ADD4 0200A230 */  andi       $v0, $a1, 0x2
    /* 11E0 8013ADD8 04004010 */  beqz       $v0, .L8013ADEC
    /* 11E4 8013ADDC 0002033C */   lui       $v1, (0x2000000 >> 16)
    /* 11E8 8013ADE0 0000828C */  lw         $v0, 0x0($a0)
    /* 11EC 8013ADE4 7FEB0408 */  j          .L8013ADFC
    /* 11F0 8013ADE8 25104300 */   or        $v0, $v0, $v1
  .L8013ADEC:
    /* 11F4 8013ADEC FFFD033C */  lui        $v1, (0xFDFFFFFF >> 16)
    /* 11F8 8013ADF0 0000828C */  lw         $v0, 0x0($a0)
    /* 11FC 8013ADF4 FFFF6334 */  ori        $v1, $v1, (0xFDFFFFFF & 0xFFFF)
    /* 1200 8013ADF8 24104300 */  and        $v0, $v0, $v1
  .L8013ADFC:
    /* 1204 8013ADFC 000082AC */  sw         $v0, 0x0($a0)
    /* 1208 8013AE00 00008594 */  lhu        $a1, 0x0($a0)
    /* 120C 8013AE04 FBEB040C */  jal        func_8013AFEC
    /* 1210 8013AE08 00000000 */   nop
    /* 1214 8013AE0C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1218 8013AE10 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 121C 8013AE14 0800E003 */  jr         $ra
    /* 1220 8013AE18 00000000 */   nop
endlabel func_8013ADA0
