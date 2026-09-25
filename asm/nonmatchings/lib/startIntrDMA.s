.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching startIntrDMA, 0x278

glabel startIntrDMA
    /* 2AAC 80012AAC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2AB0 80012AB0 0B80043C */  lui        $a0, %hi(D_800B5420)
    /* 2AB4 80012AB4 20548424 */  addiu      $a0, $a0, %lo(D_800B5420)
    /* 2AB8 80012AB8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2ABC 80012ABC 494B000C */  jal        func_80012D24
    /* 2AC0 80012AC0 08000524 */   addiu     $a1, $zero, 0x8
    /* 2AC4 80012AC4 03000424 */  addiu      $a0, $zero, 0x3
    /* 2AC8 80012AC8 0B80023C */  lui        $v0, %hi(D_800B541C)
    /* 2ACC 80012ACC 1C54428C */  lw         $v0, %lo(D_800B541C)($v0)
    /* 2AD0 80012AD0 0180053C */  lui        $a1, %hi(D_80012AF8)
    /* 2AD4 80012AD4 F82AA524 */  addiu      $a1, $a1, %lo(D_80012AF8)
    /* 2AD8 80012AD8 AB48000C */  jal        InterruptCallback
    /* 2ADC 80012ADC 000040AC */   sw        $zero, 0x0($v0)
    /* 2AE0 80012AE0 0180023C */  lui        $v0, %hi(D_80012C78)
    /* 2AE4 80012AE4 782C4224 */  addiu      $v0, $v0, %lo(D_80012C78)
    /* 2AE8 80012AE8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2AEC 80012AEC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2AF0 80012AF0 0800E003 */  jr         $ra
    /* 2AF4 80012AF4 00000000 */   nop
  alabel D_80012AF8
    /* 2AF8 80012AF8 0B80023C */  lui        $v0, %hi(D_800B541C)
    /* 2AFC 80012AFC 1C54428C */  lw         $v0, %lo(D_800B541C)($v0)
    /* 2B00 80012B00 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 2B04 80012B04 2800BFAF */  sw         $ra, 0x28($sp)
    /* 2B08 80012B08 2400B5AF */  sw         $s5, 0x24($sp)
    /* 2B0C 80012B0C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 2B10 80012B10 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 2B14 80012B14 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2B18 80012B18 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2B1C 80012B1C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2B20 80012B20 0000428C */  lw         $v0, 0x0($v0)
    /* 2B24 80012B24 00000000 */  nop
    /* 2B28 80012B28 02160200 */  srl        $v0, $v0, 24
    /* 2B2C 80012B2C 7F005130 */  andi       $s1, $v0, 0x7F
    /* 2B30 80012B30 28002012 */  beqz       $s1, .L80012BD4
    /* 2B34 80012B34 00000000 */   nop
    /* 2B38 80012B38 01001424 */  addiu      $s4, $zero, 0x1
    /* 2B3C 80012B3C FF00133C */  lui        $s3, (0xFFFFFF >> 16)
    /* 2B40 80012B40 FFFF7336 */  ori        $s3, $s3, (0xFFFFFF & 0xFFFF)
    /* 2B44 80012B44 0B80153C */  lui        $s5, %hi(D_800B5420)
    /* 2B48 80012B48 2054B526 */  addiu      $s5, $s5, %lo(D_800B5420)
  .L80012B4C:
    /* 2B4C 80012B4C 18002012 */  beqz       $s1, .L80012BB0
    /* 2B50 80012B50 21800000 */   addu      $s0, $zero, $zero
    /* 2B54 80012B54 2190A002 */  addu       $s2, $s5, $zero
  .L80012B58:
    /* 2B58 80012B58 0700022A */  slti       $v0, $s0, 0x7
    /* 2B5C 80012B5C 14004010 */  beqz       $v0, .L80012BB0
    /* 2B60 80012B60 01002232 */   andi      $v0, $s1, 0x1
    /* 2B64 80012B64 0E004010 */  beqz       $v0, .L80012BA0
    /* 2B68 80012B68 18000226 */   addiu     $v0, $s0, 0x18
    /* 2B6C 80012B6C 0B80043C */  lui        $a0, %hi(D_800B541C)
    /* 2B70 80012B70 1C54848C */  lw         $a0, %lo(D_800B541C)($a0)
    /* 2B74 80012B74 04105400 */  sllv       $v0, $s4, $v0
    /* 2B78 80012B78 0000838C */  lw         $v1, 0x0($a0)
    /* 2B7C 80012B7C 25105300 */  or         $v0, $v0, $s3
    /* 2B80 80012B80 24186200 */  and        $v1, $v1, $v0
    /* 2B84 80012B84 000083AC */  sw         $v1, 0x0($a0)
    /* 2B88 80012B88 0000428E */  lw         $v0, 0x0($s2)
    /* 2B8C 80012B8C 00000000 */  nop
    /* 2B90 80012B90 03004010 */  beqz       $v0, .L80012BA0
    /* 2B94 80012B94 00000000 */   nop
    /* 2B98 80012B98 09F84000 */  jalr       $v0
    /* 2B9C 80012B9C 00000000 */   nop
  .L80012BA0:
    /* 2BA0 80012BA0 04005226 */  addiu      $s2, $s2, 0x4
    /* 2BA4 80012BA4 42881100 */  srl        $s1, $s1, 1
    /* 2BA8 80012BA8 EBFF2016 */  bnez       $s1, .L80012B58
    /* 2BAC 80012BAC 01001026 */   addiu     $s0, $s0, 0x1
  .L80012BB0:
    /* 2BB0 80012BB0 0B80023C */  lui        $v0, %hi(D_800B541C)
    /* 2BB4 80012BB4 1C54428C */  lw         $v0, %lo(D_800B541C)($v0)
    /* 2BB8 80012BB8 00000000 */  nop
    /* 2BBC 80012BBC 0000428C */  lw         $v0, 0x0($v0)
    /* 2BC0 80012BC0 00000000 */  nop
    /* 2BC4 80012BC4 02160200 */  srl        $v0, $v0, 24
    /* 2BC8 80012BC8 7F005130 */  andi       $s1, $v0, 0x7F
    /* 2BCC 80012BCC DFFF2016 */  bnez       $s1, .L80012B4C
    /* 2BD0 80012BD0 00000000 */   nop
  .L80012BD4:
    /* 2BD4 80012BD4 0B80053C */  lui        $a1, %hi(D_800B541C)
    /* 2BD8 80012BD8 1C54A58C */  lw         $a1, %lo(D_800B541C)($a1)
    /* 2BDC 80012BDC 00000000 */  nop
    /* 2BE0 80012BE0 0000A28C */  lw         $v0, 0x0($a1)
    /* 2BE4 80012BE4 00FF033C */  lui        $v1, (0xFF000000 >> 16)
    /* 2BE8 80012BE8 24104300 */  and        $v0, $v0, $v1
    /* 2BEC 80012BEC 0080033C */  lui        $v1, (0x80000000 >> 16)
    /* 2BF0 80012BF0 06004310 */  beq        $v0, $v1, .L80012C0C
    /* 2BF4 80012BF4 00000000 */   nop
    /* 2BF8 80012BF8 0000A28C */  lw         $v0, 0x0($a1)
    /* 2BFC 80012BFC 00000000 */  nop
    /* 2C00 80012C00 00804230 */  andi       $v0, $v0, 0x8000
    /* 2C04 80012C04 13004010 */  beqz       $v0, .L80012C54
    /* 2C08 80012C08 00000000 */   nop
  .L80012C0C:
    /* 2C0C 80012C0C 1180043C */  lui        $a0, %hi(D_8010DD78)
    /* 2C10 80012C10 78DD8424 */  addiu      $a0, $a0, %lo(D_8010DD78)
    /* 2C14 80012C14 0000A58C */  lw         $a1, 0x0($a1)
    /* 2C18 80012C18 9367000C */  jal        printf
    /* 2C1C 80012C1C 21800000 */   addu      $s0, $zero, $zero
  .L80012C20:
    /* 2C20 80012C20 1180043C */  lui        $a0, %hi(D_8010DD94)
    /* 2C24 80012C24 94DD8424 */  addiu      $a0, $a0, %lo(D_8010DD94)
    /* 2C28 80012C28 21280002 */  addu       $a1, $s0, $zero
    /* 2C2C 80012C2C 0B80023C */  lui        $v0, %hi(D_800B5440)
    /* 2C30 80012C30 4054428C */  lw         $v0, %lo(D_800B5440)($v0)
    /* 2C34 80012C34 00191000 */  sll        $v1, $s0, 4
    /* 2C38 80012C38 21186200 */  addu       $v1, $v1, $v0
    /* 2C3C 80012C3C 0000668C */  lw         $a2, 0x0($v1)
    /* 2C40 80012C40 9367000C */  jal        printf
    /* 2C44 80012C44 01001026 */   addiu     $s0, $s0, 0x1
    /* 2C48 80012C48 0700022A */  slti       $v0, $s0, 0x7
    /* 2C4C 80012C4C F4FF4014 */  bnez       $v0, .L80012C20
    /* 2C50 80012C50 00000000 */   nop
  .L80012C54:
    /* 2C54 80012C54 2800BF8F */  lw         $ra, 0x28($sp)
    /* 2C58 80012C58 2400B58F */  lw         $s5, 0x24($sp)
    /* 2C5C 80012C5C 2000B48F */  lw         $s4, 0x20($sp)
    /* 2C60 80012C60 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 2C64 80012C64 1800B28F */  lw         $s2, 0x18($sp)
    /* 2C68 80012C68 1400B18F */  lw         $s1, 0x14($sp)
    /* 2C6C 80012C6C 1000B08F */  lw         $s0, 0x10($sp)
    /* 2C70 80012C70 0800E003 */  jr         $ra
    /* 2C74 80012C74 3000BD27 */   addiu     $sp, $sp, 0x30
  alabel D_80012C78
    /* 2C78 80012C78 21308000 */  addu       $a2, $a0, $zero
    /* 2C7C 80012C7C 0B80033C */  lui        $v1, %hi(D_800B5420)
    /* 2C80 80012C80 20546324 */  addiu      $v1, $v1, %lo(D_800B5420)
    /* 2C84 80012C84 80100600 */  sll        $v0, $a2, 2
    /* 2C88 80012C88 21184300 */  addu       $v1, $v0, $v1
    /* 2C8C 80012C8C 0000678C */  lw         $a3, 0x0($v1)
    /* 2C90 80012C90 2120A000 */  addu       $a0, $a1, $zero
    /* 2C94 80012C94 21008710 */  beq        $a0, $a3, .L80012D1C
    /* 2C98 80012C98 2110E000 */   addu      $v0, $a3, $zero
    /* 2C9C 80012C9C 10008010 */  beqz       $a0, .L80012CE0
    /* 2CA0 80012CA0 FF00023C */   lui       $v0, (0xFFFFFF >> 16)
    /* 2CA4 80012CA4 0B80053C */  lui        $a1, %hi(D_800B541C)
    /* 2CA8 80012CA8 1C54A58C */  lw         $a1, %lo(D_800B541C)($a1)
    /* 2CAC 80012CAC FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
    /* 2CB0 80012CB0 000064AC */  sw         $a0, 0x0($v1)
    /* 2CB4 80012CB4 0000A48C */  lw         $a0, 0x0($a1)
    /* 2CB8 80012CB8 1000C324 */  addiu      $v1, $a2, 0x10
    /* 2CBC 80012CBC 24208200 */  and        $a0, $a0, $v0
    /* 2CC0 80012CC0 01000224 */  addiu      $v0, $zero, 0x1
    /* 2CC4 80012CC4 04106200 */  sllv       $v0, $v0, $v1
    /* 2CC8 80012CC8 8000033C */  lui        $v1, (0x800000 >> 16)
    /* 2CCC 80012CCC 25104300 */  or         $v0, $v0, $v1
    /* 2CD0 80012CD0 25208200 */  or         $a0, $a0, $v0
    /* 2CD4 80012CD4 0000A4AC */  sw         $a0, 0x0($a1)
    /* 2CD8 80012CD8 474B0008 */  j          .L80012D1C
    /* 2CDC 80012CDC 2110E000 */   addu      $v0, $a3, $zero
  .L80012CE0:
    /* 2CE0 80012CE0 0B80053C */  lui        $a1, %hi(D_800B541C)
    /* 2CE4 80012CE4 1C54A58C */  lw         $a1, %lo(D_800B541C)($a1)
    /* 2CE8 80012CE8 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
    /* 2CEC 80012CEC 000060AC */  sw         $zero, 0x0($v1)
    /* 2CF0 80012CF0 0000A38C */  lw         $v1, 0x0($a1)
    /* 2CF4 80012CF4 1000C424 */  addiu      $a0, $a2, 0x10
    /* 2CF8 80012CF8 24186200 */  and        $v1, $v1, $v0
    /* 2CFC 80012CFC 8000023C */  lui        $v0, (0x800000 >> 16)
    /* 2D00 80012D00 25186200 */  or         $v1, $v1, $v0
    /* 2D04 80012D04 01000224 */  addiu      $v0, $zero, 0x1
    /* 2D08 80012D08 04108200 */  sllv       $v0, $v0, $a0
    /* 2D0C 80012D0C 27100200 */  nor        $v0, $zero, $v0
    /* 2D10 80012D10 24186200 */  and        $v1, $v1, $v0
    /* 2D14 80012D14 0000A3AC */  sw         $v1, 0x0($a1)
    /* 2D18 80012D18 2110E000 */  addu       $v0, $a3, $zero
  .L80012D1C:
    /* 2D1C 80012D1C 0800E003 */  jr         $ra
    /* 2D20 80012D20 00000000 */   nop
endlabel startIntrDMA
