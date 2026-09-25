.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ObjChangeMapResync__Fiiii, 0x178

glabel ObjChangeMapResync__Fiiii
    /* 47978 80057978 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 4797C 8005797C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 47980 80057980 21A88000 */  addu       $s5, $a0, $zero
    /* 47984 80057984 3000BEAF */  sw         $fp, 0x30($sp)
    /* 47988 80057988 21F0A000 */  addu       $fp, $a1, $zero
    /* 4798C 8005798C 2800B6AF */  sw         $s6, 0x28($sp)
    /* 47990 80057990 21B0C000 */  addu       $s6, $a2, $zero
    /* 47994 80057994 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 47998 80057998 21B8E000 */  addu       $s7, $a3, $zero
    /* 4799C 8005799C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 479A0 800579A0 2190C003 */  addu       $s2, $fp, $zero
    /* 479A4 800579A4 2A10FE02 */  slt        $v0, $s7, $fp
    /* 479A8 800579A8 3400BFAF */  sw         $ra, 0x34($sp)
    /* 479AC 800579AC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 479B0 800579B0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 479B4 800579B4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 479B8 800579B8 23004014 */  bnez       $v0, .L80057A48
    /* 479BC 800579BC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 479C0 800579C0 2A10D502 */  slt        $v0, $s6, $s5
  .L800579C4:
    /* 479C4 800579C4 1C004014 */  bnez       $v0, .L80057A38
    /* 479C8 800579C8 21A0A002 */   addu      $s4, $s5, $zero
    /* 479CC 800579CC 40101500 */  sll        $v0, $s5, 1
    /* 479D0 800579D0 21105500 */  addu       $v0, $v0, $s5
    /* 479D4 800579D4 40110200 */  sll        $v0, $v0, 5
    /* 479D8 800579D8 0E80083C */  lui        $t0, %hi(dungeon)
    /* 479DC 800579DC C4400825 */  addiu      $t0, $t0, %lo(dungeon)
    /* 479E0 800579E0 21984800 */  addu       $s3, $v0, $t0
    /* 479E4 800579E4 80101500 */  sll        $v0, $s5, 2
    /* 479E8 800579E8 21105500 */  addu       $v0, $v0, $s5
    /* 479EC 800579EC C0100200 */  sll        $v0, $v0, 3
    /* 479F0 800579F0 0E80083C */  lui        $t0, %hi(pdungeon)
    /* 479F4 800579F4 C4520825 */  addiu      $t0, $t0, %lo(pdungeon)
    /* 479F8 800579F8 21884800 */  addu       $s1, $v0, $t0
  .L800579FC:
    /* 479FC 800579FC 21208002 */  addu       $a0, $s4, $zero
    /* 47A00 80057A00 21284002 */  addu       $a1, $s2, $zero
    /* 47A04 80057A04 21803202 */  addu       $s0, $s1, $s2
    /* 47A08 80057A08 28003126 */  addiu      $s1, $s1, 0x28
    /* 47A0C 80057A0C 00000692 */  lbu        $a2, 0x0($s0)
    /* 47A10 80057A10 3156010C */  jal        ObjSetMini__Fiii
    /* 47A14 80057A14 01009426 */   addiu     $s4, $s4, 0x1
    /* 47A18 80057A18 40101200 */  sll        $v0, $s2, 1
    /* 47A1C 80057A1C 21105300 */  addu       $v0, $v0, $s3
    /* 47A20 80057A20 00000392 */  lbu        $v1, 0x0($s0)
    /* 47A24 80057A24 00000000 */  nop
    /* 47A28 80057A28 000043A4 */  sh         $v1, 0x0($v0)
    /* 47A2C 80057A2C 2A10D402 */  slt        $v0, $s6, $s4
    /* 47A30 80057A30 F2FF4010 */  beqz       $v0, .L800579FC
    /* 47A34 80057A34 60007326 */   addiu     $s3, $s3, 0x60
  .L80057A38:
    /* 47A38 80057A38 01005226 */  addiu      $s2, $s2, 0x1
    /* 47A3C 80057A3C 2A10F202 */  slt        $v0, $s7, $s2
    /* 47A40 80057A40 E0FF4010 */  beqz       $v0, .L800579C4
    /* 47A44 80057A44 2A10D502 */   slt       $v0, $s6, $s5
  .L80057A48:
    /* 47A48 80057A48 1280033C */  lui        $v1, %hi(leveltype)
    /* 47A4C 80057A4C 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 47A50 80057A50 01000224 */  addiu      $v0, $zero, 0x1
    /* 47A54 80057A54 0D006214 */  bne        $v1, $v0, .L80057A8C
    /* 47A58 80057A58 02000224 */   addiu     $v0, $zero, 0x2
    /* 47A5C 80057A5C 40201500 */  sll        $a0, $s5, 1
    /* 47A60 80057A60 10008424 */  addiu      $a0, $a0, 0x10
    /* 47A64 80057A64 40281E00 */  sll        $a1, $fp, 1
    /* 47A68 80057A68 1000A524 */  addiu      $a1, $a1, 0x10
    /* 47A6C 80057A6C 40301600 */  sll        $a2, $s6, 1
    /* 47A70 80057A70 1100C624 */  addiu      $a2, $a2, 0x11
    /* 47A74 80057A74 40381700 */  sll        $a3, $s7, 1
    /* 47A78 80057A78 6B56010C */  jal        ObjL1Special__Fiiii
    /* 47A7C 80057A7C 1100E724 */   addiu     $a3, $a3, 0x11
    /* 47A80 80057A80 1280033C */  lui        $v1, %hi(leveltype)
    /* 47A84 80057A84 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 47A88 80057A88 02000224 */  addiu      $v0, $zero, 0x2
  .L80057A8C:
    /* 47A8C 80057A8C 09006214 */  bne        $v1, $v0, .L80057AB4
    /* 47A90 80057A90 40201500 */   sll       $a0, $s5, 1
    /* 47A94 80057A94 10008424 */  addiu      $a0, $a0, 0x10
    /* 47A98 80057A98 40281E00 */  sll        $a1, $fp, 1
    /* 47A9C 80057A9C 1000A524 */  addiu      $a1, $a1, 0x10
    /* 47AA0 80057AA0 40301600 */  sll        $a2, $s6, 1
    /* 47AA4 80057AA4 1100C624 */  addiu      $a2, $a2, 0x11
    /* 47AA8 80057AA8 40381700 */  sll        $a3, $s7, 1
    /* 47AAC 80057AAC 6D56010C */  jal        ObjL2Special__Fiiii
    /* 47AB0 80057AB0 1100E724 */   addiu     $a3, $a3, 0x11
  .L80057AB4:
    /* 47AB4 80057AB4 F5E3000C */  jal        FillCrapBits__Fv
    /* 47AB8 80057AB8 00000000 */   nop
    /* 47ABC 80057ABC 3400BF8F */  lw         $ra, 0x34($sp)
    /* 47AC0 80057AC0 3000BE8F */  lw         $fp, 0x30($sp)
    /* 47AC4 80057AC4 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 47AC8 80057AC8 2800B68F */  lw         $s6, 0x28($sp)
    /* 47ACC 80057ACC 2400B58F */  lw         $s5, 0x24($sp)
    /* 47AD0 80057AD0 2000B48F */  lw         $s4, 0x20($sp)
    /* 47AD4 80057AD4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 47AD8 80057AD8 1800B28F */  lw         $s2, 0x18($sp)
    /* 47ADC 80057ADC 1400B18F */  lw         $s1, 0x14($sp)
    /* 47AE0 80057AE0 1000B08F */  lw         $s0, 0x10($sp)
    /* 47AE4 80057AE4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 47AE8 80057AE8 0800E003 */  jr         $ra
    /* 47AEC 80057AEC 00000000 */   nop
endlabel ObjChangeMapResync__Fiiii
