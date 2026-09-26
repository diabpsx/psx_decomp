.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddResurrectBeam__Fiiiiiicii, 0x90

glabel AddResurrectBeam__Fiiiiiicii
    /* 8898 80142490 80100400 */  sll        $v0, $a0, 2
    /* 889C 80142494 21104400 */  addu       $v0, $v0, $a0
    /* 88A0 80142498 80100200 */  sll        $v0, $v0, 2
    /* 88A4 8014249C 23104400 */  subu       $v0, $v0, $a0
    /* 88A8 801424A0 1000A38F */  lw         $v1, 0x10($sp)
    /* 88AC 801424A4 80100200 */  sll        $v0, $v0, 2
    /* 88B0 801424A8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 88B4 801424AC 21082200 */  addu       $at, $at, $v0
    /* 88B8 801424B0 892C27A0 */  sb         $a3, %lo(missile + 0x31)($at)
    /* 88BC 801424B4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 88C0 801424B8 21082200 */  addu       $at, $at, $v0
    /* 88C4 801424BC 892C2490 */  lbu        $a0, %lo(missile + 0x31)($at)
    /* 88C8 801424C0 1080013C */  lui        $at, %hi(missile)
    /* 88CC 801424C4 21082200 */  addu       $at, $at, $v0
    /* 88D0 801424C8 582C20AC */  sw         $zero, %lo(missile)($at)
    /* 88D4 801424CC 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 88D8 801424D0 21082200 */  addu       $at, $at, $v0
    /* 88DC 801424D4 5C2C20AC */  sw         $zero, %lo(missile + 0x4)($at)
    /* 88E0 801424D8 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 88E4 801424DC 21082200 */  addu       $at, $at, $v0
    /* 88E8 801424E0 8A2C23A0 */  sb         $v1, %lo(missile + 0x32)($at)
    /* 88EC 801424E4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 88F0 801424E8 21082200 */  addu       $at, $at, $v0
    /* 88F4 801424EC 8A2C2590 */  lbu        $a1, %lo(missile + 0x32)($at)
    /* 88F8 801424F0 10000324 */  addiu      $v1, $zero, 0x10
    /* 88FC 801424F4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 8900 801424F8 21082200 */  addu       $at, $at, $v0
    /* 8904 801424FC 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 8908 80142500 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 890C 80142504 21082200 */  addu       $at, $at, $v0
    /* 8910 80142508 8D2C24A0 */  sb         $a0, %lo(missile + 0x35)($at)
    /* 8914 8014250C 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 8918 80142510 21082200 */  addu       $at, $at, $v0
    /* 891C 80142514 8E2C25A0 */  sb         $a1, %lo(missile + 0x36)($at)
    /* 8920 80142518 0800E003 */  jr         $ra
    /* 8924 8014251C 00000000 */   nop
endlabel AddResurrectBeam__Fiiiiiicii
