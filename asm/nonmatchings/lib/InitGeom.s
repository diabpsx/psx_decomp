.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching InitGeom, 0x80

glabel InitGeom
    /* FD94 8001FD94 0B80013C */  lui        $at, %hi(D_800B634C)
    /* FD98 8001FD98 4C633FAC */  sw         $ra, %lo(D_800B634C)($at)
    /* FD9C 8001FD9C 877F000C */  jal        _patch_gte
    /* FDA0 8001FDA0 00000000 */   nop
    /* FDA4 8001FDA4 0B801F3C */  lui        $ra, %hi(D_800B634C)
    /* FDA8 8001FDA8 4C63FF8F */  lw         $ra, %lo(D_800B634C)($ra)
    /* FDAC 8001FDAC 00000000 */  nop
    /* FDB0 8001FDB0 00600240 */  mfc0       $v0, $12 /* handwritten instruction */
    /* FDB4 8001FDB4 0040033C */  lui        $v1, (0x40000000 >> 16)
    /* FDB8 8001FDB8 25104300 */  or         $v0, $v0, $v1
    /* FDBC 8001FDBC 00608240 */  mtc0       $v0, $12 /* handwritten instruction */
    /* FDC0 8001FDC0 00000000 */  nop
    /* FDC4 8001FDC4 55010824 */  addiu      $t0, $zero, 0x155
    /* FDC8 8001FDC8 00E8C848 */  ctc2       $t0, $29 /* handwritten instruction */
    /* FDCC 8001FDCC 00000000 */  nop
    /* FDD0 8001FDD0 00010824 */  addiu      $t0, $zero, 0x100
    /* FDD4 8001FDD4 00F0C848 */  ctc2       $t0, $30 /* handwritten instruction */
    /* FDD8 8001FDD8 00000000 */  nop
    /* FDDC 8001FDDC E8030824 */  addiu      $t0, $zero, 0x3E8
    /* FDE0 8001FDE0 00D0C848 */  ctc2       $t0, $26 /* handwritten instruction */
    /* FDE4 8001FDE4 00000000 */  nop
    /* FDE8 8001FDE8 9EEF0824 */  addiu      $t0, $zero, -0x1062
    /* FDEC 8001FDEC 00D8C848 */  ctc2       $t0, $27 /* handwritten instruction */
    /* FDF0 8001FDF0 00000000 */  nop
    /* FDF4 8001FDF4 4001083C */  lui        $t0, (0x1400000 >> 16)
    /* FDF8 8001FDF8 00E0C848 */  ctc2       $t0, $28 /* handwritten instruction */
    /* FDFC 8001FDFC 00000000 */  nop
    /* FE00 8001FE00 00C0C048 */  ctc2       $zero, $24 /* handwritten instruction */
    /* FE04 8001FE04 00C8C048 */  ctc2       $zero, $25 /* handwritten instruction */
    /* FE08 8001FE08 00000000 */  nop
    /* FE0C 8001FE0C 0800E003 */  jr         $ra
    /* FE10 8001FE10 00000000 */   nop
endlabel InitGeom
    /* FE14 8001FE14 00000000 */  nop
    /* FE18 8001FE18 00000000 */  nop
