.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_AsyncWeeTASK__FP4TASK, 0x2D8

glabel STR_AsyncWeeTASK__FP4TASK
    /* 899AC 800999AC C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 899B0 800999B0 3800BFAF */  sw         $ra, 0x38($sp)
    /* 899B4 800999B4 3400B5AF */  sw         $s5, 0x34($sp)
    /* 899B8 800999B8 3000B4AF */  sw         $s4, 0x30($sp)
    /* 899BC 800999BC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 899C0 800999C0 2800B2AF */  sw         $s2, 0x28($sp)
    /* 899C4 800999C4 2400B1AF */  sw         $s1, 0x24($sp)
    /* 899C8 800999C8 2000B0AF */  sw         $s0, 0x20($sp)
    /* 899CC 800999CC 1C00828C */  lw         $v0, 0x1C($a0)
    /* 899D0 800999D0 1000A427 */  addiu      $a0, $sp, 0x10
    /* 899D4 800999D4 0400508C */  lw         $s0, 0x4($v0)
    /* 899D8 800999D8 0000548C */  lw         $s4, 0x0($v0)
    /* 899DC 800999DC F240000C */  jal        strcpy
    /* 899E0 800999E0 74000526 */   addiu     $a1, $s0, 0x74
    /* 899E4 800999E4 21208002 */  addu       $a0, $s4, $zero
    /* 899E8 800999E8 D56A020C */  jal        AS_OpenStream__FP6STRHDRP6SFXHDR
    /* 899EC 800999EC 21280002 */   addu      $a1, $s0, $zero
    /* 899F0 800999F0 21A84000 */  addu       $s5, $v0, $zero
    /* 899F4 800999F4 01000224 */  addiu      $v0, $zero, 0x1
    /* 899F8 800999F8 040002AE */  sw         $v0, 0x4($s0)
    /* 899FC 800999FC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 89A00 80099A00 0D00A216 */  bne        $s5, $v0, .L80099A38
    /* 89A04 80099A04 080014AE */   sw        $s4, 0x8($s0)
    /* 89A08 80099A08 1180023C */  lui        $v0, %hi(D_80110900)
    /* 89A0C 80099A0C 00094224 */  addiu      $v0, $v0, %lo(D_80110900)
    /* 89A10 80099A10 92004010 */  beqz       $v0, .L80099C5C
    /* 89A14 80099A14 21200000 */   addu      $a0, $zero, $zero
    /* 89A18 80099A18 1180053C */  lui        $a1, %hi(D_801108B4)
    /* 89A1C 80099A1C B408A524 */  addiu      $a1, $a1, %lo(D_801108B4)
    /* 89A20 80099A20 A583000C */  jal        DBG_Error
    /* 89A24 80099A24 8E040624 */   addiu     $a2, $zero, 0x48E
    /* 89A28 80099A28 17670208 */  j          .L80099C5C
    /* 89A2C 80099A2C 00000000 */   nop
  .L80099A30:
    /* 89A30 80099A30 0D670208 */  j          .L80099C34
    /* 89A34 80099A34 040000AE */   sw        $zero, 0x4($s0)
  .L80099A38:
    /* 89A38 80099A38 21880000 */  addu       $s1, $zero, $zero
    /* 89A3C 80099A3C 6C0000AE */  sw         $zero, 0x6C($s0)
    /* 89A40 80099A40 00161100 */  sll        $v0, $s1, 24
  .L80099A44:
    /* 89A44 80099A44 7B004014 */  bnez       $v0, .L80099C34
    /* 89A48 80099A48 1000A427 */   addiu     $a0, $sp, 0x10
    /* 89A4C 80099A4C 7F67000C */  jal        strcmp
    /* 89A50 80099A50 74000526 */   addiu     $a1, $s0, 0x74
    /* 89A54 80099A54 F6FF4014 */  bnez       $v0, .L80099A30
    /* 89A58 80099A58 00000000 */   nop
    /* 89A5C 80099A5C 1D65020C */  jal        STR_Command__FP6SFXHDR
    /* 89A60 80099A60 21200002 */   addu      $a0, $s0, $zero
    /* 89A64 80099A64 3E10020C */  jal        VID_GetTick__Fv
    /* 89A68 80099A68 21884000 */   addu      $s1, $v0, $zero
    /* 89A6C 80099A6C 4400038E */  lw         $v1, 0x44($s0)
    /* 89A70 80099A70 21984000 */  addu       $s3, $v0, $zero
    /* 89A74 80099A74 23906302 */  subu       $s2, $s3, $v1
    /* 89A78 80099A78 02004106 */  bgez       $s2, .L80099A84
    /* 89A7C 80099A7C 00000000 */   nop
    /* 89A80 80099A80 23901200 */  negu       $s2, $s2
  .L80099A84:
    /* 89A84 80099A84 6400028E */  lw         $v0, 0x64($s0)
    /* 89A88 80099A88 00000000 */  nop
    /* 89A8C 80099A8C 0300401C */  bgtz       $v0, .L80099A9C
    /* 89A90 80099A90 00161100 */   sll       $v0, $s1, 24
    /* 89A94 80099A94 01001124 */  addiu      $s1, $zero, 0x1
    /* 89A98 80099A98 00161100 */  sll        $v0, $s1, 24
  .L80099A9C:
    /* 89A9C 80099A9C 18004010 */  beqz       $v0, .L80099B00
    /* 89AA0 80099AA0 08000224 */   addiu     $v0, $zero, 0x8
    /* 89AA4 80099AA4 03000382 */  lb         $v1, 0x3($s0)
    /* 89AA8 80099AA8 00000000 */  nop
    /* 89AAC 80099AAC 13006210 */  beq        $v1, $v0, .L80099AFC
    /* 89AB0 80099AB0 21880000 */   addu      $s1, $zero, $zero
    /* 89AB4 80099AB4 5800028E */  lw         $v0, 0x58($s0)
    /* 89AB8 80099AB8 3C00038E */  lw         $v1, 0x3C($s0)
    /* 89ABC 80099ABC 3000048E */  lw         $a0, 0x30($s0)
    /* 89AC0 80099AC0 01004224 */  addiu      $v0, $v0, 0x1
    /* 89AC4 80099AC4 2A186400 */  slt        $v1, $v1, $a0
    /* 89AC8 80099AC8 05006010 */  beqz       $v1, .L80099AE0
    /* 89ACC 80099ACC 580002AE */   sw        $v0, 0x58($s0)
    /* 89AD0 80099AD0 1400028E */  lw         $v0, 0x14($s0)
    /* 89AD4 80099AD4 00000000 */  nop
    /* 89AD8 80099AD8 0900401C */  bgtz       $v0, .L80099B00
    /* 89ADC 80099ADC 00000000 */   nop
  .L80099AE0:
    /* 89AE0 80099AE0 21200002 */  addu       $a0, $s0, $zero
    /* 89AE4 80099AE4 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 89AE8 80099AE8 08000524 */   addiu     $a1, $zero, 0x8
    /* 89AEC 80099AEC 1180053C */  lui        $a1, %hi(D_80110918)
    /* 89AF0 80099AF0 1809A524 */  addiu      $a1, $a1, %lo(D_80110918)
    /* 89AF4 80099AF4 BE62020C */  jal        STR_Debug__FP6SFXHDRPce
    /* 89AF8 80099AF8 21200002 */   addu      $a0, $s0, $zero
  .L80099AFC:
    /* 89AFC 80099AFC 01001124 */  addiu      $s1, $zero, 0x1
  .L80099B00:
    /* 89B00 80099B00 03000382 */  lb         $v1, 0x3($s0)
    /* 89B04 80099B04 03000224 */  addiu      $v0, $zero, 0x3
    /* 89B08 80099B08 45006210 */  beq        $v1, $v0, .L80099C20
    /* 89B0C 80099B0C 00161100 */   sll       $v0, $s1, 24
    /* 89B10 80099B10 43004014 */  bnez       $v0, .L80099C20
    /* 89B14 80099B14 00000000 */   nop
    /* 89B18 80099B18 FD6A020C */  jal        AS_GetBlock__FP6SFXHDR
    /* 89B1C 80099B1C 21200002 */   addu      $a0, $s0, $zero
    /* 89B20 80099B20 00160200 */  sll        $v0, $v0, 24
    /* 89B24 80099B24 1B004010 */  beqz       $v0, .L80099B94
    /* 89B28 80099B28 00000000 */   nop
    /* 89B2C 80099B2C 5C00028E */  lw         $v0, 0x5C($s0)
    /* 89B30 80099B30 00000000 */  nop
    /* 89B34 80099B34 17004014 */  bnez       $v0, .L80099B94
    /* 89B38 80099B38 21200002 */   addu      $a0, $s0, $zero
    /* 89B3C 80099B3C 4800068E */  lw         $a2, 0x48($s0)
    /* 89B40 80099B40 1180053C */  lui        $a1, %hi(D_80110928)
    /* 89B44 80099B44 2809A524 */  addiu      $a1, $a1, %lo(D_80110928)
    /* 89B48 80099B48 BE62020C */  jal        STR_Debug__FP6SFXHDRPce
    /* 89B4C 80099B4C 23306602 */   subu      $a2, $s3, $a2
    /* 89B50 80099B50 21200002 */  addu       $a0, $s0, $zero
    /* 89B54 80099B54 00300624 */  addiu      $a2, $zero, 0x3000
    /* 89B58 80099B58 2000038E */  lw         $v1, 0x20($s0)
    /* 89B5C 80099B5C 6800028E */  lw         $v0, 0x68($s0)
    /* 89B60 80099B60 40280300 */  sll        $a1, $v1, 1
    /* 89B64 80099B64 2128A300 */  addu       $a1, $a1, $v1
    /* 89B68 80099B68 002B0500 */  sll        $a1, $a1, 12
    /* 89B6C 80099B6C CB65020C */  jal        STR_PlayStream__FP6SFXHDRPUci
    /* 89B70 80099B70 21284500 */   addu      $a1, $v0, $a1
    /* 89B74 80099B74 2120A002 */  addu       $a0, $s5, $zero
    /* 89B78 80099B78 21288002 */  addu       $a1, $s4, $zero
    /* 89B7C 80099B7C A36A020C */  jal        AS_WasLastBlock__FiP6STRHDRP6SFXHDR
    /* 89B80 80099B80 21300002 */   addu      $a2, $s0, $zero
    /* 89B84 80099B84 5400158E */  lw         $s5, 0x54($s0)
    /* 89B88 80099B88 0D0000A2 */  sb         $zero, 0xD($s0)
    /* 89B8C 80099B8C 2C0000AE */  sw         $zero, 0x2C($s0)
    /* 89B90 80099B90 480013AE */  sw         $s3, 0x48($s0)
  .L80099B94:
    /* 89B94 80099B94 9965020C */  jal        STR_DMAControl__FP6SFXHDR
    /* 89B98 80099B98 21200002 */   addu      $a0, $s0, $zero
    /* 89B9C 80099B9C 02000282 */  lb         $v0, 0x2($s0)
    /* 89BA0 80099BA0 00000000 */  nop
    /* 89BA4 80099BA4 1E004010 */  beqz       $v0, .L80099C20
    /* 89BA8 80099BA8 76AC033C */   lui       $v1, (0xAC769185 >> 16)
    /* 89BAC 80099BAC 6000028E */  lw         $v0, 0x60($s0)
    /* 89BB0 80099BB0 00000000 */  nop
    /* 89BB4 80099BB4 18005200 */  mult       $v0, $s2
    /* 89BB8 80099BB8 3C00028E */  lw         $v0, 0x3C($s0)
    /* 89BBC 80099BBC 12380000 */  mflo       $a3
    /* 89BC0 80099BC0 21104700 */  addu       $v0, $v0, $a3
    /* 89BC4 80099BC4 3C0002AE */  sw         $v0, 0x3C($s0)
    /* 89BC8 80099BC8 3C00028E */  lw         $v0, 0x3C($s0)
    /* 89BCC 80099BCC 85916334 */  ori        $v1, $v1, (0xAC769185 & 0xFFFF)
    /* 89BD0 80099BD0 18004300 */  mult       $v0, $v1
    /* 89BD4 80099BD4 5555033C */  lui        $v1, (0x55555556 >> 16)
    /* 89BD8 80099BD8 56556334 */  ori        $v1, $v1, (0x55555556 & 0xFFFF)
    /* 89BDC 80099BDC 10380000 */  mfhi       $a3
    /* 89BE0 80099BE0 2120E200 */  addu       $a0, $a3, $v0
    /* 89BE4 80099BE4 43230400 */  sra        $a0, $a0, 13
    /* 89BE8 80099BE8 C3170200 */  sra        $v0, $v0, 31
    /* 89BEC 80099BEC 23208200 */  subu       $a0, $a0, $v0
    /* 89BF0 80099BF0 18008300 */  mult       $a0, $v1
    /* 89BF4 80099BF4 3400028E */  lw         $v0, 0x34($s0)
    /* 89BF8 80099BF8 C31F0400 */  sra        $v1, $a0, 31
    /* 89BFC 80099BFC 500004AE */  sw         $a0, 0x50($s0)
    /* 89C00 80099C00 21105200 */  addu       $v0, $v0, $s2
    /* 89C04 80099C04 340002AE */  sw         $v0, 0x34($s0)
    /* 89C08 80099C08 10380000 */  mfhi       $a3
    /* 89C0C 80099C0C 2318E300 */  subu       $v1, $a3, $v1
    /* 89C10 80099C10 40100300 */  sll        $v0, $v1, 1
    /* 89C14 80099C14 21104300 */  addu       $v0, $v0, $v1
    /* 89C18 80099C18 23208200 */  subu       $a0, $a0, $v0
    /* 89C1C 80099C1C 380004AE */  sw         $a0, 0x38($s0)
  .L80099C20:
    /* 89C20 80099C20 440013AE */  sw         $s3, 0x44($s0)
    /* 89C24 80099C24 EE80000C */  jal        TSK_Sleep
    /* 89C28 80099C28 01000424 */   addiu     $a0, $zero, 0x1
    /* 89C2C 80099C2C 91660208 */  j          .L80099A44
    /* 89C30 80099C30 00161100 */   sll       $v0, $s1, 24
  .L80099C34:
    /* 89C34 80099C34 0400028E */  lw         $v0, 0x4($s0)
    /* 89C38 80099C38 00000000 */  nop
    /* 89C3C 80099C3C 07004010 */  beqz       $v0, .L80099C5C
    /* 89C40 80099C40 21208002 */   addu      $a0, $s4, $zero
    /* 89C44 80099C44 096B020C */  jal        AS_CloseStream__FP6STRHDRP6SFXHDR
    /* 89C48 80099C48 21280002 */   addu      $a1, $s0, $zero
    /* 89C4C 80099C4C C764020C */  jal        STR_CloseStream__FP6SFXHDR
    /* 89C50 80099C50 21200002 */   addu      $a0, $s0, $zero
    /* 89C54 80099C54 7320020C */  jal        BL_CloseStreamFile__FP6STRHDR
    /* 89C58 80099C58 21208002 */   addu      $a0, $s4, $zero
  .L80099C5C:
    /* 89C5C 80099C5C 3800BF8F */  lw         $ra, 0x38($sp)
    /* 89C60 80099C60 3400B58F */  lw         $s5, 0x34($sp)
    /* 89C64 80099C64 3000B48F */  lw         $s4, 0x30($sp)
    /* 89C68 80099C68 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 89C6C 80099C6C 2800B28F */  lw         $s2, 0x28($sp)
    /* 89C70 80099C70 2400B18F */  lw         $s1, 0x24($sp)
    /* 89C74 80099C74 2000B08F */  lw         $s0, 0x20($sp)
    /* 89C78 80099C78 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 89C7C 80099C7C 0800E003 */  jr         $ra
    /* 89C80 80099C80 00000000 */   nop
endlabel STR_AsyncWeeTASK__FP4TASK
