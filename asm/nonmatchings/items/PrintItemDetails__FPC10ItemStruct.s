.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintItemDetails__FPC10ItemStruct, 0x47C

glabel PrintItemDetails__FPC10ItemStruct
    /* 36C7C 80046C7C A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 36C80 80046C80 4400B1AF */  sw         $s1, 0x44($sp)
    /* 36C84 80046C84 21888000 */  addu       $s1, $a0, $zero
    /* 36C88 80046C88 55002382 */  lb         $v1, 0x55($s1)
    /* 36C8C 80046C8C 01000224 */  addiu      $v0, $zero, 0x1
    /* 36C90 80046C90 5000BFAF */  sw         $ra, 0x50($sp)
    /* 36C94 80046C94 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 36C98 80046C98 4800B2AF */  sw         $s2, 0x48($sp)
    /* 36C9C 80046C9C 36006214 */  bne        $v1, $v0, .L80046D78
    /* 36CA0 80046CA0 4000B0AF */   sw        $s0, 0x40($sp)
    /* 36CA4 80046CA4 40003286 */  lh         $s2, 0x40($s1)
    /* 36CA8 80046CA8 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 36CAC 80046CAC 12004216 */  bne        $s2, $v0, .L80046CF8
    /* 36CB0 80046CB0 00000000 */   nop
    /* 36CB4 80046CB4 4AED010C */  jal        GetStr__Fi
    /* 36CB8 80046CB8 E1000424 */   addiu     $a0, $zero, 0xE1
    /* 36CBC 80046CBC 17020424 */  addiu      $a0, $zero, 0x217
    /* 36CC0 80046CC0 4AED010C */  jal        GetStr__Fi
    /* 36CC4 80046CC4 21804000 */   addu      $s0, $v0, $zero
    /* 36CC8 80046CC8 0D80043C */  lui        $a0, %hi(tempstr)
    /* 36CCC 80046CCC 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 36CD0 80046CD0 3B002782 */  lb         $a3, 0x3B($s1)
    /* 36CD4 80046CD4 1180053C */  lui        $a1, %hi(D_801161CC)
    /* 36CD8 80046CD8 CC61A524 */  addiu      $a1, $a1, %lo(D_801161CC)
    /* 36CDC 80046CDC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 36CE0 80046CE0 3C002282 */  lb         $v0, 0x3C($s1)
    /* 36CE4 80046CE4 21300002 */  addu       $a2, $s0, $zero
    /* 36CE8 80046CE8 9767000C */  jal        sprintf
    /* 36CEC 80046CEC 1000A2AF */   sw        $v0, 0x10($sp)
    /* 36CF0 80046CF0 591B0108 */  j          .L80046D64
    /* 36CF4 80046CF4 00000000 */   nop
  .L80046CF8:
    /* 36CF8 80046CF8 4AED010C */  jal        GetStr__Fi
    /* 36CFC 80046CFC E1000424 */   addiu     $a0, $zero, 0xE1
    /* 36D00 80046D00 0D80103C */  lui        $s0, %hi(tempstr)
    /* 36D04 80046D04 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 36D08 80046D08 21200002 */  addu       $a0, $s0, $zero
    /* 36D0C 80046D0C 21304000 */  addu       $a2, $v0, $zero
    /* 36D10 80046D10 3B002782 */  lb         $a3, 0x3B($s1)
    /* 36D14 80046D14 3C002282 */  lb         $v0, 0x3C($s1)
    /* 36D18 80046D18 1180053C */  lui        $a1, %hi(D_801161DC)
    /* 36D1C 80046D1C DC61A524 */  addiu      $a1, $a1, %lo(D_801161DC)
    /* 36D20 80046D20 9767000C */  jal        sprintf
    /* 36D24 80046D24 1000A2AF */   sw        $v0, 0x10($sp)
    /* 36D28 80046D28 4AED010C */  jal        GetStr__Fi
    /* 36D2C 80046D2C 1F010424 */   addiu     $a0, $zero, 0x11F
    /* 36D30 80046D30 1800A427 */  addiu      $a0, $sp, 0x18
    /* 36D34 80046D34 21284000 */  addu       $a1, $v0, $zero
    /* 36D38 80046D38 3E002686 */  lh         $a2, 0x3E($s1)
    /* 36D3C 80046D3C 9767000C */  jal        sprintf
    /* 36D40 80046D40 21384002 */   addu      $a3, $s2, $zero
    /* 36D44 80046D44 8767000C */  jal        strlen
    /* 36D48 80046D48 1800A427 */   addiu     $a0, $sp, 0x18
    /* 36D4C 80046D4C 21200002 */  addu       $a0, $s0, $zero
    /* 36D50 80046D50 1800A527 */  addiu      $a1, $sp, 0x18
    /* 36D54 80046D54 1700A327 */  addiu      $v1, $sp, 0x17
    /* 36D58 80046D58 21186200 */  addu       $v1, $v1, $v0
    /* 36D5C 80046D5C FC40000C */  jal        strcat
    /* 36D60 80046D60 000060A0 */   sb        $zero, 0x0($v1)
  .L80046D64:
    /* 36D64 80046D64 0D80043C */  lui        $a0, %hi(tempstr)
    /* 36D68 80046D68 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 36D6C 80046D6C 98C7000C */  jal        AddPanelString__FPCci
    /* 36D70 80046D70 01000524 */   addiu     $a1, $zero, 0x1
    /* 36D74 80046D74 55002382 */  lb         $v1, 0x55($s1)
  .L80046D78:
    /* 36D78 80046D78 02000224 */  addiu      $v0, $zero, 0x2
    /* 36D7C 80046D7C 45006214 */  bne        $v1, $v0, .L80046E94
    /* 36D80 80046D80 00000000 */   nop
    /* 36D84 80046D84 51002282 */  lb         $v0, 0x51($s1)
    /* 36D88 80046D88 00000000 */  nop
    /* 36D8C 80046D8C 27004314 */  bne        $v0, $v1, .L80046E2C
    /* 36D90 80046D90 00000000 */   nop
    /* 36D94 80046D94 69002282 */  lb         $v0, 0x69($s1)
    /* 36D98 80046D98 00000000 */  nop
    /* 36D9C 80046D9C 23004010 */  beqz       $v0, .L80046E2C
    /* 36DA0 80046DA0 AF020224 */   addiu     $v0, $zero, 0x2AF
    /* 36DA4 80046DA4 28002396 */  lhu        $v1, 0x28($s1)
    /* 36DA8 80046DA8 00000000 */  nop
    /* 36DAC 80046DAC 1F006210 */  beq        $v1, $v0, .L80046E2C
    /* 36DB0 80046DB0 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 36DB4 80046DB4 40003286 */  lh         $s2, 0x40($s1)
    /* 36DB8 80046DB8 00000000 */  nop
    /* 36DBC 80046DBC 09004216 */  bne        $s2, $v0, .L80046DE4
    /* 36DC0 80046DC0 00000000 */   nop
    /* 36DC4 80046DC4 4AED010C */  jal        GetStr__Fi
    /* 36DC8 80046DC8 17020424 */   addiu     $a0, $zero, 0x217
    /* 36DCC 80046DCC 0D80043C */  lui        $a0, %hi(tempstr)
    /* 36DD0 80046DD0 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 36DD4 80046DD4 F240000C */  jal        strcpy
    /* 36DD8 80046DD8 21284000 */   addu      $a1, $v0, $zero
    /* 36DDC 80046DDC A11B0108 */  j          .L80046E84
    /* 36DE0 80046DE0 00000000 */   nop
  .L80046DE4:
    /* 36DE4 80046DE4 4AED010C */  jal        GetStr__Fi
    /* 36DE8 80046DE8 1F010424 */   addiu     $a0, $zero, 0x11F
    /* 36DEC 80046DEC 0D80103C */  lui        $s0, %hi(tempstr)
    /* 36DF0 80046DF0 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 36DF4 80046DF4 21200002 */  addu       $a0, $s0, $zero
    /* 36DF8 80046DF8 F240000C */  jal        strcpy
    /* 36DFC 80046DFC 21284000 */   addu      $a1, $v0, $zero
    /* 36E00 80046E00 8767000C */  jal        strlen
    /* 36E04 80046E04 21200002 */   addu      $a0, $s0, $zero
    /* 36E08 80046E08 21105000 */  addu       $v0, $v0, $s0
    /* 36E0C 80046E0C FAFF4424 */  addiu      $a0, $v0, -0x6
    /* 36E10 80046E10 1280053C */  lui        $a1, %hi(D_8011B8B0)
    /* 36E14 80046E14 B0B8A524 */  addiu      $a1, $a1, %lo(D_8011B8B0)
    /* 36E18 80046E18 3E002686 */  lh         $a2, 0x3E($s1)
    /* 36E1C 80046E1C 9767000C */  jal        sprintf
    /* 36E20 80046E20 21384002 */   addu      $a3, $s2, $zero
    /* 36E24 80046E24 A11B0108 */  j          .L80046E84
    /* 36E28 80046E28 00000000 */   nop
  .L80046E2C:
    /* 36E2C 80046E2C 40003086 */  lh         $s0, 0x40($s1)
    /* 36E30 80046E30 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 36E34 80046E34 0A000216 */  bne        $s0, $v0, .L80046E60
    /* 36E38 80046E38 00000000 */   nop
    /* 36E3C 80046E3C 4AED010C */  jal        GetStr__Fi
    /* 36E40 80046E40 2E000424 */   addiu     $a0, $zero, 0x2E
    /* 36E44 80046E44 0D80043C */  lui        $a0, %hi(tempstr)
    /* 36E48 80046E48 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 36E4C 80046E4C 4A002682 */  lb         $a2, 0x4A($s1)
    /* 36E50 80046E50 9767000C */  jal        sprintf
    /* 36E54 80046E54 21284000 */   addu      $a1, $v0, $zero
    /* 36E58 80046E58 A11B0108 */  j          .L80046E84
    /* 36E5C 80046E5C 00000000 */   nop
  .L80046E60:
    /* 36E60 80046E60 4AED010C */  jal        GetStr__Fi
    /* 36E64 80046E64 2D000424 */   addiu     $a0, $zero, 0x2D
    /* 36E68 80046E68 0D80043C */  lui        $a0, %hi(tempstr)
    /* 36E6C 80046E6C 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 36E70 80046E70 4A002682 */  lb         $a2, 0x4A($s1)
    /* 36E74 80046E74 3E002786 */  lh         $a3, 0x3E($s1)
    /* 36E78 80046E78 21284000 */  addu       $a1, $v0, $zero
    /* 36E7C 80046E7C 9767000C */  jal        sprintf
    /* 36E80 80046E80 1000B0AF */   sw        $s0, 0x10($sp)
  .L80046E84:
    /* 36E84 80046E84 0D80043C */  lui        $a0, %hi(tempstr)
    /* 36E88 80046E88 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 36E8C 80046E8C 98C7000C */  jal        AddPanelString__FPCci
    /* 36E90 80046E90 01000524 */   addiu     $a1, $zero, 0x1
  .L80046E94:
    /* 36E94 80046E94 4D002392 */  lbu        $v1, 0x4D($s1)
    /* 36E98 80046E98 17000224 */  addiu      $v0, $zero, 0x17
    /* 36E9C 80046E9C 1C006214 */  bne        $v1, $v0, .L80046F10
    /* 36EA0 80046EA0 00000000 */   nop
    /* 36EA4 80046EA4 4B003292 */  lbu        $s2, 0x4B($s1)
    /* 36EA8 80046EA8 00000000 */  nop
    /* 36EAC 80046EAC 18004012 */  beqz       $s2, .L80046F10
    /* 36EB0 80046EB0 00000000 */   nop
    /* 36EB4 80046EB4 4AED010C */  jal        GetStr__Fi
    /* 36EB8 80046EB8 E6000424 */   addiu     $a0, $zero, 0xE6
    /* 36EBC 80046EBC 0D80103C */  lui        $s0, %hi(tempstr)
    /* 36EC0 80046EC0 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 36EC4 80046EC4 21284000 */  addu       $a1, $v0, $zero
    /* 36EC8 80046EC8 3B002682 */  lb         $a2, 0x3B($s1)
    /* 36ECC 80046ECC 3C002782 */  lb         $a3, 0x3C($s1)
    /* 36ED0 80046ED0 3E002286 */  lh         $v0, 0x3E($s1)
    /* 36ED4 80046ED4 40002386 */  lh         $v1, 0x40($s1)
    /* 36ED8 80046ED8 21200002 */  addu       $a0, $s0, $zero
    /* 36EDC 80046EDC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 36EE0 80046EE0 9767000C */  jal        sprintf
    /* 36EE4 80046EE4 1400A3AF */   sw        $v1, 0x14($sp)
    /* 36EE8 80046EE8 4AED010C */  jal        GetStr__Fi
    /* 36EEC 80046EEC B2000424 */   addiu     $a0, $zero, 0xB2
    /* 36EF0 80046EF0 21200002 */  addu       $a0, $s0, $zero
    /* 36EF4 80046EF4 21284000 */  addu       $a1, $v0, $zero
    /* 36EF8 80046EF8 49002692 */  lbu        $a2, 0x49($s1)
    /* 36EFC 80046EFC 9767000C */  jal        sprintf
    /* 36F00 80046F00 21384002 */   addu      $a3, $s2, $zero
    /* 36F04 80046F04 21200002 */  addu       $a0, $s0, $zero
    /* 36F08 80046F08 98C7000C */  jal        AddPanelString__FPCci
    /* 36F0C 80046F0C 01000524 */   addiu     $a1, $zero, 0x1
  .L80046F10:
    /* 36F10 80046F10 5F002382 */  lb         $v1, 0x5F($s1)
    /* 36F14 80046F14 FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 36F18 80046F18 0C007010 */  beq        $v1, $s0, .L80046F4C
    /* 36F1C 80046F1C 80100300 */   sll       $v0, $v1, 2
    /* 36F20 80046F20 21104300 */  addu       $v0, $v0, $v1
    /* 36F24 80046F24 C0100200 */  sll        $v0, $v0, 3
    /* 36F28 80046F28 1180013C */  lui        $at, %hi(PL_Prefix + 0x4)
    /* 36F2C 80046F2C 21082200 */  addu       $at, $at, $v0
    /* 36F30 80046F30 48272480 */  lb         $a0, %lo(PL_Prefix + 0x4)($at)
    /* 36F34 80046F34 9618010C */  jal        PrintItemPower__FcPC10ItemStruct
    /* 36F38 80046F38 21282002 */   addu      $a1, $s1, $zero
    /* 36F3C 80046F3C 0D80043C */  lui        $a0, %hi(tempstr)
    /* 36F40 80046F40 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 36F44 80046F44 98C7000C */  jal        AddPanelString__FPCci
    /* 36F48 80046F48 01000524 */   addiu     $a1, $zero, 0x1
  .L80046F4C:
    /* 36F4C 80046F4C 60002382 */  lb         $v1, 0x60($s1)
    /* 36F50 80046F50 00000000 */  nop
    /* 36F54 80046F54 0C007010 */  beq        $v1, $s0, .L80046F88
    /* 36F58 80046F58 80100300 */   sll       $v0, $v1, 2
    /* 36F5C 80046F5C 21104300 */  addu       $v0, $v0, $v1
    /* 36F60 80046F60 C0100200 */  sll        $v0, $v0, 3
    /* 36F64 80046F64 1180013C */  lui        $at, %hi(PL_Suffix + 0x4)
    /* 36F68 80046F68 21082200 */  addu       $at, $at, $v0
    /* 36F6C 80046F6C 68342480 */  lb         $a0, %lo(PL_Suffix + 0x4)($at)
    /* 36F70 80046F70 9618010C */  jal        PrintItemPower__FcPC10ItemStruct
    /* 36F74 80046F74 21282002 */   addu      $a1, $s1, $zero
    /* 36F78 80046F78 0D80043C */  lui        $a0, %hi(tempstr)
    /* 36F7C 80046F7C 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 36F80 80046F80 98C7000C */  jal        AddPanelString__FPCci
    /* 36F84 80046F84 01000524 */   addiu     $a1, $zero, 0x1
  .L80046F88:
    /* 36F88 80046F88 51002382 */  lb         $v1, 0x51($s1)
    /* 36F8C 80046F8C 02000224 */  addiu      $v0, $zero, 0x2
    /* 36F90 80046F90 1D006214 */  bne        $v1, $v0, .L80047008
    /* 36F94 80046F94 00000000 */   nop
    /* 36F98 80046F98 4AED010C */  jal        GetStr__Fi
    /* 36F9C 80046F9C A3040424 */   addiu     $a0, $zero, 0x4A3
    /* 36FA0 80046FA0 21204000 */  addu       $a0, $v0, $zero
    /* 36FA4 80046FA4 98C7000C */  jal        AddPanelString__FPCci
    /* 36FA8 80046FA8 01000524 */   addiu     $a1, $zero, 0x1
    /* 36FAC 80046FAC 01000224 */  addiu      $v0, $zero, 0x1
    /* 36FB0 80046FB0 5C1182A3 */  sb         $v0, %gp_rel(uitemflag)($gp)
    /* 36FB4 80046FB4 1380073C */  lui        $a3, %hi(D_8012EC58)
    /* 36FB8 80046FB8 58ECE724 */  addiu      $a3, $a3, %lo(D_8012EC58)
    /* 36FBC 80046FBC 21302002 */  addu       $a2, $s1, $zero
    /* 36FC0 80046FC0 60002826 */  addiu      $t0, $s1, 0x60
  .L80046FC4:
    /* 36FC4 80046FC4 0000C28C */  lw         $v0, 0x0($a2)
    /* 36FC8 80046FC8 0400C38C */  lw         $v1, 0x4($a2)
    /* 36FCC 80046FCC 0800C48C */  lw         $a0, 0x8($a2)
    /* 36FD0 80046FD0 0C00C58C */  lw         $a1, 0xC($a2)
    /* 36FD4 80046FD4 0000E2AC */  sw         $v0, 0x0($a3)
    /* 36FD8 80046FD8 0400E3AC */  sw         $v1, 0x4($a3)
    /* 36FDC 80046FDC 0800E4AC */  sw         $a0, 0x8($a3)
    /* 36FE0 80046FE0 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 36FE4 80046FE4 1000C624 */  addiu      $a2, $a2, 0x10
    /* 36FE8 80046FE8 F6FFC814 */  bne        $a2, $t0, .L80046FC4
    /* 36FEC 80046FEC 1000E724 */   addiu     $a3, $a3, 0x10
    /* 36FF0 80046FF0 0000C28C */  lw         $v0, 0x0($a2)
    /* 36FF4 80046FF4 0400C38C */  lw         $v1, 0x4($a2)
    /* 36FF8 80046FF8 0800C48C */  lw         $a0, 0x8($a2)
    /* 36FFC 80046FFC 0000E2AC */  sw         $v0, 0x0($a3)
    /* 37000 80047000 0400E3AC */  sw         $v1, 0x4($a3)
    /* 37004 80047004 0800E4AC */  sw         $a0, 0x8($a3)
  .L80047008:
    /* 37008 80047008 871A010C */  jal        PrintItemMisc__FPC10ItemStruct
    /* 3700C 8004700C 21202002 */   addu      $a0, $s1, $zero
    /* 37010 80047010 61003292 */  lbu        $s2, 0x61($s1)
    /* 37014 80047014 64003392 */  lbu        $s3, 0x64($s1)
    /* 37018 80047018 62003192 */  lbu        $s1, 0x62($s1)
    /* 3701C 8004701C 21105302 */  addu       $v0, $s2, $s3
    /* 37020 80047020 21105100 */  addu       $v0, $v0, $s1
    /* 37024 80047024 26004010 */  beqz       $v0, .L800470C0
    /* 37028 80047028 00000000 */   nop
    /* 3702C 8004702C 4AED010C */  jal        GetStr__Fi
    /* 37030 80047030 5D030424 */   addiu     $a0, $zero, 0x35D
    /* 37034 80047034 0D80103C */  lui        $s0, %hi(tempstr)
    /* 37038 80047038 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 3703C 8004703C 21200002 */  addu       $a0, $s0, $zero
    /* 37040 80047040 F240000C */  jal        strcpy
    /* 37044 80047044 21284000 */   addu      $a1, $v0, $zero
    /* 37048 80047048 08004012 */  beqz       $s2, .L8004706C
    /* 3704C 8004704C 00000000 */   nop
    /* 37050 80047050 4AED010C */  jal        GetStr__Fi
    /* 37054 80047054 1C050424 */   addiu     $a0, $zero, 0x51C
    /* 37058 80047058 21200002 */  addu       $a0, $s0, $zero
    /* 3705C 8004705C 21284000 */  addu       $a1, $v0, $zero
    /* 37060 80047060 21300002 */  addu       $a2, $s0, $zero
    /* 37064 80047064 9767000C */  jal        sprintf
    /* 37068 80047068 21384002 */   addu      $a3, $s2, $zero
  .L8004706C:
    /* 3706C 8004706C 08006012 */  beqz       $s3, .L80047090
    /* 37070 80047070 00000000 */   nop
    /* 37074 80047074 4AED010C */  jal        GetStr__Fi
    /* 37078 80047078 1B050424 */   addiu     $a0, $zero, 0x51B
    /* 3707C 8004707C 21200002 */  addu       $a0, $s0, $zero
    /* 37080 80047080 21284000 */  addu       $a1, $v0, $zero
    /* 37084 80047084 21300002 */  addu       $a2, $s0, $zero
    /* 37088 80047088 9767000C */  jal        sprintf
    /* 3708C 8004708C 21386002 */   addu      $a3, $s3, $zero
  .L80047090:
    /* 37090 80047090 09002012 */  beqz       $s1, .L800470B8
    /* 37094 80047094 21200002 */   addu      $a0, $s0, $zero
    /* 37098 80047098 4AED010C */  jal        GetStr__Fi
    /* 3709C 8004709C 1A050424 */   addiu     $a0, $zero, 0x51A
    /* 370A0 800470A0 21200002 */  addu       $a0, $s0, $zero
    /* 370A4 800470A4 21284000 */  addu       $a1, $v0, $zero
    /* 370A8 800470A8 21300002 */  addu       $a2, $s0, $zero
    /* 370AC 800470AC 9767000C */  jal        sprintf
    /* 370B0 800470B0 21382002 */   addu      $a3, $s1, $zero
    /* 370B4 800470B4 21200002 */  addu       $a0, $s0, $zero
  .L800470B8:
    /* 370B8 800470B8 98C7000C */  jal        AddPanelString__FPCci
    /* 370BC 800470BC 01000524 */   addiu     $a1, $zero, 0x1
  .L800470C0:
    /* 370C0 800470C0 1280033C */  lui        $v1, %hi(sel_data)
    /* 370C4 800470C4 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 370C8 800470C8 01000224 */  addiu      $v0, $zero, 0x1
    /* 370CC 800470CC 1280013C */  lui        $at, %hi(_pinfoflag)
    /* 370D0 800470D0 21082300 */  addu       $at, $at, $v1
    /* 370D4 800470D4 B8B622A0 */  sb         $v0, %lo(_pinfoflag)($at)
    /* 370D8 800470D8 5000BF8F */  lw         $ra, 0x50($sp)
    /* 370DC 800470DC 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 370E0 800470E0 4800B28F */  lw         $s2, 0x48($sp)
    /* 370E4 800470E4 4400B18F */  lw         $s1, 0x44($sp)
    /* 370E8 800470E8 4000B08F */  lw         $s0, 0x40($sp)
    /* 370EC 800470EC 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 370F0 800470F0 0800E003 */  jr         $ra
    /* 370F4 800470F4 00000000 */   nop
endlabel PrintItemDetails__FPC10ItemStruct
