.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ForceL2Trig__Fv, 0x300

glabel ForceL2Trig__Fv
    /* 65A48 80075A48 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 65A4C 80075A4C 1280043C */  lui        $a0, %hi(cursmx)
    /* 65A50 80075A50 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65A54 80075A54 1280053C */  lui        $a1, %hi(cursmy)
    /* 65A58 80075A58 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 65A5C 80075A5C 21300000 */  addu       $a2, $zero, $zero
    /* 65A60 80075A60 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 65A64 80075A64 3800B4AF */  sw         $s4, 0x38($sp)
    /* 65A68 80075A68 3400B3AF */  sw         $s3, 0x34($sp)
    /* 65A6C 80075A6C 3000B2AF */  sw         $s2, 0x30($sp)
    /* 65A70 80075A70 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 65A74 80075A74 18D4010C */  jal        FindLevTrig__Fiii
    /* 65A78 80075A78 2800B0AF */   sw        $s0, 0x28($sp)
    /* 65A7C 80075A7C 36004010 */  beqz       $v0, .L80075B58
    /* 65A80 80075A80 00000000 */   nop
    /* 65A84 80075A84 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 65A88 80075A88 00000000 */  nop
    /* 65A8C 80075A8C 32004018 */  blez       $v0, .L80075B58
    /* 65A90 80075A90 21880000 */   addu      $s1, $zero, $zero
    /* 65A94 80075A94 0E80123C */  lui        $s2, %hi(trigs + 0x4)
    /* 65A98 80075A98 D0335226 */  addiu      $s2, $s2, %lo(trigs + 0x4)
    /* 65A9C 80075A9C FCFF5326 */  addiu      $s3, $s2, -0x4
    /* 65AA0 80075AA0 21A00000 */  addu       $s4, $zero, $zero
  .L80075AA4:
    /* 65AA4 80075AA4 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 65AA8 80075AA8 21083400 */  addu       $at, $at, $s4
    /* 65AAC 80075AAC D433238C */  lw         $v1, %lo(trigs + 0x8)($at)
    /* 65AB0 80075AB0 43000224 */  addiu      $v0, $zero, 0x43
    /* 65AB4 80075AB4 21006214 */  bne        $v1, $v0, .L80075B3C
    /* 65AB8 80075AB8 00000000 */   nop
    /* 65ABC 80075ABC 0000628E */  lw         $v0, 0x0($s3)
    /* 65AC0 80075AC0 1280043C */  lui        $a0, %hi(cursmx)
    /* 65AC4 80075AC4 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65AC8 80075AC8 6D41000C */  jal        abs
    /* 65ACC 80075ACC 23204400 */   subu      $a0, $v0, $a0
    /* 65AD0 80075AD0 0000438E */  lw         $v1, 0x0($s2)
    /* 65AD4 80075AD4 1280043C */  lui        $a0, %hi(cursmy)
    /* 65AD8 80075AD8 54B7848C */  lw         $a0, %lo(cursmy)($a0)
    /* 65ADC 80075ADC 21804000 */  addu       $s0, $v0, $zero
    /* 65AE0 80075AE0 6D41000C */  jal        abs
    /* 65AE4 80075AE4 23206400 */   subu      $a0, $v1, $a0
    /* 65AE8 80075AE8 21184000 */  addu       $v1, $v0, $zero
    /* 65AEC 80075AEC 0400022A */  slti       $v0, $s0, 0x4
    /* 65AF0 80075AF0 12004010 */  beqz       $v0, .L80075B3C
    /* 65AF4 80075AF4 04006228 */   slti      $v0, $v1, 0x4
    /* 65AF8 80075AF8 10004010 */  beqz       $v0, .L80075B3C
    /* 65AFC 80075AFC 00000000 */   nop
    /* 65B00 80075B00 4AED010C */  jal        GetStr__Fi
    /* 65B04 80075B04 A7040424 */   addiu     $a0, $zero, 0x4A7
    /* 65B08 80075B08 21284000 */  addu       $a1, $v0, $zero
    /* 65B0C 80075B0C 0D80023C */  lui        $v0, %hi(_infostr)
    /* 65B10 80075B10 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 65B14 80075B14 1280043C */  lui        $a0, %hi(sel_data)
    /* 65B18 80075B18 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 65B1C 80075B1C 1280063C */  lui        $a2, %hi(currlevel)
    /* 65B20 80075B20 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 65B24 80075B24 00220400 */  sll        $a0, $a0, 8
    /* 65B28 80075B28 21208200 */  addu       $a0, $a0, $v0
    /* 65B2C 80075B2C 9767000C */  jal        sprintf
    /* 65B30 80075B30 FFFFC624 */   addiu     $a2, $a2, -0x1
    /* 65B34 80075B34 39D70108 */  j          .L80075CE4
    /* 65B38 80075B38 00000000 */   nop
  .L80075B3C:
    /* 65B3C 80075B3C 10005226 */  addiu      $s2, $s2, 0x10
    /* 65B40 80075B40 10007326 */  addiu      $s3, $s3, 0x10
    /* 65B44 80075B44 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 65B48 80075B48 01003126 */  addiu      $s1, $s1, 0x1
    /* 65B4C 80075B4C 2A102202 */  slt        $v0, $s1, $v0
    /* 65B50 80075B50 D4FF4014 */  bnez       $v0, .L80075AA4
    /* 65B54 80075B54 10009426 */   addiu     $s4, $s4, 0x10
  .L80075B58:
    /* 65B58 80075B58 1280043C */  lui        $a0, %hi(cursmx)
    /* 65B5C 80075B5C 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65B60 80075B60 1280053C */  lui        $a1, %hi(cursmy)
    /* 65B64 80075B64 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 65B68 80075B68 18D4010C */  jal        FindLevTrig__Fiii
    /* 65B6C 80075B6C 01000624 */   addiu     $a2, $zero, 0x1
    /* 65B70 80075B70 26004010 */  beqz       $v0, .L80075C0C
    /* 65B74 80075B74 00000000 */   nop
    /* 65B78 80075B78 4AED010C */  jal        GetStr__Fi
    /* 65B7C 80075B7C 15010424 */   addiu     $a0, $zero, 0x115
    /* 65B80 80075B80 21284000 */  addu       $a1, $v0, $zero
    /* 65B84 80075B84 0D80023C */  lui        $v0, %hi(_infostr)
    /* 65B88 80075B88 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 65B8C 80075B8C 1280043C */  lui        $a0, %hi(sel_data)
    /* 65B90 80075B90 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 65B94 80075B94 1280063C */  lui        $a2, %hi(currlevel)
    /* 65B98 80075B98 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 65B9C 80075B9C 00220400 */  sll        $a0, $a0, 8
    /* 65BA0 80075BA0 21208200 */  addu       $a0, $a0, $v0
    /* 65BA4 80075BA4 9767000C */  jal        sprintf
    /* 65BA8 80075BA8 0100C624 */   addiu     $a2, $a2, 0x1
    /* 65BAC 80075BAC F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 65BB0 80075BB0 00000000 */  nop
    /* 65BB4 80075BB4 15004018 */  blez       $v0, .L80075C0C
    /* 65BB8 80075BB8 21880000 */   addu      $s1, $zero, $zero
    /* 65BBC 80075BBC 42000524 */  addiu      $a1, $zero, 0x42
    /* 65BC0 80075BC0 21184000 */  addu       $v1, $v0, $zero
    /* 65BC4 80075BC4 21200000 */  addu       $a0, $zero, $zero
  .L80075BC8:
    /* 65BC8 80075BC8 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 65BCC 80075BCC 21082400 */  addu       $at, $at, $a0
    /* 65BD0 80075BD0 D433228C */  lw         $v0, %lo(trigs + 0x8)($at)
    /* 65BD4 80075BD4 00000000 */  nop
    /* 65BD8 80075BD8 09004514 */  bne        $v0, $a1, .L80075C00
    /* 65BDC 80075BDC 01003126 */   addiu     $s1, $s1, 0x1
    /* 65BE0 80075BE0 0E80013C */  lui        $at, %hi(trigs)
    /* 65BE4 80075BE4 21082400 */  addu       $at, $at, $a0
    /* 65BE8 80075BE8 CC33238C */  lw         $v1, %lo(trigs)($at)
    /* 65BEC 80075BEC 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 65BF0 80075BF0 21082400 */  addu       $at, $at, $a0
    /* 65BF4 80075BF4 D033248C */  lw         $a0, %lo(trigs + 0x4)($at)
    /* 65BF8 80075BF8 3BD70108 */  j          .L80075CEC
    /* 65BFC 80075BFC 00000000 */   nop
  .L80075C00:
    /* 65C00 80075C00 2A102302 */  slt        $v0, $s1, $v1
    /* 65C04 80075C04 F0FF4014 */  bnez       $v0, .L80075BC8
    /* 65C08 80075C08 10008424 */   addiu     $a0, $a0, 0x10
  .L80075C0C:
    /* 65C0C 80075C0C 1280033C */  lui        $v1, %hi(currlevel)
    /* 65C10 80075C10 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 65C14 80075C14 05000224 */  addiu      $v0, $zero, 0x5
    /* 65C18 80075C18 42006214 */  bne        $v1, $v0, .L80075D24
    /* 65C1C 80075C1C 21100000 */   addu      $v0, $zero, $zero
    /* 65C20 80075C20 1280043C */  lui        $a0, %hi(cursmx)
    /* 65C24 80075C24 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65C28 80075C28 1280053C */  lui        $a1, %hi(cursmy)
    /* 65C2C 80075C2C 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 65C30 80075C30 18D4010C */  jal        FindLevTrig__Fiii
    /* 65C34 80075C34 02000624 */   addiu     $a2, $zero, 0x2
    /* 65C38 80075C38 3A004010 */  beqz       $v0, .L80075D24
    /* 65C3C 80075C3C 21100000 */   addu      $v0, $zero, $zero
    /* 65C40 80075C40 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 65C44 80075C44 00000000 */  nop
    /* 65C48 80075C48 35004018 */  blez       $v0, .L80075D20
    /* 65C4C 80075C4C 21880000 */   addu      $s1, $zero, $zero
    /* 65C50 80075C50 0E80123C */  lui        $s2, %hi(trigs + 0x4)
    /* 65C54 80075C54 D0335226 */  addiu      $s2, $s2, %lo(trigs + 0x4)
    /* 65C58 80075C58 FCFF5326 */  addiu      $s3, $s2, -0x4
    /* 65C5C 80075C5C 21A00000 */  addu       $s4, $zero, $zero
  .L80075C60:
    /* 65C60 80075C60 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 65C64 80075C64 21083400 */  addu       $at, $at, $s4
    /* 65C68 80075C68 D433238C */  lw         $v1, %lo(trigs + 0x8)($at)
    /* 65C6C 80075C6C 48000224 */  addiu      $v0, $zero, 0x48
    /* 65C70 80075C70 24006214 */  bne        $v1, $v0, .L80075D04
    /* 65C74 80075C74 00000000 */   nop
    /* 65C78 80075C78 0000628E */  lw         $v0, 0x0($s3)
    /* 65C7C 80075C7C 1280043C */  lui        $a0, %hi(cursmx)
    /* 65C80 80075C80 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65C84 80075C84 6D41000C */  jal        abs
    /* 65C88 80075C88 23204400 */   subu      $a0, $v0, $a0
    /* 65C8C 80075C8C 0000438E */  lw         $v1, 0x0($s2)
    /* 65C90 80075C90 1280043C */  lui        $a0, %hi(cursmy)
    /* 65C94 80075C94 54B7848C */  lw         $a0, %lo(cursmy)($a0)
    /* 65C98 80075C98 21804000 */  addu       $s0, $v0, $zero
    /* 65C9C 80075C9C 6D41000C */  jal        abs
    /* 65CA0 80075CA0 23206400 */   subu      $a0, $v1, $a0
    /* 65CA4 80075CA4 21184000 */  addu       $v1, $v0, $zero
    /* 65CA8 80075CA8 0400022A */  slti       $v0, $s0, 0x4
    /* 65CAC 80075CAC 15004010 */  beqz       $v0, .L80075D04
    /* 65CB0 80075CB0 04006228 */   slti      $v0, $v1, 0x4
    /* 65CB4 80075CB4 13004010 */  beqz       $v0, .L80075D04
    /* 65CB8 80075CB8 00000000 */   nop
    /* 65CBC 80075CBC 4AED010C */  jal        GetStr__Fi
    /* 65CC0 80075CC0 A8040424 */   addiu     $a0, $zero, 0x4A8
    /* 65CC4 80075CC4 21284000 */  addu       $a1, $v0, $zero
    /* 65CC8 80075CC8 1280033C */  lui        $v1, %hi(sel_data)
    /* 65CCC 80075CCC 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 65CD0 80075CD0 0D80043C */  lui        $a0, %hi(_infostr)
    /* 65CD4 80075CD4 10E88424 */  addiu      $a0, $a0, %lo(_infostr)
    /* 65CD8 80075CD8 001A0300 */  sll        $v1, $v1, 8
    /* 65CDC 80075CDC F240000C */  jal        strcpy
    /* 65CE0 80075CE0 21206400 */   addu      $a0, $v1, $a0
  .L80075CE4:
    /* 65CE4 80075CE4 0000638E */  lw         $v1, 0x0($s3)
    /* 65CE8 80075CE8 0000448E */  lw         $a0, 0x0($s2)
  .L80075CEC:
    /* 65CEC 80075CEC 1280013C */  lui        $at, %hi(cursmx)
    /* 65CF0 80075CF0 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 65CF4 80075CF4 1280013C */  lui        $at, %hi(cursmy)
    /* 65CF8 80075CF8 54B724AC */  sw         $a0, %lo(cursmy)($at)
    /* 65CFC 80075CFC 49D70108 */  j          .L80075D24
    /* 65D00 80075D00 01000224 */   addiu     $v0, $zero, 0x1
  .L80075D04:
    /* 65D04 80075D04 10005226 */  addiu      $s2, $s2, 0x10
    /* 65D08 80075D08 10007326 */  addiu      $s3, $s3, 0x10
    /* 65D0C 80075D0C F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 65D10 80075D10 01003126 */  addiu      $s1, $s1, 0x1
    /* 65D14 80075D14 2A102202 */  slt        $v0, $s1, $v0
    /* 65D18 80075D18 D1FF4014 */  bnez       $v0, .L80075C60
    /* 65D1C 80075D1C 10009426 */   addiu     $s4, $s4, 0x10
  .L80075D20:
    /* 65D20 80075D20 21100000 */  addu       $v0, $zero, $zero
  .L80075D24:
    /* 65D24 80075D24 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 65D28 80075D28 3800B48F */  lw         $s4, 0x38($sp)
    /* 65D2C 80075D2C 3400B38F */  lw         $s3, 0x34($sp)
    /* 65D30 80075D30 3000B28F */  lw         $s2, 0x30($sp)
    /* 65D34 80075D34 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 65D38 80075D38 2800B08F */  lw         $s0, 0x28($sp)
    /* 65D3C 80075D3C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 65D40 80075D40 0800E003 */  jr         $ra
    /* 65D44 80075D44 00000000 */   nop
endlabel ForceL2Trig__Fv
