.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_SortUsedRegionsByAddress, 0x54

glabel GAL_SortUsedRegionsByAddress
    /* 13118 80023118 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1311C 8002311C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 13120 80023120 FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 13124 80023124 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 13128 80023128 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 1312C 8002312C 24208200 */   and       $a0, $a0, $v0
    /* 13130 80023130 07004010 */  beqz       $v0, .L80023150
    /* 13134 80023134 00000000 */   nop
    /* 13138 80023138 0280053C */  lui        $a1, %hi(SortAddr)
    /* 1313C 8002313C 6C31A524 */  addiu      $a1, $a1, %lo(SortAddr)
    /* 13140 80023140 5F8C000C */  jal        SortMemHdrList
    /* 13144 80023144 24004424 */   addiu     $a0, $v0, 0x24
    /* 13148 80023148 578C0008 */  j          .L8002315C
    /* 1314C 8002314C 01000234 */   ori       $v0, $zero, 0x1
  .L80023150:
    /* 13150 80023150 0389000C */  jal        GSetError
    /* 13154 80023154 04000434 */   ori       $a0, $zero, 0x4
    /* 13158 80023158 21100000 */  addu       $v0, $zero, $zero
  .L8002315C:
    /* 1315C 8002315C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 13160 80023160 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13164 80023164 0800E003 */  jr         $ra
    /* 13168 80023168 00000000 */   nop
endlabel GAL_SortUsedRegionsByAddress
