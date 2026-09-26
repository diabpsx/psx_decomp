.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PAD_Open__Fv, 0x44

glabel PAD_Open__Fv
    /* A071C 800B071C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A0720 800B0720 1000BFAF */  sw         $ra, 0x10($sp)
    /* A0724 800B0724 0B80043C */  lui        $a0, %hi(RawPadData0)
    /* A0728 800B0728 0C7F8424 */  addiu      $a0, $a0, %lo(RawPadData0)
    /* A072C 800B072C 22000524 */  addiu      $a1, $zero, 0x22
    /* A0730 800B0730 0B80063C */  lui        $a2, %hi(RawPadData1)
    /* A0734 800B0734 307FC624 */  addiu      $a2, $a2, %lo(RawPadData1)
    /* A0738 800B0738 2F7F000C */  jal        InitTAP
    /* A073C 800B073C 22000724 */   addiu     $a3, $zero, 0x22
    /* A0740 800B0740 377F000C */  jal        StartTAP
    /* A0744 800B0744 00000000 */   nop
    /* A0748 800B0748 9746000C */  jal        PadInit
    /* A074C 800B074C 01000424 */   addiu     $a0, $zero, 0x1
    /* A0750 800B0750 1000BF8F */  lw         $ra, 0x10($sp)
    /* A0754 800B0754 1800BD27 */  addiu      $sp, $sp, 0x18
    /* A0758 800B0758 0800E003 */  jr         $ra
    /* A075C 800B075C 00000000 */   nop
endlabel PAD_Open__Fv
