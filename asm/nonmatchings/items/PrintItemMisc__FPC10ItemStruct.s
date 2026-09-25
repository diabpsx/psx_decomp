.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintItemMisc__FPC10ItemStruct, 0x260

glabel PrintItemMisc__FPC10ItemStruct
    /* 36A1C 80046A1C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 36A20 80046A20 1400B1AF */  sw         $s1, 0x14($sp)
    /* 36A24 80046A24 21888000 */  addu       $s1, $a0, $zero
    /* 36A28 80046A28 4D002392 */  lbu        $v1, 0x4D($s1)
    /* 36A2C 80046A2C 15000224 */  addiu      $v0, $zero, 0x15
    /* 36A30 80046A30 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 36A34 80046A34 1800B2AF */  sw         $s2, 0x18($sp)
    /* 36A38 80046A38 1A006214 */  bne        $v1, $v0, .L80046AA4
    /* 36A3C 80046A3C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 36A40 80046A40 4AED010C */  jal        GetStr__Fi
    /* 36A44 80046A44 2A030424 */   addiu     $a0, $zero, 0x32A
    /* 36A48 80046A48 0D80103C */  lui        $s0, %hi(tempstr)
    /* 36A4C 80046A4C 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 36A50 80046A50 21200002 */  addu       $a0, $s0, $zero
    /* 36A54 80046A54 F240000C */  jal        strcpy
    /* 36A58 80046A58 21284000 */   addu      $a1, $v0, $zero
    /* 36A5C 80046A5C 21200002 */  addu       $a0, $s0, $zero
    /* 36A60 80046A60 98C7000C */  jal        AddPanelString__FPCci
    /* 36A64 80046A64 01000524 */   addiu     $a1, $zero, 0x1
    /* 36A68 80046A68 1280023C */  lui        $v0, %hi(invflag)
    /* 36A6C 80046A6C 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 36A70 80046A70 00000000 */  nop
    /* 36A74 80046A74 0A004010 */  beqz       $v0, .L80046AA0
    /* 36A78 80046A78 00000000 */   nop
    /* 36A7C 80046A7C 66002282 */  lb         $v0, 0x66($s1)
    /* 36A80 80046A80 00000000 */  nop
    /* 36A84 80046A84 06004014 */  bnez       $v0, .L80046AA0
    /* 36A88 80046A88 00000000 */   nop
    /* 36A8C 80046A8C 4AED010C */  jal        GetStr__Fi
    /* 36A90 80046A90 5E030424 */   addiu     $a0, $zero, 0x35E
    /* 36A94 80046A94 21204000 */  addu       $a0, $v0, $zero
    /* 36A98 80046A98 98C7000C */  jal        AddPanelString__FPCci
    /* 36A9C 80046A9C 01000524 */   addiu     $a1, $zero, 0x1
  .L80046AA0:
    /* 36AA0 80046AA0 4D002392 */  lbu        $v1, 0x4D($s1)
  .L80046AA4:
    /* 36AA4 80046AA4 16000224 */  addiu      $v0, $zero, 0x16
    /* 36AA8 80046AA8 19006214 */  bne        $v1, $v0, .L80046B10
    /* 36AAC 80046AAC 00000000 */   nop
    /* 36AB0 80046AB0 4AED010C */  jal        GetStr__Fi
    /* 36AB4 80046AB4 2A030424 */   addiu     $a0, $zero, 0x32A
    /* 36AB8 80046AB8 0D80103C */  lui        $s0, %hi(tempstr)
    /* 36ABC 80046ABC 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 36AC0 80046AC0 21200002 */  addu       $a0, $s0, $zero
    /* 36AC4 80046AC4 F240000C */  jal        strcpy
    /* 36AC8 80046AC8 21284000 */   addu      $a1, $v0, $zero
    /* 36ACC 80046ACC 21200002 */  addu       $a0, $s0, $zero
    /* 36AD0 80046AD0 98C7000C */  jal        AddPanelString__FPCci
    /* 36AD4 80046AD4 01000524 */   addiu     $a1, $zero, 0x1
    /* 36AD8 80046AD8 1280023C */  lui        $v0, %hi(invflag)
    /* 36ADC 80046ADC 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 36AE0 80046AE0 00000000 */  nop
    /* 36AE4 80046AE4 0A004010 */  beqz       $v0, .L80046B10
    /* 36AE8 80046AE8 00000000 */   nop
    /* 36AEC 80046AEC 66002282 */  lb         $v0, 0x66($s1)
    /* 36AF0 80046AF0 00000000 */  nop
    /* 36AF4 80046AF4 06004014 */  bnez       $v0, .L80046B10
    /* 36AF8 80046AF8 00000000 */   nop
    /* 36AFC 80046AFC 4AED010C */  jal        GetStr__Fi
    /* 36B00 80046B00 5E030424 */   addiu     $a0, $zero, 0x35E
    /* 36B04 80046B04 21204000 */  addu       $a0, $v0, $zero
    /* 36B08 80046B08 98C7000C */  jal        AddPanelString__FPCci
    /* 36B0C 80046B0C 01000524 */   addiu     $a1, $zero, 0x1
  .L80046B10:
    /* 36B10 80046B10 4D002292 */  lbu        $v0, 0x4D($s1)
    /* 36B14 80046B14 00000000 */  nop
    /* 36B18 80046B18 03004010 */  beqz       $v0, .L80046B28
    /* 36B1C 80046B1C 1500422C */   sltiu     $v0, $v0, 0x15
    /* 36B20 80046B20 0A004014 */  bnez       $v0, .L80046B4C
    /* 36B24 80046B24 00000000 */   nop
  .L80046B28:
    /* 36B28 80046B28 2E002386 */  lh         $v1, 0x2E($s1)
    /* 36B2C 80046B2C 14000224 */  addiu      $v0, $zero, 0x14
    /* 36B30 80046B30 13006214 */  bne        $v1, $v0, .L80046B80
    /* 36B34 80046B34 00000000 */   nop
    /* 36B38 80046B38 0D80023C */  lui        $v0, %hi(AllItemsUseable + 0x14)
    /* 36B3C 80046B3C 541B4290 */  lbu        $v0, %lo(AllItemsUseable + 0x14)($v0)
    /* 36B40 80046B40 00000000 */  nop
    /* 36B44 80046B44 0E004010 */  beqz       $v0, .L80046B80
    /* 36B48 80046B48 00000000 */   nop
  .L80046B4C:
    /* 36B4C 80046B4C 4D002482 */  lb         $a0, 0x4D($s1)
    /* 36B50 80046B50 5718010C */  jal        PrintItemOil__Fc
    /* 36B54 80046B54 00000000 */   nop
    /* 36B58 80046B58 4AED010C */  jal        GetStr__Fi
    /* 36B5C 80046B5C 2B030424 */   addiu     $a0, $zero, 0x32B
    /* 36B60 80046B60 0D80103C */  lui        $s0, %hi(tempstr)
    /* 36B64 80046B64 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 36B68 80046B68 21200002 */  addu       $a0, $s0, $zero
    /* 36B6C 80046B6C F240000C */  jal        strcpy
    /* 36B70 80046B70 21284000 */   addu      $a1, $v0, $zero
    /* 36B74 80046B74 21200002 */  addu       $a0, $s0, $zero
    /* 36B78 80046B78 98C7000C */  jal        AddPanelString__FPCci
    /* 36B7C 80046B7C 01000524 */   addiu     $a1, $zero, 0x1
  .L80046B80:
    /* 36B80 80046B80 4D002392 */  lbu        $v1, 0x4D($s1)
    /* 36B84 80046B84 18000224 */  addiu      $v0, $zero, 0x18
    /* 36B88 80046B88 19006214 */  bne        $v1, $v0, .L80046BF0
    /* 36B8C 80046B8C 00000000 */   nop
    /* 36B90 80046B90 4AED010C */  jal        GetStr__Fi
    /* 36B94 80046B94 2A030424 */   addiu     $a0, $zero, 0x32A
    /* 36B98 80046B98 0D80103C */  lui        $s0, %hi(tempstr)
    /* 36B9C 80046B9C 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 36BA0 80046BA0 21200002 */  addu       $a0, $s0, $zero
    /* 36BA4 80046BA4 F240000C */  jal        strcpy
    /* 36BA8 80046BA8 21284000 */   addu      $a1, $v0, $zero
    /* 36BAC 80046BAC 21200002 */  addu       $a0, $s0, $zero
    /* 36BB0 80046BB0 98C7000C */  jal        AddPanelString__FPCci
    /* 36BB4 80046BB4 01000524 */   addiu     $a1, $zero, 0x1
    /* 36BB8 80046BB8 1280023C */  lui        $v0, %hi(invflag)
    /* 36BBC 80046BBC 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 36BC0 80046BC0 00000000 */  nop
    /* 36BC4 80046BC4 0A004010 */  beqz       $v0, .L80046BF0
    /* 36BC8 80046BC8 00000000 */   nop
    /* 36BCC 80046BCC 66002282 */  lb         $v0, 0x66($s1)
    /* 36BD0 80046BD0 00000000 */  nop
    /* 36BD4 80046BD4 06004014 */  bnez       $v0, .L80046BF0
    /* 36BD8 80046BD8 00000000 */   nop
    /* 36BDC 80046BDC 4AED010C */  jal        GetStr__Fi
    /* 36BE0 80046BE0 5E030424 */   addiu     $a0, $zero, 0x35E
    /* 36BE4 80046BE4 21204000 */  addu       $a0, $v0, $zero
    /* 36BE8 80046BE8 98C7000C */  jal        AddPanelString__FPCci
    /* 36BEC 80046BEC 01000524 */   addiu     $a1, $zero, 0x1
  .L80046BF0:
    /* 36BF0 80046BF0 4D003292 */  lbu        $s2, 0x4D($s1)
    /* 36BF4 80046BF4 2A000224 */  addiu      $v0, $zero, 0x2A
    /* 36BF8 80046BF8 0C004216 */  bne        $s2, $v0, .L80046C2C
    /* 36BFC 80046BFC 2B000224 */   addiu     $v0, $zero, 0x2B
    /* 36C00 80046C00 4AED010C */  jal        GetStr__Fi
    /* 36C04 80046C04 2C030424 */   addiu     $a0, $zero, 0x32C
    /* 36C08 80046C08 0D80103C */  lui        $s0, %hi(tempstr)
    /* 36C0C 80046C0C 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 36C10 80046C10 21200002 */  addu       $a0, $s0, $zero
    /* 36C14 80046C14 F240000C */  jal        strcpy
    /* 36C18 80046C18 21284000 */   addu      $a1, $v0, $zero
    /* 36C1C 80046C1C 21200002 */  addu       $a0, $s0, $zero
    /* 36C20 80046C20 98C7000C */  jal        AddPanelString__FPCci
    /* 36C24 80046C24 01000524 */   addiu     $a1, $zero, 0x1
    /* 36C28 80046C28 2B000224 */  addiu      $v0, $zero, 0x2B
  .L80046C2C:
    /* 36C2C 80046C2C 0C004216 */  bne        $s2, $v0, .L80046C60
    /* 36C30 80046C30 00000000 */   nop
    /* 36C34 80046C34 4AED010C */  jal        GetStr__Fi
    /* 36C38 80046C38 47020424 */   addiu     $a0, $zero, 0x247
    /* 36C3C 80046C3C 0D80103C */  lui        $s0, %hi(tempstr)
    /* 36C40 80046C40 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 36C44 80046C44 21200002 */  addu       $a0, $s0, $zero
    /* 36C48 80046C48 1400268E */  lw         $a2, 0x14($s1)
    /* 36C4C 80046C4C 9767000C */  jal        sprintf
    /* 36C50 80046C50 21284000 */   addu      $a1, $v0, $zero
    /* 36C54 80046C54 21200002 */  addu       $a0, $s0, $zero
    /* 36C58 80046C58 98C7000C */  jal        AddPanelString__FPCci
    /* 36C5C 80046C5C 01000524 */   addiu     $a1, $zero, 0x1
  .L80046C60:
    /* 36C60 80046C60 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 36C64 80046C64 1800B28F */  lw         $s2, 0x18($sp)
    /* 36C68 80046C68 1400B18F */  lw         $s1, 0x14($sp)
    /* 36C6C 80046C6C 1000B08F */  lw         $s0, 0x10($sp)
    /* 36C70 80046C70 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 36C74 80046C74 0800E003 */  jr         $ra
    /* 36C78 80046C78 00000000 */   nop
endlabel PrintItemMisc__FPC10ItemStruct
