.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RndHealerItem__Fi, 0xFC

glabel RndHealerItem__Fi
    /* 39F18 80049F18 D0F7BD27 */  addiu      $sp, $sp, -0x830
    /* 39F1C 80049F1C 2008B4AF */  sw         $s4, 0x820($sp)
    /* 39F20 80049F20 21A08000 */  addu       $s4, $a0, $zero
    /* 39F24 80049F24 1C08B3AF */  sw         $s3, 0x81C($sp)
    /* 39F28 80049F28 21980000 */  addu       $s3, $zero, $zero
    /* 39F2C 80049F2C 1408B1AF */  sw         $s1, 0x814($sp)
    /* 39F30 80049F30 01001124 */  addiu      $s1, $zero, 0x1
    /* 39F34 80049F34 1180033C */  lui        $v1, %hi(AllItemsList + 0x22)
    /* 39F38 80049F38 C6136380 */  lb         $v1, %lo(AllItemsList + 0x22)($v1)
    /* 39F3C 80049F3C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 39F40 80049F40 2808BFAF */  sw         $ra, 0x828($sp)
    /* 39F44 80049F44 2408B5AF */  sw         $s5, 0x824($sp)
    /* 39F48 80049F48 1808B2AF */  sw         $s2, 0x818($sp)
    /* 39F4C 80049F4C 20006210 */  beq        $v1, $v0, .L80049FD0
    /* 39F50 80049F50 1008B0AF */   sw        $s0, 0x810($sp)
    /* 39F54 80049F54 FFFF1524 */  addiu      $s5, $zero, -0x1
    /* 39F58 80049F58 20001024 */  addiu      $s0, $zero, 0x20
    /* 39F5C 80049F5C 1000B227 */  addiu      $s2, $sp, 0x10
  .L80049F60:
    /* 39F60 80049F60 1180013C */  lui        $at, %hi(AllItemsList)
    /* 39F64 80049F64 21083000 */  addu       $at, $at, $s0
    /* 39F68 80049F68 A4132290 */  lbu        $v0, %lo(AllItemsList)($at)
    /* 39F6C 80049F6C 00000000 */  nop
    /* 39F70 80049F70 10004010 */  beqz       $v0, .L80049FB4
    /* 39F74 80049F74 00000000 */   nop
    /* 39F78 80049F78 5927010C */  jal        HealerItemOk__Fi
    /* 39F7C 80049F7C 21202002 */   addu      $a0, $s1, $zero
    /* 39F80 80049F80 FF004230 */  andi       $v0, $v0, 0xFF
    /* 39F84 80049F84 0B004010 */  beqz       $v0, .L80049FB4
    /* 39F88 80049F88 00000000 */   nop
    /* 39F8C 80049F8C 1180013C */  lui        $at, %hi(AllItemsList + 0xA)
    /* 39F90 80049F90 21083000 */  addu       $at, $at, $s0
    /* 39F94 80049F94 AE132280 */  lb         $v0, %lo(AllItemsList + 0xA)($at)
    /* 39F98 80049F98 00000000 */  nop
    /* 39F9C 80049F9C 2A108202 */  slt        $v0, $s4, $v0
    /* 39FA0 80049FA0 04004014 */  bnez       $v0, .L80049FB4
    /* 39FA4 80049FA4 00000000 */   nop
    /* 39FA8 80049FA8 000051AE */  sw         $s1, 0x0($s2)
    /* 39FAC 80049FAC 04005226 */  addiu      $s2, $s2, 0x4
    /* 39FB0 80049FB0 01007326 */  addiu      $s3, $s3, 0x1
  .L80049FB4:
    /* 39FB4 80049FB4 20001026 */  addiu      $s0, $s0, 0x20
    /* 39FB8 80049FB8 1180013C */  lui        $at, %hi(AllItemsList + 0x2)
    /* 39FBC 80049FBC 21083000 */  addu       $at, $at, $s0
    /* 39FC0 80049FC0 A6132280 */  lb         $v0, %lo(AllItemsList + 0x2)($at)
    /* 39FC4 80049FC4 00000000 */  nop
    /* 39FC8 80049FC8 E5FF5514 */  bne        $v0, $s5, .L80049F60
    /* 39FCC 80049FCC 01003126 */   addiu     $s1, $s1, 0x1
  .L80049FD0:
    /* 39FD0 80049FD0 C9F6000C */  jal        ENG_random__Fl
    /* 39FD4 80049FD4 21206002 */   addu      $a0, $s3, $zero
    /* 39FD8 80049FD8 80100200 */  sll        $v0, $v0, 2
    /* 39FDC 80049FDC 2110A203 */  addu       $v0, $sp, $v0
    /* 39FE0 80049FE0 1000428C */  lw         $v0, 0x10($v0)
    /* 39FE4 80049FE4 00000000 */  nop
    /* 39FE8 80049FE8 01004224 */  addiu      $v0, $v0, 0x1
    /* 39FEC 80049FEC 2808BF8F */  lw         $ra, 0x828($sp)
    /* 39FF0 80049FF0 2408B58F */  lw         $s5, 0x824($sp)
    /* 39FF4 80049FF4 2008B48F */  lw         $s4, 0x820($sp)
    /* 39FF8 80049FF8 1C08B38F */  lw         $s3, 0x81C($sp)
    /* 39FFC 80049FFC 1808B28F */  lw         $s2, 0x818($sp)
    /* 3A000 8004A000 1408B18F */  lw         $s1, 0x814($sp)
    /* 3A004 8004A004 1008B08F */  lw         $s0, 0x810($sp)
    /* 3A008 8004A008 3008BD27 */  addiu      $sp, $sp, 0x830
    /* 3A00C 8004A00C 0800E003 */  jr         $ra
    /* 3A010 8004A010 00000000 */   nop
endlabel RndHealerItem__Fi
