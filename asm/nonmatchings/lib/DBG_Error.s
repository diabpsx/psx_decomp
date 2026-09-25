.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DBG_Error, 0x34

glabel DBG_Error
    /* 10E94 80020E94 1280023C */  lui        $v0, %hi(ErrorFunc)
    /* 10E98 80020E98 B8CA428C */  lw         $v0, %lo(ErrorFunc)($v0)
    /* 10E9C 80020E9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10EA0 80020EA0 03004010 */  beqz       $v0, .L80020EB0
    /* 10EA4 80020EA4 1000BFAF */   sw        $ra, 0x10($sp)
    /* 10EA8 80020EA8 09F84000 */  jalr       $v0
    /* 10EAC 80020EAC 00000000 */   nop
  .L80020EB0:
    /* 10EB0 80020EB0 9983000C */  jal        DBG_Halt
    /* 10EB4 80020EB4 00000000 */   nop
    /* 10EB8 80020EB8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10EBC 80020EBC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10EC0 80020EC0 0800E003 */  jr         $ra
    /* 10EC4 80020EC4 00000000 */   nop
endlabel DBG_Error
