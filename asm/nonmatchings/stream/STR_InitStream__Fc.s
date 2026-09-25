.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_InitStream__Fc, 0x128

glabel STR_InitStream__Fc
    /* 88CA0 80098CA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 88CA4 80098CA4 00260400 */  sll        $a0, $a0, 24
    /* 88CA8 80098CA8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 88CAC 80098CAC 038E0400 */  sra        $s1, $a0, 24
    /* 88CB0 80098CB0 40111100 */  sll        $v0, $s1, 5
    /* 88CB4 80098CB4 21105100 */  addu       $v0, $v0, $s1
    /* 88CB8 80098CB8 80100200 */  sll        $v0, $v0, 2
    /* 88CBC 80098CBC 0C80033C */  lui        $v1, %hi(SFXTab)
    /* 88CC0 80098CC0 E09B6324 */  addiu      $v1, $v1, %lo(SFXTab)
    /* 88CC4 80098CC4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 88CC8 80098CC8 21804300 */  addu       $s0, $v0, $v1
    /* 88CCC 80098CCC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 88CD0 80098CD0 00000282 */  lb         $v0, 0x0($s0)
    /* 88CD4 80098CD4 00000000 */  nop
    /* 88CD8 80098CD8 35004014 */  bnez       $v0, .L80098DB0
    /* 88CDC 80098CDC 21100000 */   addu      $v0, $zero, $zero
    /* 88CE0 80098CE0 01000224 */  addiu      $v0, $zero, 0x1
    /* 88CE4 80098CE4 000002A2 */  sb         $v0, 0x0($s0)
    /* 88CE8 80098CE8 3E10020C */  jal        VID_GetTick__Fv
    /* 88CEC 80098CEC 030002A2 */   sb        $v0, 0x3($s0)
    /* 88CF0 80098CF0 3E10020C */  jal        VID_GetTick__Fv
    /* 88CF4 80098CF4 440002AE */   sw        $v0, 0x44($s0)
    /* 88CF8 80098CF8 A08E0434 */  ori        $a0, $zero, 0x8EA0
    /* 88CFC 80098CFC 480002AE */  sw         $v0, 0x48($s0)
    /* 88D00 80098D00 02000224 */  addiu      $v0, $zero, 0x2
    /* 88D04 80098D04 6C0002AE */  sw         $v0, 0x6C($s0)
    /* 88D08 80098D08 FC030224 */  addiu      $v0, $zero, 0x3FC
    /* 88D0C 80098D0C 1C0002AE */  sw         $v0, 0x1C($s0)
    /* 88D10 80098D10 69000224 */  addiu      $v0, $zero, 0x69
    /* 88D14 80098D14 200000AE */  sw         $zero, 0x20($s0)
    /* 88D18 80098D18 300000AE */  sw         $zero, 0x30($s0)
    /* 88D1C 80098D1C 4C0000AE */  sw         $zero, 0x4C($s0)
    /* 88D20 80098D20 340000AE */  sw         $zero, 0x34($s0)
    /* 88D24 80098D24 380000AE */  sw         $zero, 0x38($s0)
    /* 88D28 80098D28 3C0000AE */  sw         $zero, 0x3C($s0)
    /* 88D2C 80098D2C 500000AE */  sw         $zero, 0x50($s0)
    /* 88D30 80098D30 240000AE */  sw         $zero, 0x24($s0)
    /* 88D34 80098D34 020000A2 */  sb         $zero, 0x2($s0)
    /* 88D38 80098D38 280000AE */  sw         $zero, 0x28($s0)
    /* 88D3C 80098D3C 2C0000AE */  sw         $zero, 0x2C($s0)
    /* 88D40 80098D40 580000AE */  sw         $zero, 0x58($s0)
    /* 88D44 80098D44 100011AE */  sw         $s1, 0x10($s0)
    /* 88D48 80098D48 5C0000AE */  sw         $zero, 0x5C($s0)
    /* 88D4C 80098D4C 0D0000A2 */  sb         $zero, 0xD($s0)
    /* 88D50 80098D50 EF5C000C */  jal        SpuMalloc
    /* 88D54 80098D54 600002AE */   sw        $v0, 0x60($s0)
    /* 88D58 80098D58 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 88D5C 80098D5C 06004314 */  bne        $v0, $v1, .L80098D78
    /* 88D60 80098D60 400002AE */   sw        $v0, 0x40($s0)
    /* 88D64 80098D64 21200000 */  addu       $a0, $zero, $zero
    /* 88D68 80098D68 1180053C */  lui        $a1, %hi(D_801108B4)
    /* 88D6C 80098D6C B408A524 */  addiu      $a1, $a1, %lo(D_801108B4)
    /* 88D70 80098D70 A583000C */  jal        DBG_Error
    /* 88D74 80098D74 3E020624 */   addiu     $a2, $zero, 0x23E
  .L80098D78:
    /* 88D78 80098D78 C763000C */  jal        SpuSetTransferMode
    /* 88D7C 80098D7C 21200000 */   addu      $a0, $zero, $zero
    /* 88D80 80098D80 4000048E */  lw         $a0, 0x40($s0)
    /* 88D84 80098D84 AF63000C */  jal        SpuSetTransferStartAddr
    /* 88D88 80098D88 00000000 */   nop
    /* 88D8C 80098D8C 5763000C */  jal        SpuWrite0
    /* 88D90 80098D90 808E0434 */   ori       $a0, $zero, 0x8E80
    /* 88D94 80098D94 D363000C */  jal        SpuIsTransferCompleted
    /* 88D98 80098D98 01000424 */   addiu     $a0, $zero, 0x1
    /* 88D9C 80098D9C 3D068393 */  lbu        $v1, %gp_rel(NoActiveStreams)($gp)
    /* 88DA0 80098DA0 00000000 */  nop
    /* 88DA4 80098DA4 01006324 */  addiu      $v1, $v1, 0x1
    /* 88DA8 80098DA8 3D0683A3 */  sb         $v1, %gp_rel(NoActiveStreams)($gp)
    /* 88DAC 80098DAC 21100002 */  addu       $v0, $s0, $zero
  .L80098DB0:
    /* 88DB0 80098DB0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 88DB4 80098DB4 1400B18F */  lw         $s1, 0x14($sp)
    /* 88DB8 80098DB8 1000B08F */  lw         $s0, 0x10($sp)
    /* 88DBC 80098DBC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 88DC0 80098DC0 0800E003 */  jr         $ra
    /* 88DC4 80098DC4 00000000 */   nop
endlabel STR_InitStream__Fc
