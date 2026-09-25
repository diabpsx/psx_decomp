.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Load__7Overlay, 0x5C

glabel Load__7Overlay
    /* 8560C 8009560C E8FEBD27 */  addiu      $sp, $sp, -0x118
    /* 85610 80095610 1001B0AF */  sw         $s0, 0x110($sp)
    /* 85614 80095614 1401BFAF */  sw         $ra, 0x114($sp)
    /* 85618 80095618 2011020C */  jal        SYSI_GetOverlayFs__Fv
    /* 8561C 8009561C 21808000 */   addu      $s0, $a0, $zero
    /* 85620 80095620 0800058E */  lw         $a1, 0x8($s0)
    /* 85624 80095624 0000068E */  lw         $a2, 0x0($s0)
    /* 85628 80095628 0400078E */  lw         $a3, 0x4($s0)
    /* 8562C 8009562C FD16020C */  jal        ReadAtAddr__6FileIOPCcPUci
    /* 85630 80095630 21204000 */   addu      $a0, $v0, $zero
    /* 85634 80095634 9E4E000C */  jal        DrawSync
    /* 85638 80095638 21200000 */   addu      $a0, $zero, $zero
    /* 8563C 8009563C 6346000C */  jal        EnterCriticalSection
    /* 85640 80095640 00000000 */   nop
    /* 85644 80095644 4F46000C */  jal        FlushCache
    /* 85648 80095648 00000000 */   nop
    /* 8564C 8009564C 6746000C */  jal        ExitCriticalSection
    /* 85650 80095650 00000000 */   nop
    /* 85654 80095654 1401BF8F */  lw         $ra, 0x114($sp)
    /* 85658 80095658 1001B08F */  lw         $s0, 0x110($sp)
    /* 8565C 8009565C 1801BD27 */  addiu      $sp, $sp, 0x118
    /* 85660 80095660 0800E003 */  jr         $ra
    /* 85664 80095664 00000000 */   nop
endlabel Load__7Overlay
