.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RndPremiumItem__Fii, 0x104

glabel RndPremiumItem__Fii
    /* 37E14 80047E14 D0F7BD27 */  addiu      $sp, $sp, -0x830
    /* 37E18 80047E18 2008B4AF */  sw         $s4, 0x820($sp)
    /* 37E1C 80047E1C 21A08000 */  addu       $s4, $a0, $zero
    /* 37E20 80047E20 2408B5AF */  sw         $s5, 0x824($sp)
    /* 37E24 80047E24 21A8A000 */  addu       $s5, $a1, $zero
    /* 37E28 80047E28 1C08B3AF */  sw         $s3, 0x81C($sp)
    /* 37E2C 80047E2C 21980000 */  addu       $s3, $zero, $zero
    /* 37E30 80047E30 1408B1AF */  sw         $s1, 0x814($sp)
    /* 37E34 80047E34 01001124 */  addiu      $s1, $zero, 0x1
    /* 37E38 80047E38 1180033C */  lui        $v1, %hi(AllItemsList + 0x22)
    /* 37E3C 80047E3C C6136380 */  lb         $v1, %lo(AllItemsList + 0x22)($v1)
    /* 37E40 80047E40 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 37E44 80047E44 2808BFAF */  sw         $ra, 0x828($sp)
    /* 37E48 80047E48 1808B2AF */  sw         $s2, 0x818($sp)
    /* 37E4C 80047E4C 21006210 */  beq        $v1, $v0, .L80047ED4
    /* 37E50 80047E50 1008B0AF */   sw        $s0, 0x810($sp)
    /* 37E54 80047E54 20001024 */  addiu      $s0, $zero, 0x20
    /* 37E58 80047E58 1000B227 */  addiu      $s2, $sp, 0x10
  .L80047E5C:
    /* 37E5C 80047E5C 1180013C */  lui        $at, %hi(AllItemsList)
    /* 37E60 80047E60 21083000 */  addu       $at, $at, $s0
    /* 37E64 80047E64 A4132290 */  lbu        $v0, %lo(AllItemsList)($at)
    /* 37E68 80047E68 00000000 */  nop
    /* 37E6C 80047E6C 12004010 */  beqz       $v0, .L80047EB8
    /* 37E70 80047E70 00000000 */   nop
    /* 37E74 80047E74 661F010C */  jal        PremiumItemOk__Fi
    /* 37E78 80047E78 21202002 */   addu      $a0, $s1, $zero
    /* 37E7C 80047E7C FF004230 */  andi       $v0, $v0, 0xFF
    /* 37E80 80047E80 0D004010 */  beqz       $v0, .L80047EB8
    /* 37E84 80047E84 00000000 */   nop
    /* 37E88 80047E88 1180013C */  lui        $at, %hi(AllItemsList + 0xA)
    /* 37E8C 80047E8C 21083000 */  addu       $at, $at, $s0
    /* 37E90 80047E90 AE132380 */  lb         $v1, %lo(AllItemsList + 0xA)($at)
    /* 37E94 80047E94 00000000 */  nop
    /* 37E98 80047E98 2A107400 */  slt        $v0, $v1, $s4
    /* 37E9C 80047E9C 06004014 */  bnez       $v0, .L80047EB8
    /* 37EA0 80047EA0 2A10A302 */   slt       $v0, $s5, $v1
    /* 37EA4 80047EA4 04004014 */  bnez       $v0, .L80047EB8
    /* 37EA8 80047EA8 00000000 */   nop
    /* 37EAC 80047EAC 000051AE */  sw         $s1, 0x0($s2)
    /* 37EB0 80047EB0 04005226 */  addiu      $s2, $s2, 0x4
    /* 37EB4 80047EB4 01007326 */  addiu      $s3, $s3, 0x1
  .L80047EB8:
    /* 37EB8 80047EB8 20001026 */  addiu      $s0, $s0, 0x20
    /* 37EBC 80047EBC 1180013C */  lui        $at, %hi(AllItemsList + 0x2)
    /* 37EC0 80047EC0 21083000 */  addu       $at, $at, $s0
    /* 37EC4 80047EC4 A6132380 */  lb         $v1, %lo(AllItemsList + 0x2)($at)
    /* 37EC8 80047EC8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 37ECC 80047ECC E3FF6214 */  bne        $v1, $v0, .L80047E5C
    /* 37ED0 80047ED0 01003126 */   addiu     $s1, $s1, 0x1
  .L80047ED4:
    /* 37ED4 80047ED4 C9F6000C */  jal        ENG_random__Fl
    /* 37ED8 80047ED8 21206002 */   addu      $a0, $s3, $zero
    /* 37EDC 80047EDC 80100200 */  sll        $v0, $v0, 2
    /* 37EE0 80047EE0 2110A203 */  addu       $v0, $sp, $v0
    /* 37EE4 80047EE4 1000428C */  lw         $v0, 0x10($v0)
    /* 37EE8 80047EE8 00000000 */  nop
    /* 37EEC 80047EEC 01004224 */  addiu      $v0, $v0, 0x1
    /* 37EF0 80047EF0 2808BF8F */  lw         $ra, 0x828($sp)
    /* 37EF4 80047EF4 2408B58F */  lw         $s5, 0x824($sp)
    /* 37EF8 80047EF8 2008B48F */  lw         $s4, 0x820($sp)
    /* 37EFC 80047EFC 1C08B38F */  lw         $s3, 0x81C($sp)
    /* 37F00 80047F00 1808B28F */  lw         $s2, 0x818($sp)
    /* 37F04 80047F04 1408B18F */  lw         $s1, 0x814($sp)
    /* 37F08 80047F08 1008B08F */  lw         $s0, 0x810($sp)
    /* 37F0C 80047F0C 3008BD27 */  addiu      $sp, $sp, 0x830
    /* 37F10 80047F10 0800E003 */  jr         $ra
    /* 37F14 80047F14 00000000 */   nop
endlabel RndPremiumItem__Fii
