.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching openhandlea, 0x234

glabel openhandlea
    /* 18A18 80028A18 A0FEBD27 */  addiu      $sp, $sp, -0x160
    /* 18A1C 80028A1C 3C01B1AF */  sw         $s1, 0x13C($sp)
    /* 18A20 80028A20 21888000 */  addu       $s1, $a0, $zero
    /* 18A24 80028A24 4001B2AF */  sw         $s2, 0x140($sp)
    /* 18A28 80028A28 2190A000 */  addu       $s2, $a1, $zero
    /* 18A2C 80028A2C 5401B7AF */  sw         $s7, 0x154($sp)
    /* 18A30 80028A30 21B8C000 */  addu       $s7, $a2, $zero
    /* 18A34 80028A34 4801B4AF */  sw         $s4, 0x148($sp)
    /* 18A38 80028A38 21A0E000 */  addu       $s4, $a3, $zero
    /* 18A3C 80028A3C 4401B3AF */  sw         $s3, 0x144($sp)
    /* 18A40 80028A40 21980000 */  addu       $s3, $zero, $zero
    /* 18A44 80028A44 3801B0AF */  sw         $s0, 0x138($sp)
    /* 18A48 80028A48 0A001024 */  addiu      $s0, $zero, 0xA
    /* 18A4C 80028A4C 5001B6AF */  sw         $s6, 0x150($sp)
    /* 18A50 80028A50 21B00000 */  addu       $s6, $zero, $zero
    /* 18A54 80028A54 5801BEAF */  sw         $fp, 0x158($sp)
    /* 18A58 80028A58 7001BE8F */  lw         $fp, 0x170($sp)
    /* 18A5C 80028A5C 0B80043C */  lui        $a0, %hi(currentdirectory)
    /* 18A60 80028A60 84698424 */  addiu      $a0, $a0, %lo(currentdirectory)
    /* 18A64 80028A64 1280053C */  lui        $a1, %hi(D_8011C43C)
    /* 18A68 80028A68 3CC4A524 */  addiu      $a1, $a1, %lo(D_8011C43C)
    /* 18A6C 80028A6C 06000624 */  addiu      $a2, $zero, 0x6
    /* 18A70 80028A70 5C01BFAF */  sw         $ra, 0x15C($sp)
    /* 18A74 80028A74 4375000C */  jal        strncmp
    /* 18A78 80028A78 4C01B5AF */   sw        $s5, 0x14C($sp)
    /* 18A7C 80028A7C 0A004014 */  bnez       $v0, .L80028AA8
    /* 18A80 80028A80 21202002 */   addu      $a0, $s1, $zero
    /* 18A84 80028A84 21284002 */  addu       $a1, $s2, $zero
    /* 18A88 80028A88 2130E002 */  addu       $a2, $s7, $zero
    /* 18A8C 80028A8C 21388002 */  addu       $a3, $s4, $zero
    /* 18A90 80028A90 3001A227 */  addiu      $v0, $sp, 0x130
    /* 18A94 80028A94 1000A2AF */  sw         $v0, 0x10($sp)
    /* 18A98 80028A98 8B97000C */  jal        openblockhandlea
    /* 18A9C 80028A9C 1400BEAF */   sw        $fp, 0x14($sp)
    /* 18AA0 80028AA0 06A30008 */  j          .L80028C18
    /* 18AA4 80028AA4 00000000 */   nop
  .L80028AA8:
    /* 18AA8 80028AA8 5C000524 */  addiu      $a1, $zero, 0x5C
    /* 18AAC 80028AAC 000040AE */  sw         $zero, 0x0($s2)
    /* 18AB0 80028AB0 0000E0AE */  sw         $zero, 0x0($s7)
    /* 18AB4 80028AB4 1341000C */  jal        strchr
    /* 18AB8 80028AB8 000080AE */   sw        $zero, 0x0($s4)
    /* 18ABC 80028ABC 0E004014 */  bnez       $v0, .L80028AF8
    /* 18AC0 80028AC0 21202002 */   addu      $a0, $s1, $zero
    /* 18AC4 80028AC4 1341000C */  jal        strchr
    /* 18AC8 80028AC8 3A000524 */   addiu     $a1, $zero, 0x3A
    /* 18ACC 80028ACC 0A004014 */  bnez       $v0, .L80028AF8
    /* 18AD0 80028AD0 21202002 */   addu      $a0, $s1, $zero
    /* 18AD4 80028AD4 1800A427 */  addiu      $a0, $sp, 0x18
    /* 18AD8 80028AD8 1280053C */  lui        $a1, %hi(D_8011C448)
    /* 18ADC 80028ADC 48C4A524 */  addiu      $a1, $a1, %lo(D_8011C448)
    /* 18AE0 80028AE0 0B80063C */  lui        $a2, %hi(currentdirectory)
    /* 18AE4 80028AE4 8469C624 */  addiu      $a2, $a2, %lo(currentdirectory)
    /* 18AE8 80028AE8 9767000C */  jal        sprintf
    /* 18AEC 80028AEC 21382002 */   addu      $a3, $s1, $zero
    /* 18AF0 80028AF0 CCA20008 */  j          .L80028B30
    /* 18AF4 80028AF4 1800A427 */   addiu     $a0, $sp, 0x18
  .L80028AF8:
    /* 18AF8 80028AF8 1341000C */  jal        strchr
    /* 18AFC 80028AFC 3A000524 */   addiu     $a1, $zero, 0x3A
    /* 18B00 80028B00 07004014 */  bnez       $v0, .L80028B20
    /* 18B04 80028B04 1800A427 */   addiu     $a0, $sp, 0x18
    /* 18B08 80028B08 B41C828F */  lw         $v0, %gp_rel(D_8011C434)($gp)
    /* 18B0C 80028B0C B81C8383 */  lb         $v1, %gp_rel(D_8011C438)($gp)
    /* 18B10 80028B10 1800A2AF */  sw         $v0, 0x18($sp)
    /* 18B14 80028B14 1C00A3A3 */  sb         $v1, 0x1C($sp)
    /* 18B18 80028B18 C9A20008 */  j          .L80028B24
    /* 18B1C 80028B1C 1800A427 */   addiu     $a0, $sp, 0x18
  .L80028B20:
    /* 18B20 80028B20 1800A0A3 */  sb         $zero, 0x18($sp)
  .L80028B24:
    /* 18B24 80028B24 FC40000C */  jal        strcat
    /* 18B28 80028B28 21282002 */   addu      $a1, $s1, $zero
    /* 18B2C 80028B2C 1800A427 */  addiu      $a0, $sp, 0x18
  .L80028B30:
    /* 18B30 80028B30 6F46000C */  jal        open
    /* 18B34 80028B34 01000524 */   addiu     $a1, $zero, 0x1
    /* 18B38 80028B38 09004018 */  blez       $v0, .L80028B60
    /* 18B3C 80028B3C 000042AE */   sw        $v0, 0x0($s2)
    /* 18B40 80028B40 01A2000C */  jal        PCfilelen
    /* 18B44 80028B44 21204000 */   addu      $a0, $v0, $zero
    /* 18B48 80028B48 0000448E */  lw         $a0, 0x0($s2)
    /* 18B4C 80028B4C 21984000 */  addu       $s3, $v0, $zero
    /* 18B50 80028B50 21280000 */  addu       $a1, $zero, $zero
    /* 18B54 80028B54 DBA3000C */  jal        lseek
    /* 18B58 80028B58 21300000 */   addu      $a2, $zero, $zero
    /* 18B5C 80028B5C 21A84000 */  addu       $s5, $v0, $zero
  .L80028B60:
    /* 18B60 80028B60 03006012 */  beqz       $s3, .L80028B70
    /* 18B64 80028B64 00000000 */   nop
    /* 18B68 80028B68 1F00A012 */  beqz       $s5, .L80028BE8
    /* 18B6C 80028B6C 0A000224 */   addiu     $v0, $zero, 0xA
  .L80028B70:
    /* 18B70 80028B70 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 18B74 80028B74 0E000016 */  bnez       $s0, .L80028BB0
    /* 18B78 80028B78 00000000 */   nop
    /* 18B7C 80028B7C 0C00C013 */  beqz       $fp, .L80028BB0
    /* 18B80 80028B80 00000000 */   nop
    /* 18B84 80028B84 1180043C */  lui        $a0, %hi(D_8010F16C)
    /* 18B88 80028B88 6CF18424 */  addiu      $a0, $a0, %lo(D_8010F16C)
    /* 18B8C 80028B8C 1180023C */  lui        $v0, %hi(D_8010F130)
    /* 18B90 80028B90 30F14224 */  addiu      $v0, $v0, %lo(D_8010F130)
    /* 18B94 80028B94 1280013C */  lui        $at, %hi(abortfile)
    /* 18B98 80028B98 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 18B9C 80028B9C 68010224 */  addiu      $v0, $zero, 0x168
    /* 18BA0 80028BA0 1280013C */  lui        $at, %hi(abortline)
    /* 18BA4 80028BA4 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 18BA8 80028BA8 0F95000C */  jal        abortmessage
    /* 18BAC 80028BAC 1800A527 */   addiu     $a1, $sp, 0x18
  .L80028BB0:
    /* 18BB0 80028BB0 0000448E */  lw         $a0, 0x0($s2)
    /* 18BB4 80028BB4 00000000 */  nop
    /* 18BB8 80028BB8 03008018 */  blez       $a0, .L80028BC8
    /* 18BBC 80028BBC 00000000 */   nop
    /* 18BC0 80028BC0 76A3000C */  jal        libclosehandle
    /* 18BC4 80028BC4 00000000 */   nop
  .L80028BC8:
    /* 18BC8 80028BC8 000040AE */  sw         $zero, 0x0($s2)
    /* 18BCC 80028BCC 21980000 */  addu       $s3, $zero, $zero
    /* 18BD0 80028BD0 1180043C */  lui        $a0, %hi(D_8010F18C)
    /* 18BD4 80028BD4 8CF18424 */  addiu      $a0, $a0, %lo(D_8010F18C)
    /* 18BD8 80028BD8 5F97000C */  jal        print
    /* 18BDC 80028BDC 1800A527 */   addiu     $a1, $sp, 0x18
    /* 18BE0 80028BE0 02A30008 */  j          .L80028C08
    /* 18BE4 80028BE4 00000000 */   nop
  .L80028BE8:
    /* 18BE8 80028BE8 06000212 */  beq        $s0, $v0, .L80028C04
    /* 18BEC 80028BEC 21800000 */   addu      $s0, $zero, $zero
    /* 18BF0 80028BF0 1180043C */  lui        $a0, %hi(D_8010F1B0)
    /* 18BF4 80028BF4 B0F18424 */  addiu      $a0, $a0, %lo(D_8010F1B0)
    /* 18BF8 80028BF8 5F97000C */  jal        print
    /* 18BFC 80028BFC 1800A527 */   addiu     $a1, $sp, 0x18
    /* 18C00 80028C00 21800000 */  addu       $s0, $zero, $zero
  .L80028C04:
    /* 18C04 80028C04 01001624 */  addiu      $s6, $zero, 0x1
  .L80028C08:
    /* 18C08 80028C08 A7FF0016 */  bnez       $s0, .L80028AA8
    /* 18C0C 80028C0C 21202002 */   addu      $a0, $s1, $zero
    /* 18C10 80028C10 000093AE */  sw         $s3, 0x0($s4)
    /* 18C14 80028C14 2110C002 */  addu       $v0, $s6, $zero
  .L80028C18:
    /* 18C18 80028C18 5C01BF8F */  lw         $ra, 0x15C($sp)
    /* 18C1C 80028C1C 5801BE8F */  lw         $fp, 0x158($sp)
    /* 18C20 80028C20 5401B78F */  lw         $s7, 0x154($sp)
    /* 18C24 80028C24 5001B68F */  lw         $s6, 0x150($sp)
    /* 18C28 80028C28 4C01B58F */  lw         $s5, 0x14C($sp)
    /* 18C2C 80028C2C 4801B48F */  lw         $s4, 0x148($sp)
    /* 18C30 80028C30 4401B38F */  lw         $s3, 0x144($sp)
    /* 18C34 80028C34 4001B28F */  lw         $s2, 0x140($sp)
    /* 18C38 80028C38 3C01B18F */  lw         $s1, 0x13C($sp)
    /* 18C3C 80028C3C 3801B08F */  lw         $s0, 0x138($sp)
    /* 18C40 80028C40 6001BD27 */  addiu      $sp, $sp, 0x160
    /* 18C44 80028C44 0800E003 */  jr         $ra
    /* 18C48 80028C48 00000000 */   nop
endlabel openhandlea
