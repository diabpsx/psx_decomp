.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_Clip__FP4RECTi, 0x128

glabel PRIM_Clip__FP4RECTi
    /* 739EC 800839EC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 739F0 800839F0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 739F4 800839F4 2188A000 */  addu       $s1, $a1, $zero
    /* 739F8 800839F8 2400BFAF */  sw         $ra, 0x24($sp)
    /* 739FC 800839FC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 73A00 80083A00 1800B0AF */  sw         $s0, 0x18($sp)
    /* 73A04 80083A04 03008288 */  lwl        $v0, 0x3($a0)
    /* 73A08 80083A08 00008298 */  lwr        $v0, 0x0($a0)
    /* 73A0C 80083A0C 07008388 */  lwl        $v1, 0x7($a0)
    /* 73A10 80083A10 04008398 */  lwr        $v1, 0x4($a0)
    /* 73A14 80083A14 1300A2AB */  swl        $v0, 0x13($sp)
    /* 73A18 80083A18 1000A2BB */  swr        $v0, 0x10($sp)
    /* 73A1C 80083A1C 1700A3AB */  swl        $v1, 0x17($sp)
    /* 73A20 80083A20 1400A3BB */  swr        $v1, 0x14($sp)
    /* 73A24 80083A24 5B10020C */  jal        VID_GetXOff__Fv
    /* 73A28 80083A28 80881100 */   sll       $s1, $s1, 2
    /* 73A2C 80083A2C 1000A397 */  lhu        $v1, 0x10($sp)
    /* 73A30 80083A30 00000000 */  nop
    /* 73A34 80083A34 21186200 */  addu       $v1, $v1, $v0
    /* 73A38 80083A38 5E10020C */  jal        VID_GetYOff__Fv
    /* 73A3C 80083A3C 1000A3A7 */   sh        $v1, 0x10($sp)
    /* 73A40 80083A40 1280043C */  lui        $a0, %hi(AddrToAvoid + 0x4)
    /* 73A44 80083A44 C0AA8424 */  addiu      $a0, $a0, %lo(AddrToAvoid + 0x4)
    /* 73A48 80083A48 1000B227 */  addiu      $s2, $sp, 0x10
    /* 73A4C 80083A4C 1200A397 */  lhu        $v1, 0x12($sp)
    /* 73A50 80083A50 21284002 */  addu       $a1, $s2, $zero
    /* 73A54 80083A54 21186200 */  addu       $v1, $v1, $v0
    /* 73A58 80083A58 AD0F020C */  jal        ClipRect__FRC4RECTR4RECT
    /* 73A5C 80083A5C 1200A3A7 */   sh        $v1, 0x12($sp)
    /* 73A60 80083A60 921E8393 */  lbu        $v1, %gp_rel(D_8011C612)($gp)
    /* 73A64 80083A64 00000000 */  nop
    /* 73A68 80083A68 C0100300 */  sll        $v0, $v1, 3
    /* 73A6C 80083A6C 23104300 */  subu       $v0, $v0, $v1
    /* 73A70 80083A70 941E838F */  lw         $v1, %gp_rel(D_8011C614)($gp)
    /* 73A74 80083A74 00110200 */  sll        $v0, $v0, 4
    /* 73A78 80083A78 21104300 */  addu       $v0, $v0, $v1
    /* 73A7C 80083A7C 1000A397 */  lhu        $v1, 0x10($sp)
    /* 73A80 80083A80 00004494 */  lhu        $a0, 0x0($v0)
    /* 73A84 80083A84 00000000 */  nop
    /* 73A88 80083A88 21186400 */  addu       $v1, $v1, $a0
    /* 73A8C 80083A8C 1000A3A7 */  sh         $v1, 0x10($sp)
    /* 73A90 80083A90 1200A397 */  lhu        $v1, 0x12($sp)
    /* 73A94 80083A94 02004294 */  lhu        $v0, 0x2($v0)
    /* 73A98 80083A98 00000000 */  nop
    /* 73A9C 80083A9C 21186200 */  addu       $v1, $v1, $v0
    /* 73AA0 80083AA0 A70F020C */  jal        PRIM_GetNextDrArea__Fv
    /* 73AA4 80083AA4 1200A3A7 */   sh        $v1, 0x12($sp)
    /* 73AA8 80083AA8 21804000 */  addu       $s0, $v0, $zero
    /* 73AAC 80083AAC 21200002 */  addu       $a0, $s0, $zero
    /* 73AB0 80083AB0 DE51000C */  jal        SetDrawArea
    /* 73AB4 80083AB4 21284002 */   addu      $a1, $s2, $zero
    /* 73AB8 80083AB8 FF00043C */  lui        $a0, (0xFFFFFF >> 16)
    /* 73ABC 80083ABC FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
    /* 73AC0 80083AC0 00FF053C */  lui        $a1, (0xFF000000 >> 16)
    /* 73AC4 80083AC4 3403828F */  lw         $v0, %gp_rel(ThisOt)($gp)
    /* 73AC8 80083AC8 0000038E */  lw         $v1, 0x0($s0)
    /* 73ACC 80083ACC 21882202 */  addu       $s1, $s1, $v0
    /* 73AD0 80083AD0 0000228E */  lw         $v0, 0x0($s1)
    /* 73AD4 80083AD4 24186500 */  and        $v1, $v1, $a1
    /* 73AD8 80083AD8 24104400 */  and        $v0, $v0, $a0
    /* 73ADC 80083ADC 25186200 */  or         $v1, $v1, $v0
    /* 73AE0 80083AE0 000003AE */  sw         $v1, 0x0($s0)
    /* 73AE4 80083AE4 0000228E */  lw         $v0, 0x0($s1)
    /* 73AE8 80083AE8 24800402 */  and        $s0, $s0, $a0
    /* 73AEC 80083AEC 24104500 */  and        $v0, $v0, $a1
    /* 73AF0 80083AF0 25105000 */  or         $v0, $v0, $s0
    /* 73AF4 80083AF4 000022AE */  sw         $v0, 0x0($s1)
    /* 73AF8 80083AF8 2400BF8F */  lw         $ra, 0x24($sp)
    /* 73AFC 80083AFC 2000B28F */  lw         $s2, 0x20($sp)
    /* 73B00 80083B00 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 73B04 80083B04 1800B08F */  lw         $s0, 0x18($sp)
    /* 73B08 80083B08 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 73B0C 80083B0C 0800E003 */  jr         $ra
    /* 73B10 80083B10 00000000 */   nop
endlabel PRIM_Clip__FP4RECTi
