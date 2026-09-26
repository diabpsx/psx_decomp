.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetMissilePos__Fi, 0x7C

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
    /* 120C 8013AE04 0700C104 */  bgez       $a2, D_8013AE24
    /* 1210 8013AE08 C3400600 */   sra       $t0, $a2, 3
    /* 1214 8013AE0C 23100600 */  negu       $v0, $a2
    /* 1218 8013AE10 C3180200 */  sra        $v1, $v0, 3
    /* 121C 8013AE14 23400300 */  negu       $t0, $v1
    /* 1220 8013AE18 83110200 */  sra        $v0, $v0, 6
endlabel GetMissilePos__Fi
