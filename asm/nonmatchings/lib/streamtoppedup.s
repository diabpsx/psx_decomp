.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamtoppedup, 0x38

glabel streamtoppedup
    /* 191C4 800291C4 E81C828F */  lw         $v0, %gp_rel(streamtoppedupflag)($gp)
    /* 191C8 800291C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 191CC 800291CC 06004010 */  beqz       $v0, .L800291E8
    /* 191D0 800291D0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 191D4 800291D4 14A4000C */  jal        reserveioforasync
    /* 191D8 800291D8 00000000 */   nop
    /* 191DC 800291DC DC1C828F */  lw         $v0, %gp_rel(streamhasioflag)($gp)
    /* 191E0 800291E0 7BA40008 */  j          .L800291EC
    /* 191E4 800291E4 0100422C */   sltiu     $v0, $v0, 0x1
  .L800291E8:
    /* 191E8 800291E8 21100000 */  addu       $v0, $zero, $zero
  .L800291EC:
    /* 191EC 800291EC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 191F0 800291F0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 191F4 800291F4 0800E003 */  jr         $ra
    /* 191F8 800291F8 00000000 */   nop
endlabel streamtoppedup
