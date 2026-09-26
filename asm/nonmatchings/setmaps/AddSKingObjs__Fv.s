.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddSKingObjs__Fv, 0x130

glabel AddSKingObjs__Fv
    /* 1B794 8015538C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1B798 80155390 40000424 */  addiu      $a0, $zero, 0x40
    /* 1B79C 80155394 22000524 */  addiu      $a1, $zero, 0x22
    /* 1B7A0 80155398 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1B7A4 8015539C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1B7A8 801553A0 B654050C */  jal        ObjIndex__Fii
    /* 1B7AC 801553A4 1800B0AF */   sw        $s0, 0x18($sp)
    /* 1B7B0 801553A8 21204000 */  addu       $a0, $v0, $zero
    /* 1B7B4 801553AC 14000524 */  addiu      $a1, $zero, 0x14
    /* 1B7B8 801553B0 07000624 */  addiu      $a2, $zero, 0x7
    /* 1B7BC 801553B4 17000724 */  addiu      $a3, $zero, 0x17
    /* 1B7C0 801553B8 0A000224 */  addiu      $v0, $zero, 0xA
    /* 1B7C4 801553BC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1B7C8 801553C0 01000224 */  addiu      $v0, $zero, 0x1
    /* 1B7CC 801553C4 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B7D0 801553C8 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1B7D4 801553CC 40000424 */  addiu      $a0, $zero, 0x40
    /* 1B7D8 801553D0 B654050C */  jal        ObjIndex__Fii
    /* 1B7DC 801553D4 3B000524 */   addiu     $a1, $zero, 0x3B
    /* 1B7E0 801553D8 21204000 */  addu       $a0, $v0, $zero
    /* 1B7E4 801553DC 14000524 */  addiu      $a1, $zero, 0x14
    /* 1B7E8 801553E0 0E000624 */  addiu      $a2, $zero, 0xE
    /* 1B7EC 801553E4 15000724 */  addiu      $a3, $zero, 0x15
    /* 1B7F0 801553E8 10000224 */  addiu      $v0, $zero, 0x10
    /* 1B7F4 801553EC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1B7F8 801553F0 02000224 */  addiu      $v0, $zero, 0x2
    /* 1B7FC 801553F4 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B800 801553F8 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1B804 801553FC 1B000424 */  addiu      $a0, $zero, 0x1B
    /* 1B808 80155400 B654050C */  jal        ObjIndex__Fii
    /* 1B80C 80155404 25000524 */   addiu     $a1, $zero, 0x25
    /* 1B810 80155408 21204000 */  addu       $a0, $v0, $zero
    /* 1B814 8015540C 08000524 */  addiu      $a1, $zero, 0x8
    /* 1B818 80155410 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B81C 80155414 0F000724 */  addiu      $a3, $zero, 0xF
    /* 1B820 80155418 0B001124 */  addiu      $s1, $zero, 0xB
    /* 1B824 8015541C 03001024 */  addiu      $s0, $zero, 0x3
    /* 1B828 80155420 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B82C 80155424 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B830 80155428 1400B0AF */   sw        $s0, 0x14($sp)
    /* 1B834 8015542C 2E000424 */  addiu      $a0, $zero, 0x2E
    /* 1B838 80155430 B654050C */  jal        ObjIndex__Fii
    /* 1B83C 80155434 23000524 */   addiu     $a1, $zero, 0x23
    /* 1B840 80155438 21204000 */  addu       $a0, $v0, $zero
    /* 1B844 8015543C 08000524 */  addiu      $a1, $zero, 0x8
    /* 1B848 80155440 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B84C 80155444 0F000724 */  addiu      $a3, $zero, 0xF
    /* 1B850 80155448 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B854 8015544C 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B858 80155450 1400B0AF */   sw        $s0, 0x14($sp)
    /* 1B85C 80155454 31000424 */  addiu      $a0, $zero, 0x31
    /* 1B860 80155458 B654050C */  jal        ObjIndex__Fii
    /* 1B864 8015545C 35000524 */   addiu     $a1, $zero, 0x35
    /* 1B868 80155460 21204000 */  addu       $a0, $v0, $zero
    /* 1B86C 80155464 08000524 */  addiu      $a1, $zero, 0x8
    /* 1B870 80155468 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B874 8015546C 0F000724 */  addiu      $a3, $zero, 0xF
    /* 1B878 80155470 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B87C 80155474 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B880 80155478 1400B0AF */   sw        $s0, 0x14($sp)
    /* 1B884 8015547C 1B000424 */  addiu      $a0, $zero, 0x1B
    /* 1B888 80155480 B654050C */  jal        ObjIndex__Fii
    /* 1B88C 80155484 35000524 */   addiu     $a1, $zero, 0x35
    /* 1B890 80155488 21204000 */  addu       $a0, $v0, $zero
    /* 1B894 8015548C 08000524 */  addiu      $a1, $zero, 0x8
    /* 1B898 80155490 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B89C 80155494 0F000724 */  addiu      $a3, $zero, 0xF
    /* 1B8A0 80155498 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B8A4 8015549C 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B8A8 801554A0 1400B0AF */   sw        $s0, 0x14($sp)
    /* 1B8AC 801554A4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1B8B0 801554A8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1B8B4 801554AC 1800B08F */  lw         $s0, 0x18($sp)
    /* 1B8B8 801554B0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1B8BC 801554B4 0800E003 */  jr         $ra
    /* 1B8C0 801554B8 00000000 */   nop
endlabel AddSKingObjs__Fv
