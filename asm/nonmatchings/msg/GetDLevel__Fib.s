.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDLevel__Fib, 0x48

glabel GetDLevel__Fib
    /* 42888 80052888 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4288C 8005288C 1280023C */  lui        $v0, %hi(setlevel)
    /* 42890 80052890 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 42894 80052894 21288000 */  addu       $a1, $a0, $zero
    /* 42898 80052898 05004010 */  beqz       $v0, .L800528B0
    /* 4289C 8005289C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 428A0 800528A0 1280023C */  lui        $v0, %hi(setlvlnum)
    /* 428A4 800528A4 0FC14290 */  lbu        $v0, %lo(setlvlnum)($v0)
    /* 428A8 800528A8 00000000 */  nop
    /* 428AC 800528AC 10004524 */  addiu      $a1, $v0, 0x10
  .L800528B0:
    /* 428B0 800528B0 0D80043C */  lui        $a0, %hi(GameMaps)
    /* 428B4 800528B4 4C708424 */  addiu      $a0, $a0, %lo(GameMaps)
    /* 428B8 800528B8 E205020C */  jal        GetMap__13CompLevelMapsi
    /* 428BC 800528BC 00000000 */   nop
    /* 428C0 800528C0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 428C4 800528C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 428C8 800528C8 0800E003 */  jr         $ra
    /* 428CC 800528CC 00000000 */   nop
endlabel GetDLevel__Fib
