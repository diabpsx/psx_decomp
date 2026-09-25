.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NonBlockingLoadNewGFX__7CPlayeri, 0x6C

glabel NonBlockingLoadNewGFX__7CPlayeri
    /* 8654C 8009654C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 86550 80096550 1000B0AF */  sw         $s0, 0x10($sp)
    /* 86554 80096554 21808000 */  addu       $s0, $a0, $zero
    /* 86558 80096558 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8655C 8009655C 2188A000 */  addu       $s1, $a1, $zero
    /* 86560 80096560 21200000 */  addu       $a0, $zero, $zero
    /* 86564 80096564 02800534 */  ori        $a1, $zero, 0x8002
    /* 86568 80096568 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8656C 8009656C B681000C */  jal        TSK_Exist
    /* 86570 80096570 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 86574 80096574 0A004014 */  bnez       $v0, .L800965A0
    /* 86578 80096578 02800434 */   ori       $a0, $zero, 0x8002
    /* 8657C 8009657C 0980053C */  lui        $a1, %hi(FilthyTask__FP4TASK)
    /* 86580 80096580 B865A524 */  addiu      $a1, $a1, %lo(FilthyTask__FP4TASK)
    /* 86584 80096584 780C0624 */  addiu      $a2, $zero, 0xC78
    /* 86588 80096588 0480000C */  jal        TSK_AddTask
    /* 8658C 8009658C 08000724 */   addiu     $a3, $zero, 0x8
    /* 86590 80096590 1C00428C */  lw         $v0, 0x1C($v0)
    /* 86594 80096594 00000000 */  nop
    /* 86598 80096598 000050AC */  sw         $s0, 0x0($v0)
    /* 8659C 8009659C 040051AC */  sw         $s1, 0x4($v0)
  .L800965A0:
    /* 865A0 800965A0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 865A4 800965A4 1400B18F */  lw         $s1, 0x14($sp)
    /* 865A8 800965A8 1000B08F */  lw         $s0, 0x10($sp)
    /* 865AC 800965AC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 865B0 800965B0 0800E003 */  jr         $ra
    /* 865B4 800965B4 00000000 */   nop
endlabel NonBlockingLoadNewGFX__7CPlayeri
