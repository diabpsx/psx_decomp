.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateChest__FiiUc, 0x3C0

glabel OperateChest__FiiUc
    /* 48BD0 80058BD0 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 48BD4 80058BD4 3000B2AF */  sw         $s2, 0x30($sp)
    /* 48BD8 80058BD8 21908000 */  addu       $s2, $a0, $zero
    /* 48BDC 80058BDC 3800B4AF */  sw         $s4, 0x38($sp)
    /* 48BE0 80058BE0 21A0A000 */  addu       $s4, $a1, $zero
    /* 48BE4 80058BE4 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 48BE8 80058BE8 21A80000 */  addu       $s5, $zero, $zero
    /* 48BEC 80058BEC 40101400 */  sll        $v0, $s4, 1
    /* 48BF0 80058BF0 21105400 */  addu       $v0, $v0, $s4
    /* 48BF4 80058BF4 80100200 */  sll        $v0, $v0, 2
    /* 48BF8 80058BF8 23105400 */  subu       $v0, $v0, $s4
    /* 48BFC 80058BFC 2800B0AF */  sw         $s0, 0x28($sp)
    /* 48C00 80058C00 80800200 */  sll        $s0, $v0, 2
    /* 48C04 80058C04 4000BFAF */  sw         $ra, 0x40($sp)
    /* 48C08 80058C08 3400B3AF */  sw         $s3, 0x34($sp)
    /* 48C0C 80058C0C 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 48C10 80058C10 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 48C14 80058C14 21083000 */  addu       $at, $at, $s0
    /* 48C18 80058C18 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 48C1C 80058C1C 00000000 */  nop
    /* 48C20 80058C20 D1004010 */  beqz       $v0, .L80058F68
    /* 48C24 80058C24 2198C000 */   addu      $s3, $a2, $zero
    /* 48C28 80058C28 1280023C */  lui        $v0, %hi(deltaload)
    /* 48C2C 80058C2C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 48C30 80058C30 00000000 */  nop
    /* 48C34 80058C34 0A004014 */  bnez       $v0, .L80058C60
    /* 48C38 80058C38 02000224 */   addiu     $v0, $zero, 0x2
    /* 48C3C 80058C3C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 48C40 80058C40 21083000 */  addu       $at, $at, $s0
    /* 48C44 80058C44 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 48C48 80058C48 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 48C4C 80058C4C 21083000 */  addu       $at, $at, $s0
    /* 48C50 80058C50 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 48C54 80058C54 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 48C58 80058C58 12000424 */   addiu     $a0, $zero, 0x12
    /* 48C5C 80058C5C 02000224 */  addiu      $v0, $zero, 0x2
  .L80058C60:
    /* 48C60 80058C60 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 48C64 80058C64 21083000 */  addu       $at, $at, $s0
    /* 48C68 80058C68 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 48C6C 80058C6C 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 48C70 80058C70 21083000 */  addu       $at, $at, $s0
    /* 48C74 80058C74 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 48C78 80058C78 1280023C */  lui        $v0, %hi(deltaload)
    /* 48C7C 80058C7C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 48C80 80058C80 00000000 */  nop
    /* 48C84 80058C84 B8004014 */  bnez       $v0, .L80058F68
    /* 48C88 80058C88 00000000 */   nop
    /* 48C8C 80058C8C 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 48C90 80058C90 21083000 */  addu       $at, $at, $s0
    /* 48C94 80058C94 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 48C98 80058C98 B3F6000C */  jal        SetRndSeed__Fl
    /* 48C9C 80058C9C 00000000 */   nop
    /* 48CA0 80058CA0 1280023C */  lui        $v0, %hi(setlevel)
    /* 48CA4 80058CA4 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 48CA8 80058CA8 00000000 */  nop
    /* 48CAC 80058CAC 1B004010 */  beqz       $v0, .L80058D1C
    /* 48CB0 80058CB0 00000000 */   nop
    /* 48CB4 80058CB4 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 48CB8 80058CB8 21083000 */  addu       $at, $at, $s0
    /* 48CBC 80058CBC 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 48CC0 80058CC0 00000000 */  nop
    /* 48CC4 80058CC4 2A10A202 */  slt        $v0, $s5, $v0
    /* 48CC8 80058CC8 3C004010 */  beqz       $v0, .L80058DBC
    /* 48CCC 80058CCC 21880000 */   addu      $s1, $zero, $zero
    /* 48CD0 80058CD0 01000624 */  addiu      $a2, $zero, 0x1
  .L80058CD4:
    /* 48CD4 80058CD4 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 48CD8 80058CD8 21083000 */  addu       $at, $at, $s0
    /* 48CDC 80058CDC 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 48CE0 80058CE0 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 48CE4 80058CE4 21083000 */  addu       $at, $at, $s0
    /* 48CE8 80058CE8 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 48CEC 80058CEC FF006732 */  andi       $a3, $s3, 0xFF
    /* 48CF0 80058CF0 F612010C */  jal        CreateRndItem__FiiUcUcUc
    /* 48CF4 80058CF4 1000A0AF */   sw        $zero, 0x10($sp)
    /* 48CF8 80058CF8 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 48CFC 80058CFC 21083000 */  addu       $at, $at, $s0
    /* 48D00 80058D00 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 48D04 80058D04 01003126 */  addiu      $s1, $s1, 0x1
    /* 48D08 80058D08 2A102202 */  slt        $v0, $s1, $v0
    /* 48D0C 80058D0C F1FF4014 */  bnez       $v0, .L80058CD4
    /* 48D10 80058D10 01000624 */   addiu     $a2, $zero, 0x1
    /* 48D14 80058D14 70630108 */  j          .L80058DC0
    /* 48D18 80058D18 40101400 */   sll       $v0, $s4, 1
  .L80058D1C:
    /* 48D1C 80058D1C 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 48D20 80058D20 21083000 */  addu       $at, $at, $s0
    /* 48D24 80058D24 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 48D28 80058D28 00000000 */  nop
    /* 48D2C 80058D2C 2A10A202 */  slt        $v0, $s5, $v0
    /* 48D30 80058D30 22004010 */  beqz       $v0, .L80058DBC
    /* 48D34 80058D34 21880000 */   addu      $s1, $zero, $zero
  .L80058D38:
    /* 48D38 80058D38 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 48D3C 80058D3C 21083000 */  addu       $at, $at, $s0
    /* 48D40 80058D40 5C8C2284 */  lh         $v0, %lo(object + 0x10)($at)
    /* 48D44 80058D44 00000000 */  nop
    /* 48D48 80058D48 0C004010 */  beqz       $v0, .L80058D7C
    /* 48D4C 80058D4C 21300000 */   addu      $a2, $zero, $zero
    /* 48D50 80058D50 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 48D54 80058D54 21083000 */  addu       $at, $at, $s0
    /* 48D58 80058D58 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 48D5C 80058D5C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 48D60 80058D60 21083000 */  addu       $at, $at, $s0
    /* 48D64 80058D64 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 48D68 80058D68 FF006732 */  andi       $a3, $s3, 0xFF
    /* 48D6C 80058D6C F612010C */  jal        CreateRndItem__FiiUcUcUc
    /* 48D70 80058D70 1000A0AF */   sw        $zero, 0x10($sp)
    /* 48D74 80058D74 68630108 */  j          .L80058DA0
    /* 48D78 80058D78 00000000 */   nop
  .L80058D7C:
    /* 48D7C 80058D7C 21204002 */  addu       $a0, $s2, $zero
    /* 48D80 80058D80 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 48D84 80058D84 21083000 */  addu       $at, $at, $s0
    /* 48D88 80058D88 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 48D8C 80058D8C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 48D90 80058D90 21083000 */  addu       $at, $at, $s0
    /* 48D94 80058D94 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 48D98 80058D98 8113010C */  jal        CreateRndUseful__FiiiUc
    /* 48D9C 80058D9C FF006732 */   andi      $a3, $s3, 0xFF
  .L80058DA0:
    /* 48DA0 80058DA0 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 48DA4 80058DA4 21083000 */  addu       $at, $at, $s0
    /* 48DA8 80058DA8 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 48DAC 80058DAC 01003126 */  addiu      $s1, $s1, 0x1
    /* 48DB0 80058DB0 2A102202 */  slt        $v0, $s1, $v0
    /* 48DB4 80058DB4 E0FF4014 */  bnez       $v0, .L80058D38
    /* 48DB8 80058DB8 00000000 */   nop
  .L80058DBC:
    /* 48DBC 80058DBC 40101400 */  sll        $v0, $s4, 1
  .L80058DC0:
    /* 48DC0 80058DC0 21105400 */  addu       $v0, $v0, $s4
    /* 48DC4 80058DC4 80100200 */  sll        $v0, $v0, 2
    /* 48DC8 80058DC8 23105400 */  subu       $v0, $v0, $s4
    /* 48DCC 80058DCC 80800200 */  sll        $s0, $v0, 2
    /* 48DD0 80058DD0 0E80013C */  lui        $at, %hi(object + 0x2A)
    /* 48DD4 80058DD4 21083000 */  addu       $at, $at, $s0
    /* 48DD8 80058DD8 768C2290 */  lbu        $v0, %lo(object + 0x2A)($at)
    /* 48DDC 80058DDC 00000000 */  nop
    /* 48DE0 80058DE0 5D004010 */  beqz       $v0, .L80058F58
    /* 48DE4 80058DE4 21200000 */   addu      $a0, $zero, $zero
    /* 48DE8 80058DE8 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 48DEC 80058DEC 21083000 */  addu       $at, $at, $s0
    /* 48DF0 80058DF0 6A8C2290 */  lbu        $v0, %lo(object + 0x1E)($at)
    /* 48DF4 80058DF4 00000000 */  nop
    /* 48DF8 80058DF8 BCFF4224 */  addiu      $v0, $v0, -0x44
    /* 48DFC 80058DFC 0300422C */  sltiu      $v0, $v0, 0x3
    /* 48E00 80058E00 55004010 */  beqz       $v0, .L80058F58
    /* 48E04 80058E04 40101200 */   sll       $v0, $s2, 1
    /* 48E08 80058E08 21105200 */  addu       $v0, $v0, $s2
    /* 48E0C 80058E0C 80100200 */  sll        $v0, $v0, 2
    /* 48E10 80058E10 21105200 */  addu       $v0, $v0, $s2
    /* 48E14 80058E14 00110200 */  sll        $v0, $v0, 4
    /* 48E18 80058E18 23105200 */  subu       $v0, $v0, $s2
    /* 48E1C 80058E1C 80100200 */  sll        $v0, $v0, 2
    /* 48E20 80058E20 21105200 */  addu       $v0, $v0, $s2
    /* 48E24 80058E24 C0100200 */  sll        $v0, $v0, 3
    /* 48E28 80058E28 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 48E2C 80058E2C 21083000 */  addu       $at, $at, $s0
    /* 48E30 80058E30 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 48E34 80058E34 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 48E38 80058E38 21083000 */  addu       $at, $at, $s0
    /* 48E3C 80058E3C 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 48E40 80058E40 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 48E44 80058E44 21082200 */  addu       $at, $at, $v0
    /* 48E48 80058E48 68A52684 */  lh         $a2, %lo(plr + 0x30)($at)
    /* 48E4C 80058E4C 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 48E50 80058E50 21082200 */  addu       $at, $at, $v0
    /* 48E54 80058E54 6AA52784 */  lh         $a3, %lo(plr + 0x32)($at)
    /* 48E58 80058E58 8AF6000C */  jal        GetDirection__Fiiii
    /* 48E5C 80058E5C 00000000 */   nop
    /* 48E60 80058E60 21404000 */  addu       $t0, $v0, $zero
    /* 48E64 80058E64 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 48E68 80058E68 21083000 */  addu       $at, $at, $s0
    /* 48E6C 80058E6C 608C2384 */  lh         $v1, %lo(object + 0x14)($at)
    /* 48E70 80058E70 01000224 */  addiu      $v0, $zero, 0x1
    /* 48E74 80058E74 0E006210 */  beq        $v1, $v0, .L80058EB0
    /* 48E78 80058E78 02006228 */   slti      $v0, $v1, 0x2
    /* 48E7C 80058E7C 05004010 */  beqz       $v0, .L80058E94
    /* 48E80 80058E80 00000000 */   nop
    /* 48E84 80058E84 08006010 */  beqz       $v1, .L80058EA8
    /* 48E88 80058E88 40801400 */   sll       $s0, $s4, 1
    /* 48E8C 80058E8C B0630108 */  j          .L80058EC0
    /* 48E90 80058E90 00000000 */   nop
  .L80058E94:
    /* 48E94 80058E94 02000224 */  addiu      $v0, $zero, 0x2
    /* 48E98 80058E98 07006210 */  beq        $v1, $v0, .L80058EB8
    /* 48E9C 80058E9C 40801400 */   sll       $s0, $s4, 1
    /* 48EA0 80058EA0 B0630108 */  j          .L80058EC0
    /* 48EA4 80058EA4 00000000 */   nop
  .L80058EA8:
    /* 48EA8 80058EA8 AF630108 */  j          .L80058EBC
    /* 48EAC 80058EAC 21A80000 */   addu      $s5, $zero, $zero
  .L80058EB0:
    /* 48EB0 80058EB0 AF630108 */  j          .L80058EBC
    /* 48EB4 80058EB4 1B001524 */   addiu     $s5, $zero, 0x1B
  .L80058EB8:
    /* 48EB8 80058EB8 2A001524 */  addiu      $s5, $zero, 0x2A
  .L80058EBC:
    /* 48EBC 80058EBC 40801400 */  sll        $s0, $s4, 1
  .L80058EC0:
    /* 48EC0 80058EC0 21801402 */  addu       $s0, $s0, $s4
    /* 48EC4 80058EC4 80801000 */  sll        $s0, $s0, 2
    /* 48EC8 80058EC8 23801402 */  subu       $s0, $s0, $s4
    /* 48ECC 80058ECC 80801000 */  sll        $s0, $s0, 2
    /* 48ED0 80058ED0 40101200 */  sll        $v0, $s2, 1
    /* 48ED4 80058ED4 21105200 */  addu       $v0, $v0, $s2
    /* 48ED8 80058ED8 80100200 */  sll        $v0, $v0, 2
    /* 48EDC 80058EDC 21105200 */  addu       $v0, $v0, $s2
    /* 48EE0 80058EE0 00110200 */  sll        $v0, $v0, 4
    /* 48EE4 80058EE4 23105200 */  subu       $v0, $v0, $s2
    /* 48EE8 80058EE8 80100200 */  sll        $v0, $v0, 2
    /* 48EEC 80058EEC 21105200 */  addu       $v0, $v0, $s2
    /* 48EF0 80058EF0 C0100200 */  sll        $v0, $v0, 3
    /* 48EF4 80058EF4 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 48EF8 80058EF8 21083000 */  addu       $at, $at, $s0
    /* 48EFC 80058EFC 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 48F00 80058F00 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 48F04 80058F04 21083000 */  addu       $at, $at, $s0
    /* 48F08 80058F08 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 48F0C 80058F0C 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 48F10 80058F10 21082200 */  addu       $at, $at, $v0
    /* 48F14 80058F14 68A52684 */  lh         $a2, %lo(plr + 0x30)($at)
    /* 48F18 80058F18 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 48F1C 80058F1C 21082200 */  addu       $at, $at, $v0
    /* 48F20 80058F20 6AA52784 */  lh         $a3, %lo(plr + 0x32)($at)
    /* 48F24 80058F24 01000224 */  addiu      $v0, $zero, 0x1
    /* 48F28 80058F28 1800A2AF */  sw         $v0, 0x18($sp)
    /* 48F2C 80058F2C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 48F30 80058F30 1000A8AF */  sw         $t0, 0x10($sp)
    /* 48F34 80058F34 1400B5AF */  sw         $s5, 0x14($sp)
    /* 48F38 80058F38 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 48F3C 80058F3C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 48F40 80058F40 810A050C */  jal        func_80142A04
    /* 48F44 80058F44 2400A0AF */   sw        $zero, 0x24($sp)
    /* 48F48 80058F48 0E80013C */  lui        $at, %hi(object + 0x2A)
    /* 48F4C 80058F4C 21083000 */  addu       $at, $at, $s0
    /* 48F50 80058F50 768C20A0 */  sb         $zero, %lo(object + 0x2A)($at)
    /* 48F54 80058F54 21200000 */  addu       $a0, $zero, $zero
  .L80058F58:
    /* 48F58 80058F58 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 48F5C 80058F5C FFFF4632 */  andi       $a2, $s2, 0xFFFF
    /* 48F60 80058F60 183E010C */  jal        NetSendCmdParam2__FUcUcUsUs
    /* 48F64 80058F64 FFFF8732 */   andi      $a3, $s4, 0xFFFF
  .L80058F68:
    /* 48F68 80058F68 4000BF8F */  lw         $ra, 0x40($sp)
    /* 48F6C 80058F6C 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 48F70 80058F70 3800B48F */  lw         $s4, 0x38($sp)
    /* 48F74 80058F74 3400B38F */  lw         $s3, 0x34($sp)
    /* 48F78 80058F78 3000B28F */  lw         $s2, 0x30($sp)
    /* 48F7C 80058F7C 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 48F80 80058F80 2800B08F */  lw         $s0, 0x28($sp)
    /* 48F84 80058F84 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 48F88 80058F88 0800E003 */  jr         $ra
    /* 48F8C 80058F8C 00000000 */   nop
endlabel OperateChest__FiiUc
