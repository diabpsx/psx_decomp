.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching psxcdromasyncread, 0x17C

glabel psxcdromasyncread
    /* 17AC8 80027AC8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 17ACC 80027ACC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 17AD0 80027AD0 21888000 */  addu       $s1, $a0, $zero
    /* 17AD4 80027AD4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 17AD8 80027AD8 2190A000 */  addu       $s2, $a1, $zero
    /* 17ADC 80027ADC 03002232 */  andi       $v0, $s1, 0x3
    /* 17AE0 80027AE0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 17AE4 80027AE4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 17AE8 80027AE8 0C004010 */  beqz       $v0, .L80027B1C
    /* 17AEC 80027AEC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 17AF0 80027AF0 1180043C */  lui        $a0, %hi(D_8010EFE0)
    /* 17AF4 80027AF4 E0EF8424 */  addiu      $a0, $a0, %lo(D_8010EFE0)
    /* 17AF8 80027AF8 1180023C */  lui        $v0, %hi(D_8010EF20)
    /* 17AFC 80027AFC 20EF4224 */  addiu      $v0, $v0, %lo(D_8010EF20)
    /* 17B00 80027B00 1280013C */  lui        $at, %hi(abortfile)
    /* 17B04 80027B04 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 17B08 80027B08 AF030224 */  addiu      $v0, $zero, 0x3AF
    /* 17B0C 80027B0C 1280013C */  lui        $at, %hi(abortline)
    /* 17B10 80027B10 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 17B14 80027B14 0F95000C */  jal        abortmessage
    /* 17B18 80027B18 00000000 */   nop
  .L80027B1C:
    /* 17B1C 80027B1C 741C828F */  lw         $v0, %gp_rel(asynctimerflag)($gp)
    /* 17B20 80027B20 00000000 */  nop
    /* 17B24 80027B24 06004014 */  bnez       $v0, .L80027B40
    /* 17B28 80027B28 01000224 */   addiu     $v0, $zero, 0x1
    /* 17B2C 80027B2C 741C82AF */  sw         $v0, %gp_rel(asynctimerflag)($gp)
    /* 17B30 80027B30 0280043C */  lui        $a0, %hi(asynctimer)
    /* 17B34 80027B34 70768424 */  addiu      $a0, $a0, %lo(asynctimer)
    /* 17B38 80027B38 FDBE000C */  jal        addtimer
    /* 17B3C 80027B3C 00000000 */   nop
  .L80027B40:
    /* 17B40 80027B40 1480133C */  lui        $s3, %hi(cdrombufsector)
    /* 17B44 80027B44 E09B7326 */  addiu      $s3, $s3, %lo(cdrombufsector)
    /* 17B48 80027B48 21800000 */  addu       $s0, $zero, $zero
  .L80027B4C:
    /* 17B4C 80027B4C 21206002 */  addu       $a0, $s3, $zero
  .L80027B50:
    /* 17B50 80027B50 0000838C */  lw         $v1, 0x0($a0)
    /* 17B54 80027B54 E422828F */  lw         $v0, %gp_rel(asyncsector)($gp)
    /* 17B58 80027B58 00000000 */  nop
    /* 17B5C 80027B5C 06006210 */  beq        $v1, $v0, .L80027B78
    /* 17B60 80027B60 04000224 */   addiu     $v0, $zero, 0x4
    /* 17B64 80027B64 01001026 */  addiu      $s0, $s0, 0x1
    /* 17B68 80027B68 0400022A */  slti       $v0, $s0, 0x4
    /* 17B6C 80027B6C F8FF4014 */  bnez       $v0, .L80027B50
    /* 17B70 80027B70 04008424 */   addiu     $a0, $a0, 0x4
    /* 17B74 80027B74 04000224 */  addiu      $v0, $zero, 0x4
  .L80027B78:
    /* 17B78 80027B78 0B000216 */  bne        $s0, $v0, .L80027BA8
    /* 17B7C 80027B7C 00000000 */   nop
    /* 17B80 80027B80 A66C000C */  jal        CdDataSync
    /* 17B84 80027B84 21200000 */   addu      $a0, $zero, $zero
    /* 17B88 80027B88 03001024 */  addiu      $s0, $zero, 0x3
    /* 17B8C 80027B8C 0C006226 */  addiu      $v0, $s3, 0xC
  .L80027B90:
    /* 17B90 80027B90 000040AC */  sw         $zero, 0x0($v0)
    /* 17B94 80027B94 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 17B98 80027B98 FDFF0106 */  bgez       $s0, .L80027B90
    /* 17B9C 80027B9C FCFF4224 */   addiu     $v0, $v0, -0x4
    /* 17BA0 80027BA0 049F0008 */  j          .L80027C10
    /* 17BA4 80027BA4 00000000 */   nop
  .L80027BA8:
    /* 17BA8 80027BA8 A66C000C */  jal        CdDataSync
    /* 17BAC 80027BAC 21200000 */   addu      $a0, $zero, $zero
    /* 17BB0 80027BB0 80801000 */  sll        $s0, $s0, 2
    /* 17BB4 80027BB4 0B80013C */  lui        $at, %hi(cdrombufadr)
    /* 17BB8 80027BB8 21083000 */  addu       $at, $at, $s0
    /* 17BBC 80027BBC F468248C */  lw         $a0, %lo(cdrombufadr)($at)
    /* 17BC0 80027BC0 21282002 */  addu       $a1, $s1, $zero
    /* 17BC4 80027BC4 F1B1000C */  jal        blockmove
    /* 17BC8 80027BC8 00080624 */   addiu     $a2, $zero, 0x800
    /* 17BCC 80027BCC E422828F */  lw         $v0, %gp_rel(asyncsector)($gp)
    /* 17BD0 80027BD0 00083126 */  addiu      $s1, $s1, 0x800
    /* 17BD4 80027BD4 FFFF5226 */  addiu      $s2, $s2, -0x1
    /* 17BD8 80027BD8 21801302 */  addu       $s0, $s0, $s3
    /* 17BDC 80027BDC 000000AE */  sw         $zero, 0x0($s0)
    /* 17BE0 80027BE0 01004224 */  addiu      $v0, $v0, 0x1
    /* 17BE4 80027BE4 E42282AF */  sw         $v0, %gp_rel(asyncsector)($gp)
    /* 17BE8 80027BE8 E422828F */  lw         $v0, %gp_rel(asyncsector)($gp)
    /* 17BEC 80027BEC D7FF401E */  bgtz       $s2, .L80027B4C
    /* 17BF0 80027BF0 21800000 */   addu      $s0, $zero, $zero
    /* 17BF4 80027BF4 D422828F */  lw         $v0, %gp_rel(asyncreadcallbackfunc)($gp)
    /* 17BF8 80027BF8 CC2291AF */  sw         $s1, %gp_rel(asyncmemadr)($gp)
    /* 17BFC 80027BFC 0C2392AF */  sw         $s2, %gp_rel(asyncsectors)($gp)
    /* 17C00 80027C00 09F84000 */  jalr       $v0
    /* 17C04 80027C04 21200000 */   addu      $a0, $zero, $zero
    /* 17C08 80027C08 099F0008 */  j          .L80027C24
    /* 17C0C 80027C0C 00000000 */   nop
  .L80027C10:
    /* 17C10 80027C10 CC2291AF */  sw         $s1, %gp_rel(asyncmemadr)($gp)
    /* 17C14 80027C14 0C2392AF */  sw         $s2, %gp_rel(asyncsectors)($gp)
    /* 17C18 80027C18 02004012 */  beqz       $s2, .L80027C24
    /* 17C1C 80027C1C 20030224 */   addiu     $v0, $zero, 0x320
    /* 17C20 80027C20 781C82AF */  sw         $v0, %gp_rel(asynctimeout)($gp)
  .L80027C24:
    /* 17C24 80027C24 2000BF8F */  lw         $ra, 0x20($sp)
    /* 17C28 80027C28 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 17C2C 80027C2C 1800B28F */  lw         $s2, 0x18($sp)
    /* 17C30 80027C30 1400B18F */  lw         $s1, 0x14($sp)
    /* 17C34 80027C34 1000B08F */  lw         $s0, 0x10($sp)
    /* 17C38 80027C38 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 17C3C 80027C3C 0800E003 */  jr         $ra
    /* 17C40 80027C40 00000000 */   nop
endlabel psxcdromasyncread
