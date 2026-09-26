.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddHeal__Fiiiiiicii, 0x20C

glabel AddHeal__Fiiiiiicii
    /* 70F0 80140CE8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 70F4 80140CEC 3000B4AF */  sw         $s4, 0x30($sp)
    /* 70F8 80140CF0 21A08000 */  addu       $s4, $a0, $zero
    /* 70FC 80140CF4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 7100 80140CF8 5400B38F */  lw         $s3, 0x54($sp)
    /* 7104 80140CFC 0A000424 */  addiu      $a0, $zero, 0xA
    /* 7108 80140D00 3400BFAF */  sw         $ra, 0x34($sp)
    /* 710C 80140D04 2800B2AF */  sw         $s2, 0x28($sp)
    /* 7110 80140D08 2400B1AF */  sw         $s1, 0x24($sp)
    /* 7114 80140D0C C9F6000C */  jal        ENG_random__Fl
    /* 7118 80140D10 2000B0AF */   sw        $s0, 0x20($sp)
    /* 711C 80140D14 01004224 */  addiu      $v0, $v0, 0x1
    /* 7120 80140D18 80890200 */  sll        $s1, $v0, 6
    /* 7124 80140D1C 40101300 */  sll        $v0, $s3, 1
    /* 7128 80140D20 21105300 */  addu       $v0, $v0, $s3
    /* 712C 80140D24 80100200 */  sll        $v0, $v0, 2
    /* 7130 80140D28 21105300 */  addu       $v0, $v0, $s3
    /* 7134 80140D2C 00110200 */  sll        $v0, $v0, 4
    /* 7138 80140D30 23105300 */  subu       $v0, $v0, $s3
    /* 713C 80140D34 80100200 */  sll        $v0, $v0, 2
    /* 7140 80140D38 21105300 */  addu       $v0, $v0, $s3
    /* 7144 80140D3C C0180200 */  sll        $v1, $v0, 3
    /* 7148 80140D40 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 714C 80140D44 21082300 */  addu       $at, $at, $v1
    /* 7150 80140D48 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 7154 80140D4C 00000000 */  nop
    /* 7158 80140D50 0E004018 */  blez       $v0, .L80140D8C
    /* 715C 80140D54 21800000 */   addu      $s0, $zero, $zero
    /* 7160 80140D58 21906000 */  addu       $s2, $v1, $zero
  .L80140D5C:
    /* 7164 80140D5C C9F6000C */  jal        ENG_random__Fl
    /* 7168 80140D60 04000424 */   addiu     $a0, $zero, 0x4
    /* 716C 80140D64 01004224 */  addiu      $v0, $v0, 0x1
    /* 7170 80140D68 80110200 */  sll        $v0, $v0, 6
    /* 7174 80140D6C 21882202 */  addu       $s1, $s1, $v0
    /* 7178 80140D70 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 717C 80140D74 21083200 */  addu       $at, $at, $s2
    /* 7180 80140D78 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 7184 80140D7C 01001026 */  addiu      $s0, $s0, 0x1
    /* 7188 80140D80 2A100202 */  slt        $v0, $s0, $v0
    /* 718C 80140D84 F5FF4014 */  bnez       $v0, .L80140D5C
    /* 7190 80140D88 00000000 */   nop
  .L80140D8C:
    /* 7194 80140D8C 80101400 */  sll        $v0, $s4, 2
    /* 7198 80140D90 21105400 */  addu       $v0, $v0, $s4
    /* 719C 80140D94 80100200 */  sll        $v0, $v0, 2
    /* 71A0 80140D98 23105400 */  subu       $v0, $v0, $s4
    /* 71A4 80140D9C 80180200 */  sll        $v1, $v0, 2
    /* 71A8 80140DA0 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 71AC 80140DA4 21082300 */  addu       $at, $at, $v1
    /* 71B0 80140DA8 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* 71B4 80140DAC 00000000 */  nop
    /* 71B8 80140DB0 0E004018 */  blez       $v0, .L80140DEC
    /* 71BC 80140DB4 21800000 */   addu      $s0, $zero, $zero
    /* 71C0 80140DB8 21906000 */  addu       $s2, $v1, $zero
  .L80140DBC:
    /* 71C4 80140DBC C9F6000C */  jal        ENG_random__Fl
    /* 71C8 80140DC0 06000424 */   addiu     $a0, $zero, 0x6
    /* 71CC 80140DC4 01004224 */  addiu      $v0, $v0, 0x1
    /* 71D0 80140DC8 80110200 */  sll        $v0, $v0, 6
    /* 71D4 80140DCC 21882202 */  addu       $s1, $s1, $v0
    /* 71D8 80140DD0 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 71DC 80140DD4 21083200 */  addu       $at, $at, $s2
    /* 71E0 80140DD8 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* 71E4 80140DDC 01001026 */  addiu      $s0, $s0, 0x1
    /* 71E8 80140DE0 2A100202 */  slt        $v0, $s0, $v0
    /* 71EC 80140DE4 F5FF4014 */  bnez       $v0, .L80140DBC
    /* 71F0 80140DE8 00000000 */   nop
  .L80140DEC:
    /* 71F4 80140DEC 40101300 */  sll        $v0, $s3, 1
    /* 71F8 80140DF0 21105300 */  addu       $v0, $v0, $s3
    /* 71FC 80140DF4 80100200 */  sll        $v0, $v0, 2
    /* 7200 80140DF8 21105300 */  addu       $v0, $v0, $s3
    /* 7204 80140DFC 00110200 */  sll        $v0, $v0, 4
    /* 7208 80140E00 23105300 */  subu       $v0, $v0, $s3
    /* 720C 80140E04 80100200 */  sll        $v0, $v0, 2
    /* 7210 80140E08 21105300 */  addu       $v0, $v0, $s3
    /* 7214 80140E0C C0180200 */  sll        $v1, $v0, 3
    /* 7218 80140E10 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 721C 80140E14 21082300 */  addu       $at, $at, $v1
    /* 7220 80140E18 2EA62480 */  lb         $a0, %lo(plr + 0xF6)($at)
    /* 7224 80140E1C 00000000 */  nop
    /* 7228 80140E20 02008014 */  bnez       $a0, .L80140E2C
    /* 722C 80140E24 01000224 */   addiu     $v0, $zero, 0x1
    /* 7230 80140E28 40881100 */  sll        $s1, $s1, 1
  .L80140E2C:
    /* 7234 80140E2C 02008214 */  bne        $a0, $v0, .L80140E38
    /* 7238 80140E30 43101100 */   sra       $v0, $s1, 1
    /* 723C 80140E34 21882202 */  addu       $s1, $s1, $v0
  .L80140E38:
    /* 7240 80140E38 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 7244 80140E3C 21082300 */  addu       $at, $at, $v1
    /* 7248 80140E40 54A6228C */  lw         $v0, %lo(plr + 0x11C)($at)
    /* 724C 80140E44 0E80013C */  lui        $at, %hi(plr + 0x120)
    /* 7250 80140E48 21082300 */  addu       $at, $at, $v1
    /* 7254 80140E4C 58A6248C */  lw         $a0, %lo(plr + 0x120)($at)
    /* 7258 80140E50 21105100 */  addu       $v0, $v0, $s1
    /* 725C 80140E54 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 7260 80140E58 21082300 */  addu       $at, $at, $v1
    /* 7264 80140E5C 54A622AC */  sw         $v0, %lo(plr + 0x11C)($at)
    /* 7268 80140E60 2A108200 */  slt        $v0, $a0, $v0
    /* 726C 80140E64 04004010 */  beqz       $v0, .L80140E78
    /* 7270 80140E68 00000000 */   nop
    /* 7274 80140E6C 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 7278 80140E70 21082300 */  addu       $at, $at, $v1
    /* 727C 80140E74 54A624AC */  sw         $a0, %lo(plr + 0x11C)($at)
  .L80140E78:
    /* 7280 80140E78 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 7284 80140E7C 21082300 */  addu       $at, $at, $v1
    /* 7288 80140E80 4CA6228C */  lw         $v0, %lo(plr + 0x114)($at)
    /* 728C 80140E84 0E80013C */  lui        $at, %hi(plr + 0x118)
    /* 7290 80140E88 21082300 */  addu       $at, $at, $v1
    /* 7294 80140E8C 50A6248C */  lw         $a0, %lo(plr + 0x118)($at)
    /* 7298 80140E90 21105100 */  addu       $v0, $v0, $s1
    /* 729C 80140E94 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 72A0 80140E98 21082300 */  addu       $at, $at, $v1
    /* 72A4 80140E9C 4CA622AC */  sw         $v0, %lo(plr + 0x114)($at)
    /* 72A8 80140EA0 2A108200 */  slt        $v0, $a0, $v0
    /* 72AC 80140EA4 04004010 */  beqz       $v0, .L80140EB8
    /* 72B0 80140EA8 00000000 */   nop
    /* 72B4 80140EAC 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 72B8 80140EB0 21082300 */  addu       $at, $at, $v1
    /* 72BC 80140EB4 4CA624AC */  sw         $a0, %lo(plr + 0x114)($at)
  .L80140EB8:
    /* 72C0 80140EB8 21206002 */  addu       $a0, $s3, $zero
    /* 72C4 80140EBC C2DC010C */  jal        UseMana__Fii
    /* 72C8 80140EC0 02000524 */   addiu     $a1, $zero, 0x2
    /* 72CC 80140EC4 01000324 */  addiu      $v1, $zero, 0x1
    /* 72D0 80140EC8 80101400 */  sll        $v0, $s4, 2
    /* 72D4 80140ECC 21105400 */  addu       $v0, $v0, $s4
    /* 72D8 80140ED0 80100200 */  sll        $v0, $v0, 2
    /* 72DC 80140ED4 23105400 */  subu       $v0, $v0, $s4
    /* 72E0 80140ED8 80100200 */  sll        $v0, $v0, 2
    /* 72E4 80140EDC 1280013C */  lui        $at, %hi(drawhpflag)
    /* 72E8 80140EE0 BEB623A0 */  sb         $v1, %lo(drawhpflag)($at)
    /* 72EC 80140EE4 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 72F0 80140EE8 21082200 */  addu       $at, $at, $v0
    /* 72F4 80140EEC 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* 72F8 80140EF0 3400BF8F */  lw         $ra, 0x34($sp)
endlabel AddHeal__Fiiiiiicii
