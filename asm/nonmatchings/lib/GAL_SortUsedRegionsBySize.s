.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_SortUsedRegionsBySize, 0x54

glabel GAL_SortUsedRegionsBySize
    /* 130B4 800230B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 130B8 800230B8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 130BC 800230BC FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 130C0 800230C0 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 130C4 800230C4 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 130C8 800230C8 24208200 */   and       $a0, $a0, $v0
    /* 130CC 800230CC 07004010 */  beqz       $v0, .L800230EC
    /* 130D0 800230D0 00000000 */   nop
    /* 130D4 800230D4 0280053C */  lui        $a1, %hi(SortSize)
    /* 130D8 800230D8 0831A524 */  addiu      $a1, $a1, %lo(SortSize)
    /* 130DC 800230DC 5F8C000C */  jal        SortMemHdrList
    /* 130E0 800230E0 24004424 */   addiu     $a0, $v0, 0x24
    /* 130E4 800230E4 3E8C0008 */  j          .L800230F8
    /* 130E8 800230E8 01000234 */   ori       $v0, $zero, 0x1
  .L800230EC:
    /* 130EC 800230EC 0389000C */  jal        GSetError
    /* 130F0 800230F0 04000434 */   ori       $a0, $zero, 0x4
    /* 130F4 800230F4 21100000 */  addu       $v0, $zero, $zero
  .L800230F8:
    /* 130F8 800230F8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 130FC 800230FC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13100 80023100 0800E003 */  jr         $ra
    /* 13104 80023104 00000000 */   nop
endlabel GAL_SortUsedRegionsBySize
