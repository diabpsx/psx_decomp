.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetupWorkRam__Fv, 0xA0

glabel SetupWorkRam__Fv
    /* A04FC 800B04FC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* A0500 800B0500 01000224 */  addiu      $v0, $zero, 0x1
    /* A0504 800B0504 1400B1AF */  sw         $s1, 0x14($sp)
    /* A0508 800B0508 0B80113C */  lui        $s1, %hi(D_800B7948)
    /* A050C 800B050C 48793126 */  addiu      $s1, $s1, %lo(D_800B7948)
    /* A0510 800B0510 0B80013C */  lui        $at, %hi(D_800B7928)
    /* A0514 800B0514 287922AC */  sw         $v0, %lo(D_800B7928)($at)
    /* A0518 800B0518 801F023C */  lui        $v0, (0x1F800000 >> 16)
    /* A051C 800B051C 1800BFAF */  sw         $ra, 0x18($sp)
    /* A0520 800B0520 1000B0AF */  sw         $s0, 0x10($sp)
    /* A0524 800B0524 000022AE */  sw         $v0, 0x0($s1)
    /* A0528 800B0528 00040224 */  addiu      $v0, $zero, 0x400
    /* A052C 800B052C 0B80013C */  lui        $at, %hi(D_800B794C)
    /* A0530 800B0530 4C7922AC */  sw         $v0, %lo(D_800B794C)($at)
    /* A0534 800B0534 02000224 */  addiu      $v0, $zero, 0x2
    /* A0538 800B0538 0B80103C */  lui        $s0, %hi(D_800B7920)
    /* A053C 800B053C 20791026 */  addiu      $s0, $s0, %lo(D_800B7920)
    /* A0540 800B0540 1180043C */  lui        $a0, %hi(OPT_FreeMemStart)
    /* A0544 800B0544 E4DB848C */  lw         $a0, %lo(OPT_FreeMemStart)($a0)
    /* A0548 800B0548 1180063C */  lui        $a2, %hi(OPT_FreeMemSize)
    /* A054C 800B054C E8DBC68C */  lw         $a2, %lo(OPT_FreeMemSize)($a2)
    /* A0550 800B0550 0B80013C */  lui        $at, %hi(D_800B7950)
    /* A0554 800B0554 507922AC */  sw         $v0, %lo(D_800B7950)($at)
    /* A0558 800B0558 000004AE */  sw         $a0, 0x0($s0)
    /* A055C 800B055C 0B80013C */  lui        $at, %hi(D_800B7924)
    /* A0560 800B0560 247926AC */  sw         $a2, %lo(D_800B7924)($at)
    /* A0564 800B0564 E940000C */  jal        memset
    /* A0568 800B0568 21280000 */   addu      $a1, $zero, $zero
    /* A056C 800B056C 2F85000C */  jal        GAL_AddMemType
    /* A0570 800B0570 21202002 */   addu      $a0, $s1, $zero
    /* A0574 800B0574 2F85000C */  jal        GAL_AddMemType
    /* A0578 800B0578 21200002 */   addu      $a0, $s0, $zero
    /* A057C 800B057C FE8B000C */  jal        GAL_SetVerbosity
    /* A0580 800B0580 01000424 */   addiu     $a0, $zero, 0x1
    /* A0584 800B0584 1800BF8F */  lw         $ra, 0x18($sp)
    /* A0588 800B0588 1400B18F */  lw         $s1, 0x14($sp)
    /* A058C 800B058C 1000B08F */  lw         $s0, 0x10($sp)
    /* A0590 800B0590 2000BD27 */  addiu      $sp, $sp, 0x20
    /* A0594 800B0594 0800E003 */  jr         $ra
    /* A0598 800B0598 00000000 */   nop
endlabel SetupWorkRam__Fv
