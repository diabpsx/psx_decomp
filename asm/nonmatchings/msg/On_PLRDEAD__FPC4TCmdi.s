.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_PLRDEAD__FPC4TCmdi, 0x48

glabel On_PLRDEAD__FPC4TCmdi
    /* 41B30 80051B30 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 41B34 80051B34 21188000 */  addu       $v1, $a0, $zero
    /* 41B38 80051B38 1280023C */  lui        $v0, %hi(myplr)
    /* 41B3C 80051B3C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 41B40 80051B40 2120A000 */  addu       $a0, $a1, $zero
    /* 41B44 80051B44 06008210 */  beq        $a0, $v0, .L80051B60
    /* 41B48 80051B48 1000BFAF */   sw        $ra, 0x10($sp)
    /* 41B4C 80051B4C 02006594 */  lhu        $a1, 0x2($v1)
    /* 41B50 80051B50 769B010C */  jal        SyncPlrKill__Fii
    /* 41B54 80051B54 00000000 */   nop
    /* 41B58 80051B58 DA460108 */  j          .L80051B68
    /* 41B5C 80051B5C 00000000 */   nop
  .L80051B60:
    /* 41B60 80051B60 DB3F010C */  jal        check_update_plr__Fi
    /* 41B64 80051B64 00000000 */   nop
  .L80051B68:
    /* 41B68 80051B68 1000BF8F */  lw         $ra, 0x10($sp)
    /* 41B6C 80051B6C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 41B70 80051B70 0800E003 */  jr         $ra
    /* 41B74 80051B74 00000000 */   nop
endlabel On_PLRDEAD__FPC4TCmdi
