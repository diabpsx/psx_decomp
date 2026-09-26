.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PreObjObjAddSwitch__Fiiii, 0x268

glabel PreObjObjAddSwitch__Fiiii
    /* 2007C 80159C74 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 20080 80159C78 21188000 */  addu       $v1, $a0, $zero
    /* 20084 80159C7C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 20088 80159C80 2180E000 */  addu       $s0, $a3, $zero
    /* 2008C 80159C84 5D00622C */  sltiu      $v0, $v1, 0x5D
    /* 20090 80159C88 8F004010 */  beqz       $v0, .L80159EC8
    /* 20094 80159C8C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 20098 80159C90 80100300 */  sll        $v0, $v1, 2
    /* 2009C 80159C94 1280013C */  lui        $at, %hi(jtbl_8011981C)
    /* 200A0 80159C98 21082200 */  addu       $at, $at, $v0
    /* 200A4 80159C9C 1C98228C */  lw         $v0, %lo(jtbl_8011981C)($at)
    /* 200A8 80159CA0 00000000 */  nop
    /* 200AC 80159CA4 08004000 */  jr         $v0
    /* 200B0 80159CA8 00000000 */   nop
    /* 200B4 80159CAC 21200002 */  addu       $a0, $s0, $zero
    /* 200B8 80159CB0 EC59050C */  jal        AddObjLight__Fii
    /* 200BC 80159CB4 F3030524 */   addiu     $a1, $zero, 0x3F3
    /* 200C0 80159CB8 B2670508 */  j          .L80159EC8
    /* 200C4 80159CBC 00000000 */   nop
    /* 200C8 80159CC0 21200002 */  addu       $a0, $s0, $zero
    /* 200CC 80159CC4 F657050C */  jal        AddL1Door__Fiiii
    /* 200D0 80159CC8 21386000 */   addu      $a3, $v1, $zero
    /* 200D4 80159CCC B2670508 */  j          .L80159EC8
    /* 200D8 80159CD0 00000000 */   nop
    /* 200DC 80159CD4 21200002 */  addu       $a0, $s0, $zero
    /* 200E0 80159CD8 CC58050C */  jal        AddL2Door__Fiiii
    /* 200E4 80159CDC 21386000 */   addu      $a3, $v1, $zero
    /* 200E8 80159CE0 B2670508 */  j          .L80159EC8
    /* 200EC 80159CE4 00000000 */   nop
    /* 200F0 80159CE8 21200002 */  addu       $a0, $s0, $zero
    /* 200F4 80159CEC 1F59050C */  jal        AddL3Door__Fiiii
    /* 200F8 80159CF0 21386000 */   addu      $a3, $v1, $zero
    /* 200FC 80159CF4 B2670508 */  j          .L80159EC8
    /* 20100 80159CF8 00000000 */   nop
    /* 20104 80159CFC 3058050C */  jal        AddSCambBook__Fi
    /* 20108 80159D00 21200002 */   addu      $a0, $s0, $zero
    /* 2010C 80159D04 B2670508 */  j          .L80159EC8
    /* 20110 80159D08 00000000 */   nop
    /* 20114 80159D0C 21200002 */  addu       $a0, $s0, $zero
    /* 20118 80159D10 5858050C */  jal        AddChest__Fii
    /* 2011C 80159D14 21286000 */   addu      $a1, $v1, $zero
    /* 20120 80159D18 B2670508 */  j          .L80159EC8
    /* 20124 80159D1C 00000000 */   nop
    /* 20128 80159D20 4459050C */  jal        AddSarc__Fi
    /* 2012C 80159D24 21200002 */   addu      $a0, $s0, $zero
    /* 20130 80159D28 B2670508 */  j          .L80159EC8
    /* 20134 80159D2C 00000000 */   nop
    /* 20138 80159D30 7659050C */  jal        AddFlameTrap__Fi
    /* 2013C 80159D34 21200002 */   addu      $a0, $s0, $zero
    /* 20140 80159D38 B2670508 */  j          .L80159EC8
    /* 20144 80159D3C 00000000 */   nop
    /* 20148 80159D40 925C050C */  jal        AddFlameLvr__Fi
    /* 2014C 80159D44 21200002 */   addu      $a0, $s0, $zero
    /* 20150 80159D48 B2670508 */  j          .L80159EC8
    /* 20154 80159D4C 00000000 */   nop
    /* 20158 80159D50 40101000 */  sll        $v0, $s0, 1
    /* 2015C 80159D54 21105000 */  addu       $v0, $v0, $s0
    /* 20160 80159D58 80100200 */  sll        $v0, $v0, 2
    /* 20164 80159D5C 23105000 */  subu       $v0, $v0, $s0
    /* 20168 80159D60 80100200 */  sll        $v0, $v0, 2
    /* 2016C 80159D64 01000324 */  addiu      $v1, $zero, 0x1
    /* 20170 80159D68 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 20174 80159D6C 21082200 */  addu       $at, $at, $v0
    /* 20178 80159D70 6D8C23A0 */  sb         $v1, %lo(object + 0x21)($at)
    /* 2017C 80159D74 B2670508 */  j          .L80159EC8
    /* 20180 80159D78 00000000 */   nop
    /* 20184 80159D7C 21200002 */  addu       $a0, $s0, $zero
    /* 20188 80159D80 8D59050C */  jal        AddTrap__Fii
    /* 2018C 80159D84 21286000 */   addu      $a1, $v1, $zero
    /* 20190 80159D88 B2670508 */  j          .L80159EC8
    /* 20194 80159D8C 00000000 */   nop
    /* 20198 80159D90 21200002 */  addu       $a0, $s0, $zero
    /* 2019C 80159D94 1E5A050C */  jal        AddBarrel__Fii
    /* 201A0 80159D98 21286000 */   addu      $a1, $v1, $zero
    /* 201A4 80159D9C B2670508 */  j          .L80159EC8
    /* 201A8 80159DA0 00000000 */   nop
    /* 201AC 80159DA4 485A050C */  jal        AddShrine__Fi
    /* 201B0 80159DA8 21200002 */   addu      $a0, $s0, $zero
    /* 201B4 80159DAC B2670508 */  j          .L80159EC8
    /* 201B8 80159DB0 00000000 */   nop
    /* 201BC 80159DB4 9A5A050C */  jal        AddBookcase__Fi
    /* 201C0 80159DB8 21200002 */   addu      $a0, $s0, $zero
    /* 201C4 80159DBC B2670508 */  j          .L80159EC8
    /* 201C8 80159DC0 00000000 */   nop
    /* 201CC 80159DC4 B05A050C */  jal        AddBookstand__Fi
    /* 201D0 80159DC8 21200002 */   addu      $a0, $s0, $zero
    /* 201D4 80159DCC B2670508 */  j          .L80159EC8
    /* 201D8 80159DD0 00000000 */   nop
    /* 201DC 80159DD4 C25A050C */  jal        AddBloodFtn__Fi
    /* 201E0 80159DD8 21200002 */   addu      $a0, $s0, $zero
    /* 201E4 80159DDC B2670508 */  j          .L80159EC8
    /* 201E8 80159DE0 00000000 */   nop
    /* 201EC 80159DE4 685B050C */  jal        AddDecap__Fi
    /* 201F0 80159DE8 21200002 */   addu      $a0, $s0, $zero
    /* 201F4 80159DEC B2670508 */  j          .L80159EC8
    /* 201F8 80159DF0 00000000 */   nop
    /* 201FC 80159DF4 D45A050C */  jal        AddPurifyingFountain__Fi
    /* 20200 80159DF8 21200002 */   addu      $a0, $s0, $zero
    /* 20204 80159DFC B2670508 */  j          .L80159EC8
    /* 20208 80159E00 00000000 */   nop
    /* 2020C 80159E04 CA59050C */  jal        AddArmorStand__Fi
    /* 20210 80159E08 21200002 */   addu      $a0, $s0, $zero
    /* 20214 80159E0C B2670508 */  j          .L80159EC8
    /* 20218 80159E10 00000000 */   nop
    /* 2021C 80159E14 035B050C */  jal        AddGoatShrine__Fi
    /* 20220 80159E18 21200002 */   addu      $a0, $s0, $zero
    /* 20224 80159E1C B2670508 */  j          .L80159EC8
    /* 20228 80159E20 00000000 */   nop
    /* 2022C 80159E24 155B050C */  jal        AddCauldron__Fi
    /* 20230 80159E28 21200002 */   addu      $a0, $s0, $zero
    /* 20234 80159E2C B2670508 */  j          .L80159EC8
    /* 20238 80159E30 00000000 */   nop
    /* 2023C 80159E34 275B050C */  jal        AddMurkyFountain__Fi
    /* 20240 80159E38 21200002 */   addu      $a0, $s0, $zero
    /* 20244 80159E3C B2670508 */  j          .L80159EC8
    /* 20248 80159E40 00000000 */   nop
    /* 2024C 80159E44 565B050C */  jal        AddTearFountain__Fi
    /* 20250 80159E48 21200002 */   addu      $a0, $s0, $zero
    /* 20254 80159E4C B2670508 */  j          .L80159EC8
    /* 20258 80159E50 00000000 */   nop
    /* 2025C 80159E54 855B050C */  jal        AddVilebook__Fi
    /* 20260 80159E58 21200002 */   addu      $a0, $s0, $zero
    /* 20264 80159E5C B2670508 */  j          .L80159EC8
    /* 20268 80159E60 00000000 */   nop
    /* 2026C 80159E64 995B050C */  jal        AddMagicCircle__Fi
    /* 20270 80159E68 21200002 */   addu      $a0, $s0, $zero
    /* 20274 80159E6C B2670508 */  j          .L80159EC8
    /* 20278 80159E70 00000000 */   nop
    /* 2027C 80159E74 F25B050C */  jal        AddStoryBook__Fi
    /* 20280 80159E78 21200002 */   addu      $a0, $s0, $zero
    /* 20284 80159E7C B2670508 */  j          .L80159EC8
    /* 20288 80159E80 00000000 */   nop
    /* 2028C 80159E84 B65B050C */  jal        AddBrnCross__Fi
    /* 20290 80159E88 21200002 */   addu      $a0, $s0, $zero
    /* 20294 80159E8C 21200002 */  addu       $a0, $s0, $zero
    /* 20298 80159E90 EC59050C */  jal        AddObjLight__Fii
    /* 2029C 80159E94 B8010524 */   addiu     $a1, $zero, 0x1B8
    /* 202A0 80159E98 B2670508 */  j          .L80159EC8
    /* 202A4 80159E9C 00000000 */   nop
    /* 202A8 80159EA0 C85B050C */  jal        AddPedistal__Fi
    /* 202AC 80159EA4 21200002 */   addu      $a0, $s0, $zero
    /* 202B0 80159EA8 B2670508 */  j          .L80159EC8
    /* 202B4 80159EAC 00000000 */   nop
    /* 202B8 80159EB0 525C050C */  jal        AddWeaponRack__Fi
    /* 202BC 80159EB4 21200002 */   addu      $a0, $s0, $zero
    /* 202C0 80159EB8 B2670508 */  j          .L80159EC8
    /* 202C4 80159EBC 00000000 */   nop
    /* 202C8 80159EC0 745C050C */  jal        AddTorturedBody__Fi
    /* 202CC 80159EC4 21200002 */   addu      $a0, $s0, $zero
  .L80159EC8:
    /* 202D0 80159EC8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 202D4 80159ECC 1000B08F */  lw         $s0, 0x10($sp)
    /* 202D8 80159ED0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 202DC 80159ED4 0800E003 */  jr         $ra
    /* 202E0 80159ED8 00000000 */   nop
endlabel PreObjObjAddSwitch__Fiiii
