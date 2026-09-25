.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostAddWeaponRack__Fi, 0x88

glabel PostAddWeaponRack__Fi
    /* 43400 80053400 1280023C */  lui        $v0, %hi(weaponFlag)
    /* 43404 80053404 96C14290 */  lbu        $v0, %lo(weaponFlag)($v0)
    /* 43408 80053408 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4340C 8005340C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 43410 80053410 21808000 */  addu       $s0, $a0, $zero
    /* 43414 80053414 0D004014 */  bnez       $v0, .L8005344C
    /* 43418 80053418 1400BFAF */   sw        $ra, 0x14($sp)
    /* 4341C 8005341C 40101000 */  sll        $v0, $s0, 1
    /* 43420 80053420 21105000 */  addu       $v0, $v0, $s0
    /* 43424 80053424 80100200 */  sll        $v0, $v0, 2
    /* 43428 80053428 23105000 */  subu       $v0, $v0, $s0
    /* 4342C 8005342C 80100200 */  sll        $v0, $v0, 2
    /* 43430 80053430 02000324 */  addiu      $v1, $zero, 0x2
    /* 43434 80053434 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 43438 80053438 21082200 */  addu       $at, $at, $v0
    /* 4343C 8005343C 718C23A0 */  sb         $v1, %lo(object + 0x25)($at)
    /* 43440 80053440 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 43444 80053444 21082200 */  addu       $at, $at, $v0
    /* 43448 80053448 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
  .L8005344C:
    /* 4344C 8005344C B7F6000C */  jal        GetRndSeed__Fv
    /* 43450 80053450 00000000 */   nop
    /* 43454 80053454 40181000 */  sll        $v1, $s0, 1
    /* 43458 80053458 21187000 */  addu       $v1, $v1, $s0
    /* 4345C 8005345C 80180300 */  sll        $v1, $v1, 2
    /* 43460 80053460 23187000 */  subu       $v1, $v1, $s0
    /* 43464 80053464 80180300 */  sll        $v1, $v1, 2
    /* 43468 80053468 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4346C 8005346C 21082300 */  addu       $at, $at, $v1
    /* 43470 80053470 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 43474 80053474 1400BF8F */  lw         $ra, 0x14($sp)
    /* 43478 80053478 1000B08F */  lw         $s0, 0x10($sp)
    /* 4347C 8005347C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 43480 80053480 0800E003 */  jr         $ra
    /* 43484 80053484 00000000 */   nop
endlabel PostAddWeaponRack__Fi
