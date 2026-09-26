.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetMissAnim__Fii, 0xD8

glabel SetMissAnim__Fii
    /* 3754 8013D34C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3758 8013D350 1000B0AF */  sw         $s0, 0x10($sp)
    /* 375C 8013D354 80800400 */  sll        $s0, $a0, 2
    /* 3760 8013D358 21800402 */  addu       $s0, $s0, $a0
    /* 3764 8013D35C 80801000 */  sll        $s0, $s0, 2
    /* 3768 8013D360 23800402 */  subu       $s0, $s0, $a0
    /* 376C 8013D364 80801000 */  sll        $s0, $s0, 2
    /* 3770 8013D368 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3774 8013D36C 80880500 */  sll        $s1, $a1, 2
    /* 3778 8013D370 21882502 */  addu       $s1, $s1, $a1
    /* 377C 8013D374 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 3780 8013D378 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3784 8013D37C 1080013C */  lui        $at, %hi(missile + 0x37)
    /* 3788 8013D380 21083000 */  addu       $at, $at, $s0
    /* 378C 8013D384 8F2C25A0 */  sb         $a1, %lo(missile + 0x37)($at)
    /* 3790 8013D388 0D80013C */  lui        $at, %hi(misfiledata + 0x2)
    /* 3794 8013D38C 21083100 */  addu       $at, $at, $s1
    /* 3798 8013D390 626F2290 */  lbu        $v0, %lo(misfiledata + 0x2)($at)
    /* 379C 8013D394 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* 37A0 8013D398 21083000 */  addu       $at, $at, $s0
    /* 37A4 8013D39C 972C3280 */  lb         $s2, %lo(missile + 0x3F)($at)
    /* 37A8 8013D3A0 1080013C */  lui        $at, %hi(missile + 0x39)
    /* 37AC 8013D3A4 21083000 */  addu       $at, $at, $s0
    /* 37B0 8013D3A8 912C22A0 */  sb         $v0, %lo(missile + 0x39)($at)
    /* 37B4 8013D3AC 0D80013C */  lui        $at, %hi(misfiledata + 0x3)
    /* 37B8 8013D3B0 21083100 */  addu       $at, $at, $s1
    /* 37BC 8013D3B4 636F2490 */  lbu        $a0, %lo(misfiledata + 0x3)($at)
    /* 37C0 8013D3B8 AEF4040C */  jal        GetTableValue__FUci
    /* 37C4 8013D3BC 21284002 */   addu      $a1, $s2, $zero
    /* 37C8 8013D3C0 1080013C */  lui        $at, %hi(missile + 0x41)
    /* 37CC 8013D3C4 21083000 */  addu       $at, $at, $s0
    /* 37D0 8013D3C8 992C22A0 */  sb         $v0, %lo(missile + 0x41)($at)
    /* 37D4 8013D3CC 0D80013C */  lui        $at, %hi(misfiledata + 0x4)
    /* 37D8 8013D3D0 21083100 */  addu       $at, $at, $s1
    /* 37DC 8013D3D4 646F2490 */  lbu        $a0, %lo(misfiledata + 0x4)($at)
    /* 37E0 8013D3D8 AEF4040C */  jal        GetTableValue__FUci
    /* 37E4 8013D3DC 21284002 */   addu      $a1, $s2, $zero
    /* 37E8 8013D3E0 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 37EC 8013D3E4 21083000 */  addu       $at, $at, $s0
    /* 37F0 8013D3E8 9A2C22A0 */  sb         $v0, %lo(missile + 0x42)($at)
    /* 37F4 8013D3EC 01000224 */  addiu      $v0, $zero, 0x1
    /* 37F8 8013D3F0 1080013C */  lui        $at, %hi(missile + 0x45)
    /* 37FC 8013D3F4 21083000 */  addu       $at, $at, $s0
    /* 3800 8013D3F8 9D2C20A0 */  sb         $zero, %lo(missile + 0x45)($at)
    /* 3804 8013D3FC 1080013C */  lui        $at, %hi(missile + 0x47)
    /* 3808 8013D400 21083000 */  addu       $at, $at, $s0
    /* 380C 8013D404 9F2C22A0 */  sb         $v0, %lo(missile + 0x47)($at)
    /* 3810 8013D408 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 3814 8013D40C 1800B28F */  lw         $s2, 0x18($sp)
    /* 3818 8013D410 1400B18F */  lw         $s1, 0x14($sp)
    /* 381C 8013D414 1000B08F */  lw         $s0, 0x10($sp)
    /* 3820 8013D418 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3824 8013D41C 0800E003 */  jr         $ra
    /* 3828 8013D420 00000000 */   nop
endlabel SetMissAnim__Fii
