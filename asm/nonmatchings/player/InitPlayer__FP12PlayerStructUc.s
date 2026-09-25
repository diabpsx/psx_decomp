.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPlayer__FP12PlayerStructUc, 0x320

glabel InitPlayer__FP12PlayerStructUc
    /* 50924 80060924 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 50928 80060928 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5092C 8006092C 21808000 */  addu       $s0, $a0, $zero
    /* 50930 80060930 1400B1AF */  sw         $s1, 0x14($sp)
    /* 50934 80060934 2188A000 */  addu       $s1, $a1, $zero
    /* 50938 80060938 FF002232 */  andi       $v0, $s1, 0xFF
    /* 5093C 8006093C 14004010 */  beqz       $v0, .L80060990
    /* 50940 80060940 1800BFAF */   sw        $ra, 0x18($sp)
    /* 50944 80060944 04000224 */  addiu      $v0, $zero, 0x4
    /* 50948 80060948 680002A2 */  sb         $v0, 0x68($s0)
    /* 5094C 8006094C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 50950 80060950 640002AE */  sw         $v0, 0x64($s0)
    /* 50954 80060954 6C0002AE */  sw         $v0, 0x6C($s0)
    /* 50958 80060958 64000224 */  addiu      $v0, $zero, 0x64
    /* 5095C 8006095C 5A0002A2 */  sb         $v0, 0x5A($s0)
    /* 50960 80060960 04000224 */  addiu      $v0, $zero, 0x4
    /* 50964 80060964 6400048E */  lw         $a0, 0x64($s0)
    /* 50968 80060968 43000392 */  lbu        $v1, 0x43($s0)
    /* 5096C 8006096C 68000592 */  lbu        $a1, 0x68($s0)
    /* 50970 80060970 0F006330 */  andi       $v1, $v1, 0xF
    /* 50974 80060974 5D0004A2 */  sb         $a0, 0x5D($s0)
    /* 50978 80060978 04006214 */  bne        $v1, $v0, .L8006098C
    /* 5097C 8006097C 5E0005A2 */   sb        $a1, 0x5E($s0)
    /* 50980 80060980 01000224 */  addiu      $v0, $zero, 0x1
    /* 50984 80060984 64820108 */  j          .L80060990
    /* 50988 80060988 D10002A2 */   sb        $v0, 0xD1($s0)
  .L8006098C:
    /* 5098C 8006098C D10000A2 */  sb         $zero, 0xD1($s0)
  .L80060990:
    /* 50990 80060990 957F010C */  jal        SetPlrAnims__FP12PlayerStruct
    /* 50994 80060994 21200002 */   addu      $a0, $s0, $zero
    /* 50998 80060998 21200002 */  addu       $a0, $s0, $zero
    /* 5099C 8006099C 3C0000A2 */  sb         $zero, 0x3C($s0)
    /* 509A0 800609A0 3D0000A2 */  sb         $zero, 0x3D($s0)
    /* 509A4 800609A4 3E0000A6 */  sh         $zero, 0x3E($s0)
    /* 509A8 800609A8 8E7F010C */  jal        ClearPlrPVars__FP12PlayerStruct
    /* 509AC 800609AC 400000A6 */   sh        $zero, 0x40($s0)
    /* 509B0 800609B0 1C01028E */  lw         $v0, 0x11C($s0)
    /* 509B4 800609B4 00000000 */  nop
    /* 509B8 800609B8 83110200 */  sra        $v0, $v0, 6
    /* 509BC 800609BC 0F004018 */  blez       $v0, .L800609FC
    /* 509C0 800609C0 21280000 */   addu      $a1, $zero, $zero
    /* 509C4 800609C4 21200002 */  addu       $a0, $s0, $zero
    /* 509C8 800609C8 9001068E */  lw         $a2, 0x190($s0)
    /* 509CC 800609CC 03000724 */  addiu      $a3, $zero, 0x3
    /* 509D0 800609D0 877F010C */  jal        NewPlrAnim__FP12PlayerStructiii
    /* 509D4 800609D4 000000AE */   sw        $zero, 0x0($s0)
    /* 509D8 800609D8 9001048E */  lw         $a0, 0x190($s0)
    /* 509DC 800609DC C9F6000C */  jal        ENG_random__Fl
    /* 509E0 800609E0 FFFF8424 */   addiu     $a0, $a0, -0x1
    /* 509E4 800609E4 03000424 */  addiu      $a0, $zero, 0x3
    /* 509E8 800609E8 01004224 */  addiu      $v0, $v0, 0x1
    /* 509EC 800609EC C9F6000C */  jal        ENG_random__Fl
    /* 509F0 800609F0 540002AE */   sw        $v0, 0x54($s0)
    /* 509F4 800609F4 8C820108 */  j          .L80060A30
    /* 509F8 800609F8 4C0002AE */   sw        $v0, 0x4C($s0)
  .L800609FC:
    /* 509FC 800609FC 21200002 */  addu       $a0, $s0, $zero
    /* 50A00 80060A00 01000524 */  addiu      $a1, $zero, 0x1
    /* 50A04 80060A04 01000724 */  addiu      $a3, $zero, 0x1
    /* 50A08 80060A08 A801068E */  lw         $a2, 0x1A8($s0)
    /* 50A0C 80060A0C 08000224 */  addiu      $v0, $zero, 0x8
    /* 50A10 80060A10 877F010C */  jal        NewPlrAnim__FP12PlayerStructiii
    /* 50A14 80060A14 000002AE */   sw        $v0, 0x0($s0)
    /* 50A18 80060A18 5000028E */  lw         $v0, 0x50($s0)
    /* 50A1C 80060A1C 5000038E */  lw         $v1, 0x50($s0)
    /* 50A20 80060A20 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 50A24 80060A24 40180300 */  sll        $v1, $v1, 1
    /* 50A28 80060A28 540002AE */  sw         $v0, 0x54($s0)
    /* 50A2C 80060A2C 640103A6 */  sh         $v1, 0x164($s0)
  .L80060A30:
    /* 50A30 80060A30 420000A2 */  sb         $zero, 0x42($s0)
    /* 50A34 80060A34 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 50A38 80060A38 21200002 */   addu      $a0, $s0, $zero
    /* 50A3C 80060A3C 1D004010 */  beqz       $v0, .L80060AB4
    /* 50A40 80060A40 FF002232 */   andi      $v0, $s1, 0xFF
    /* 50A44 80060A44 06004010 */  beqz       $v0, .L80060A60
    /* 50A48 80060A48 00000000 */   nop
    /* 50A4C 80060A4C 1280023C */  lui        $v0, %hi(currlevel)
    /* 50A50 80060A50 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 50A54 80060A54 00000000 */  nop
    /* 50A58 80060A58 21004010 */  beqz       $v0, .L80060AE0
    /* 50A5C 80060A5C 21200002 */   addu      $a0, $s0, $zero
  .L80060A60:
    /* 50A60 80060A60 787F010C */  jal        plrind__FP12PlayerStruct
    /* 50A64 80060A64 21200002 */   addu      $a0, $s0, $zero
    /* 50A68 80060A68 01000324 */  addiu      $v1, $zero, 0x1
    /* 50A6C 80060A6C 11004314 */  bne        $v0, $v1, .L80060AB4
    /* 50A70 80060A70 00000000 */   nop
    /* 50A74 80060A74 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 50A78 80060A78 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 50A7C 80060A7C 00000000 */  nop
    /* 50A80 80060A80 0C004010 */  beqz       $v0, .L80060AB4
    /* 50A84 80060A84 00000000 */   nop
    /* 50A88 80060A88 787F010C */  jal        plrind__FP12PlayerStruct
    /* 50A8C 80060A8C 21200002 */   addu      $a0, $s0, $zero
    /* 50A90 80060A90 21204000 */  addu       $a0, $v0, $zero
    /* 50A94 80060A94 21380000 */  addu       $a3, $zero, $zero
    /* 50A98 80060A98 1280053C */  lui        $a1, %hi(ViewX)
    /* 50A9C 80060A9C 14C1A58C */  lw         $a1, %lo(ViewX)($a1)
    /* 50AA0 80060AA0 1280063C */  lui        $a2, %hi(ViewY)
    /* 50AA4 80060AA4 18C1C68C */  lw         $a2, %lo(ViewY)($a2)
    /* 50AA8 80060AA8 0100A524 */  addiu      $a1, $a1, 0x1
    /* 50AAC 80060AAC B5820108 */  j          .L80060AD4
    /* 50AB0 80060AB0 0100C624 */   addiu     $a2, $a2, 0x1
  .L80060AB4:
    /* 50AB4 80060AB4 787F010C */  jal        plrind__FP12PlayerStruct
    /* 50AB8 80060AB8 21200002 */   addu      $a0, $s0, $zero
    /* 50ABC 80060ABC 21204000 */  addu       $a0, $v0, $zero
    /* 50AC0 80060AC0 1280053C */  lui        $a1, %hi(ViewX)
    /* 50AC4 80060AC4 14C1A58C */  lw         $a1, %lo(ViewX)($a1)
    /* 50AC8 80060AC8 1280063C */  lui        $a2, %hi(ViewY)
    /* 50ACC 80060ACC 18C1C68C */  lw         $a2, %lo(ViewY)($a2)
    /* 50AD0 80060AD0 21380000 */  addu       $a3, $zero, $zero
  .L80060AD4:
    /* 50AD4 80060AD4 2090020C */  jal        PlacePlayer__FiiiUc
    /* 50AD8 80060AD8 00000000 */   nop
    /* 50ADC 80060ADC 21200002 */  addu       $a0, $s0, $zero
  .L80060AE0:
    /* 50AE0 80060AE0 30000586 */  lh         $a1, 0x30($s0)
    /* 50AE4 80060AE4 32000686 */  lh         $a2, 0x32($s0)
    /* 50AE8 80060AE8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 50AEC 80060AEC 040002A2 */  sb         $v0, 0x4($s0)
    /* 50AF0 80060AF0 1E0002A2 */  sb         $v0, 0x1E($s0)
    /* 50AF4 80060AF4 C0280500 */  sll        $a1, $a1, 3
    /* 50AF8 80060AF8 0400A534 */  ori        $a1, $a1, 0x4
    /* 50AFC 80060AFC C0300600 */  sll        $a2, $a2, 3
    /* 50B00 80060B00 E899010C */  jal        WorldToOffset__FP12PlayerStructii
    /* 50B04 80060B04 0400C634 */   ori       $a2, $a2, 0x4
    /* 50B08 80060B08 D4000292 */  lbu        $v0, 0xD4($s0)
    /* 50B0C 80060B0C 00000000 */  nop
    /* 50B10 80060B10 8D1282A3 */  sb         $v0, %gp_rel(light_rad)($gp)
    /* 50B14 80060B14 5B000482 */  lb         $a0, 0x5B($s0)
    /* 50B18 80060B18 EC34010C */  jal        light_fix__Fi
    /* 50B1C 80060B1C 00000000 */   nop
    /* 50B20 80060B20 30000486 */  lh         $a0, 0x30($s0)
    /* 50B24 80060B24 8D128683 */  lb         $a2, %gp_rel(light_rad)($gp)
    /* 50B28 80060B28 32000586 */  lh         $a1, 0x32($s0)
    /* 50B2C 80060B2C BA34010C */  jal        AddLight__Fiii
    /* 50B30 80060B30 F023C624 */   addiu     $a2, $a2, 0x23F0
    /* 50B34 80060B34 00260200 */  sll        $a0, $v0, 24
    /* 50B38 80060B38 03260400 */  sra        $a0, $a0, 24
    /* 50B3C 80060B3C 21280000 */  addu       $a1, $zero, $zero
    /* 50B40 80060B40 21300000 */  addu       $a2, $zero, $zero
    /* 50B44 80060B44 EE34010C */  jal        ChangeLightOff__Fiii
    /* 50B48 80060B48 5B0002A2 */   sb        $v0, 0x5B($s0)
    /* 50B4C 80060B4C 1280013C */  lui        $at, %hi(ManashieldFlag)
    /* 50B50 80060B50 8DC220A0 */  sb         $zero, %lo(ManashieldFlag)($at)
    /* 50B54 80060B54 1280013C */  lui        $at, %hi(ManashieldFlag2)
    /* 50B58 80060B58 8EC220A0 */  sb         $zero, %lo(ManashieldFlag2)($at)
    /* 50B5C 80060B5C 787F010C */  jal        plrind__FP12PlayerStruct
    /* 50B60 80060B60 21200002 */   addu      $a0, $s0, $zero
    /* 50B64 80060B64 0A000624 */  addiu      $a2, $zero, 0xA
    /* 50B68 80060B68 30000486 */  lh         $a0, 0x30($s0)
    /* 50B6C 80060B6C 32000586 */  lh         $a1, 0x32($s0)
    /* 50B70 80060B70 6A35010C */  jal        AddVision__FiiiUc
    /* 50B74 80060B74 FF004730 */   andi      $a3, $v0, 0xFF
    /* 50B78 80060B78 F6000382 */  lb         $v1, 0xF6($s0)
    /* 50B7C 80060B7C 00000000 */  nop
    /* 50B80 80060B80 05006014 */  bnez       $v1, .L80060B98
    /* 50B84 80060B84 5C0002A2 */   sb        $v0, 0x5C($s0)
    /* 50B88 80060B88 00000324 */  addiu      $v1, $zero, 0x0
    /* 50B8C 80060B8C 0002023C */  lui        $v0, (0x2000000 >> 16)
    /* 50B90 80060B90 F1820108 */  j          .L80060BC4
    /* 50B94 80060B94 00000000 */   nop
  .L80060B98:
    /* 50B98 80060B98 01000224 */  addiu      $v0, $zero, 0x1
    /* 50B9C 80060B9C 05006214 */  bne        $v1, $v0, .L80060BB4
    /* 50BA0 80060BA0 02000224 */   addiu     $v0, $zero, 0x2
    /* 50BA4 80060BA4 00000324 */  addiu      $v1, $zero, 0x0
    /* 50BA8 80060BA8 0008023C */  lui        $v0, (0x8000000 >> 16)
    /* 50BAC 80060BAC F1820108 */  j          .L80060BC4
    /* 50BB0 80060BB0 00000000 */   nop
  .L80060BB4:
    /* 50BB4 80060BB4 05006214 */  bne        $v1, $v0, .L80060BCC
    /* 50BB8 80060BB8 00000000 */   nop
    /* 50BBC 80060BBC 00000324 */  addiu      $v1, $zero, 0x0
    /* 50BC0 80060BC0 0004023C */  lui        $v0, (0x4000000 >> 16)
  .L80060BC4:
    /* 50BC4 80060BC4 C00002AE */  sw         $v0, 0xC0($s0)
    /* 50BC8 80060BC8 C40003AE */  sw         $v1, 0xC4($s0)
  .L80060BCC:
    /* 50BCC 80060BCC 3C010282 */  lb         $v0, 0x13C($s0)
    /* 50BD0 80060BD0 00000000 */  nop
    /* 50BD4 80060BD4 80100200 */  sll        $v0, $v0, 2
    /* 50BD8 80060BD8 0E80013C */  lui        $at, %hi(ExpLvlsTbl)
    /* 50BDC 80060BDC 21082200 */  addu       $at, $at, $v0
    /* 50BE0 80060BE0 68A4228C */  lw         $v0, %lo(ExpLvlsTbl)($at)
    /* 50BE4 80060BE4 21200002 */  addu       $a0, $s0, $zero
    /* 50BE8 80060BE8 D30000A2 */  sb         $zero, 0xD3($s0)
    /* 50BEC 80060BEC 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 50BF0 80060BF0 480102AE */   sw        $v0, 0x148($s0)
    /* 50BF4 80060BF4 0D004010 */  beqz       $v0, .L80060C2C
    /* 50BF8 80060BF8 00000000 */   nop
    /* 50BFC 80060BFC 787F010C */  jal        plrind__FP12PlayerStruct
    /* 50C00 80060C00 21200002 */   addu      $a0, $s0, $zero
    /* 50C04 80060C04 1280013C */  lui        $at, %hi(D_8011C878)
    /* 50C08 80060C08 21082200 */  addu       $at, $at, $v0
    /* 50C0C 80060C0C 78C820A0 */  sb         $zero, %lo(D_8011C878)($at)
    /* 50C10 80060C10 8C1280A3 */  sb         $zero, %gp_rel(deathflag)($gp)
    /* 50C14 80060C14 0E80013C */  lui        $at, %hi(ScrollInfo)
    /* 50C18 80060C18 147920AC */  sw         $zero, %lo(ScrollInfo)($at)
    /* 50C1C 80060C1C 0E80013C */  lui        $at, %hi(ScrollInfo + 0x4)
    /* 50C20 80060C20 187920AC */  sw         $zero, %lo(ScrollInfo + 0x4)($at)
    /* 50C24 80060C24 0E80013C */  lui        $at, %hi(ScrollInfo + 0x10)
    /* 50C28 80060C28 247920AC */  sw         $zero, %lo(ScrollInfo + 0x10)($at)
  .L80060C2C:
    /* 50C2C 80060C2C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 50C30 80060C30 1400B18F */  lw         $s1, 0x14($sp)
    /* 50C34 80060C34 1000B08F */  lw         $s0, 0x10($sp)
    /* 50C38 80060C38 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 50C3C 80060C3C 0800E003 */  jr         $ra
    /* 50C40 80060C40 00000000 */   nop
endlabel InitPlayer__FP12PlayerStructUc
