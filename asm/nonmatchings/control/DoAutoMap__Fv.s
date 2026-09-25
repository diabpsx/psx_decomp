.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoAutoMap__Fv, 0x60

glabel DoAutoMap__Fv
    /* 221C8 800321C8 1280023C */  lui        $v0, %hi(currlevel)
    /* 221CC 800321CC 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 221D0 800321D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 221D4 800321D4 05004014 */  bnez       $v0, .L800321EC
    /* 221D8 800321D8 1000BFAF */   sw        $ra, 0x10($sp)
    /* 221DC 800321DC 11F7000C */  jal        InitDiabloMsg__Fc
    /* 221E0 800321E0 01000424 */   addiu     $a0, $zero, 0x1
    /* 221E4 800321E4 86C80008 */  j          .L80032218
    /* 221E8 800321E8 00000000 */   nop
  .L800321EC:
    /* 221EC 800321EC 1280023C */  lui        $v0, %hi(automapflag)
    /* 221F0 800321F0 7BC34290 */  lbu        $v0, %lo(automapflag)($v0)
    /* 221F4 800321F4 00000000 */  nop
    /* 221F8 800321F8 05004014 */  bnez       $v0, .L80032210
    /* 221FC 800321FC 00000000 */   nop
    /* 22200 80032200 D687050C */  jal        func_80161F58
    /* 22204 80032204 00000000 */   nop
    /* 22208 80032208 86C80008 */  j          .L80032218
    /* 2220C 8003220C 00000000 */   nop
  .L80032210:
    /* 22210 80032210 1280013C */  lui        $at, %hi(automapflag)
    /* 22214 80032214 7BC320A0 */  sb         $zero, %lo(automapflag)($at)
  .L80032218:
    /* 22218 80032218 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2221C 8003221C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22220 80032220 0800E003 */  jr         $ra
    /* 22224 80032224 00000000 */   nop
endlabel DoAutoMap__Fv
