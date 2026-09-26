.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetMissilePos__Fi, 0x134

glabel GetMissilePos__Fi
    /* 11A8 8013ADA0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 11AC 8013ADA4 80100400 */  sll        $v0, $a0, 2
    /* 11B0 8013ADA8 21104400 */  addu       $v0, $v0, $a0
    /* 11B4 8013ADAC 80100200 */  sll        $v0, $v0, 2
    /* 11B8 8013ADB0 23104400 */  subu       $v0, $v0, $a0
    /* 11BC 8013ADB4 80100200 */  sll        $v0, $v0, 2
    /* 11C0 8013ADB8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 11C4 8013ADBC 1080013C */  lui        $at, %hi(missile + 0xE)
    /* 11C8 8013ADC0 21082200 */  addu       $at, $at, $v0
    /* 11CC 8013ADC4 662C2984 */  lh         $t1, %lo(missile + 0xE)($at)
    /* 11D0 8013ADC8 1080013C */  lui        $at, %hi(missile + 0xA)
    /* 11D4 8013ADCC 21082200 */  addu       $at, $at, $v0
    /* 11D8 8013ADD0 622C2784 */  lh         $a3, %lo(missile + 0xA)($at)
    /* 11DC 8013ADD4 40100900 */  sll        $v0, $t1, 1
    /* 11E0 8013ADD8 2128E200 */  addu       $a1, $a3, $v0
    /* 11E4 8013ADDC 0700A104 */  bgez       $a1, .L8013ADFC
    /* 11E8 8013ADE0 23304700 */   subu      $a2, $v0, $a3
    /* 11EC 8013ADE4 23100500 */  negu       $v0, $a1
    /* 11F0 8013ADE8 C3180200 */  sra        $v1, $v0, 3
    /* 11F4 8013ADEC 23500300 */  negu       $t2, $v1
    /* 11F8 8013ADF0 83110200 */  sra        $v0, $v0, 6
    /* 11FC 8013ADF4 81EB0408 */  j          .L8013AE04
    /* 1200 8013ADF8 23280200 */   negu      $a1, $v0
  .L8013ADFC:
    /* 1204 8013ADFC C3500500 */  sra        $t2, $a1, 3
    /* 1208 8013AE00 83290500 */  sra        $a1, $a1, 6
  .L8013AE04:
    /* 120C 8013AE04 0700C104 */  bgez       $a2, .L8013AE24
    /* 1210 8013AE08 C3400600 */   sra       $t0, $a2, 3
    /* 1214 8013AE0C 23100600 */  negu       $v0, $a2
    /* 1218 8013AE10 C3180200 */  sra        $v1, $v0, 3
    /* 121C 8013AE14 23400300 */  negu       $t0, $v1
    /* 1220 8013AE18 83110200 */  sra        $v0, $v0, 6
    /* 1224 8013AE1C 8AEB0408 */  j          .L8013AE28
    /* 1228 8013AE20 23300200 */   negu      $a2, $v0
  .L8013AE24:
    /* 122C 8013AE24 83310600 */  sra        $a2, $a2, 6
  .L8013AE28:
    /* 1230 8013AE28 80180400 */  sll        $v1, $a0, 2
    /* 1234 8013AE2C 21186400 */  addu       $v1, $v1, $a0
    /* 1238 8013AE30 80180300 */  sll        $v1, $v1, 2
    /* 123C 8013AE34 23186400 */  subu       $v1, $v1, $a0
    /* 1240 8013AE38 80180300 */  sll        $v1, $v1, 2
    /* 1244 8013AE3C 2310A600 */  subu       $v0, $a1, $a2
    /* 1248 8013AE40 40110200 */  sll        $v0, $v0, 5
    /* 124C 8013AE44 2310E200 */  subu       $v0, $a3, $v0
    /* 1250 8013AE48 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 1254 8013AE4C 21082300 */  addu       $at, $at, $v1
    /* 1258 8013AE50 8B2C22A0 */  sb         $v0, %lo(missile + 0x33)($at)
    /* 125C 8013AE54 2110A600 */  addu       $v0, $a1, $a2
    /* 1260 8013AE58 00110200 */  sll        $v0, $v0, 4
    /* 1264 8013AE5C 23102201 */  subu       $v0, $t1, $v0
    /* 1268 8013AE60 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 126C 8013AE64 21082300 */  addu       $at, $at, $v1
    /* 1270 8013AE68 8C2C22A0 */  sb         $v0, %lo(missile + 0x34)($at)
    /* 1274 8013AE6C 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 1278 8013AE70 21082300 */  addu       $at, $at, $v1
    /* 127C 8013AE74 8D2C2290 */  lbu        $v0, %lo(missile + 0x35)($at)
    /* 1280 8013AE78 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 1284 8013AE7C 21082300 */  addu       $at, $at, $v1
    /* 1288 8013AE80 8E2C2490 */  lbu        $a0, %lo(missile + 0x36)($at)
    /* 128C 8013AE84 21104500 */  addu       $v0, $v0, $a1
    /* 1290 8013AE88 21208600 */  addu       $a0, $a0, $a2
    /* 1294 8013AE8C C0280500 */  sll        $a1, $a1, 3
    /* 1298 8013AE90 C0300600 */  sll        $a2, $a2, 3
    /* 129C 8013AE94 23284501 */  subu       $a1, $t2, $a1
    /* 12A0 8013AE98 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 12A4 8013AE9C 21082300 */  addu       $at, $at, $v1
    /* 12A8 8013AEA0 8A2C24A0 */  sb         $a0, %lo(missile + 0x32)($at)
    /* 12AC 8013AEA4 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 12B0 8013AEA8 21082300 */  addu       $at, $at, $v1
    /* 12B4 8013AEAC 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 12B8 8013AEB0 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 12BC 8013AEB4 21082300 */  addu       $at, $at, $v1
    /* 12C0 8013AEB8 892C22A0 */  sb         $v0, %lo(missile + 0x31)($at)
    /* 12C4 8013AEBC EE34010C */  jal        ChangeLightOff__Fiii
    /* 12C8 8013AEC0 23300601 */   subu      $a2, $t0, $a2
    /* 12CC 8013AEC4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 12D0 8013AEC8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12D4 8013AECC 0800E003 */  jr         $ra
    /* 12D8 8013AED0 00000000 */   nop
endlabel GetMissilePos__Fi
