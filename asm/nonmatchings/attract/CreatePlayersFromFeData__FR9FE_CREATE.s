.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreatePlayersFromFeData__FR9FE_CREATE, 0xD8

glabel CreatePlayersFromFeData__FR9FE_CREATE
    /* 7D344 8008D344 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 7D348 8008D348 3000B6AF */  sw         $s6, 0x30($sp)
    /* 7D34C 8008D34C 21B08000 */  addu       $s6, $a0, $zero
    /* 7D350 8008D350 3400BFAF */  sw         $ra, 0x34($sp)
    /* 7D354 8008D354 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 7D358 8008D358 2800B4AF */  sw         $s4, 0x28($sp)
    /* 7D35C 8008D35C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 7D360 8008D360 2000B2AF */  sw         $s2, 0x20($sp)
    /* 7D364 8008D364 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 7D368 8008D368 1800B0AF */  sw         $s0, 0x18($sp)
    /* 7D36C 8008D36C 0000C28E */  lw         $v0, 0x0($s6)
    /* 7D370 8008D370 00000000 */  nop
    /* 7D374 8008D374 1E004018 */  blez       $v0, .L8008D3F0
    /* 7D378 8008D378 21800000 */   addu      $s0, $zero, $zero
    /* 7D37C 8008D37C 04001524 */  addiu      $s5, $zero, 0x4
    /* 7D380 8008D380 0E80023C */  lui        $v0, %hi(plr)
    /* 7D384 8008D384 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 7D388 8008D388 D6005424 */  addiu      $s4, $v0, 0xD6
    /* 7D38C 8008D38C 21984000 */  addu       $s3, $v0, $zero
    /* 7D390 8008D390 2190C002 */  addu       $s2, $s6, $zero
    /* 7D394 8008D394 1280113C */  lui        $s1, %hi(LoadedChar)
    /* 7D398 8008D398 28B33126 */  addiu      $s1, $s1, %lo(LoadedChar)
  .L8008D39C:
    /* 7D39C 8008D39C 0000228E */  lw         $v0, 0x0($s1)
    /* 7D3A0 8008D3A0 00000000 */  nop
    /* 7D3A4 8008D3A4 09004014 */  bnez       $v0, .L8008D3CC
    /* 7D3A8 8008D3A8 00000000 */   nop
    /* 7D3AC 8008D3AC 10004582 */  lb         $a1, 0x10($s2)
    /* 7D3B0 8008D3B0 149B010C */  jal        CreatePlayer__Fic
    /* 7D3B4 8008D3B4 21200002 */   addu      $a0, $s0, $zero
    /* 7D3B8 8008D3B8 CF34020C */  jal        CustomPlayerInit__FR12PlayerStruct
    /* 7D3BC 8008D3BC 21206002 */   addu      $a0, $s3, $zero
    /* 7D3C0 8008D3C0 21208002 */  addu       $a0, $s4, $zero
    /* 7D3C4 8008D3C4 F240000C */  jal        strcpy
    /* 7D3C8 8008D3C8 2128D502 */   addu      $a1, $s6, $s5
  .L8008D3CC:
    /* 7D3CC 8008D3CC 1000B526 */  addiu      $s5, $s5, 0x10
    /* 7D3D0 8008D3D0 E8199426 */  addiu      $s4, $s4, 0x19E8
    /* 7D3D4 8008D3D4 E8197326 */  addiu      $s3, $s3, 0x19E8
    /* 7D3D8 8008D3D8 10005226 */  addiu      $s2, $s2, 0x10
    /* 7D3DC 8008D3DC 0000C28E */  lw         $v0, 0x0($s6)
    /* 7D3E0 8008D3E0 01001026 */  addiu      $s0, $s0, 0x1
    /* 7D3E4 8008D3E4 2A100202 */  slt        $v0, $s0, $v0
    /* 7D3E8 8008D3E8 ECFF4014 */  bnez       $v0, .L8008D39C
    /* 7D3EC 8008D3EC 04003126 */   addiu     $s1, $s1, 0x4
  .L8008D3F0:
    /* 7D3F0 8008D3F0 3400BF8F */  lw         $ra, 0x34($sp)
    /* 7D3F4 8008D3F4 3000B68F */  lw         $s6, 0x30($sp)
    /* 7D3F8 8008D3F8 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 7D3FC 8008D3FC 2800B48F */  lw         $s4, 0x28($sp)
    /* 7D400 8008D400 2400B38F */  lw         $s3, 0x24($sp)
    /* 7D404 8008D404 2000B28F */  lw         $s2, 0x20($sp)
    /* 7D408 8008D408 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 7D40C 8008D40C 1800B08F */  lw         $s0, 0x18($sp)
    /* 7D410 8008D410 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 7D414 8008D414 0800E003 */  jr         $ra
    /* 7D418 8008D418 00000000 */   nop
endlabel CreatePlayersFromFeData__FR9FE_CREATE
