.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___14CPauseMessages, 0x34

glabel ___14CPauseMessages
    /* 7937C 8008937C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 79380 80089380 1180023C */  lui        $v0, %hi(D_80110428)
    /* 79384 80089384 28044224 */  addiu      $v0, $v0, %lo(D_80110428)
    /* 79388 80089388 0100A530 */  andi       $a1, $a1, 0x1
    /* 7938C 8008938C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 79390 80089390 0300A010 */  beqz       $a1, .L800893A0
    /* 79394 80089394 040082AC */   sw        $v0, 0x4($a0)
    /* 79398 80089398 BE44000C */  jal        __builtin_delete
    /* 7939C 8008939C 00000000 */   nop
  .L800893A0:
    /* 793A0 800893A0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 793A4 800893A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 793A8 800893A8 0800E003 */  jr         $ra
    /* 793AC 800893AC 00000000 */   nop
endlabel ___14CPauseMessages
