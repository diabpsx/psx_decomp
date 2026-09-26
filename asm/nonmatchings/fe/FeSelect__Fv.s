.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeSelect__Fv, 0x50

glabel FeSelect__Fv
    /* C58 8013A850 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* C5C 8013A854 1000BFAF */  sw         $ra, 0x10($sp)
    /* C60 8013A858 C6F5000C */  jal        PlaySFX__Fi
    /* C64 8013A85C 33000424 */   addiu     $a0, $zero, 0x33
    /* C68 8013A860 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* C6C 8013A864 00000000 */  nop
    /* C70 8013A868 0400438C */  lw         $v1, 0x4($v0)
    /* C74 8013A86C 00000000 */  nop
    /* C78 8013A870 40100300 */  sll        $v0, $v1, 1
    /* C7C 8013A874 21104300 */  addu       $v0, $v0, $v1
    /* C80 8013A878 C0100200 */  sll        $v0, $v0, 3
    /* C84 8013A87C 0D80013C */  lui        $at, %hi(FeBuffer + 0x14)
    /* C88 8013A880 21082200 */  addu       $at, $at, $v0
    /* C8C 8013A884 8CDB248C */  lw         $a0, %lo(FeBuffer + 0x14)($at)
    /* C90 8013A888 29E9040C */  jal        FeNewMenu__FP7FeTable
    /* C94 8013A88C 00000000 */   nop
    /* C98 8013A890 1000BF8F */  lw         $ra, 0x10($sp)
    /* C9C 8013A894 1800BD27 */  addiu      $sp, $sp, 0x18
    /* CA0 8013A898 0800E003 */  jr         $ra
    /* CA4 8013A89C 00000000 */   nop
endlabel FeSelect__Fv
