.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SwitchMONO__Fv, 0x4C

glabel SwitchMONO__Fv
    /* 99214 800A9214 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 99218 800A9218 1000BFAF */  sw         $ra, 0x10($sp)
    /* 9921C 800A921C C6F5000C */  jal        PlaySFX__Fi
    /* 99220 800A9220 33000424 */   addiu     $a0, $zero, 0x33
    /* 99224 800A9224 1280023C */  lui        $v0, %hi(MONO)
    /* 99228 800A9228 B0BB428C */  lw         $v0, %lo(MONO)($v0)
    /* 9922C 800A922C 00000000 */  nop
    /* 99230 800A9230 05004010 */  beqz       $v0, .L800A9248
    /* 99234 800A9234 01000224 */   addiu     $v0, $zero, 0x1
    /* 99238 800A9238 1280013C */  lui        $at, %hi(MONO)
    /* 9923C 800A923C B0BB20AC */  sw         $zero, %lo(MONO)($at)
    /* 99240 800A9240 94A40208 */  j          .L800A9250
    /* 99244 800A9244 00000000 */   nop
  .L800A9248:
    /* 99248 800A9248 1280013C */  lui        $at, %hi(MONO)
    /* 9924C 800A924C B0BB22AC */  sw         $v0, %lo(MONO)($at)
  .L800A9250:
    /* 99250 800A9250 1000BF8F */  lw         $ra, 0x10($sp)
    /* 99254 800A9254 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 99258 800A9258 0800E003 */  jr         $ra
    /* 9925C 800A925C 00000000 */   nop
endlabel SwitchMONO__Fv
