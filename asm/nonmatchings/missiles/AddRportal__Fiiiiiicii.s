.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddRportal__Fiiiiiicii, 0x12C

glabel AddRportal__Fiiiiiicii
    /* 8B9C 80142794 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8BA0 80142798 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8BA4 8014279C 21908000 */  addu       $s2, $a0, $zero
    /* 8BA8 801427A0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8BAC 801427A4 2180A000 */  addu       $s0, $a1, $zero
    /* 8BB0 801427A8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8BB4 801427AC 2188C000 */  addu       $s1, $a2, $zero
    /* 8BB8 801427B0 C0181100 */  sll        $v1, $s1, 3
    /* 8BBC 801427B4 C0101000 */  sll        $v0, $s0, 3
    /* 8BC0 801427B8 23105000 */  subu       $v0, $v0, $s0
    /* 8BC4 801427BC C0110200 */  sll        $v0, $v0, 7
    /* 8BC8 801427C0 21186200 */  addu       $v1, $v1, $v0
    /* 8BCC 801427C4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 8BD0 801427C8 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 8BD4 801427CC 21082300 */  addu       $at, $at, $v1
    /* 8BD8 801427D0 2D7A2480 */  lb         $a0, %lo(dung_map + 0x5)($at)
    /* 8BDC 801427D4 00000000 */  nop
    /* 8BE0 801427D8 0E008018 */  blez       $a0, .L80142814
    /* 8BE4 801427DC FFFF8424 */   addiu     $a0, $a0, -0x1
    /* 8BE8 801427E0 80100400 */  sll        $v0, $a0, 2
    /* 8BEC 801427E4 21104400 */  addu       $v0, $v0, $a0
    /* 8BF0 801427E8 80100200 */  sll        $v0, $v0, 2
    /* 8BF4 801427EC 23104400 */  subu       $v0, $v0, $a0
    /* 8BF8 801427F0 80100200 */  sll        $v0, $v0, 2
    /* 8BFC 801427F4 1080033C */  lui        $v1, %hi(missile)
    /* 8C00 801427F8 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* 8C04 801427FC 21104300 */  addu       $v0, $v0, $v1
    /* 8C08 80142800 32004390 */  lbu        $v1, 0x32($v0)
    /* 8C0C 80142804 00000000 */  nop
    /* 8C10 80142808 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 8C14 8014280C D1EA040C */  jal        PutMissile__Fi
    /* 8C18 80142810 320043A0 */   sb        $v1, 0x32($v0)
  .L80142814:
    /* 8C1C 80142814 21204002 */  addu       $a0, $s2, $zero
    /* 8C20 80142818 80100400 */  sll        $v0, $a0, 2
    /* 8C24 8014281C 21104400 */  addu       $v0, $v0, $a0
    /* 8C28 80142820 80100200 */  sll        $v0, $v0, 2
    /* 8C2C 80142824 23104400 */  subu       $v0, $v0, $a0
    /* 8C30 80142828 80100200 */  sll        $v0, $v0, 2
    /* 8C34 8014282C 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 8C38 80142830 21082200 */  addu       $at, $at, $v0
    /* 8C3C 80142834 9A2C2390 */  lbu        $v1, %lo(missile + 0x42)($at)
    /* 8C40 80142838 64000524 */  addiu      $a1, $zero, 0x64
    /* 8C44 8014283C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 8C48 80142840 21082200 */  addu       $at, $at, $v0
    /* 8C4C 80142844 892C30A0 */  sb         $s0, %lo(missile + 0x31)($at)
    /* 8C50 80142848 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 8C54 8014284C 21082200 */  addu       $at, $at, $v0
    /* 8C58 80142850 8A2C31A0 */  sb         $s1, %lo(missile + 0x32)($at)
    /* 8C5C 80142854 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 8C60 80142858 21082200 */  addu       $at, $at, $v0
    /* 8C64 8014285C 8D2C30A0 */  sb         $s0, %lo(missile + 0x35)($at)
    /* 8C68 80142860 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 8C6C 80142864 21082200 */  addu       $at, $at, $v0
    /* 8C70 80142868 8E2C31A0 */  sb         $s1, %lo(missile + 0x36)($at)
    /* 8C74 8014286C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 8C78 80142870 21082200 */  addu       $at, $at, $v0
    /* 8C7C 80142874 702C25A4 */  sh         $a1, %lo(missile + 0x18)($at)
    /* 8C80 80142878 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 8C84 8014287C 21082200 */  addu       $at, $at, $v0
    /* 8C88 80142880 782C20A4 */  sh         $zero, %lo(missile + 0x20)($at)
    /* 8C8C 80142884 001E0300 */  sll        $v1, $v1, 24
    /* 8C90 80142888 031E0300 */  sra        $v1, $v1, 24
    /* 8C94 8014288C 2328A300 */  subu       $a1, $a1, $v1
    /* 8C98 80142890 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 8C9C 80142894 21082200 */  addu       $at, $at, $v0
    /* 8CA0 80142898 762C25A4 */  sh         $a1, %lo(missile + 0x1E)($at)
    /* 8CA4 8014289C D1EA040C */  jal        PutMissile__Fi
    /* 8CA8 801428A0 00000000 */   nop
    /* 8CAC 801428A4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 8CB0 801428A8 1800B28F */  lw         $s2, 0x18($sp)
    /* 8CB4 801428AC 1400B18F */  lw         $s1, 0x14($sp)
    /* 8CB8 801428B0 1000B08F */  lw         $s0, 0x10($sp)
    /* 8CBC 801428B4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8CC0 801428B8 0800E003 */  jr         $ra
    /* 8CC4 801428BC 00000000 */   nop
endlabel AddRportal__Fiiiiiicii
