.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrepareFt4__7TextDatP8POLY_FT4iiiii, 0x294

glabel PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 82A80 80092A80 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 82A84 80092A84 2800B2AF */  sw         $s2, 0x28($sp)
    /* 82A88 80092A88 21908000 */  addu       $s2, $a0, $zero
    /* 82A8C 80092A8C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 82A90 80092A90 2180A000 */  addu       $s0, $a1, $zero
    /* 82A94 80092A94 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 82A98 80092A98 21B8C000 */  addu       $s7, $a2, $zero
    /* 82A9C 80092A9C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 82AA0 80092AA0 2188E000 */  addu       $s1, $a3, $zero
    /* 82AA4 80092AA4 3000B4AF */  sw         $s4, 0x30($sp)
    /* 82AA8 80092AA8 5800B48F */  lw         $s4, 0x58($sp)
    /* 82AAC 80092AAC 4000BEAF */  sw         $fp, 0x40($sp)
    /* 82AB0 80092AB0 5C00BE8F */  lw         $fp, 0x5C($sp)
    /* 82AB4 80092AB4 2128E002 */  addu       $a1, $s7, $zero
    /* 82AB8 80092AB8 4400BFAF */  sw         $ra, 0x44($sp)
    /* 82ABC 80092ABC 3800B6AF */  sw         $s6, 0x38($sp)
    /* 82AC0 80092AC0 3400B5AF */  sw         $s5, 0x34($sp)
    /* 82AC4 80092AC4 DB54020C */  jal        GetFr__7TextDati_8009536c
    /* 82AC8 80092AC8 2C00B3AF */   sw        $s3, 0x2C($sp)
    /* 82ACC 80092ACC 21984000 */  addu       $s3, $v0, $zero
    /* 82AD0 80092AD0 0800628E */  lw         $v0, 0x8($s3)
    /* 82AD4 80092AD4 09000324 */  addiu      $v1, $zero, 0x9
    /* 82AD8 80092AD8 030003A2 */  sb         $v1, 0x3($s0)
    /* 82ADC 80092ADC 2D000324 */  addiu      $v1, $zero, 0x2D
    /* 82AE0 80092AE0 070003A2 */  sb         $v1, 0x7($s0)
    /* 82AE4 80092AE4 42AA0200 */  srl        $s5, $v0, 9
    /* 82AE8 80092AE8 FF01B532 */  andi       $s5, $s5, 0x1FF
    /* 82AEC 80092AEC 0600C013 */  beqz       $fp, .L80092B08
    /* 82AF0 80092AF0 FF015630 */   andi      $s6, $v0, 0x1FF
    /* 82AF4 80092AF4 04006282 */  lb         $v0, 0x4($s3)
    /* 82AF8 80092AF8 00000000 */  nop
    /* 82AFC 80092AFC 23882202 */  subu       $s1, $s1, $v0
    /* 82B00 80092B00 C54A0208 */  j          .L80092B14
    /* 82B04 80092B04 23883602 */   subu      $s1, $s1, $s6
  .L80092B08:
    /* 82B08 80092B08 04006282 */  lb         $v0, 0x4($s3)
    /* 82B0C 80092B0C 00000000 */  nop
    /* 82B10 80092B10 21882202 */  addu       $s1, $s1, $v0
  .L80092B14:
    /* 82B14 80092B14 21204002 */  addu       $a0, $s2, $zero
    /* 82B18 80092B18 21286002 */  addu       $a1, $s3, $zero
    /* 82B1C 80092B1C 21300002 */  addu       $a2, $s0, $zero
    /* 82B20 80092B20 05006382 */  lb         $v1, 0x5($s3)
    /* 82B24 80092B24 21103602 */  addu       $v0, $s1, $s6
    /* 82B28 80092B28 080011A6 */  sh         $s1, 0x8($s0)
    /* 82B2C 80092B2C 100002A6 */  sh         $v0, 0x10($s0)
    /* 82B30 80092B30 180011A6 */  sh         $s1, 0x18($s0)
    /* 82B34 80092B34 200002A6 */  sh         $v0, 0x20($s0)
    /* 82B38 80092B38 21A08302 */  addu       $s4, $s4, $v1
    /* 82B3C 80092B3C 21109502 */  addu       $v0, $s4, $s5
    /* 82B40 80092B40 0A0014A6 */  sh         $s4, 0xA($s0)
    /* 82B44 80092B44 120014A6 */  sh         $s4, 0x12($s0)
    /* 82B48 80092B48 1A0002A6 */  sh         $v0, 0x1A($s0)
    /* 82B4C 80092B4C 754F020C */  jal        SetPal__7TextDatP9FRAME_HDRP8POLY_FT4
    /* 82B50 80092B50 220002A6 */   sh        $v0, 0x22($s0)
    /* 82B54 80092B54 0400628E */  lw         $v0, 0x4($s3)
    /* 82B58 80092B58 0004033C */  lui        $v1, (0x4000000 >> 16)
    /* 82B5C 80092B5C 24104300 */  and        $v0, $v0, $v1
    /* 82B60 80092B60 0B004010 */  beqz       $v0, .L80092B90
    /* 82B64 80092B64 2188A002 */   addu      $s1, $s5, $zero
    /* 82B68 80092B68 6000A88F */  lw         $t0, 0x60($sp)
    /* 82B6C 80092B6C 00000000 */  nop
    /* 82B70 80092B70 1000A8AF */  sw         $t0, 0x10($sp)
    /* 82B74 80092B74 21204002 */  addu       $a0, $s2, $zero
    /* 82B78 80092B78 21286002 */  addu       $a1, $s3, $zero
    /* 82B7C 80092B7C 21300002 */  addu       $a2, $s0, $zero
    /* 82B80 80092B80 3849020C */  jal        SetUVTp__7TextDatP9FRAME_HDRP8POLY_FT4ii
    /* 82B84 80092B84 2138C003 */   addu      $a3, $fp, $zero
    /* 82B88 80092B88 384B0208 */  j          .L80092CE0
    /* 82B8C 80092B8C 080057AE */   sw        $s7, 0x8($s2)
  .L80092B90:
    /* 82B90 80092B90 A654020C */  jal        CanXferFrame__C7TextDat
    /* 82B94 80092B94 21204002 */   addu      $a0, $s2, $zero
    /* 82B98 80092B98 4B004010 */  beqz       $v0, .L80092CC8
    /* 82B9C 80092B9C 00000000 */   nop
    /* 82BA0 80092BA0 0800428E */  lw         $v0, 0x8($s2)
    /* 82BA4 80092BA4 00000000 */  nop
    /* 82BA8 80092BA8 11005710 */  beq        $v0, $s7, .L80092BF0
    /* 82BAC 80092BAC 21204002 */   addu      $a0, $s2, $zero
    /* 82BB0 80092BB0 B04D020C */  jal        DecompFrame__7TextDatP9FRAME_HDR
    /* 82BB4 80092BB4 21286002 */   addu      $a1, $s3, $zero
    /* 82BB8 80092BB8 5000428E */  lw         $v0, 0x50($s2)
    /* 82BBC 80092BBC 2120C002 */  addu       $a0, $s6, $zero
    /* 82BC0 80092BC0 1800A2A7 */  sh         $v0, 0x18($sp)
    /* 82BC4 80092BC4 5400428E */  lw         $v0, 0x54($s2)
    /* 82BC8 80092BC8 02000524 */  addiu      $a1, $zero, 0x2
    /* 82BCC 80092BCC 7883000C */  jal        GU_AlignVal
    /* 82BD0 80092BD0 1A00A2A7 */   sh        $v0, 0x1A($sp)
    /* 82BD4 80092BD4 1800A427 */  addiu      $a0, $sp, 0x18
    /* 82BD8 80092BD8 42100200 */  srl        $v0, $v0, 1
    /* 82BDC 80092BDC 1C00A2A7 */  sh         $v0, 0x1C($sp)
    /* 82BE0 80092BE0 1E00B1A7 */  sh         $s1, 0x1E($sp)
    /* 82BE4 80092BE4 4C00458E */  lw         $a1, 0x4C($s2)
    /* 82BE8 80092BE8 590D020C */  jal        GPUQ_LoadImage__FP4RECTli
    /* 82BEC 80092BEC 21300000 */   addu      $a2, $zero, $zero
  .L80092BF0:
    /* 82BF0 80092BF0 5000428E */  lw         $v0, 0x50($s2)
    /* 82BF4 80092BF4 00000000 */  nop
    /* 82BF8 80092BF8 3F004230 */  andi       $v0, $v0, 0x3F
    /* 82BFC 80092BFC 40100200 */  sll        $v0, $v0, 1
    /* 82C00 80092C00 0C0002A2 */  sb         $v0, 0xC($s0)
    /* 82C04 80092C04 5400428E */  lw         $v0, 0x54($s2)
    /* 82C08 80092C08 00000000 */  nop
    /* 82C0C 80092C0C 0D0002A2 */  sb         $v0, 0xD($s0)
    /* 82C10 80092C10 5000428E */  lw         $v0, 0x50($s2)
    /* 82C14 80092C14 00000000 */  nop
    /* 82C18 80092C18 3F004230 */  andi       $v0, $v0, 0x3F
    /* 82C1C 80092C1C 40100200 */  sll        $v0, $v0, 1
    /* 82C20 80092C20 21105600 */  addu       $v0, $v0, $s6
    /* 82C24 80092C24 140002A2 */  sb         $v0, 0x14($s0)
    /* 82C28 80092C28 5400428E */  lw         $v0, 0x54($s2)
    /* 82C2C 80092C2C 00000000 */  nop
    /* 82C30 80092C30 150002A2 */  sb         $v0, 0x15($s0)
    /* 82C34 80092C34 5000428E */  lw         $v0, 0x50($s2)
    /* 82C38 80092C38 00000000 */  nop
    /* 82C3C 80092C3C 3F004230 */  andi       $v0, $v0, 0x3F
    /* 82C40 80092C40 40100200 */  sll        $v0, $v0, 1
    /* 82C44 80092C44 1C0002A2 */  sb         $v0, 0x1C($s0)
    /* 82C48 80092C48 5400428E */  lw         $v0, 0x54($s2)
    /* 82C4C 80092C4C 00000000 */  nop
    /* 82C50 80092C50 21105500 */  addu       $v0, $v0, $s5
    /* 82C54 80092C54 1D0002A2 */  sb         $v0, 0x1D($s0)
    /* 82C58 80092C58 5000428E */  lw         $v0, 0x50($s2)
    /* 82C5C 80092C5C 00000000 */  nop
    /* 82C60 80092C60 3F004230 */  andi       $v0, $v0, 0x3F
    /* 82C64 80092C64 40100200 */  sll        $v0, $v0, 1
    /* 82C68 80092C68 21105600 */  addu       $v0, $v0, $s6
    /* 82C6C 80092C6C 240002A2 */  sb         $v0, 0x24($s0)
    /* 82C70 80092C70 5400428E */  lw         $v0, 0x54($s2)
    /* 82C74 80092C74 01000424 */  addiu      $a0, $zero, 0x1
    /* 82C78 80092C78 21105500 */  addu       $v0, $v0, $s5
    /* 82C7C 80092C7C 250002A2 */  sb         $v0, 0x25($s0)
    /* 82C80 80092C80 5000468E */  lw         $a2, 0x50($s2)
    /* 82C84 80092C84 5400478E */  lw         $a3, 0x54($s2)
    /* 82C88 80092C88 074C000C */  jal        GetTPage
    /* 82C8C 80092C8C 21280000 */   addu      $a1, $zero, $zero
    /* 82C90 80092C90 160002A6 */  sh         $v0, 0x16($s0)
    /* 82C94 80092C94 6000A88F */  lw         $t0, 0x60($sp)
    /* 82C98 80092C98 00000000 */  nop
    /* 82C9C 80092C9C 0F000011 */  beqz       $t0, .L80092CDC
    /* 82CA0 80092CA0 00000000 */   nop
    /* 82CA4 80092CA4 0D000492 */  lbu        $a0, 0xD($s0)
    /* 82CA8 80092CA8 1D000392 */  lbu        $v1, 0x1D($s0)
    /* 82CAC 80092CAC 25000292 */  lbu        $v0, 0x25($s0)
    /* 82CB0 80092CB0 1D0004A2 */  sb         $a0, 0x1D($s0)
    /* 82CB4 80092CB4 15000492 */  lbu        $a0, 0x15($s0)
    /* 82CB8 80092CB8 0D0003A2 */  sb         $v1, 0xD($s0)
    /* 82CBC 80092CBC 150002A2 */  sb         $v0, 0x15($s0)
    /* 82CC0 80092CC0 374B0208 */  j          .L80092CDC
    /* 82CC4 80092CC4 250004A2 */   sb        $a0, 0x25($s0)
  .L80092CC8:
    /* 82CC8 80092CC8 21200000 */  addu       $a0, $zero, $zero
    /* 82CCC 80092CCC 1180053C */  lui        $a1, %hi(D_80110598)
    /* 82CD0 80092CD0 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 82CD4 80092CD4 A583000C */  jal        DBG_Error
    /* 82CD8 80092CD8 B7020624 */   addiu     $a2, $zero, 0x2B7
  .L80092CDC:
    /* 82CDC 80092CDC 080057AE */  sw         $s7, 0x8($s2)
  .L80092CE0:
    /* 82CE0 80092CE0 4400BF8F */  lw         $ra, 0x44($sp)
    /* 82CE4 80092CE4 4000BE8F */  lw         $fp, 0x40($sp)
    /* 82CE8 80092CE8 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 82CEC 80092CEC 3800B68F */  lw         $s6, 0x38($sp)
    /* 82CF0 80092CF0 3400B58F */  lw         $s5, 0x34($sp)
    /* 82CF4 80092CF4 3000B48F */  lw         $s4, 0x30($sp)
    /* 82CF8 80092CF8 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 82CFC 80092CFC 2800B28F */  lw         $s2, 0x28($sp)
    /* 82D00 80092D00 2400B18F */  lw         $s1, 0x24($sp)
    /* 82D04 80092D04 2000B08F */  lw         $s0, 0x20($sp)
    /* 82D08 80092D08 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 82D0C 80092D0C 0800E003 */  jr         $ra
    /* 82D10 80092D10 00000000 */   nop
endlabel PrepareFt4__7TextDatP8POLY_FT4iiiii
