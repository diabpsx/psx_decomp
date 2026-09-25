.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_FT4_80096640, 0x7C

glabel PRIM_GetPrim__FPP8POLY_FT4_80096640
    /* 86640 80096640 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 86644 80096644 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 86648 80096648 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 8664C 8009664C BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 86650 80096650 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 86654 80096654 1000B0AF */  sw         $s0, 0x10($sp)
    /* 86658 80096658 21808000 */  addu       $s0, $a0, $zero
    /* 8665C 8009665C 90014224 */  addiu      $v0, $v0, 0x190
    /* 86660 80096660 2B104300 */  sltu       $v0, $v0, $v1
    /* 86664 80096664 06004014 */  bnez       $v0, .L80096680
    /* 86668 80096668 1400BFAF */   sw        $ra, 0x14($sp)
    /* 8666C 8009666C 21200000 */  addu       $a0, $zero, $zero
    /* 86670 80096670 1180053C */  lui        $a1, %hi(D_80110660)
    /* 86674 80096674 6006A524 */  addiu      $a1, $a1, %lo(D_80110660)
    /* 86678 80096678 A583000C */  jal        DBG_Error
    /* 8667C 8009667C 44000624 */   addiu     $a2, $zero, 0x44
  .L80096680:
    /* 86680 80096680 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 86684 80096684 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 86688 80096688 00000000 */  nop
    /* 8668C 8009668C 000002AE */  sw         $v0, 0x0($s0)
    /* 86690 80096690 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 86694 80096694 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 86698 80096698 00000000 */  nop
    /* 8669C 8009669C 28004224 */  addiu      $v0, $v0, 0x28
    /* 866A0 800966A0 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 866A4 800966A4 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 866A8 800966A8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 866AC 800966AC 1000B08F */  lw         $s0, 0x10($sp)
    /* 866B0 800966B0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 866B4 800966B4 0800E003 */  jr         $ra
    /* 866B8 800966B8 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_FT4_80096640
