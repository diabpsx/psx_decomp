.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintStat__FiiPcUc, 0xCC

glabel PrintStat__FiiPcUc
    /* 1DDA8 801579A0 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 1DDAC 801579A4 3800B4AF */  sw         $s4, 0x38($sp)
    /* 1DDB0 801579A8 21A08000 */  addu       $s4, $a0, $zero
    /* 1DDB4 801579AC 2120A000 */  addu       $a0, $a1, $zero
    /* 1DDB8 801579B0 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 1DDBC 801579B4 21A8C000 */  addu       $s5, $a2, $zero
    /* 1DDC0 801579B8 4000BFAF */  sw         $ra, 0x40($sp)
    /* 1DDC4 801579BC 3400B3AF */  sw         $s3, 0x34($sp)
    /* 1DDC8 801579C0 3000B2AF */  sw         $s2, 0x30($sp)
    /* 1DDCC 801579C4 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 1DDD0 801579C8 4AED010C */  jal        GetStr__Fi
    /* 1DDD4 801579CC 2800B0AF */   sw        $s0, 0x28($sp)
    /* 1DDD8 801579D0 0C80123C */  lui        $s2, %hi(MediumFont)
    /* 1DDDC 801579D4 D8825226 */  addiu      $s2, $s2, %lo(MediumFont)
    /* 1DDE0 801579D8 21204002 */  addu       $a0, $s2, $zero
    /* 1DDE4 801579DC 21280000 */  addu       $a1, $zero, $zero
    /* 1DDE8 801579E0 21308002 */  addu       $a2, $s4, $zero
    /* 1DDEC 801579E4 21384000 */  addu       $a3, $v0, $zero
    /* 1DDF0 801579E8 1280133C */  lui        $s3, %hi(WHITER)
    /* 1DDF4 801579EC D1AB7392 */  lbu        $s3, %lo(WHITER)($s3)
    /* 1DDF8 801579F0 1280103C */  lui        $s0, %hi(WHITEG)
    /* 1DDFC 801579F4 D2AB1092 */  lbu        $s0, %lo(WHITEG)($s0)
    /* 1DE00 801579F8 1280113C */  lui        $s1, %hi(BRect)
    /* 1DE04 801579FC 54C33126 */  addiu      $s1, $s1, %lo(BRect)
    /* 1DE08 80157A00 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1DE0C 80157A04 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1DE10 80157A08 1800B3AF */  sw         $s3, 0x18($sp)
    /* 1DE14 80157A0C 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 1DE18 80157A10 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1DE1C 80157A14 2000B0AF */   sw        $s0, 0x20($sp)
    /* 1DE20 80157A18 21204002 */  addu       $a0, $s2, $zero
    /* 1DE24 80157A1C 21280000 */  addu       $a1, $zero, $zero
    /* 1DE28 80157A20 21308002 */  addu       $a2, $s4, $zero
    /* 1DE2C 80157A24 2138A002 */  addu       $a3, $s5, $zero
    /* 1DE30 80157A28 02000224 */  addiu      $v0, $zero, 0x2
    /* 1DE34 80157A2C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1DE38 80157A30 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1DE3C 80157A34 1800B3AF */  sw         $s3, 0x18($sp)
    /* 1DE40 80157A38 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 1DE44 80157A3C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1DE48 80157A40 2000B0AF */   sw        $s0, 0x20($sp)
    /* 1DE4C 80157A44 4000BF8F */  lw         $ra, 0x40($sp)
    /* 1DE50 80157A48 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 1DE54 80157A4C 3800B48F */  lw         $s4, 0x38($sp)
    /* 1DE58 80157A50 3400B38F */  lw         $s3, 0x34($sp)
    /* 1DE5C 80157A54 3000B28F */  lw         $s2, 0x30($sp)
    /* 1DE60 80157A58 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 1DE64 80157A5C 2800B08F */  lw         $s0, 0x28($sp)
    /* 1DE68 80157A60 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 1DE6C 80157A64 0800E003 */  jr         $ra
    /* 1DE70 80157A68 00000000 */   nop
endlabel PrintStat__FiiPcUc
