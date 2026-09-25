.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DefaultObjPrint__FP12ObjectStructiiP7TextDatiii, 0x194

glabel DefaultObjPrint__FP12ObjectStructiiP7TextDatiii
    /* 6D9E8 8007D9E8 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 6D9EC 8007D9EC 21408000 */  addu       $t0, $a0, $zero
    /* 6D9F0 8007D9F0 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 6D9F4 8007D9F4 2198A000 */  addu       $s3, $a1, $zero
    /* 6D9F8 8007D9F8 3000B4AF */  sw         $s4, 0x30($sp)
    /* 6D9FC 8007D9FC 21A0C000 */  addu       $s4, $a2, $zero
    /* 6DA00 8007DA00 2800B2AF */  sw         $s2, 0x28($sp)
    /* 6DA04 8007DA04 2190E000 */  addu       $s2, $a3, $zero
    /* 6DA08 8007DA08 21204002 */  addu       $a0, $s2, $zero
    /* 6DA0C 8007DA0C 21300000 */  addu       $a2, $zero, $zero
    /* 6DA10 8007DA10 4000BFAF */  sw         $ra, 0x40($sp)
    /* 6DA14 8007DA14 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 6DA18 8007DA18 3800B6AF */  sw         $s6, 0x38($sp)
    /* 6DA1C 8007DA1C 3400B5AF */  sw         $s5, 0x34($sp)
    /* 6DA20 8007DA20 2400B1AF */  sw         $s1, 0x24($sp)
    /* 6DA24 8007DA24 2000B0AF */  sw         $s0, 0x20($sp)
    /* 6DA28 8007DA28 1E000381 */  lb         $v1, 0x1E($t0)
    /* 6DA2C 8007DA2C 5800B78F */  lw         $s7, 0x58($sp)
    /* 6DA30 8007DA30 5C00B58F */  lw         $s5, 0x5C($sp)
    /* 6DA34 8007DA34 C0100300 */  sll        $v0, $v1, 3
    /* 6DA38 8007DA38 21104300 */  addu       $v0, $v0, $v1
    /* 6DA3C 8007DA3C 40100200 */  sll        $v0, $v0, 1
    /* 6DA40 8007DA40 0E80013C */  lui        $at, %hi(AllObjects + 0x1)
    /* 6DA44 8007DA44 21082200 */  addu       $at, $at, $v0
    /* 6DA48 8007DA48 B1842280 */  lb         $v0, %lo(AllObjects + 0x1)($at)
    /* 6DA4C 8007DA4C 6000B68F */  lw         $s6, 0x60($sp)
    /* 6DA50 8007DA50 80100200 */  sll        $v0, $v0, 2
    /* 6DA54 8007DA54 1180013C */  lui        $at, %hi(ObjMasterLoadList)
    /* 6DA58 8007DA58 21082200 */  addu       $at, $at, $v0
    /* 6DA5C 8007DA5C F0693184 */  lh         $s1, %lo(ObjMasterLoadList)($at)
    /* 6DA60 8007DA60 21000281 */  lb         $v0, 0x21($t0)
    /* 6DA64 8007DA64 21282002 */  addu       $a1, $s1, $zero
    /* 6DA68 8007DA68 7DFB010C */  jal        GetNumOfFrames__7TextDatii_8007edf4
    /* 6DA6C 8007DA6C FFFF5024 */   addiu     $s0, $v0, -0x1
    /* 6DA70 8007DA70 2A100202 */  slt        $v0, $s0, $v0
    /* 6DA74 8007DA74 33004010 */  beqz       $v0, .L8007DB44
    /* 6DA78 8007DA78 21204002 */   addu      $a0, $s2, $zero
    /* 6DA7C 8007DA7C 21282002 */  addu       $a1, $s1, $zero
    /* 6DA80 8007DA80 21300000 */  addu       $a2, $zero, $zero
    /* 6DA84 8007DA84 21380000 */  addu       $a3, $zero, $zero
    /* 6DA88 8007DA88 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6DA8C 8007DA8C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 6DA90 8007DA90 21204002 */  addu       $a0, $s2, $zero
    /* 6DA94 8007DA94 21804000 */  addu       $s0, $v0, $zero
    /* 6DA98 8007DA98 21280002 */  addu       $a1, $s0, $zero
    /* 6DA9C 8007DA9C 21307502 */  addu       $a2, $s3, $s5
    /* 6DAA0 8007DAA0 21389602 */  addu       $a3, $s4, $s6
    /* 6DAA4 8007DAA4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6DAA8 8007DAA8 1400B7AF */  sw         $s7, 0x14($sp)
    /* 6DAAC 8007DAAC 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 6DAB0 8007DAB0 1800A0AF */   sw        $zero, 0x18($sp)
    /* 6DAB4 8007DAB4 21884000 */  addu       $s1, $v0, $zero
    /* 6DAB8 8007DAB8 21204002 */  addu       $a0, $s2, $zero
    /* 6DABC 8007DABC 07002292 */  lbu        $v0, 0x7($s1)
    /* 6DAC0 8007DAC0 21280002 */  addu       $a1, $s0, $zero
    /* 6DAC4 8007DAC4 FE004230 */  andi       $v0, $v0, 0xFE
    /* 6DAC8 8007DAC8 92FB010C */  jal        GetFr__7TextDati_8007ee48
    /* 6DACC 8007DACC 070022A2 */   sb        $v0, 0x7($s1)
    /* 6DAD0 8007DAD0 0400428C */  lw         $v0, 0x4($v0)
    /* 6DAD4 8007DAD4 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* 6DAD8 8007DAD8 24104300 */  and        $v0, $v0, $v1
    /* 6DADC 8007DADC 1B004010 */  beqz       $v0, .L8007DB4C
    /* 6DAE0 8007DAE0 21102002 */   addu      $v0, $s1, $zero
    /* 6DAE4 8007DAE4 45FB010C */  jal        PRIM_GetCopy__FP8POLY_FT4
    /* 6DAE8 8007DAE8 21202002 */   addu      $a0, $s1, $zero
    /* 6DAEC 8007DAEC 21804000 */  addu       $s0, $v0, $zero
    /* 6DAF0 8007DAF0 4C46020C */  jal        ShadScaleSkew__7CBlocksP8POLY_FT4
    /* 6DAF4 8007DAF4 21200002 */   addu      $a0, $s0, $zero
    /* 6DAF8 8007DAF8 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
    /* 6DAFC 8007DAFC FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 6DB00 8007DB00 80201700 */  sll        $a0, $s7, 2
    /* 6DB04 8007DB04 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 6DB08 8007DB08 1280023C */  lui        $v0, %hi(ThisOt)
    /* 6DB0C 8007DB0C B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 6DB10 8007DB10 0000038E */  lw         $v1, 0x0($s0)
    /* 6DB14 8007DB14 21208200 */  addu       $a0, $a0, $v0
    /* 6DB18 8007DB18 0000828C */  lw         $v0, 0x0($a0)
    /* 6DB1C 8007DB1C 24186600 */  and        $v1, $v1, $a2
    /* 6DB20 8007DB20 24104500 */  and        $v0, $v0, $a1
    /* 6DB24 8007DB24 25186200 */  or         $v1, $v1, $v0
    /* 6DB28 8007DB28 000003AE */  sw         $v1, 0x0($s0)
    /* 6DB2C 8007DB2C 0000828C */  lw         $v0, 0x0($a0)
    /* 6DB30 8007DB30 24800502 */  and        $s0, $s0, $a1
    /* 6DB34 8007DB34 24104600 */  and        $v0, $v0, $a2
    /* 6DB38 8007DB38 25105000 */  or         $v0, $v0, $s0
    /* 6DB3C 8007DB3C D2F60108 */  j          .L8007DB48
    /* 6DB40 8007DB40 000082AC */   sw        $v0, 0x0($a0)
  .L8007DB44:
    /* 6DB44 8007DB44 21880000 */  addu       $s1, $zero, $zero
  .L8007DB48:
    /* 6DB48 8007DB48 21102002 */  addu       $v0, $s1, $zero
  .L8007DB4C:
    /* 6DB4C 8007DB4C 4000BF8F */  lw         $ra, 0x40($sp)
    /* 6DB50 8007DB50 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 6DB54 8007DB54 3800B68F */  lw         $s6, 0x38($sp)
    /* 6DB58 8007DB58 3400B58F */  lw         $s5, 0x34($sp)
    /* 6DB5C 8007DB5C 3000B48F */  lw         $s4, 0x30($sp)
    /* 6DB60 8007DB60 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 6DB64 8007DB64 2800B28F */  lw         $s2, 0x28($sp)
    /* 6DB68 8007DB68 2400B18F */  lw         $s1, 0x24($sp)
    /* 6DB6C 8007DB6C 2000B08F */  lw         $s0, 0x20($sp)
    /* 6DB70 8007DB70 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 6DB74 8007DB74 0800E003 */  jr         $ra
    /* 6DB78 8007DB78 00000000 */   nop
endlabel DefaultObjPrint__FP12ObjectStructiiP7TextDatiii
