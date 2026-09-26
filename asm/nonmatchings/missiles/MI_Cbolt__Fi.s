.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Cbolt__Fi, 0x354

glabel MI_Cbolt__Fi
    /* F618 80149210 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* F61C 80149214 7000B2AF */  sw         $s2, 0x70($sp)
    /* F620 80149218 21908000 */  addu       $s2, $a0, $zero
    /* F624 8014921C 2000A727 */  addiu      $a3, $sp, 0x20
    /* F628 80149220 1280063C */  lui        $a2, %hi(D_8011A1C4)
    /* F62C 80149224 C4A1C624 */  addiu      $a2, $a2, %lo(D_8011A1C4)
    /* F630 80149228 4000C824 */  addiu      $t0, $a2, 0x40
    /* F634 8014922C 7400BFAF */  sw         $ra, 0x74($sp)
    /* F638 80149230 6C00B1AF */  sw         $s1, 0x6C($sp)
    /* F63C 80149234 6800B0AF */  sw         $s0, 0x68($sp)
  .L80149238:
    /* F640 80149238 0000C28C */  lw         $v0, 0x0($a2)
    /* F644 8014923C 0400C38C */  lw         $v1, 0x4($a2)
    /* F648 80149240 0800C48C */  lw         $a0, 0x8($a2)
    /* F64C 80149244 0C00C58C */  lw         $a1, 0xC($a2)
    /* F650 80149248 0000E2AC */  sw         $v0, 0x0($a3)
    /* F654 8014924C 0400E3AC */  sw         $v1, 0x4($a3)
    /* F658 80149250 0800E4AC */  sw         $a0, 0x8($a3)
    /* F65C 80149254 0C00E5AC */  sw         $a1, 0xC($a3)
    /* F660 80149258 1000C624 */  addiu      $a2, $a2, 0x10
    /* F664 8014925C F6FFC814 */  bne        $a2, $t0, .L80149238
    /* F668 80149260 1000E724 */   addiu     $a3, $a3, 0x10
    /* F66C 80149264 80101200 */  sll        $v0, $s2, 2
    /* F670 80149268 21105200 */  addu       $v0, $v0, $s2
    /* F674 8014926C 80100200 */  sll        $v0, $v0, 2
    /* F678 80149270 23105200 */  subu       $v0, $v0, $s2
    /* F67C 80149274 80800200 */  sll        $s0, $v0, 2
    /* F680 80149278 1080033C */  lui        $v1, %hi(missile)
    /* F684 8014927C 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* F688 80149280 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F68C 80149284 21083000 */  addu       $at, $at, $s0
    /* F690 80149288 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* F694 8014928C 21200302 */  addu       $a0, $s0, $v1
    /* F698 80149290 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* F69C 80149294 180082A4 */  sh         $v0, 0x18($a0)
    /* F6A0 80149298 1080013C */  lui        $at, %hi(missile + 0x37)
    /* F6A4 8014929C 21083000 */  addu       $at, $at, $s0
    /* F6A8 801492A0 8F2C2390 */  lbu        $v1, %lo(missile + 0x37)($at)
    /* F6AC 801492A4 03000224 */  addiu      $v0, $zero, 0x3
    /* F6B0 801492A8 90006210 */  beq        $v1, $v0, .L801494EC
    /* F6B4 801492AC 80101200 */   sll       $v0, $s2, 2
    /* F6B8 801492B0 1080013C */  lui        $at, %hi(missile + 0x22)
    /* F6BC 801492B4 21083000 */  addu       $at, $at, $s0
    /* F6C0 801492B8 7A2C2284 */  lh         $v0, %lo(missile + 0x22)($at)
    /* F6C4 801492BC 00000000 */  nop
    /* F6C8 801492C0 2B004014 */  bnez       $v0, .L80149370
    /* F6CC 801492C4 21184000 */   addu      $v1, $v0, $zero
    /* F6D0 801492C8 21204002 */  addu       $a0, $s2, $zero
    /* F6D4 801492CC 1080013C */  lui        $at, %hi(missile + 0x31)
    /* F6D8 801492D0 21083000 */  addu       $at, $at, $s0
    /* F6DC 801492D4 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* F6E0 801492D8 1080013C */  lui        $at, %hi(missile + 0x14)
    /* F6E4 801492DC 21083000 */  addu       $at, $at, $s0
    /* F6E8 801492E0 6C2C238C */  lw         $v1, %lo(missile + 0x14)($at)
    /* F6EC 801492E4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* F6F0 801492E8 21083000 */  addu       $at, $at, $s0
    /* F6F4 801492EC 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* F6F8 801492F0 80100300 */  sll        $v0, $v1, 2
    /* F6FC 801492F4 2138A203 */  addu       $a3, $sp, $v0
    /* F700 801492F8 01006324 */  addiu      $v1, $v1, 0x1
    /* F704 801492FC 1080013C */  lui        $at, %hi(missile + 0x20)
    /* F708 80149300 21083000 */  addu       $at, $at, $s0
    /* F70C 80149304 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* F710 80149308 2000E78C */  lw         $a3, 0x20($a3)
    /* F714 8014930C 0F006330 */  andi       $v1, $v1, 0xF
    /* F718 80149310 1080013C */  lui        $at, %hi(missile + 0x14)
    /* F71C 80149314 21083000 */  addu       $at, $at, $s0
    /* F720 80149318 6C2C23AC */  sw         $v1, %lo(missile + 0x14)($at)
    /* F724 8014931C 21104700 */  addu       $v0, $v0, $a3
    /* F728 80149320 07004230 */  andi       $v0, $v0, 0x7
    /* F72C 80149324 80100200 */  sll        $v0, $v0, 2
    /* F730 80149328 1080013C */  lui        $at, %hi(XDirAdd)
    /* F734 8014932C 21082200 */  addu       $at, $at, $v0
    /* F738 80149330 D829278C */  lw         $a3, %lo(XDirAdd)($at)
    /* F73C 80149334 1080013C */  lui        $at, %hi(YDirAdd)
    /* F740 80149338 21082200 */  addu       $at, $at, $v0
    /* F744 8014933C F829238C */  lw         $v1, %lo(YDirAdd)($at)
    /* F748 80149340 08000224 */  addiu      $v0, $zero, 0x8
    /* F74C 80149344 1400A2AF */  sw         $v0, 0x14($sp)
    /* F750 80149348 2138A700 */  addu       $a3, $a1, $a3
    /* F754 8014934C 2110C300 */  addu       $v0, $a2, $v1
    /* F758 80149350 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* F75C 80149354 1000A2AF */   sw        $v0, 0x10($sp)
    /* F760 80149358 10000224 */  addiu      $v0, $zero, 0x10
    /* F764 8014935C 1080013C */  lui        $at, %hi(missile + 0x22)
    /* F768 80149360 21083000 */  addu       $at, $at, $s0
    /* F76C 80149364 7A2C22A4 */  sh         $v0, %lo(missile + 0x22)($at)
    /* F770 80149368 DF240508 */  j          .L8014937C
    /* F774 8014936C 80101200 */   sll       $v0, $s2, 2
  .L80149370:
    /* F778 80149370 FFFF6224 */  addiu      $v0, $v1, -0x1
    /* F77C 80149374 220082A4 */  sh         $v0, 0x22($a0)
    /* F780 80149378 80101200 */  sll        $v0, $s2, 2
  .L8014937C:
    /* F784 8014937C 21105200 */  addu       $v0, $v0, $s2
    /* F788 80149380 80100200 */  sll        $v0, $v0, 2
    /* F78C 80149384 23105200 */  subu       $v0, $v0, $s2
    /* F790 80149388 80880200 */  sll        $s1, $v0, 2
    /* F794 8014938C 1080013C */  lui        $at, %hi(missile + 0x8)
    /* F798 80149390 21083100 */  addu       $at, $at, $s1
    /* F79C 80149394 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* F7A0 80149398 1080013C */  lui        $at, %hi(missile)
    /* F7A4 8014939C 21083100 */  addu       $at, $at, $s1
    /* F7A8 801493A0 582C258C */  lw         $a1, %lo(missile)($at)
    /* F7AC 801493A4 1080013C */  lui        $at, %hi(missile + 0xC)
    /* F7B0 801493A8 21083100 */  addu       $at, $at, $s1
    /* F7B4 801493AC 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* F7B8 801493B0 1080013C */  lui        $at, %hi(missile + 0x4)
    /* F7BC 801493B4 21083100 */  addu       $at, $at, $s1
    /* F7C0 801493B8 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* F7C4 801493BC 21104500 */  addu       $v0, $v0, $a1
    /* F7C8 801493C0 21186600 */  addu       $v1, $v1, $a2
    /* F7CC 801493C4 1080013C */  lui        $at, %hi(missile + 0x8)
    /* F7D0 801493C8 21083100 */  addu       $at, $at, $s1
    /* F7D4 801493CC 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* F7D8 801493D0 1080013C */  lui        $at, %hi(missile + 0xC)
    /* F7DC 801493D4 21083100 */  addu       $at, $at, $s1
    /* F7E0 801493D8 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* F7E4 801493DC 68EB040C */  jal        GetMissilePos__Fi
    /* F7E8 801493E0 21204002 */   addu      $a0, $s2, $zero
    /* F7EC 801493E4 21204002 */  addu       $a0, $s2, $zero
    /* F7F0 801493E8 21380000 */  addu       $a3, $zero, $zero
    /* F7F4 801493EC 1080013C */  lui        $at, %hi(missile + 0x10)
    /* F7F8 801493F0 21083100 */  addu       $at, $at, $s1
    /* F7FC 801493F4 682C258C */  lw         $a1, %lo(missile + 0x10)($at)
    /* F800 801493F8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* F804 801493FC 21083100 */  addu       $at, $at, $s1
    /* F808 80149400 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* F80C 80149404 01001024 */  addiu      $s0, $zero, 0x1
    /* F810 80149408 1000A2AF */  sw         $v0, 0x10($sp)
    /* F814 8014940C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* F818 80149410 21083100 */  addu       $at, $at, $s1
    /* F81C 80149414 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* F820 80149418 2130A000 */  addu       $a2, $a1, $zero
    /* F824 8014941C 1800A0AF */  sw         $zero, 0x18($sp)
    /* F828 80149420 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* F82C 80149424 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* F830 80149428 1400A2AF */   sw        $v0, 0x14($sp)
    /* F834 8014942C 1080013C */  lui        $at, %hi(missile + 0x3D)
    /* F838 80149430 21083100 */  addu       $at, $at, $s1
    /* F83C 80149434 952C2290 */  lbu        $v0, %lo(missile + 0x3D)($at)
    /* F840 80149438 00000000 */  nop
    /* F844 8014943C 1D005014 */  bne        $v0, $s0, .L801494B4
    /* F848 80149440 04004232 */   andi      $v0, $s2, 0x4
    /* F84C 80149444 21204002 */  addu       $a0, $s2, $zero
    /* F850 80149448 08000224 */  addiu      $v0, $zero, 0x8
    /* F854 8014944C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* F858 80149450 21083100 */  addu       $at, $at, $s1
    /* F85C 80149454 762C22A4 */  sh         $v0, %lo(missile + 0x1E)($at)
    /* F860 80149458 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* F864 8014945C 21083100 */  addu       $at, $at, $s1
    /* F868 80149460 972C20A0 */  sb         $zero, %lo(missile + 0x3F)($at)
    /* F86C 80149464 1080013C */  lui        $at, %hi(missile + 0x33)
    /* F870 80149468 21083100 */  addu       $at, $at, $s1
    /* F874 8014946C 8B2C20A0 */  sb         $zero, %lo(missile + 0x33)($at)
    /* F878 80149470 1080013C */  lui        $at, %hi(missile + 0x34)
    /* F87C 80149474 21083100 */  addu       $at, $at, $s1
    /* F880 80149478 8C2C20A0 */  sb         $zero, %lo(missile + 0x34)($at)
    /* F884 8014947C D3F4040C */  jal        SetMissAnim__Fii
    /* F888 80149480 03000524 */   addiu     $a1, $zero, 0x3
    /* F88C 80149484 1080013C */  lui        $at, %hi(missile + 0x42)
    /* F890 80149488 21083100 */  addu       $at, $at, $s1
    /* F894 8014948C 9A2C2290 */  lbu        $v0, %lo(missile + 0x42)($at)
    /* F898 80149490 00000000 */  nop
    /* F89C 80149494 00160200 */  sll        $v0, $v0, 24
    /* F8A0 80149498 03160200 */  sra        $v0, $v0, 24
    /* F8A4 8014949C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F8A8 801494A0 21083100 */  addu       $at, $at, $s1
    /* F8AC 801494A4 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* F8B0 801494A8 68EB040C */  jal        GetMissilePos__Fi
    /* F8B4 801494AC 21204002 */   addu      $a0, $s2, $zero
    /* F8B8 801494B0 04004232 */  andi       $v0, $s2, 0x4
  .L801494B4:
    /* F8BC 801494B4 0D004010 */  beqz       $v0, .L801494EC
    /* F8C0 801494B8 80101200 */   sll       $v0, $s2, 2
    /* F8C4 801494BC 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* F8C8 801494C0 21083100 */  addu       $at, $at, $s1
    /* F8CC 801494C4 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* F8D0 801494C8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* F8D4 801494CC 21083100 */  addu       $at, $at, $s1
    /* F8D8 801494D0 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* F8DC 801494D4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* F8E0 801494D8 21083100 */  addu       $at, $at, $s1
    /* F8E4 801494DC 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* F8E8 801494E0 F834010C */  jal        ChangeLight__Fiiii
    /* F8EC 801494E4 42020724 */   addiu     $a3, $zero, 0x242
    /* F8F0 801494E8 80101200 */  sll        $v0, $s2, 2
  .L801494EC:
    /* F8F4 801494EC 21105200 */  addu       $v0, $v0, $s2
    /* F8F8 801494F0 80100200 */  sll        $v0, $v0, 2
    /* F8FC 801494F4 23105200 */  subu       $v0, $v0, $s2
    /* F900 801494F8 80180200 */  sll        $v1, $v0, 2
    /* F904 801494FC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F908 80149500 21082300 */  addu       $at, $at, $v1
    /* F90C 80149504 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* F910 80149508 00000000 */  nop
    /* F914 8014950C 0C004014 */  bnez       $v0, .L80149540
    /* F918 80149510 01000224 */   addiu     $v0, $zero, 0x1
    /* F91C 80149514 1080013C */  lui        $at, %hi(missile + 0x38)
    /* F920 80149518 21082300 */  addu       $at, $at, $v1
    /* F924 8014951C 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* F928 80149520 04004232 */  andi       $v0, $s2, 0x4
    /* F92C 80149524 06004010 */  beqz       $v0, .L80149540
    /* F930 80149528 00000000 */   nop
    /* F934 8014952C 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* F938 80149530 21082300 */  addu       $at, $at, $v1
    /* F93C 80149534 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* F940 80149538 D034010C */  jal        AddUnLight__Fi
    /* F944 8014953C 00000000 */   nop
  .L80149540:
    /* F948 80149540 D1EA040C */  jal        PutMissile__Fi
    /* F94C 80149544 21204002 */   addu      $a0, $s2, $zero
    /* F950 80149548 7400BF8F */  lw         $ra, 0x74($sp)
    /* F954 8014954C 7000B28F */  lw         $s2, 0x70($sp)
    /* F958 80149550 6C00B18F */  lw         $s1, 0x6C($sp)
    /* F95C 80149554 6800B08F */  lw         $s0, 0x68($sp)
    /* F960 80149558 7800BD27 */  addiu      $sp, $sp, 0x78
    /* F964 8014955C 0800E003 */  jr         $ra
    /* F968 80149560 00000000 */   nop
endlabel MI_Cbolt__Fi
