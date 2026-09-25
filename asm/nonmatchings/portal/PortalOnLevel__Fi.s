.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PortalOnLevel__Fi, 0x38

glabel PortalOnLevel__Fi
    /* 711E8 800811E8 40100400 */  sll        $v0, $a0, 1
    /* 711EC 800811EC 21104400 */  addu       $v0, $v0, $a0
    /* 711F0 800811F0 80100200 */  sll        $v0, $v0, 2
    /* 711F4 800811F4 0E80013C */  lui        $at, %hi(portal + 0x6)
    /* 711F8 800811F8 21082200 */  addu       $at, $at, $v0
    /* 711FC 800811FC F23B2280 */  lb         $v0, %lo(portal + 0x6)($at)
    /* 71200 80081200 1280033C */  lui        $v1, %hi(currlevel)
    /* 71204 80081204 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 71208 80081208 00000000 */  nop
    /* 7120C 8008120C 02004314 */  bne        $v0, $v1, .L80081218
    /* 71210 80081210 0100622C */   sltiu     $v0, $v1, 0x1
    /* 71214 80081214 01000224 */  addiu      $v0, $zero, 0x1
  .L80081218:
    /* 71218 80081218 0800E003 */  jr         $ra
    /* 7121C 8008121C 00000000 */   nop
endlabel PortalOnLevel__Fi
