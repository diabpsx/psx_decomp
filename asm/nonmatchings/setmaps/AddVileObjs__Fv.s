.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddVileObjs__Fv, 0xAC

glabel AddVileObjs__Fv
    /* 1B940 80155538 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1B944 8015553C 1A000424 */  addiu      $a0, $zero, 0x1A
    /* 1B948 80155540 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 1B94C 80155544 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1B950 80155548 B654050C */  jal        ObjIndex__Fii
    /* 1B954 8015554C 1800B0AF */   sw        $s0, 0x18($sp)
    /* 1B958 80155550 21204000 */  addu       $a0, $v0, $zero
    /* 1B95C 80155554 01000524 */  addiu      $a1, $zero, 0x1
    /* 1B960 80155558 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B964 8015555C 09000724 */  addiu      $a3, $zero, 0x9
    /* 1B968 80155560 0A001024 */  addiu      $s0, $zero, 0xA
    /* 1B96C 80155564 01000224 */  addiu      $v0, $zero, 0x1
    /* 1B970 80155568 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B974 8015556C 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B978 80155570 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1B97C 80155574 2D000424 */  addiu      $a0, $zero, 0x2D
    /* 1B980 80155578 B654050C */  jal        ObjIndex__Fii
    /* 1B984 8015557C 2E000524 */   addiu     $a1, $zero, 0x2E
    /* 1B988 80155580 21204000 */  addu       $a0, $v0, $zero
    /* 1B98C 80155584 0B000524 */  addiu      $a1, $zero, 0xB
    /* 1B990 80155588 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B994 8015558C 14000724 */  addiu      $a3, $zero, 0x14
    /* 1B998 80155590 02000224 */  addiu      $v0, $zero, 0x2
    /* 1B99C 80155594 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B9A0 80155598 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B9A4 8015559C 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1B9A8 801555A0 23000424 */  addiu      $a0, $zero, 0x23
    /* 1B9AC 801555A4 B654050C */  jal        ObjIndex__Fii
    /* 1B9B0 801555A8 24000524 */   addiu     $a1, $zero, 0x24
    /* 1B9B4 801555AC 21204000 */  addu       $a0, $v0, $zero
    /* 1B9B8 801555B0 07000524 */  addiu      $a1, $zero, 0x7
    /* 1B9BC 801555B4 0B000624 */  addiu      $a2, $zero, 0xB
    /* 1B9C0 801555B8 0D000724 */  addiu      $a3, $zero, 0xD
    /* 1B9C4 801555BC 12000224 */  addiu      $v0, $zero, 0x12
    /* 1B9C8 801555C0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1B9CC 801555C4 03000224 */  addiu      $v0, $zero, 0x3
    /* 1B9D0 801555C8 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1B9D4 801555CC 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1B9D8 801555D0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1B9DC 801555D4 1800B08F */  lw         $s0, 0x18($sp)
    /* 1B9E0 801555D8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1B9E4 801555DC 0800E003 */  jr         $ra
    /* 1B9E8 801555E0 00000000 */   nop
endlabel AddVileObjs__Fv
