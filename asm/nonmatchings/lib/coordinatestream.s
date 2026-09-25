.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching coordinatestream, 0x2C

glabel coordinatestream
    /* 1D9B4 8002D9B4 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1D9B8 8002D9B8 00000000 */  nop
    /* 1D9BC 8002D9BC 06008010 */  beqz       $a0, .L8002D9D8
    /* 1D9C0 8002D9C0 00000000 */   nop
    /* 1D9C4 8002D9C4 2800838C */  lw         $v1, 0x28($a0)
    /* 1D9C8 8002D9C8 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D9CC 8002D9CC 02006214 */  bne        $v1, $v0, .L8002D9D8
    /* 1D9D0 8002D9D0 15000224 */   addiu     $v0, $zero, 0x15
    /* 1D9D4 8002D9D4 240082AC */  sw         $v0, 0x24($a0)
  .L8002D9D8:
    /* 1D9D8 8002D9D8 0800E003 */  jr         $ra
    /* 1D9DC 8002D9DC 00000000 */   nop
endlabel coordinatestream
