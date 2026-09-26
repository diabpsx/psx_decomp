.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoStand__Fi, 0x60

glabel M_DoStand__Fi
    /* 12E98 8014CA90 40100400 */  sll        $v0, $a0, 1
    /* 12E9C 8014CA94 21104400 */  addu       $v0, $v0, $a0
    /* 12EA0 8014CA98 80100200 */  sll        $v0, $v0, 2
    /* 12EA4 8014CA9C 21104400 */  addu       $v0, $v0, $a0
    /* 12EA8 8014CAA0 C0100200 */  sll        $v0, $v0, 3
    /* 12EAC 8014CAA4 1080033C */  lui        $v1, %hi(monster)
    /* 12EB0 8014CAA8 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 12EB4 8014CAAC 21204300 */  addu       $a0, $v0, $v1
    /* 12EB8 8014CAB0 6000828C */  lw         $v0, 0x60($a0)
    /* 12EBC 8014CAB4 00000000 */  nop
    /* 12EC0 8014CAB8 12004390 */  lbu        $v1, 0x12($v0)
    /* 12EC4 8014CABC 6D000224 */  addiu      $v0, $zero, 0x6D
    /* 12EC8 8014CAC0 04006214 */  bne        $v1, $v0, .L8014CAD4
    /* 12ECC 8014CAC4 00000000 */   nop
    /* 12ED0 8014CAC8 01000224 */  addiu      $v0, $zero, 0x1
    /* 12ED4 8014CACC B6320508 */  j          .L8014CAD8
    /* 12ED8 8014CAD0 5A0082A0 */   sb        $v0, 0x5A($a0)
  .L8014CAD4:
    /* 12EDC 8014CAD4 5A0080A0 */  sb         $zero, 0x5A($a0)
  .L8014CAD8:
    /* 12EE0 8014CAD8 1A008294 */  lhu        $v0, 0x1A($a0)
    /* 12EE4 8014CADC 00000000 */  nop
    /* 12EE8 8014CAE0 01004224 */  addiu      $v0, $v0, 0x1
    /* 12EEC 8014CAE4 1A0082A4 */  sh         $v0, 0x1A($a0)
    /* 12EF0 8014CAE8 0800E003 */  jr         $ra
    /* 12EF4 8014CAEC 21100000 */   addu      $v0, $zero, $zero
endlabel M_DoStand__Fi
