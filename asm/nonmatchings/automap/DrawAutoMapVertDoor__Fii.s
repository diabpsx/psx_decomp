.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawAutoMapVertDoor__Fii, 0x1BC

glabel DrawAutoMapVertDoor__Fii
    /* 28898 80162490 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 2889C 80162494 1000B0AF */  sw         $s0, 0x10($sp)
    /* 288A0 80162498 E81B908F */  lw         $s0, %gp_rel(AutoMapScale)($gp)
    /* 288A4 8016249C 00000000 */  nop
    /* 288A8 801624A0 18009000 */  mult       $a0, $s0
    /* 288AC 801624A4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 288B0 801624A8 12880000 */  mflo       $s1
    /* 288B4 801624AC 00000000 */  nop
    /* 288B8 801624B0 00000000 */  nop
    /* 288BC 801624B4 1800B000 */  mult       $a1, $s0
    /* 288C0 801624B8 101C838F */  lw         $v1, %gp_rel(AMPlayerY)($gp)
    /* 288C4 801624BC 38000624 */  addiu      $a2, $zero, 0x38
    /* 288C8 801624C0 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 288CC 801624C4 2800B6AF */  sw         $s6, 0x28($sp)
    /* 288D0 801624C8 2400B5AF */  sw         $s5, 0x24($sp)
    /* 288D4 801624CC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 288D8 801624D0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 288DC 801624D4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 288E0 801624D8 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 288E4 801624DC 58000524 */  addiu      $a1, $zero, 0x58
    /* 288E8 801624E0 12100000 */  mflo       $v0
    /* 288EC 801624E4 21B05100 */  addu       $s6, $v0, $s1
    /* 288F0 801624E8 23882202 */  subu       $s1, $s1, $v0
    /* 288F4 801624EC 40881100 */  sll        $s1, $s1, 1
    /* 288F8 801624F0 0C1C828F */  lw         $v0, %gp_rel(AMPlayerX)($gp)
    /* 288FC 801624F4 21B0C302 */  addu       $s6, $s6, $v1
    /* 28900 801624F8 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28904 801624FC 21882202 */   addu      $s1, $s1, $v0
    /* 28908 80162500 21404000 */  addu       $t0, $v0, $zero
    /* 2890C 80162504 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 28910 80162508 58000524 */  addiu      $a1, $zero, 0x58
    /* 28914 8016250C 38000624 */  addiu      $a2, $zero, 0x38
    /* 28918 80162510 43901000 */  sra        $s2, $s0, 1
    /* 2891C 80162514 23103202 */  subu       $v0, $s1, $s2
    /* 28920 80162518 C2871000 */  srl        $s0, $s0, 31
    /* 28924 8016251C 21805002 */  addu       $s0, $s2, $s0
    /* 28928 80162520 43801000 */  sra        $s0, $s0, 1
    /* 2892C 80162524 0C0002A5 */  sh         $v0, 0xC($t0)
    /* 28930 80162528 2110D002 */  addu       $v0, $s6, $s0
    /* 28934 8016252C 080011A5 */  sh         $s1, 0x8($t0)
    /* 28938 80162530 0A0016A5 */  sh         $s6, 0xA($t0)
    /* 2893C 80162534 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28940 80162538 0E0002A5 */   sh        $v0, 0xE($t0)
    /* 28944 8016253C 21404000 */  addu       $t0, $v0, $zero
    /* 28948 80162540 7F000424 */  addiu      $a0, $zero, 0x7F
    /* 2894C 80162544 7F000524 */  addiu      $a1, $zero, 0x7F
    /* 28950 80162548 64000624 */  addiu      $a2, $zero, 0x64
    /* 28954 8016254C E81B938F */  lw         $s3, %gp_rel(AutoMapScale)($gp)
    /* 28958 80162550 40181200 */  sll        $v1, $s2, 1
    /* 2895C 80162554 40A01300 */  sll        $s4, $s3, 1
    /* 28960 80162558 23383402 */  subu       $a3, $s1, $s4
    /* 28964 8016255C 23882302 */  subu       $s1, $s1, $v1
    /* 28968 80162560 2110F200 */  addu       $v0, $a3, $s2
    /* 2896C 80162564 2198D302 */  addu       $s3, $s6, $s3
    /* 28970 80162568 23807002 */  subu       $s0, $s3, $s0
    /* 28974 8016256C 23A83402 */  subu       $s5, $s1, $s4
    /* 28978 80162570 21A8A302 */  addu       $s5, $s5, $v1
    /* 2897C 80162574 0E0013A5 */  sh         $s3, 0xE($t0)
    /* 28980 80162578 23987202 */  subu       $s3, $s3, $s2
    /* 28984 8016257C 0A0010A5 */  sh         $s0, 0xA($t0)
    /* 28988 80162580 2180D402 */  addu       $s0, $s6, $s4
    /* 2898C 80162584 23801202 */  subu       $s0, $s0, $s2
    /* 28990 80162588 23801202 */  subu       $s0, $s0, $s2
    /* 28994 8016258C 21A03402 */  addu       $s4, $s1, $s4
    /* 28998 80162590 23A08302 */  subu       $s4, $s4, $v1
    /* 2899C 80162594 080002A5 */  sh         $v0, 0x8($t0)
    /* 289A0 80162598 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 289A4 8016259C 0C0007A5 */   sh        $a3, 0xC($t0)
    /* 289A8 801625A0 21404000 */  addu       $t0, $v0, $zero
    /* 289AC 801625A4 7F000424 */  addiu      $a0, $zero, 0x7F
    /* 289B0 801625A8 7F000524 */  addiu      $a1, $zero, 0x7F
    /* 289B4 801625AC 64000624 */  addiu      $a2, $zero, 0x64
    /* 289B8 801625B0 080011A5 */  sh         $s1, 0x8($t0)
    /* 289BC 801625B4 0A0016A5 */  sh         $s6, 0xA($t0)
    /* 289C0 801625B8 0C0015A5 */  sh         $s5, 0xC($t0)
    /* 289C4 801625BC FA87050C */  jal        AMGetLine__FUcUcUc
    /* 289C8 801625C0 0E0013A5 */   sh        $s3, 0xE($t0)
    /* 289CC 801625C4 21404000 */  addu       $t0, $v0, $zero
    /* 289D0 801625C8 7F000424 */  addiu      $a0, $zero, 0x7F
    /* 289D4 801625CC 7F000524 */  addiu      $a1, $zero, 0x7F
    /* 289D8 801625D0 64000624 */  addiu      $a2, $zero, 0x64
    /* 289DC 801625D4 080015A5 */  sh         $s5, 0x8($t0)
    /* 289E0 801625D8 0A0013A5 */  sh         $s3, 0xA($t0)
    /* 289E4 801625DC 0C0011A5 */  sh         $s1, 0xC($t0)
    /* 289E8 801625E0 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 289EC 801625E4 0E0010A5 */   sh        $s0, 0xE($t0)
    /* 289F0 801625E8 21404000 */  addu       $t0, $v0, $zero
    /* 289F4 801625EC 7F000424 */  addiu      $a0, $zero, 0x7F
    /* 289F8 801625F0 7F000524 */  addiu      $a1, $zero, 0x7F
    /* 289FC 801625F4 64000624 */  addiu      $a2, $zero, 0x64
    /* 28A00 801625F8 080011A5 */  sh         $s1, 0x8($t0)
    /* 28A04 801625FC 0A0010A5 */  sh         $s0, 0xA($t0)
    /* 28A08 80162600 0C0014A5 */  sh         $s4, 0xC($t0)
    /* 28A0C 80162604 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28A10 80162608 0E0013A5 */   sh        $s3, 0xE($t0)
    /* 28A14 8016260C 21404000 */  addu       $t0, $v0, $zero
    /* 28A18 80162610 080014A5 */  sh         $s4, 0x8($t0)
    /* 28A1C 80162614 0A0013A5 */  sh         $s3, 0xA($t0)
    /* 28A20 80162618 0C0011A5 */  sh         $s1, 0xC($t0)
    /* 28A24 8016261C 0E0016A5 */  sh         $s6, 0xE($t0)
    /* 28A28 80162620 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 28A2C 80162624 2800B68F */  lw         $s6, 0x28($sp)
    /* 28A30 80162628 2400B58F */  lw         $s5, 0x24($sp)
    /* 28A34 8016262C 2000B48F */  lw         $s4, 0x20($sp)
    /* 28A38 80162630 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 28A3C 80162634 1800B28F */  lw         $s2, 0x18($sp)
    /* 28A40 80162638 1400B18F */  lw         $s1, 0x14($sp)
    /* 28A44 8016263C 1000B08F */  lw         $s0, 0x10($sp)
    /* 28A48 80162640 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 28A4C 80162644 0800E003 */  jr         $ra
    /* 28A50 80162648 00000000 */   nop
endlabel DrawAutoMapVertDoor__Fii
