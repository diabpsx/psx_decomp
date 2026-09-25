.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PSX_WndProc__FUilUl, 0x384

glabel PSX_WndProc__FUilUl
    /* 86B5C 80096B5C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 86B60 80096B60 BEFF8324 */  addiu      $v1, $a0, -0x42
    /* 86B64 80096B64 0A00622C */  sltiu      $v0, $v1, 0xA
    /* 86B68 80096B68 A9004010 */  beqz       $v0, .L80096E10
    /* 86B6C 80096B6C 1800BFAF */   sw        $ra, 0x18($sp)
    /* 86B70 80096B70 80100300 */  sll        $v0, $v1, 2
    /* 86B74 80096B74 1180013C */  lui        $at, %hi(jtbl_80110774)
    /* 86B78 80096B78 21082200 */  addu       $at, $at, $v0
    /* 86B7C 80096B7C 7407228C */  lw         $v0, %lo(jtbl_80110774)($at)
    /* 86B80 80096B80 00000000 */  nop
    /* 86B84 80096B84 08004000 */  jr         $v0
    /* 86B88 80096B88 00000000 */   nop
  jlabel .L80096B8C
    /* 86B8C 80096B8C 1280023C */  lui        $v0, %hi(currlevel)
    /* 86B90 80096B90 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 86B94 80096B94 00000000 */  nop
    /* 86B98 80096B98 80100200 */  sll        $v0, $v0, 2
    /* 86B9C 80096B9C 0D80013C */  lui        $at, %hi(gnLevelTypeTbl)
    /* 86BA0 80096BA0 21082200 */  addu       $at, $at, $v0
    /* 86BA4 80096BA4 A0F7238C */  lw         $v1, %lo(gnLevelTypeTbl)($at)
    /* 86BA8 80096BA8 00000000 */  nop
    /* 86BAC 80096BAC 0500622C */  sltiu      $v0, $v1, 0x5
    /* 86BB0 80096BB0 15004010 */  beqz       $v0, .L80096C08
    /* 86BB4 80096BB4 80100300 */   sll       $v0, $v1, 2
    /* 86BB8 80096BB8 1180013C */  lui        $at, %hi(jtbl_8011079C)
    /* 86BBC 80096BBC 21082200 */  addu       $at, $at, $v0
    /* 86BC0 80096BC0 9C07228C */  lw         $v0, %lo(jtbl_8011079C)($at)
    /* 86BC4 80096BC4 00000000 */  nop
    /* 86BC8 80096BC8 08004000 */  jr         $v0
    /* 86BCC 80096BCC 00000000 */   nop
  jlabel .L80096BD0
    /* 86BD0 80096BD0 855B0208 */  j          .L80096E14
    /* 86BD4 80096BD4 01000224 */   addiu     $v0, $zero, 0x1
  jlabel .L80096BD8
    /* 86BD8 80096BD8 855B0208 */  j          .L80096E14
    /* 86BDC 80096BDC 02000224 */   addiu     $v0, $zero, 0x2
  jlabel .L80096BE0
    /* 86BE0 80096BE0 855B0208 */  j          .L80096E14
    /* 86BE4 80096BE4 03000224 */   addiu     $v0, $zero, 0x3
  jlabel .L80096BE8
    /* 86BE8 80096BE8 1280023C */  lui        $v0, %hi(currlevel)
    /* 86BEC 80096BEC 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 86BF0 80096BF0 00000000 */  nop
    /* 86BF4 80096BF4 0F00422C */  sltiu      $v0, $v0, 0xF
    /* 86BF8 80096BF8 86004014 */  bnez       $v0, .L80096E14
    /* 86BFC 80096BFC 04000224 */   addiu     $v0, $zero, 0x4
    /* 86C00 80096C00 855B0208 */  j          .L80096E14
    /* 86C04 80096C04 08000224 */   addiu     $v0, $zero, 0x8
  .L80096C08:
    /* 86C08 80096C08 855B0208 */  j          .L80096E14
    /* 86C0C 80096C0C 01000224 */   addiu     $v0, $zero, 0x1
  jlabel .L80096C10
    /* 86C10 80096C10 1280023C */  lui        $v0, %hi(currlevel)
    /* 86C14 80096C14 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 86C18 80096C18 00000000 */  nop
    /* 86C1C 80096C1C 80280200 */  sll        $a1, $v0, 2
    /* 86C20 80096C20 0D80013C */  lui        $at, %hi(glSeedTbl + 0x40)
    /* 86C24 80096C24 21082500 */  addu       $at, $at, $a1
    /* 86C28 80096C28 9CF7228C */  lw         $v0, %lo(glSeedTbl + 0x40)($at)
    /* 86C2C 80096C2C 0D80033C */  lui        $v1, %hi(glSeedTbl + 0x40)
    /* 86C30 80096C30 9CF76324 */  addiu      $v1, $v1, %lo(glSeedTbl + 0x40)
    /* 86C34 80096C34 04004014 */  bnez       $v0, .L80096C48
    /* 86C38 80096C38 21106500 */   addu      $v0, $v1, $a1
  jlabel .L80096C3C
    /* 86C3C 80096C3C FC0580AF */  sw         $zero, %gp_rel(D_8011AD7C)($gp)
    /* 86C40 80096C40 875B0208 */  j          .L80096E1C
    /* 86C44 80096C44 BEFF8424 */   addiu     $a0, $a0, -0x42
  .L80096C48:
    /* 86C48 80096C48 0400438C */  lw         $v1, 0x4($v0)
    /* 86C4C 80096C4C 00000000 */  nop
    /* 86C50 80096C50 0500622C */  sltiu      $v0, $v1, 0x5
    /* 86C54 80096C54 0F004010 */  beqz       $v0, .L80096C94
    /* 86C58 80096C58 80100300 */   sll       $v0, $v1, 2
    /* 86C5C 80096C5C 1180013C */  lui        $at, %hi(jtbl_801107B4)
    /* 86C60 80096C60 21082200 */  addu       $at, $at, $v0
    /* 86C64 80096C64 B407228C */  lw         $v0, %lo(jtbl_801107B4)($at)
    /* 86C68 80096C68 00000000 */  nop
    /* 86C6C 80096C6C 08004000 */  jr         $v0
    /* 86C70 80096C70 00000000 */   nop
  jlabel .L80096C74
    /* 86C74 80096C74 855B0208 */  j          .L80096E14
    /* 86C78 80096C78 01000224 */   addiu     $v0, $zero, 0x1
  jlabel .L80096C7C
    /* 86C7C 80096C7C 855B0208 */  j          .L80096E14
    /* 86C80 80096C80 02000224 */   addiu     $v0, $zero, 0x2
  jlabel .L80096C84
    /* 86C84 80096C84 855B0208 */  j          .L80096E14
    /* 86C88 80096C88 03000224 */   addiu     $v0, $zero, 0x3
  jlabel .L80096C8C
    /* 86C8C 80096C8C 855B0208 */  j          .L80096E14
    /* 86C90 80096C90 04000224 */   addiu     $v0, $zero, 0x4
  .L80096C94:
    /* 86C94 80096C94 855B0208 */  j          .L80096E14
    /* 86C98 80096C98 01000224 */   addiu     $v0, $zero, 0x1
  jlabel .L80096C9C
    /* 86C9C 80096C9C 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 86CA0 80096CA0 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 86CA4 80096CA4 02000224 */  addiu      $v0, $zero, 0x2
    /* 86CA8 80096CA8 56006210 */  beq        $v1, $v0, .L80096E04
    /* 86CAC 80096CAC 05000224 */   addiu     $v0, $zero, 0x5
    /* 86CB0 80096CB0 58006214 */  bne        $v1, $v0, .L80096E14
    /* 86CB4 80096CB4 01000224 */   addiu     $v0, $zero, 0x1
    /* 86CB8 80096CB8 855B0208 */  j          .L80096E14
    /* 86CBC 80096CBC 06000224 */   addiu     $v0, $zero, 0x6
  jlabel .L80096CC0
    /* 86CC0 80096CC0 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 86CC4 80096CC4 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 86CC8 80096CC8 02000224 */  addiu      $v0, $zero, 0x2
    /* 86CCC 80096CCC 4D006210 */  beq        $v1, $v0, .L80096E04
    /* 86CD0 80096CD0 05000224 */   addiu     $v0, $zero, 0x5
    /* 86CD4 80096CD4 4F006214 */  bne        $v1, $v0, .L80096E14
    /* 86CD8 80096CD8 01000224 */   addiu     $v0, $zero, 0x1
    /* 86CDC 80096CDC 855B0208 */  j          .L80096E14
    /* 86CE0 80096CE0 06000224 */   addiu     $v0, $zero, 0x6
  jlabel .L80096CE4
    /* 86CE4 80096CE4 855B0208 */  j          .L80096E14
    /* 86CE8 80096CE8 05000224 */   addiu     $v0, $zero, 0x5
  jlabel .L80096CEC
    /* 86CEC 80096CEC 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 86CF0 80096CF0 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 86CF4 80096CF4 02000224 */  addiu      $v0, $zero, 0x2
    /* 86CF8 80096CF8 42006210 */  beq        $v1, $v0, .L80096E04
    /* 86CFC 80096CFC 05000224 */   addiu     $v0, $zero, 0x5
    /* 86D00 80096D00 44006210 */  beq        $v1, $v0, .L80096E14
    /* 86D04 80096D04 06000224 */   addiu     $v0, $zero, 0x6
    /* 86D08 80096D08 1280023C */  lui        $v0, %hi(currlevel)
    /* 86D0C 80096D0C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 86D10 80096D10 00000000 */  nop
    /* 86D14 80096D14 80100200 */  sll        $v0, $v0, 2
    /* 86D18 80096D18 0D80013C */  lui        $at, %hi(gnLevelTypeTbl)
    /* 86D1C 80096D1C 21082200 */  addu       $at, $at, $v0
    /* 86D20 80096D20 A0F7238C */  lw         $v1, %lo(gnLevelTypeTbl)($at)
    /* 86D24 80096D24 00000000 */  nop
    /* 86D28 80096D28 0500622C */  sltiu      $v0, $v1, 0x5
    /* 86D2C 80096D2C 0F004010 */  beqz       $v0, .L80096D6C
    /* 86D30 80096D30 80100300 */   sll       $v0, $v1, 2
    /* 86D34 80096D34 1180013C */  lui        $at, %hi(jtbl_801107CC)
    /* 86D38 80096D38 21082200 */  addu       $at, $at, $v0
    /* 86D3C 80096D3C CC07228C */  lw         $v0, %lo(jtbl_801107CC)($at)
    /* 86D40 80096D40 00000000 */  nop
    /* 86D44 80096D44 08004000 */  jr         $v0
    /* 86D48 80096D48 00000000 */   nop
  jlabel .L80096D4C
    /* 86D4C 80096D4C 855B0208 */  j          .L80096E14
    /* 86D50 80096D50 01000224 */   addiu     $v0, $zero, 0x1
  jlabel .L80096D54
    /* 86D54 80096D54 855B0208 */  j          .L80096E14
    /* 86D58 80096D58 02000224 */   addiu     $v0, $zero, 0x2
  jlabel .L80096D5C
    /* 86D5C 80096D5C 855B0208 */  j          .L80096E14
    /* 86D60 80096D60 03000224 */   addiu     $v0, $zero, 0x3
  jlabel .L80096D64
    /* 86D64 80096D64 855B0208 */  j          .L80096E14
    /* 86D68 80096D68 04000224 */   addiu     $v0, $zero, 0x4
  .L80096D6C:
    /* 86D6C 80096D6C 855B0208 */  j          .L80096E14
    /* 86D70 80096D70 01000224 */   addiu     $v0, $zero, 0x1
  jlabel .L80096D74
    /* 86D74 80096D74 855B0208 */  j          .L80096E14
    /* 86D78 80096D78 07000224 */   addiu     $v0, $zero, 0x7
  jlabel .L80096D7C
    /* 86D7C 80096D7C 1280033C */  lui        $v1, %hi(myplr)
    /* 86D80 80096D80 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 86D84 80096D84 00000000 */  nop
    /* 86D88 80096D88 40100300 */  sll        $v0, $v1, 1
    /* 86D8C 80096D8C 21104300 */  addu       $v0, $v0, $v1
    /* 86D90 80096D90 80100200 */  sll        $v0, $v0, 2
    /* 86D94 80096D94 21104300 */  addu       $v0, $v0, $v1
    /* 86D98 80096D98 00110200 */  sll        $v0, $v0, 4
    /* 86D9C 80096D9C 23104300 */  subu       $v0, $v0, $v1
    /* 86DA0 80096DA0 80100200 */  sll        $v0, $v0, 2
    /* 86DA4 80096DA4 21104300 */  addu       $v0, $v0, $v1
    /* 86DA8 80096DA8 C0100200 */  sll        $v0, $v0, 3
    /* 86DAC 80096DAC 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 86DB0 80096DB0 21082200 */  addu       $at, $at, $v0
    /* 86DB4 80096DB4 5CA5228C */  lw         $v0, %lo(plr + 0x24)($at)
    /* 86DB8 80096DB8 00000000 */  nop
    /* 86DBC 80096DBC 80100200 */  sll        $v0, $v0, 2
    /* 86DC0 80096DC0 0D80013C */  lui        $at, %hi(gnLevelTypeTbl)
    /* 86DC4 80096DC4 21082200 */  addu       $at, $at, $v0
    /* 86DC8 80096DC8 A0F7238C */  lw         $v1, %lo(gnLevelTypeTbl)($at)
    /* 86DCC 80096DCC 02000224 */  addiu      $v0, $zero, 0x2
    /* 86DD0 80096DD0 0C006210 */  beq        $v1, $v0, .L80096E04
    /* 86DD4 80096DD4 03006228 */   slti      $v0, $v1, 0x3
    /* 86DD8 80096DD8 05004010 */  beqz       $v0, .L80096DF0
    /* 86DDC 80096DDC 00000000 */   nop
    /* 86DE0 80096DE0 96FF6010 */  beqz       $v1, .L80096C3C
    /* 86DE4 80096DE4 00000000 */   nop
    /* 86DE8 80096DE8 875B0208 */  j          .L80096E1C
    /* 86DEC 80096DEC BEFF8424 */   addiu     $a0, $a0, -0x42
  .L80096DF0:
    /* 86DF0 80096DF0 03000224 */  addiu      $v0, $zero, 0x3
    /* 86DF4 80096DF4 03006210 */  beq        $v1, $v0, .L80096E04
    /* 86DF8 80096DF8 04000224 */   addiu     $v0, $zero, 0x4
    /* 86DFC 80096DFC 06006214 */  bne        $v1, $v0, .L80096E18
    /* 86E00 80096E00 00000000 */   nop
  .L80096E04:
    /* 86E04 80096E04 FC0583AF */  sw         $v1, %gp_rel(D_8011AD7C)($gp)
    /* 86E08 80096E08 875B0208 */  j          .L80096E1C
    /* 86E0C 80096E0C BEFF8424 */   addiu     $a0, $a0, -0x42
  .L80096E10:
    /* 86E10 80096E10 09000224 */  addiu      $v0, $zero, 0x9
  .L80096E14:
    /* 86E14 80096E14 FC0582AF */  sw         $v0, %gp_rel(D_8011AD7C)($gp)
  .L80096E18:
    /* 86E18 80096E18 BEFF8424 */  addiu      $a0, $a0, -0x42
  .L80096E1C:
    /* 86E1C 80096E1C 0C00822C */  sltiu      $v0, $a0, 0xC
    /* 86E20 80096E20 23004010 */  beqz       $v0, .L80096EB0
    /* 86E24 80096E24 80100400 */   sll       $v0, $a0, 2
    /* 86E28 80096E28 1180013C */  lui        $at, %hi(jtbl_801107E4)
    /* 86E2C 80096E2C 21082200 */  addu       $at, $at, $v0
    /* 86E30 80096E30 E407228C */  lw         $v0, %lo(jtbl_801107E4)($at)
    /* 86E34 80096E34 00000000 */  nop
    /* 86E38 80096E38 08004000 */  jr         $v0
    /* 86E3C 80096E3C 00000000 */   nop
  jlabel .L80096E40
    /* 86E40 80096E40 0C5D020C */  jal        GoForwardLevel__Fv
    /* 86E44 80096E44 00000000 */   nop
    /* 86E48 80096E48 B45B0208 */  j          .L80096ED0
    /* 86E4C 80096E4C 00000000 */   nop
  jlabel .L80096E50
    /* 86E50 80096E50 E65B020C */  jal        GoSetLevel__Fv
    /* 86E54 80096E54 00000000 */   nop
    /* 86E58 80096E58 B45B0208 */  j          .L80096ED0
    /* 86E5C 80096E5C 00000000 */   nop
  jlabel .L80096E60
    /* 86E60 80096E60 0C5C020C */  jal        GoBackLevel__Fv
    /* 86E64 80096E64 00000000 */   nop
    /* 86E68 80096E68 B45B0208 */  j          .L80096ED0
    /* 86E6C 80096E6C 00000000 */   nop
  jlabel .L80096E70
    /* 86E70 80096E70 235C020C */  jal        GoWarpLevel__Fv
    /* 86E74 80096E74 00000000 */   nop
    /* 86E78 80096E78 B45B0208 */  j          .L80096ED0
    /* 86E7C 80096E7C 00000000 */   nop
  jlabel .L80096E80
    /* 86E80 80096E80 4C5D020C */  jal        GoNewGame__Fv
    /* 86E84 80096E84 00000000 */   nop
    /* 86E88 80096E88 B45B0208 */  j          .L80096ED0
    /* 86E8C 80096E8C 00000000 */   nop
  jlabel .L80096E90
    /* 86E90 80096E90 4C5C020C */  jal        GoLoadGame__Fv
    /* 86E94 80096E94 00000000 */   nop
    /* 86E98 80096E98 B45B0208 */  j          .L80096ED0
    /* 86E9C 80096E9C 00000000 */   nop
  jlabel .L80096EA0
    /* 86EA0 80096EA0 CF5C020C */  jal        GoNewLevel__Fv
    /* 86EA4 80096EA4 00000000 */   nop
    /* 86EA8 80096EA8 B45B0208 */  j          .L80096ED0
    /* 86EAC 80096EAC 00000000 */   nop
  jlabel .L80096EB0
    /* 86EB0 80096EB0 1180023C */  lui        $v0, %hi(D_80110708)
    /* 86EB4 80096EB4 08074224 */  addiu      $v0, $v0, %lo(D_80110708)
    /* 86EB8 80096EB8 05004010 */  beqz       $v0, .L80096ED0
    /* 86EBC 80096EBC 21200000 */   addu      $a0, $zero, $zero
    /* 86EC0 80096EC0 1180053C */  lui        $a1, %hi(D_8011071C)
    /* 86EC4 80096EC4 1C07A524 */  addiu      $a1, $a1, %lo(D_8011071C)
    /* 86EC8 80096EC8 A583000C */  jal        DBG_Error
    /* 86ECC 80096ECC 7F010624 */   addiu     $a2, $zero, 0x17F
  .L80096ED0:
    /* 86ED0 80096ED0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 86ED4 80096ED4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 86ED8 80096ED8 0800E003 */  jr         $ra
    /* 86EDC 80096EDC 00000000 */   nop
endlabel PSX_WndProc__FUilUl
