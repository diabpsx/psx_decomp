.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Display__7CScreeniiii, 0x2E0

glabel Display__7CScreeniiii
    /* 84BC8 80094BC8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 84BCC 80094BCC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 84BD0 80094BD0 2188C000 */  addu       $s1, $a2, $zero
    /* 84BD4 80094BD4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 84BD8 80094BD8 3000BFAF */  sw         $ra, 0x30($sp)
    /* 84BDC 80094BDC 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 84BE0 80094BE0 2400B3AF */  sw         $s3, 0x24($sp)
    /* 84BE4 80094BE4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 84BE8 80094BE8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 84BEC 80094BEC 7000828C */  lw         $v0, 0x70($a0)
    /* 84BF0 80094BF0 4800B08F */  lw         $s0, 0x48($sp)
    /* 84BF4 80094BF4 0300A210 */  beq        $a1, $v0, .L80094C04
    /* 84BF8 80094BF8 21A0E000 */   addu      $s4, $a3, $zero
    /* 84BFC 80094BFC 2452020C */  jal        Load__7CScreeniii
    /* 84C00 80094C00 00000000 */   nop
  .L80094C04:
    /* 84C04 80094C04 6A54020C */  jal        PRIM_GetPrim__FPP8POLY_FT4_800951a8
    /* 84C08 80094C08 1000A427 */   addiu     $a0, $sp, 0x10
    /* 84C0C 80094C0C 1000A38F */  lw         $v1, 0x10($sp)
    /* 84C10 80094C10 09000224 */  addiu      $v0, $zero, 0x9
    /* 84C14 80094C14 030062A0 */  sb         $v0, 0x3($v1)
    /* 84C18 80094C18 1000A38F */  lw         $v1, 0x10($sp)
    /* 84C1C 80094C1C 2C000224 */  addiu      $v0, $zero, 0x2C
    /* 84C20 80094C20 070062A0 */  sb         $v0, 0x7($v1)
    /* 84C24 80094C24 1000A38F */  lw         $v1, 0x10($sp)
    /* 84C28 80094C28 00000000 */  nop
    /* 84C2C 80094C2C 07006290 */  lbu        $v0, 0x7($v1)
    /* 84C30 80094C30 00000000 */  nop
    /* 84C34 80094C34 FD004230 */  andi       $v0, $v0, 0xFD
    /* 84C38 80094C38 070062A0 */  sb         $v0, 0x7($v1)
    /* 84C3C 80094C3C 1000A38F */  lw         $v1, 0x10($sp)
    /* 84C40 80094C40 00000000 */  nop
    /* 84C44 80094C44 07006290 */  lbu        $v0, 0x7($v1)
    /* 84C48 80094C48 00000000 */  nop
    /* 84C4C 80094C4C 01004234 */  ori        $v0, $v0, 0x1
    /* 84C50 80094C50 070062A0 */  sb         $v0, 0x7($v1)
    /* 84C54 80094C54 0B000224 */  addiu      $v0, $zero, 0xB
    /* 84C58 80094C58 02002216 */  bne        $s1, $v0, .L80094C64
    /* 84C5C 80094C5C 40010424 */   addiu     $a0, $zero, 0x140
    /* 84C60 80094C60 00010424 */  addiu      $a0, $zero, 0x100
  .L80094C64:
    /* 84C64 80094C64 1000A28F */  lw         $v0, 0x10($sp)
    /* 84C68 80094C68 F0000324 */  addiu      $v1, $zero, 0xF0
    /* 84C6C 80094C6C 080040A4 */  sh         $zero, 0x8($v0)
    /* 84C70 80094C70 0A0040A4 */  sh         $zero, 0xA($v0)
    /* 84C74 80094C74 100044A4 */  sh         $a0, 0x10($v0)
    /* 84C78 80094C78 120040A4 */  sh         $zero, 0x12($v0)
    /* 84C7C 80094C7C 180040A4 */  sh         $zero, 0x18($v0)
    /* 84C80 80094C80 1A0043A4 */  sh         $v1, 0x1A($v0)
    /* 84C84 80094C84 200044A4 */  sh         $a0, 0x20($v0)
    /* 84C88 80094C88 220043A4 */  sh         $v1, 0x22($v0)
    /* 84C8C 80094C8C 1000A28F */  lw         $v0, 0x10($sp)
    /* 84C90 80094C90 00000000 */  nop
    /* 84C94 80094C94 0C0040A0 */  sb         $zero, 0xC($v0)
    /* 84C98 80094C98 1000A28F */  lw         $v0, 0x10($sp)
    /* 84C9C 80094C9C 00000000 */  nop
    /* 84CA0 80094CA0 0D0040A0 */  sb         $zero, 0xD($v0)
    /* 84CA4 80094CA4 1000A28F */  lw         $v0, 0x10($sp)
    /* 84CA8 80094CA8 FF000324 */  addiu      $v1, $zero, 0xFF
    /* 84CAC 80094CAC 140043A0 */  sb         $v1, 0x14($v0)
    /* 84CB0 80094CB0 1000A28F */  lw         $v0, 0x10($sp)
    /* 84CB4 80094CB4 01000424 */  addiu      $a0, $zero, 0x1
    /* 84CB8 80094CB8 150040A0 */  sb         $zero, 0x15($v0)
    /* 84CBC 80094CBC 1000A28F */  lw         $v0, 0x10($sp)
    /* 84CC0 80094CC0 21280000 */  addu       $a1, $zero, $zero
    /* 84CC4 80094CC4 1C0040A0 */  sb         $zero, 0x1C($v0)
    /* 84CC8 80094CC8 1000A28F */  lw         $v0, 0x10($sp)
    /* 84CCC 80094CCC F0001324 */  addiu      $s3, $zero, 0xF0
    /* 84CD0 80094CD0 1D0053A0 */  sb         $s3, 0x1D($v0)
    /* 84CD4 80094CD4 1000A28F */  lw         $v0, 0x10($sp)
    /* 84CD8 80094CD8 80311100 */  sll        $a2, $s1, 6
    /* 84CDC 80094CDC 240043A0 */  sb         $v1, 0x24($v0)
    /* 84CE0 80094CE0 1000A28F */  lw         $v0, 0x10($sp)
    /* 84CE4 80094CE4 21388002 */  addu       $a3, $s4, $zero
    /* 84CE8 80094CE8 074C000C */  jal        GetTPage
    /* 84CEC 80094CEC 250053A0 */   sb        $s3, 0x25($v0)
    /* 84CF0 80094CF0 21200000 */  addu       $a0, $zero, $zero
    /* 84CF4 80094CF4 F0001526 */  addiu      $s5, $s0, 0xF0
    /* 84CF8 80094CF8 1000A38F */  lw         $v1, 0x10($sp)
    /* 84CFC 80094CFC 2128A002 */  addu       $a1, $s5, $zero
    /* 84D00 80094D00 164C000C */  jal        GetClut
    /* 84D04 80094D04 160062A4 */   sh        $v0, 0x16($v1)
    /* 84D08 80094D08 FF00103C */  lui        $s0, (0xFFFFFF >> 16)
    /* 84D0C 80094D0C FFFF1036 */  ori        $s0, $s0, (0xFFFFFF & 0xFFFF)
    /* 84D10 80094D10 1000A48F */  lw         $a0, 0x10($sp)
    /* 84D14 80094D14 1280053C */  lui        $a1, %hi(ThisOt)
    /* 84D18 80094D18 B4AAA58C */  lw         $a1, %lo(ThisOt)($a1)
    /* 84D1C 80094D1C 0000838C */  lw         $v1, 0x0($a0)
    /* 84D20 80094D20 00FF123C */  lui        $s2, (0xFF000000 >> 16)
    /* 84D24 80094D24 0E0082A4 */  sh         $v0, 0xE($a0)
    /* 84D28 80094D28 0000A28C */  lw         $v0, 0x0($a1)
    /* 84D2C 80094D2C 24187200 */  and        $v1, $v1, $s2
    /* 84D30 80094D30 24105000 */  and        $v0, $v0, $s0
    /* 84D34 80094D34 25186200 */  or         $v1, $v1, $v0
    /* 84D38 80094D38 000083AC */  sw         $v1, 0x0($a0)
    /* 84D3C 80094D3C 0000A28C */  lw         $v0, 0x0($a1)
    /* 84D40 80094D40 24209000 */  and        $a0, $a0, $s0
    /* 84D44 80094D44 24105200 */  and        $v0, $v0, $s2
    /* 84D48 80094D48 25104400 */  or         $v0, $v0, $a0
    /* 84D4C 80094D4C 0000A2AC */  sw         $v0, 0x0($a1)
    /* 84D50 80094D50 0B000224 */  addiu      $v0, $zero, 0xB
    /* 84D54 80094D54 4A002216 */  bne        $s1, $v0, .L80094E80
    /* 84D58 80094D58 00000000 */   nop
    /* 84D5C 80094D5C 6A54020C */  jal        PRIM_GetPrim__FPP8POLY_FT4_800951a8
    /* 84D60 80094D60 1000A427 */   addiu     $a0, $sp, 0x10
    /* 84D64 80094D64 1000A38F */  lw         $v1, 0x10($sp)
    /* 84D68 80094D68 09000224 */  addiu      $v0, $zero, 0x9
    /* 84D6C 80094D6C 030062A0 */  sb         $v0, 0x3($v1)
    /* 84D70 80094D70 1000A38F */  lw         $v1, 0x10($sp)
    /* 84D74 80094D74 2C000224 */  addiu      $v0, $zero, 0x2C
    /* 84D78 80094D78 070062A0 */  sb         $v0, 0x7($v1)
    /* 84D7C 80094D7C 1000A38F */  lw         $v1, 0x10($sp)
    /* 84D80 80094D80 00000000 */  nop
    /* 84D84 80094D84 07006290 */  lbu        $v0, 0x7($v1)
    /* 84D88 80094D88 00000000 */  nop
    /* 84D8C 80094D8C FD004230 */  andi       $v0, $v0, 0xFD
    /* 84D90 80094D90 070062A0 */  sb         $v0, 0x7($v1)
    /* 84D94 80094D94 1000A38F */  lw         $v1, 0x10($sp)
    /* 84D98 80094D98 00000000 */  nop
    /* 84D9C 80094D9C 07006290 */  lbu        $v0, 0x7($v1)
    /* 84DA0 80094DA0 40010524 */  addiu      $a1, $zero, 0x140
    /* 84DA4 80094DA4 01004234 */  ori        $v0, $v0, 0x1
    /* 84DA8 80094DA8 070062A0 */  sb         $v0, 0x7($v1)
    /* 84DAC 80094DAC 1000A28F */  lw         $v0, 0x10($sp)
    /* 84DB0 80094DB0 FF000324 */  addiu      $v1, $zero, 0xFF
    /* 84DB4 80094DB4 080043A4 */  sh         $v1, 0x8($v0)
    /* 84DB8 80094DB8 0A0040A4 */  sh         $zero, 0xA($v0)
    /* 84DBC 80094DBC 100045A4 */  sh         $a1, 0x10($v0)
    /* 84DC0 80094DC0 120040A4 */  sh         $zero, 0x12($v0)
    /* 84DC4 80094DC4 180043A4 */  sh         $v1, 0x18($v0)
    /* 84DC8 80094DC8 0C0040A0 */  sb         $zero, 0xC($v0)
    /* 84DCC 80094DCC 1000A48F */  lw         $a0, 0x10($sp)
    /* 84DD0 80094DD0 F0000324 */  addiu      $v1, $zero, 0xF0
    /* 84DD4 80094DD4 1A0043A4 */  sh         $v1, 0x1A($v0)
    /* 84DD8 80094DD8 200045A4 */  sh         $a1, 0x20($v0)
    /* 84DDC 80094DDC 220043A4 */  sh         $v1, 0x22($v0)
    /* 84DE0 80094DE0 0D0080A0 */  sb         $zero, 0xD($a0)
    /* 84DE4 80094DE4 1000A28F */  lw         $v0, 0x10($sp)
    /* 84DE8 80094DE8 40000324 */  addiu      $v1, $zero, 0x40
    /* 84DEC 80094DEC 140043A0 */  sb         $v1, 0x14($v0)
    /* 84DF0 80094DF0 1000A28F */  lw         $v0, 0x10($sp)
    /* 84DF4 80094DF4 00000000 */  nop
    /* 84DF8 80094DF8 150040A0 */  sb         $zero, 0x15($v0)
    /* 84DFC 80094DFC 1000A28F */  lw         $v0, 0x10($sp)
    /* 84E00 80094E00 40030624 */  addiu      $a2, $zero, 0x340
    /* 84E04 80094E04 1C0040A0 */  sb         $zero, 0x1C($v0)
    /* 84E08 80094E08 1000A28F */  lw         $v0, 0x10($sp)
    /* 84E0C 80094E0C 21388002 */  addu       $a3, $s4, $zero
    /* 84E10 80094E10 1D0053A0 */  sb         $s3, 0x1D($v0)
    /* 84E14 80094E14 1000A28F */  lw         $v0, 0x10($sp)
    /* 84E18 80094E18 21280000 */  addu       $a1, $zero, $zero
    /* 84E1C 80094E1C 240043A0 */  sb         $v1, 0x24($v0)
    /* 84E20 80094E20 1000A28F */  lw         $v0, 0x10($sp)
    /* 84E24 80094E24 01000424 */  addiu      $a0, $zero, 0x1
    /* 84E28 80094E28 074C000C */  jal        GetTPage
    /* 84E2C 80094E2C 250053A0 */   sb        $s3, 0x25($v0)
    /* 84E30 80094E30 21200000 */  addu       $a0, $zero, $zero
    /* 84E34 80094E34 1000A38F */  lw         $v1, 0x10($sp)
    /* 84E38 80094E38 2128A002 */  addu       $a1, $s5, $zero
    /* 84E3C 80094E3C 164C000C */  jal        GetClut
    /* 84E40 80094E40 160062A4 */   sh        $v0, 0x16($v1)
    /* 84E44 80094E44 1000A48F */  lw         $a0, 0x10($sp)
    /* 84E48 80094E48 1280053C */  lui        $a1, %hi(ThisOt)
    /* 84E4C 80094E4C B4AAA58C */  lw         $a1, %lo(ThisOt)($a1)
    /* 84E50 80094E50 0000838C */  lw         $v1, 0x0($a0)
    /* 84E54 80094E54 0E0082A4 */  sh         $v0, 0xE($a0)
    /* 84E58 80094E58 0000A28C */  lw         $v0, 0x0($a1)
    /* 84E5C 80094E5C 24187200 */  and        $v1, $v1, $s2
    /* 84E60 80094E60 24105000 */  and        $v0, $v0, $s0
    /* 84E64 80094E64 25186200 */  or         $v1, $v1, $v0
    /* 84E68 80094E68 000083AC */  sw         $v1, 0x0($a0)
    /* 84E6C 80094E6C 0000A28C */  lw         $v0, 0x0($a1)
    /* 84E70 80094E70 24209000 */  and        $a0, $a0, $s0
    /* 84E74 80094E74 24105200 */  and        $v0, $v0, $s2
    /* 84E78 80094E78 25104400 */  or         $v0, $v0, $a0
    /* 84E7C 80094E7C 0000A2AC */  sw         $v0, 0x0($a1)
  .L80094E80:
    /* 84E80 80094E80 3000BF8F */  lw         $ra, 0x30($sp)
    /* 84E84 80094E84 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 84E88 80094E88 2800B48F */  lw         $s4, 0x28($sp)
    /* 84E8C 80094E8C 2400B38F */  lw         $s3, 0x24($sp)
    /* 84E90 80094E90 2000B28F */  lw         $s2, 0x20($sp)
    /* 84E94 80094E94 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 84E98 80094E98 1800B08F */  lw         $s0, 0x18($sp)
    /* 84E9C 80094E9C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 84EA0 80094EA0 0800E003 */  jr         $ra
    /* 84EA4 80094EA4 00000000 */   nop
endlabel Display__7CScreeniiii
