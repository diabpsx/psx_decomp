.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckQuestKill__FiUc, 0x5C8

glabel CheckQuestKill__FiUc
    /* 57C04 80067C04 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 57C08 80067C08 40100400 */  sll        $v0, $a0, 1
    /* 57C0C 80067C0C 21104400 */  addu       $v0, $v0, $a0
    /* 57C10 80067C10 80100200 */  sll        $v0, $v0, 2
    /* 57C14 80067C14 21104400 */  addu       $v0, $v0, $a0
    /* 57C18 80067C18 C0200200 */  sll        $a0, $v0, 3
    /* 57C1C 80067C1C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 57C20 80067C20 2400B5AF */  sw         $s5, 0x24($sp)
    /* 57C24 80067C24 2000B4AF */  sw         $s4, 0x20($sp)
    /* 57C28 80067C28 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 57C2C 80067C2C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 57C30 80067C30 1400B1AF */  sw         $s1, 0x14($sp)
    /* 57C34 80067C34 1000B0AF */  sw         $s0, 0x10($sp)
    /* 57C38 80067C38 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 57C3C 80067C3C 21082400 */  addu       $at, $at, $a0
    /* 57C40 80067C40 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 57C44 80067C44 00000000 */  nop
    /* 57C48 80067C48 12004390 */  lbu        $v1, 0x12($v0)
    /* 57C4C 80067C4C 32000224 */  addiu      $v0, $zero, 0x32
    /* 57C50 80067C50 2A006214 */  bne        $v1, $v0, .L80067CFC
    /* 57C54 80067C54 21A8A000 */   addu      $s5, $a1, $zero
    /* 57C58 80067C58 1280033C */  lui        $v1, %hi(myplr)
    /* 57C5C 80067C5C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 57C60 80067C60 03000224 */  addiu      $v0, $zero, 0x3
    /* 57C64 80067C64 0E80013C */  lui        $at, %hi(quests + 0xF2)
    /* 57C68 80067C68 32DB22A0 */  sb         $v0, %lo(quests + 0xF2)($at)
    /* 57C6C 80067C6C 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 57C70 80067C70 1280013C */  lui        $at, %hi(sfxdelay)
    /* 57C74 80067C74 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 57C78 80067C78 40100300 */  sll        $v0, $v1, 1
    /* 57C7C 80067C7C 21104300 */  addu       $v0, $v0, $v1
    /* 57C80 80067C80 80100200 */  sll        $v0, $v0, 2
    /* 57C84 80067C84 21104300 */  addu       $v0, $v0, $v1
    /* 57C88 80067C88 00110200 */  sll        $v0, $v0, 4
    /* 57C8C 80067C8C 23104300 */  subu       $v0, $v0, $v1
    /* 57C90 80067C90 80100200 */  sll        $v0, $v0, 2
    /* 57C94 80067C94 21104300 */  addu       $v0, $v0, $v1
    /* 57C98 80067C98 C0100200 */  sll        $v0, $v0, 3
    /* 57C9C 80067C9C 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 57CA0 80067CA0 21082200 */  addu       $at, $at, $v0
    /* 57CA4 80067CA4 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 57CA8 80067CA8 00000000 */  nop
    /* 57CAC 80067CAC 03006014 */  bnez       $v1, .L80067CBC
    /* 57CB0 80067CB0 01000224 */   addiu     $v0, $zero, 0x1
    /* 57CB4 80067CB4 369F0108 */  j          .L80067CD8
    /* 57CB8 80067CB8 24030224 */   addiu     $v0, $zero, 0x324
  .L80067CBC:
    /* 57CBC 80067CBC 03006214 */  bne        $v1, $v0, .L80067CCC
    /* 57CC0 80067CC0 02000224 */   addiu     $v0, $zero, 0x2
    /* 57CC4 80067CC4 369F0108 */  j          .L80067CD8
    /* 57CC8 80067CC8 B6020224 */   addiu     $v0, $zero, 0x2B6
  .L80067CCC:
    /* 57CCC 80067CCC 05006214 */  bne        $v1, $v0, .L80067CE4
    /* 57CD0 80067CD0 FF00A232 */   andi      $v0, $s5, 0xFF
    /* 57CD4 80067CD4 4E020224 */  addiu      $v0, $zero, 0x24E
  .L80067CD8:
    /* 57CD8 80067CD8 1280013C */  lui        $at, %hi(sfxdnum)
    /* 57CDC 80067CDC 54B822AC */  sw         $v0, %lo(sfxdnum)($at)
    /* 57CE0 80067CE0 FF00A232 */  andi       $v0, $s5, 0xFF
  .L80067CE4:
    /* 57CE4 80067CE4 2F014010 */  beqz       $v0, .L800681A4
    /* 57CE8 80067CE8 01000424 */   addiu     $a0, $zero, 0x1
    /* 57CEC 80067CEC 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 57CF0 80067CF0 0C000524 */   addiu     $a1, $zero, 0xC
    /* 57CF4 80067CF4 69A00108 */  j          .L800681A4
    /* 57CF8 80067CF8 00000000 */   nop
  .L80067CFC:
    /* 57CFC 80067CFC 33000224 */  addiu      $v0, $zero, 0x33
    /* 57D00 80067D00 29006214 */  bne        $v1, $v0, .L80067DA8
    /* 57D04 80067D04 03000224 */   addiu     $v0, $zero, 0x3
    /* 57D08 80067D08 1280033C */  lui        $v1, %hi(myplr)
    /* 57D0C 80067D0C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 57D10 80067D10 0E80013C */  lui        $at, %hi(quests + 0x7A)
    /* 57D14 80067D14 BADA22A0 */  sb         $v0, %lo(quests + 0x7A)($at)
    /* 57D18 80067D18 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 57D1C 80067D1C 1280013C */  lui        $at, %hi(sfxdelay)
    /* 57D20 80067D20 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 57D24 80067D24 40100300 */  sll        $v0, $v1, 1
    /* 57D28 80067D28 21104300 */  addu       $v0, $v0, $v1
    /* 57D2C 80067D2C 80100200 */  sll        $v0, $v0, 2
    /* 57D30 80067D30 21104300 */  addu       $v0, $v0, $v1
    /* 57D34 80067D34 00110200 */  sll        $v0, $v0, 4
    /* 57D38 80067D38 23104300 */  subu       $v0, $v0, $v1
    /* 57D3C 80067D3C 80100200 */  sll        $v0, $v0, 2
    /* 57D40 80067D40 21104300 */  addu       $v0, $v0, $v1
    /* 57D44 80067D44 C0100200 */  sll        $v0, $v0, 3
    /* 57D48 80067D48 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 57D4C 80067D4C 21082200 */  addu       $at, $at, $v0
    /* 57D50 80067D50 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 57D54 80067D54 00000000 */  nop
    /* 57D58 80067D58 03006014 */  bnez       $v1, .L80067D68
    /* 57D5C 80067D5C 01000224 */   addiu     $v0, $zero, 0x1
    /* 57D60 80067D60 619F0108 */  j          .L80067D84
    /* 57D64 80067D64 22030224 */   addiu     $v0, $zero, 0x322
  .L80067D68:
    /* 57D68 80067D68 03006214 */  bne        $v1, $v0, .L80067D78
    /* 57D6C 80067D6C 02000224 */   addiu     $v0, $zero, 0x2
    /* 57D70 80067D70 619F0108 */  j          .L80067D84
    /* 57D74 80067D74 B4020224 */   addiu     $v0, $zero, 0x2B4
  .L80067D78:
    /* 57D78 80067D78 05006214 */  bne        $v1, $v0, .L80067D90
    /* 57D7C 80067D7C FF00A232 */   andi      $v0, $s5, 0xFF
    /* 57D80 80067D80 4C020224 */  addiu      $v0, $zero, 0x24C
  .L80067D84:
    /* 57D84 80067D84 1280013C */  lui        $at, %hi(sfxdnum)
    /* 57D88 80067D88 54B822AC */  sw         $v0, %lo(sfxdnum)($at)
    /* 57D8C 80067D8C FF00A232 */  andi       $v0, $s5, 0xFF
  .L80067D90:
    /* 57D90 80067D90 04014010 */  beqz       $v0, .L800681A4
    /* 57D94 80067D94 01000424 */   addiu     $a0, $zero, 0x1
    /* 57D98 80067D98 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 57D9C 80067D9C 06000524 */   addiu     $a1, $zero, 0x6
    /* 57DA0 80067DA0 69A00108 */  j          .L800681A4
    /* 57DA4 80067DA4 00000000 */   nop
  .L80067DA8:
    /* 57DA8 80067DA8 1180023C */  lui        $v0, %hi(UniqMonst + 0x2)
    /* 57DAC 80067DAC 0AC74294 */  lhu        $v0, %lo(UniqMonst + 0x2)($v0)
    /* 57DB0 80067DB0 1080013C */  lui        $at, %hi(monster + 0x5C)
    /* 57DB4 80067DB4 21082400 */  addu       $at, $at, $a0
    /* 57DB8 80067DB8 F053238C */  lw         $v1, %lo(monster + 0x5C)($at)
    /* 57DBC 80067DBC 00000000 */  nop
    /* 57DC0 80067DC0 21006214 */  bne        $v1, $v0, .L80067E48
    /* 57DC4 80067DC4 03000224 */   addiu     $v0, $zero, 0x3
    /* 57DC8 80067DC8 1280033C */  lui        $v1, %hi(myplr)
    /* 57DCC 80067DCC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 57DD0 80067DD0 0E80013C */  lui        $at, %hi(quests + 0x2A)
    /* 57DD4 80067DD4 6ADA22A0 */  sb         $v0, %lo(quests + 0x2A)($at)
    /* 57DD8 80067DD8 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 57DDC 80067DDC 1280013C */  lui        $at, %hi(sfxdelay)
    /* 57DE0 80067DE0 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 57DE4 80067DE4 40100300 */  sll        $v0, $v1, 1
    /* 57DE8 80067DE8 21104300 */  addu       $v0, $v0, $v1
    /* 57DEC 80067DEC 80100200 */  sll        $v0, $v0, 2
    /* 57DF0 80067DF0 21104300 */  addu       $v0, $v0, $v1
    /* 57DF4 80067DF4 00110200 */  sll        $v0, $v0, 4
    /* 57DF8 80067DF8 23104300 */  subu       $v0, $v0, $v1
    /* 57DFC 80067DFC 80100200 */  sll        $v0, $v0, 2
    /* 57E00 80067E00 21104300 */  addu       $v0, $v0, $v1
    /* 57E04 80067E04 C0100200 */  sll        $v0, $v0, 3
    /* 57E08 80067E08 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 57E0C 80067E0C 21082200 */  addu       $at, $at, $v0
    /* 57E10 80067E10 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 57E14 80067E14 00000000 */  nop
    /* 57E18 80067E18 03006014 */  bnez       $v1, .L80067E28
    /* 57E1C 80067E1C 01000224 */   addiu     $v0, $zero, 0x1
    /* 57E20 80067E20 67A00108 */  j          .L8006819C
    /* 57E24 80067E24 0E030224 */   addiu     $v0, $zero, 0x30E
  .L80067E28:
    /* 57E28 80067E28 03006214 */  bne        $v1, $v0, .L80067E38
    /* 57E2C 80067E2C 02000224 */   addiu     $v0, $zero, 0x2
    /* 57E30 80067E30 67A00108 */  j          .L8006819C
    /* 57E34 80067E34 A0020224 */   addiu     $v0, $zero, 0x2A0
  .L80067E38:
    /* 57E38 80067E38 DA006214 */  bne        $v1, $v0, .L800681A4
    /* 57E3C 80067E3C 38020224 */   addiu     $v0, $zero, 0x238
    /* 57E40 80067E40 67A00108 */  j          .L8006819C
    /* 57E44 80067E44 00000000 */   nop
  .L80067E48:
    /* 57E48 80067E48 1180023C */  lui        $v0, %hi(UniqMonst + 0x32)
    /* 57E4C 80067E4C 3AC74294 */  lhu        $v0, %lo(UniqMonst + 0x32)($v0)
    /* 57E50 80067E50 00000000 */  nop
    /* 57E54 80067E54 21006214 */  bne        $v1, $v0, .L80067EDC
    /* 57E58 80067E58 03000224 */   addiu     $v0, $zero, 0x3
    /* 57E5C 80067E5C 1280033C */  lui        $v1, %hi(myplr)
    /* 57E60 80067E60 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 57E64 80067E64 0E80013C */  lui        $at, %hi(quests + 0x3E)
    /* 57E68 80067E68 7EDA22A0 */  sb         $v0, %lo(quests + 0x3E)($at)
    /* 57E6C 80067E6C 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 57E70 80067E70 1280013C */  lui        $at, %hi(sfxdelay)
    /* 57E74 80067E74 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 57E78 80067E78 40100300 */  sll        $v0, $v1, 1
    /* 57E7C 80067E7C 21104300 */  addu       $v0, $v0, $v1
    /* 57E80 80067E80 80100200 */  sll        $v0, $v0, 2
    /* 57E84 80067E84 21104300 */  addu       $v0, $v0, $v1
    /* 57E88 80067E88 00110200 */  sll        $v0, $v0, 4
    /* 57E8C 80067E8C 23104300 */  subu       $v0, $v0, $v1
    /* 57E90 80067E90 80100200 */  sll        $v0, $v0, 2
    /* 57E94 80067E94 21104300 */  addu       $v0, $v0, $v1
    /* 57E98 80067E98 C0100200 */  sll        $v0, $v0, 3
    /* 57E9C 80067E9C 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 57EA0 80067EA0 21082200 */  addu       $at, $at, $v0
    /* 57EA4 80067EA4 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 57EA8 80067EA8 00000000 */  nop
    /* 57EAC 80067EAC 03006014 */  bnez       $v1, .L80067EBC
    /* 57EB0 80067EB0 01000224 */   addiu     $v0, $zero, 0x1
    /* 57EB4 80067EB4 67A00108 */  j          .L8006819C
    /* 57EB8 80067EB8 0F030224 */   addiu     $v0, $zero, 0x30F
  .L80067EBC:
    /* 57EBC 80067EBC 03006214 */  bne        $v1, $v0, .L80067ECC
    /* 57EC0 80067EC0 02000224 */   addiu     $v0, $zero, 0x2
    /* 57EC4 80067EC4 67A00108 */  j          .L8006819C
    /* 57EC8 80067EC8 A1020224 */   addiu     $v0, $zero, 0x2A1
  .L80067ECC:
    /* 57ECC 80067ECC B5006214 */  bne        $v1, $v0, .L800681A4
    /* 57ED0 80067ED0 39020224 */   addiu     $v0, $zero, 0x239
    /* 57ED4 80067ED4 67A00108 */  j          .L8006819C
    /* 57ED8 80067ED8 00000000 */   nop
  .L80067EDC:
    /* 57EDC 80067EDC 1180023C */  lui        $v0, %hi(UniqMonst + 0x62)
    /* 57EE0 80067EE0 6AC74294 */  lhu        $v0, %lo(UniqMonst + 0x62)($v0)
    /* 57EE4 80067EE4 00000000 */  nop
    /* 57EE8 80067EE8 89006214 */  bne        $v1, $v0, .L80068110
    /* 57EEC 80067EEC 01000224 */   addiu     $v0, $zero, 0x1
    /* 57EF0 80067EF0 1280103C */  lui        $s0, %hi(gbMaxPlayers)
    /* 57EF4 80067EF4 A2B91092 */  lbu        $s0, %lo(gbMaxPlayers)($s0)
    /* 57EF8 80067EF8 00000000 */  nop
    /* 57EFC 80067EFC 5A000212 */  beq        $s0, $v0, .L80068068
    /* 57F00 80067F00 21880000 */   addu      $s1, $zero, $zero
    /* 57F04 80067F04 72011424 */  addiu      $s4, $zero, 0x172
    /* 57F08 80067F08 03001324 */  addiu      $s3, $zero, 0x3
    /* 57F0C 80067F0C 42001224 */  addiu      $s2, $zero, 0x42
    /* 57F10 80067F10 03000224 */  addiu      $v0, $zero, 0x3
    /* 57F14 80067F14 0E80013C */  lui        $at, %hi(quests + 0x12E)
    /* 57F18 80067F18 6EDB22A0 */  sb         $v0, %lo(quests + 0x12E)($at)
    /* 57F1C 80067F1C 07000224 */  addiu      $v0, $zero, 0x7
    /* 57F20 80067F20 0E80013C */  lui        $at, %hi(quests + 0x13B)
    /* 57F24 80067F24 7BDB22A0 */  sb         $v0, %lo(quests + 0x13B)($at)
    /* 57F28 80067F28 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 57F2C 80067F2C 1280013C */  lui        $at, %hi(sfxdelay)
    /* 57F30 80067F30 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 57F34 80067F34 02000224 */  addiu      $v0, $zero, 0x2
    /* 57F38 80067F38 0E80013C */  lui        $at, %hi(quests + 0x66)
    /* 57F3C 80067F3C A6DA22A0 */  sb         $v0, %lo(quests + 0x66)($at)
  .L80067F40:
    /* 57F40 80067F40 21800000 */  addu       $s0, $zero, $zero
    /* 57F44 80067F44 21200002 */  addu       $a0, $s0, $zero
  .L80067F48:
    /* 57F48 80067F48 80D4010C */  jal        FindBlock__Fii
    /* 57F4C 80067F4C 21282002 */   addu      $a1, $s1, $zero
    /* 57F50 80067F50 16005414 */  bne        $v0, $s4, .L80067FAC
    /* 57F54 80067F54 00000000 */   nop
    /* 57F58 80067F58 0E80023C */  lui        $v0, %hi(quests + 0x12E)
    /* 57F5C 80067F5C 6EDB4290 */  lbu        $v0, %lo(quests + 0x12E)($v0)
    /* 57F60 80067F60 00000000 */  nop
    /* 57F64 80067F64 11005314 */  bne        $v0, $s3, .L80067FAC
    /* 57F68 80067F68 00000000 */   nop
    /* 57F6C 80067F6C 1280033C */  lui        $v1, %hi(numtrigs)
    /* 57F70 80067F70 78BB638C */  lw         $v1, %lo(numtrigs)($v1)
    /* 57F74 80067F74 00000000 */  nop
    /* 57F78 80067F78 00110300 */  sll        $v0, $v1, 4
    /* 57F7C 80067F7C 01006324 */  addiu      $v1, $v1, 0x1
    /* 57F80 80067F80 0E80013C */  lui        $at, %hi(trigs)
    /* 57F84 80067F84 21082200 */  addu       $at, $at, $v0
    /* 57F88 80067F88 CC3330AC */  sw         $s0, %lo(trigs)($at)
    /* 57F8C 80067F8C 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 57F90 80067F90 21082200 */  addu       $at, $at, $v0
    /* 57F94 80067F94 D03331AC */  sw         $s1, %lo(trigs + 0x4)($at)
    /* 57F98 80067F98 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 57F9C 80067F9C 21082200 */  addu       $at, $at, $v0
    /* 57FA0 80067FA0 D43332AC */  sw         $s2, %lo(trigs + 0x8)($at)
    /* 57FA4 80067FA4 1280013C */  lui        $at, %hi(numtrigs)
    /* 57FA8 80067FA8 78BB23AC */  sw         $v1, %lo(numtrigs)($at)
  .L80067FAC:
    /* 57FAC 80067FAC 01001026 */  addiu      $s0, $s0, 0x1
    /* 57FB0 80067FB0 6000022A */  slti       $v0, $s0, 0x60
    /* 57FB4 80067FB4 E4FF4014 */  bnez       $v0, .L80067F48
    /* 57FB8 80067FB8 21200002 */   addu      $a0, $s0, $zero
    /* 57FBC 80067FBC 01003126 */  addiu      $s1, $s1, 0x1
    /* 57FC0 80067FC0 6000222A */  slti       $v0, $s1, 0x60
    /* 57FC4 80067FC4 DEFF4014 */  bnez       $v0, .L80067F40
    /* 57FC8 80067FC8 00000000 */   nop
    /* 57FCC 80067FCC 1280033C */  lui        $v1, %hi(myplr)
    /* 57FD0 80067FD0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 57FD4 80067FD4 00000000 */  nop
    /* 57FD8 80067FD8 40100300 */  sll        $v0, $v1, 1
    /* 57FDC 80067FDC 21104300 */  addu       $v0, $v0, $v1
    /* 57FE0 80067FE0 80100200 */  sll        $v0, $v0, 2
    /* 57FE4 80067FE4 21104300 */  addu       $v0, $v0, $v1
    /* 57FE8 80067FE8 00110200 */  sll        $v0, $v0, 4
    /* 57FEC 80067FEC 23104300 */  subu       $v0, $v0, $v1
    /* 57FF0 80067FF0 80100200 */  sll        $v0, $v0, 2
    /* 57FF4 80067FF4 21104300 */  addu       $v0, $v0, $v1
    /* 57FF8 80067FF8 C0100200 */  sll        $v0, $v0, 3
    /* 57FFC 80067FFC 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 58000 80068000 21082200 */  addu       $at, $at, $v0
    /* 58004 80068004 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 58008 80068008 00000000 */  nop
    /* 5800C 8006800C 03006014 */  bnez       $v1, .L8006801C
    /* 58010 80068010 01000224 */   addiu     $v0, $zero, 0x1
    /* 58014 80068014 0EA00108 */  j          .L80068038
    /* 58018 80068018 25030224 */   addiu     $v0, $zero, 0x325
  .L8006801C:
    /* 5801C 8006801C 03006214 */  bne        $v1, $v0, .L8006802C
    /* 58020 80068020 02000224 */   addiu     $v0, $zero, 0x2
    /* 58024 80068024 0EA00108 */  j          .L80068038
    /* 58028 80068028 B7020224 */   addiu     $v0, $zero, 0x2B7
  .L8006802C:
    /* 5802C 8006802C 05006214 */  bne        $v1, $v0, .L80068044
    /* 58030 80068030 FF00A232 */   andi      $v0, $s5, 0xFF
    /* 58034 80068034 4F020224 */  addiu      $v0, $zero, 0x24F
  .L80068038:
    /* 58038 80068038 1280013C */  lui        $at, %hi(sfxdnum)
    /* 5803C 8006803C 54B822AC */  sw         $v0, %lo(sfxdnum)($at)
    /* 58040 80068040 FF00A232 */  andi       $v0, $s5, 0xFF
  .L80068044:
    /* 58044 80068044 57004010 */  beqz       $v0, .L800681A4
    /* 58048 80068048 01000424 */   addiu     $a0, $zero, 0x1
    /* 5804C 8006804C 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 58050 80068050 0F000524 */   addiu     $a1, $zero, 0xF
    /* 58054 80068054 01000424 */  addiu      $a0, $zero, 0x1
    /* 58058 80068058 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 5805C 8006805C 05000524 */   addiu     $a1, $zero, 0x5
    /* 58060 80068060 69A00108 */  j          .L800681A4
    /* 58064 80068064 00000000 */   nop
  .L80068068:
    /* 58068 80068068 03000224 */  addiu      $v0, $zero, 0x3
    /* 5806C 8006806C 0E80013C */  lui        $at, %hi(quests + 0x12E)
    /* 58070 80068070 6EDB22A0 */  sb         $v0, %lo(quests + 0x12E)($at)
    /* 58074 80068074 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 58078 80068078 1280013C */  lui        $at, %hi(sfxdelay)
    /* 5807C 8006807C 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 58080 80068080 06D4010C */  jal        InitVPTriggers__Fv
    /* 58084 80068084 00000000 */   nop
    /* 58088 80068088 1280033C */  lui        $v1, %hi(myplr)
    /* 5808C 8006808C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 58090 80068090 07000224 */  addiu      $v0, $zero, 0x7
    /* 58094 80068094 0E80013C */  lui        $at, %hi(quests + 0x13B)
    /* 58098 80068098 7BDB22A0 */  sb         $v0, %lo(quests + 0x13B)($at)
    /* 5809C 8006809C 04000224 */  addiu      $v0, $zero, 0x4
    /* 580A0 800680A0 0E80013C */  lui        $at, %hi(quests + 0x13C)
    /* 580A4 800680A4 7CDB22A0 */  sb         $v0, %lo(quests + 0x13C)($at)
    /* 580A8 800680A8 02000224 */  addiu      $v0, $zero, 0x2
    /* 580AC 800680AC 0E80013C */  lui        $at, %hi(quests + 0x66)
    /* 580B0 800680B0 A6DA22A0 */  sb         $v0, %lo(quests + 0x66)($at)
    /* 580B4 800680B4 40100300 */  sll        $v0, $v1, 1
    /* 580B8 800680B8 21104300 */  addu       $v0, $v0, $v1
    /* 580BC 800680BC 80100200 */  sll        $v0, $v0, 2
    /* 580C0 800680C0 21104300 */  addu       $v0, $v0, $v1
    /* 580C4 800680C4 00110200 */  sll        $v0, $v0, 4
    /* 580C8 800680C8 23104300 */  subu       $v0, $v0, $v1
    /* 580CC 800680CC 80100200 */  sll        $v0, $v0, 2
    /* 580D0 800680D0 21104300 */  addu       $v0, $v0, $v1
    /* 580D4 800680D4 C0100200 */  sll        $v0, $v0, 3
    /* 580D8 800680D8 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 580DC 800680DC 21082200 */  addu       $at, $at, $v0
    /* 580E0 800680E0 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 580E4 800680E4 00000000 */  nop
    /* 580E8 800680E8 2C006010 */  beqz       $v1, .L8006819C
    /* 580EC 800680EC 25030224 */   addiu     $v0, $zero, 0x325
    /* 580F0 800680F0 03007014 */  bne        $v1, $s0, .L80068100
    /* 580F4 800680F4 02000224 */   addiu     $v0, $zero, 0x2
    /* 580F8 800680F8 67A00108 */  j          .L8006819C
    /* 580FC 800680FC B7020224 */   addiu     $v0, $zero, 0x2B7
  .L80068100:
    /* 58100 80068100 28006214 */  bne        $v1, $v0, .L800681A4
    /* 58104 80068104 4F020224 */   addiu     $v0, $zero, 0x24F
    /* 58108 80068108 67A00108 */  j          .L8006819C
    /* 5810C 8006810C 00000000 */   nop
  .L80068110:
    /* 58110 80068110 1180023C */  lui        $v0, %hi(UniqMonst + 0xC2)
    /* 58114 80068114 CAC74294 */  lhu        $v0, %lo(UniqMonst + 0xC2)($v0)
    /* 58118 80068118 00000000 */  nop
    /* 5811C 8006811C 21006214 */  bne        $v1, $v0, .L800681A4
    /* 58120 80068120 03000224 */   addiu     $v0, $zero, 0x3
    /* 58124 80068124 1280033C */  lui        $v1, %hi(myplr)
    /* 58128 80068128 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5812C 8006812C 0E80013C */  lui        $at, %hi(quests + 0xDE)
    /* 58130 80068130 1EDB22A0 */  sb         $v0, %lo(quests + 0xDE)($at)
    /* 58134 80068134 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 58138 80068138 1280013C */  lui        $at, %hi(sfxdelay)
    /* 5813C 8006813C 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 58140 80068140 40100300 */  sll        $v0, $v1, 1
    /* 58144 80068144 21104300 */  addu       $v0, $v0, $v1
    /* 58148 80068148 80100200 */  sll        $v0, $v0, 2
    /* 5814C 8006814C 21104300 */  addu       $v0, $v0, $v1
    /* 58150 80068150 00110200 */  sll        $v0, $v0, 4
    /* 58154 80068154 23104300 */  subu       $v0, $v0, $v1
    /* 58158 80068158 80100200 */  sll        $v0, $v0, 2
    /* 5815C 8006815C 21104300 */  addu       $v0, $v0, $v1
    /* 58160 80068160 C0100200 */  sll        $v0, $v0, 3
    /* 58164 80068164 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 58168 80068168 21082200 */  addu       $at, $at, $v0
    /* 5816C 8006816C 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 58170 80068170 00000000 */  nop
    /* 58174 80068174 03006014 */  bnez       $v1, .L80068184
    /* 58178 80068178 01000224 */   addiu     $v0, $zero, 0x1
    /* 5817C 8006817C 67A00108 */  j          .L8006819C
    /* 58180 80068180 30030224 */   addiu     $v0, $zero, 0x330
  .L80068184:
    /* 58184 80068184 03006214 */  bne        $v1, $v0, .L80068194
    /* 58188 80068188 02000224 */   addiu     $v0, $zero, 0x2
    /* 5818C 8006818C 67A00108 */  j          .L8006819C
    /* 58190 80068190 C2020224 */   addiu     $v0, $zero, 0x2C2
  .L80068194:
    /* 58194 80068194 03006214 */  bne        $v1, $v0, .L800681A4
    /* 58198 80068198 5A020224 */   addiu     $v0, $zero, 0x25A
  .L8006819C:
    /* 5819C 8006819C 1280013C */  lui        $at, %hi(sfxdnum)
    /* 581A0 800681A0 54B822AC */  sw         $v0, %lo(sfxdnum)($at)
  .L800681A4:
    /* 581A4 800681A4 2800BF8F */  lw         $ra, 0x28($sp)
    /* 581A8 800681A8 2400B58F */  lw         $s5, 0x24($sp)
    /* 581AC 800681AC 2000B48F */  lw         $s4, 0x20($sp)
    /* 581B0 800681B0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 581B4 800681B4 1800B28F */  lw         $s2, 0x18($sp)
    /* 581B8 800681B8 1400B18F */  lw         $s1, 0x14($sp)
    /* 581BC 800681BC 1000B08F */  lw         $s0, 0x10($sp)
    /* 581C0 800681C0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 581C4 800681C4 0800E003 */  jr         $ra
    /* 581C8 800681C8 00000000 */   nop
endlabel CheckQuestKill__FiUc
