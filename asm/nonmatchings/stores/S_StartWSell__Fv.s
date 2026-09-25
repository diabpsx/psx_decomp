.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartWSell__Fv, 0x678

glabel S_StartWSell__Fv
    /* 5CBB4 8006CBB4 20138283 */  lb         $v0, %gp_rel(WStaffFlag)($gp)
    /* 5CBB8 8006CBB8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 5CBBC 8006CBBC 3400BFAF */  sw         $ra, 0x34($sp)
    /* 5CBC0 8006CBC0 3000B4AF */  sw         $s4, 0x30($sp)
    /* 5CBC4 8006CBC4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 5CBC8 8006CBC8 2800B2AF */  sw         $s2, 0x28($sp)
    /* 5CBCC 8006CBCC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 5CBD0 8006CBD0 03004010 */  beqz       $v0, .L8006CBE0
    /* 5CBD4 8006CBD4 2000B0AF */   sw        $s0, 0x20($sp)
    /* 5CBD8 8006CBD8 F9B20108 */  j          .L8006CBE4
    /* 5CBDC 8006CBDC 02000224 */   addiu     $v0, $zero, 0x2
  .L8006CBE0:
    /* 5CBE0 8006CBE0 01000224 */  addiu      $v0, $zero, 0x1
  .L8006CBE4:
    /* 5CBE4 8006CBE4 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5CBE8 8006CBE8 21980000 */  addu       $s3, $zero, $zero
    /* 5CBEC 8006CBEC FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 5CBF0 8006CBF0 D4130324 */  addiu      $v1, $zero, 0x13D4
    /* 5CBF4 8006CBF4 01000224 */  addiu      $v0, $zero, 0x1
    /* 5CBF8 8006CBF8 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5CBFC 8006CBFC 282180AF */  sw         $zero, %gp_rel(D_8011C8A8)($gp)
  .L8006CC00:
    /* 5CC00 8006CC00 0E80013C */  lui        $at, %hi(storehold + 0x2C)
    /* 5CC04 8006CC04 21082300 */  addu       $at, $at, $v1
    /* 5CC08 8006CC08 B41D24A4 */  sh         $a0, %lo(storehold + 0x2C)($at)
    /* 5CC0C 8006CC0C 94FF6324 */  addiu      $v1, $v1, -0x6C
    /* 5CC10 8006CC10 FBFF6104 */  bgez       $v1, .L8006CC00
    /* 5CC14 8006CC14 00000000 */   nop
    /* 5CC18 8006CC18 1280023C */  lui        $v0, %hi(myplr)
    /* 5CC1C 8006CC1C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5CC20 8006CC20 00000000 */  nop
    /* 5CC24 8006CC24 40180200 */  sll        $v1, $v0, 1
    /* 5CC28 8006CC28 21186200 */  addu       $v1, $v1, $v0
    /* 5CC2C 8006CC2C 80180300 */  sll        $v1, $v1, 2
    /* 5CC30 8006CC30 21186200 */  addu       $v1, $v1, $v0
    /* 5CC34 8006CC34 00190300 */  sll        $v1, $v1, 4
    /* 5CC38 8006CC38 23186200 */  subu       $v1, $v1, $v0
    /* 5CC3C 8006CC3C 80180300 */  sll        $v1, $v1, 2
    /* 5CC40 8006CC40 21186200 */  addu       $v1, $v1, $v0
    /* 5CC44 8006CC44 C0180300 */  sll        $v1, $v1, 3
    /* 5CC48 8006CC48 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5CC4C 8006CC4C 21082300 */  addu       $at, $at, $v1
    /* 5CC50 8006CC50 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 5CC54 8006CC54 00000000 */  nop
    /* 5CC58 8006CC58 86004018 */  blez       $v0, .L8006CE74
    /* 5CC5C 8006CC5C 21800000 */   addu      $s0, $zero, $zero
    /* 5CC60 8006CC60 0E80143C */  lui        $s4, %hi(storehold)
    /* 5CC64 8006CC64 881D9426 */  addiu      $s4, $s4, %lo(storehold)
    /* 5CC68 8006CC68 0E80123C */  lui        $s2, %hi(plr + 0x4A4)
    /* 5CC6C 8006CC6C DCA95226 */  addiu      $s2, $s2, %lo(plr + 0x4A4)
    /* 5CC70 8006CC70 21880000 */  addu       $s1, $zero, $zero
  .L8006CC74:
    /* 5CC74 8006CC74 9AB2010C */  jal        WitchSellOk__Fi
    /* 5CC78 8006CC78 21200002 */   addu      $a0, $s0, $zero
    /* 5CC7C 8006CC7C FF004230 */  andi       $v0, $v0, 0xFF
    /* 5CC80 8006CC80 69004010 */  beqz       $v0, .L8006CE28
    /* 5CC84 8006CC84 00000000 */   nop
    /* 5CC88 8006CC88 2821838F */  lw         $v1, %gp_rel(D_8011C8A8)($gp)
    /* 5CC8C 8006CC8C 01001324 */  addiu      $s3, $zero, 0x1
    /* 5CC90 8006CC90 C0100300 */  sll        $v0, $v1, 3
    /* 5CC94 8006CC94 23104300 */  subu       $v0, $v0, $v1
    /* 5CC98 8006CC98 80100200 */  sll        $v0, $v0, 2
    /* 5CC9C 8006CC9C 23104300 */  subu       $v0, $v0, $v1
    /* 5CCA0 8006CCA0 80100200 */  sll        $v0, $v0, 2
    /* 5CCA4 8006CCA4 1280033C */  lui        $v1, %hi(myplr)
    /* 5CCA8 8006CCA8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5CCAC 8006CCAC 21385400 */  addu       $a3, $v0, $s4
    /* 5CCB0 8006CCB0 40100300 */  sll        $v0, $v1, 1
    /* 5CCB4 8006CCB4 21104300 */  addu       $v0, $v0, $v1
    /* 5CCB8 8006CCB8 80100200 */  sll        $v0, $v0, 2
    /* 5CCBC 8006CCBC 21104300 */  addu       $v0, $v0, $v1
    /* 5CCC0 8006CCC0 00110200 */  sll        $v0, $v0, 4
    /* 5CCC4 8006CCC4 23104300 */  subu       $v0, $v0, $v1
    /* 5CCC8 8006CCC8 80100200 */  sll        $v0, $v0, 2
    /* 5CCCC 8006CCCC 21104300 */  addu       $v0, $v0, $v1
    /* 5CCD0 8006CCD0 C0100200 */  sll        $v0, $v0, 3
    /* 5CCD4 8006CCD4 21105200 */  addu       $v0, $v0, $s2
    /* 5CCD8 8006CCD8 21302202 */  addu       $a2, $s1, $v0
    /* 5CCDC 8006CCDC 6000C824 */  addiu      $t0, $a2, 0x60
  .L8006CCE0:
    /* 5CCE0 8006CCE0 0000C28C */  lw         $v0, 0x0($a2)
    /* 5CCE4 8006CCE4 0400C38C */  lw         $v1, 0x4($a2)
    /* 5CCE8 8006CCE8 0800C48C */  lw         $a0, 0x8($a2)
    /* 5CCEC 8006CCEC 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5CCF0 8006CCF0 0000E2AC */  sw         $v0, 0x0($a3)
    /* 5CCF4 8006CCF4 0400E3AC */  sw         $v1, 0x4($a3)
    /* 5CCF8 8006CCF8 0800E4AC */  sw         $a0, 0x8($a3)
    /* 5CCFC 8006CCFC 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 5CD00 8006CD00 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5CD04 8006CD04 F6FFC814 */  bne        $a2, $t0, .L8006CCE0
    /* 5CD08 8006CD08 1000E724 */   addiu     $a3, $a3, 0x10
    /* 5CD0C 8006CD0C 0000C28C */  lw         $v0, 0x0($a2)
    /* 5CD10 8006CD10 0400C38C */  lw         $v1, 0x4($a2)
    /* 5CD14 8006CD14 0800C48C */  lw         $a0, 0x8($a2)
    /* 5CD18 8006CD18 0000E2AC */  sw         $v0, 0x0($a3)
    /* 5CD1C 8006CD1C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 5CD20 8006CD20 0800E4AC */  sw         $a0, 0x8($a3)
    /* 5CD24 8006CD24 2821838F */  lw         $v1, %gp_rel(D_8011C8A8)($gp)
    /* 5CD28 8006CD28 00000000 */  nop
    /* 5CD2C 8006CD2C C0100300 */  sll        $v0, $v1, 3
    /* 5CD30 8006CD30 23104300 */  subu       $v0, $v0, $v1
    /* 5CD34 8006CD34 80100200 */  sll        $v0, $v0, 2
    /* 5CD38 8006CD38 23104300 */  subu       $v0, $v0, $v1
    /* 5CD3C 8006CD3C 80180200 */  sll        $v1, $v0, 2
    /* 5CD40 8006CD40 0E80013C */  lui        $at, %hi(storehold + 0x51)
    /* 5CD44 8006CD44 21082300 */  addu       $at, $at, $v1
    /* 5CD48 8006CD48 D91D2280 */  lb         $v0, %lo(storehold + 0x51)($at)
    /* 5CD4C 8006CD4C 00000000 */  nop
    /* 5CD50 8006CD50 0D004010 */  beqz       $v0, .L8006CD88
    /* 5CD54 8006CD54 00000000 */   nop
    /* 5CD58 8006CD58 0E80013C */  lui        $at, %hi(storehold + 0x69)
    /* 5CD5C 8006CD5C 21082300 */  addu       $at, $at, $v1
    /* 5CD60 8006CD60 F11D2280 */  lb         $v0, %lo(storehold + 0x69)($at)
    /* 5CD64 8006CD64 00000000 */  nop
    /* 5CD68 8006CD68 07004010 */  beqz       $v0, .L8006CD88
    /* 5CD6C 8006CD6C 00000000 */   nop
    /* 5CD70 8006CD70 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 5CD74 8006CD74 21082300 */  addu       $at, $at, $v1
    /* 5CD78 8006CD78 A01D228C */  lw         $v0, %lo(storehold + 0x18)($at)
    /* 5CD7C 8006CD7C 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5CD80 8006CD80 21082300 */  addu       $at, $at, $v1
    /* 5CD84 8006CD84 9C1D22AC */  sw         $v0, %lo(storehold + 0x14)($at)
  .L8006CD88:
    /* 5CD88 8006CD88 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5CD8C 8006CD8C 00000000 */  nop
    /* 5CD90 8006CD90 C0180200 */  sll        $v1, $v0, 3
    /* 5CD94 8006CD94 23186200 */  subu       $v1, $v1, $v0
    /* 5CD98 8006CD98 80180300 */  sll        $v1, $v1, 2
    /* 5CD9C 8006CD9C 23186200 */  subu       $v1, $v1, $v0
    /* 5CDA0 8006CDA0 80180300 */  sll        $v1, $v1, 2
    /* 5CDA4 8006CDA4 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5CDA8 8006CDA8 21082300 */  addu       $at, $at, $v1
    /* 5CDAC 8006CDAC 9C1D228C */  lw         $v0, %lo(storehold + 0x14)($at)
    /* 5CDB0 8006CDB0 00000000 */  nop
    /* 5CDB4 8006CDB4 83100200 */  sra        $v0, $v0, 2
    /* 5CDB8 8006CDB8 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5CDBC 8006CDBC 21082300 */  addu       $at, $at, $v1
    /* 5CDC0 8006CDC0 9C1D22AC */  sw         $v0, %lo(storehold + 0x14)($at)
    /* 5CDC4 8006CDC4 04004014 */  bnez       $v0, .L8006CDD8
    /* 5CDC8 8006CDC8 01000224 */   addiu     $v0, $zero, 0x1
    /* 5CDCC 8006CDCC 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5CDD0 8006CDD0 21082300 */  addu       $at, $at, $v1
    /* 5CDD4 8006CDD4 9C1D22AC */  sw         $v0, %lo(storehold + 0x14)($at)
  .L8006CDD8:
    /* 5CDD8 8006CDD8 2821848F */  lw         $a0, %gp_rel(D_8011C8A8)($gp)
    /* 5CDDC 8006CDDC 00000000 */  nop
    /* 5CDE0 8006CDE0 C0100400 */  sll        $v0, $a0, 3
    /* 5CDE4 8006CDE4 23104400 */  subu       $v0, $v0, $a0
    /* 5CDE8 8006CDE8 80100200 */  sll        $v0, $v0, 2
    /* 5CDEC 8006CDEC 23104400 */  subu       $v0, $v0, $a0
    /* 5CDF0 8006CDF0 80100200 */  sll        $v0, $v0, 2
    /* 5CDF4 8006CDF4 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5CDF8 8006CDF8 21082200 */  addu       $at, $at, $v0
    /* 5CDFC 8006CDFC 9C1D238C */  lw         $v1, %lo(storehold + 0x14)($at)
    /* 5CE00 8006CE00 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 5CE04 8006CE04 21082200 */  addu       $at, $at, $v0
    /* 5CE08 8006CE08 A01D23AC */  sw         $v1, %lo(storehold + 0x18)($at)
    /* 5CE0C 8006CE0C 0E80013C */  lui        $at, %hi(storehidx)
    /* 5CE10 8006CE10 21082400 */  addu       $at, $at, $a0
    /* 5CE14 8006CE14 C83130A0 */  sb         $s0, %lo(storehidx)($at)
    /* 5CE18 8006CE18 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5CE1C 8006CE1C 00000000 */  nop
    /* 5CE20 8006CE20 01004224 */  addiu      $v0, $v0, 0x1
    /* 5CE24 8006CE24 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
  .L8006CE28:
    /* 5CE28 8006CE28 1280023C */  lui        $v0, %hi(myplr)
    /* 5CE2C 8006CE2C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5CE30 8006CE30 00000000 */  nop
    /* 5CE34 8006CE34 40180200 */  sll        $v1, $v0, 1
    /* 5CE38 8006CE38 21186200 */  addu       $v1, $v1, $v0
    /* 5CE3C 8006CE3C 80180300 */  sll        $v1, $v1, 2
    /* 5CE40 8006CE40 21186200 */  addu       $v1, $v1, $v0
    /* 5CE44 8006CE44 00190300 */  sll        $v1, $v1, 4
    /* 5CE48 8006CE48 23186200 */  subu       $v1, $v1, $v0
    /* 5CE4C 8006CE4C 80180300 */  sll        $v1, $v1, 2
    /* 5CE50 8006CE50 21186200 */  addu       $v1, $v1, $v0
    /* 5CE54 8006CE54 C0180300 */  sll        $v1, $v1, 3
    /* 5CE58 8006CE58 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5CE5C 8006CE5C 21082300 */  addu       $at, $at, $v1
    /* 5CE60 8006CE60 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 5CE64 8006CE64 01001026 */  addiu      $s0, $s0, 0x1
    /* 5CE68 8006CE68 2A100202 */  slt        $v0, $s0, $v0
    /* 5CE6C 8006CE6C 81FF4014 */  bnez       $v0, .L8006CC74
    /* 5CE70 8006CE70 6C003126 */   addiu     $s1, $s1, 0x6C
  .L8006CE74:
    /* 5CE74 8006CE74 21800000 */  addu       $s0, $zero, $zero
    /* 5CE78 8006CE78 0E80143C */  lui        $s4, %hi(storehold)
    /* 5CE7C 8006CE7C 881D9426 */  addiu      $s4, $s4, %lo(storehold)
    /* 5CE80 8006CE80 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 5CE84 8006CE84 21880000 */  addu       $s1, $zero, $zero
  .L8006CE88:
    /* 5CE88 8006CE88 1280033C */  lui        $v1, %hi(myplr)
    /* 5CE8C 8006CE8C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5CE90 8006CE90 00000000 */  nop
    /* 5CE94 8006CE94 40100300 */  sll        $v0, $v1, 1
    /* 5CE98 8006CE98 21104300 */  addu       $v0, $v0, $v1
    /* 5CE9C 8006CE9C 80100200 */  sll        $v0, $v0, 2
    /* 5CEA0 8006CEA0 21104300 */  addu       $v0, $v0, $v1
    /* 5CEA4 8006CEA4 00110200 */  sll        $v0, $v0, 4
    /* 5CEA8 8006CEA8 23104300 */  subu       $v0, $v0, $v1
    /* 5CEAC 8006CEAC 80100200 */  sll        $v0, $v0, 2
    /* 5CEB0 8006CEB0 21104300 */  addu       $v0, $v0, $v1
    /* 5CEB4 8006CEB4 C0100200 */  sll        $v0, $v0, 3
    /* 5CEB8 8006CEB8 21102202 */  addu       $v0, $s1, $v0
    /* 5CEBC 8006CEBC 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 5CEC0 8006CEC0 21082200 */  addu       $at, $at, $v0
    /* 5CEC4 8006CEC4 14BB2384 */  lh         $v1, %lo(plr + 0x15DC)($at)
    /* 5CEC8 8006CEC8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5CECC 8006CECC 70006210 */  beq        $v1, $v0, .L8006D090
    /* 5CED0 8006CED0 00000000 */   nop
    /* 5CED4 8006CED4 9AB2010C */  jal        WitchSellOk__Fi
    /* 5CED8 8006CED8 21204002 */   addu      $a0, $s2, $zero
    /* 5CEDC 8006CEDC FF004230 */  andi       $v0, $v0, 0xFF
    /* 5CEE0 8006CEE0 6B004010 */  beqz       $v0, .L8006D090
    /* 5CEE4 8006CEE4 00000000 */   nop
    /* 5CEE8 8006CEE8 2821838F */  lw         $v1, %gp_rel(D_8011C8A8)($gp)
    /* 5CEEC 8006CEEC 01001324 */  addiu      $s3, $zero, 0x1
    /* 5CEF0 8006CEF0 C0100300 */  sll        $v0, $v1, 3
    /* 5CEF4 8006CEF4 23104300 */  subu       $v0, $v0, $v1
    /* 5CEF8 8006CEF8 80100200 */  sll        $v0, $v0, 2
    /* 5CEFC 8006CEFC 23104300 */  subu       $v0, $v0, $v1
    /* 5CF00 8006CF00 80100200 */  sll        $v0, $v0, 2
    /* 5CF04 8006CF04 1280033C */  lui        $v1, %hi(myplr)
    /* 5CF08 8006CF08 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5CF0C 8006CF0C 21405400 */  addu       $t0, $v0, $s4
    /* 5CF10 8006CF10 40100300 */  sll        $v0, $v1, 1
    /* 5CF14 8006CF14 21104300 */  addu       $v0, $v0, $v1
    /* 5CF18 8006CF18 80100200 */  sll        $v0, $v0, 2
    /* 5CF1C 8006CF1C 21104300 */  addu       $v0, $v0, $v1
    /* 5CF20 8006CF20 00110200 */  sll        $v0, $v0, 4
    /* 5CF24 8006CF24 23104300 */  subu       $v0, $v0, $v1
    /* 5CF28 8006CF28 80100200 */  sll        $v0, $v0, 2
    /* 5CF2C 8006CF2C 21104300 */  addu       $v0, $v0, $v1
    /* 5CF30 8006CF30 C0100200 */  sll        $v0, $v0, 3
    /* 5CF34 8006CF34 0E80033C */  lui        $v1, %hi(plr + 0x15B0)
    /* 5CF38 8006CF38 E8BA6324 */  addiu      $v1, $v1, %lo(plr + 0x15B0)
    /* 5CF3C 8006CF3C 21104300 */  addu       $v0, $v0, $v1
    /* 5CF40 8006CF40 21302202 */  addu       $a2, $s1, $v0
    /* 5CF44 8006CF44 6000C724 */  addiu      $a3, $a2, 0x60
  .L8006CF48:
    /* 5CF48 8006CF48 0000C28C */  lw         $v0, 0x0($a2)
    /* 5CF4C 8006CF4C 0400C38C */  lw         $v1, 0x4($a2)
    /* 5CF50 8006CF50 0800C48C */  lw         $a0, 0x8($a2)
    /* 5CF54 8006CF54 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5CF58 8006CF58 000002AD */  sw         $v0, 0x0($t0)
    /* 5CF5C 8006CF5C 040003AD */  sw         $v1, 0x4($t0)
    /* 5CF60 8006CF60 080004AD */  sw         $a0, 0x8($t0)
    /* 5CF64 8006CF64 0C0005AD */  sw         $a1, 0xC($t0)
    /* 5CF68 8006CF68 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5CF6C 8006CF6C F6FFC714 */  bne        $a2, $a3, .L8006CF48
    /* 5CF70 8006CF70 10000825 */   addiu     $t0, $t0, 0x10
    /* 5CF74 8006CF74 0000C28C */  lw         $v0, 0x0($a2)
    /* 5CF78 8006CF78 0400C38C */  lw         $v1, 0x4($a2)
    /* 5CF7C 8006CF7C 0800C48C */  lw         $a0, 0x8($a2)
    /* 5CF80 8006CF80 000002AD */  sw         $v0, 0x0($t0)
    /* 5CF84 8006CF84 040003AD */  sw         $v1, 0x4($t0)
    /* 5CF88 8006CF88 080004AD */  sw         $a0, 0x8($t0)
    /* 5CF8C 8006CF8C 2821838F */  lw         $v1, %gp_rel(D_8011C8A8)($gp)
    /* 5CF90 8006CF90 00000000 */  nop
    /* 5CF94 8006CF94 C0100300 */  sll        $v0, $v1, 3
    /* 5CF98 8006CF98 23104300 */  subu       $v0, $v0, $v1
    /* 5CF9C 8006CF9C 80100200 */  sll        $v0, $v0, 2
    /* 5CFA0 8006CFA0 23104300 */  subu       $v0, $v0, $v1
    /* 5CFA4 8006CFA4 80180200 */  sll        $v1, $v0, 2
    /* 5CFA8 8006CFA8 0E80013C */  lui        $at, %hi(storehold + 0x51)
    /* 5CFAC 8006CFAC 21082300 */  addu       $at, $at, $v1
    /* 5CFB0 8006CFB0 D91D2280 */  lb         $v0, %lo(storehold + 0x51)($at)
    /* 5CFB4 8006CFB4 00000000 */  nop
    /* 5CFB8 8006CFB8 0D004010 */  beqz       $v0, .L8006CFF0
    /* 5CFBC 8006CFBC 00000000 */   nop
    /* 5CFC0 8006CFC0 0E80013C */  lui        $at, %hi(storehold + 0x69)
    /* 5CFC4 8006CFC4 21082300 */  addu       $at, $at, $v1
    /* 5CFC8 8006CFC8 F11D2280 */  lb         $v0, %lo(storehold + 0x69)($at)
    /* 5CFCC 8006CFCC 00000000 */  nop
    /* 5CFD0 8006CFD0 07004010 */  beqz       $v0, .L8006CFF0
    /* 5CFD4 8006CFD4 00000000 */   nop
    /* 5CFD8 8006CFD8 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 5CFDC 8006CFDC 21082300 */  addu       $at, $at, $v1
    /* 5CFE0 8006CFE0 A01D228C */  lw         $v0, %lo(storehold + 0x18)($at)
    /* 5CFE4 8006CFE4 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5CFE8 8006CFE8 21082300 */  addu       $at, $at, $v1
    /* 5CFEC 8006CFEC 9C1D22AC */  sw         $v0, %lo(storehold + 0x14)($at)
  .L8006CFF0:
    /* 5CFF0 8006CFF0 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5CFF4 8006CFF4 00000000 */  nop
    /* 5CFF8 8006CFF8 C0180200 */  sll        $v1, $v0, 3
    /* 5CFFC 8006CFFC 23186200 */  subu       $v1, $v1, $v0
    /* 5D000 8006D000 80180300 */  sll        $v1, $v1, 2
    /* 5D004 8006D004 23186200 */  subu       $v1, $v1, $v0
    /* 5D008 8006D008 80180300 */  sll        $v1, $v1, 2
    /* 5D00C 8006D00C 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5D010 8006D010 21082300 */  addu       $at, $at, $v1
    /* 5D014 8006D014 9C1D228C */  lw         $v0, %lo(storehold + 0x14)($at)
    /* 5D018 8006D018 00000000 */  nop
    /* 5D01C 8006D01C 83100200 */  sra        $v0, $v0, 2
    /* 5D020 8006D020 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5D024 8006D024 21082300 */  addu       $at, $at, $v1
    /* 5D028 8006D028 9C1D22AC */  sw         $v0, %lo(storehold + 0x14)($at)
    /* 5D02C 8006D02C 04004014 */  bnez       $v0, .L8006D040
    /* 5D030 8006D030 01000224 */   addiu     $v0, $zero, 0x1
    /* 5D034 8006D034 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5D038 8006D038 21082300 */  addu       $at, $at, $v1
    /* 5D03C 8006D03C 9C1D22AC */  sw         $v0, %lo(storehold + 0x14)($at)
  .L8006D040:
    /* 5D040 8006D040 2821848F */  lw         $a0, %gp_rel(D_8011C8A8)($gp)
    /* 5D044 8006D044 00000000 */  nop
    /* 5D048 8006D048 C0100400 */  sll        $v0, $a0, 3
    /* 5D04C 8006D04C 23104400 */  subu       $v0, $v0, $a0
    /* 5D050 8006D050 80100200 */  sll        $v0, $v0, 2
    /* 5D054 8006D054 23104400 */  subu       $v0, $v0, $a0
    /* 5D058 8006D058 80100200 */  sll        $v0, $v0, 2
    /* 5D05C 8006D05C 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5D060 8006D060 21082200 */  addu       $at, $at, $v0
    /* 5D064 8006D064 9C1D238C */  lw         $v1, %lo(storehold + 0x14)($at)
    /* 5D068 8006D068 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 5D06C 8006D06C 21082200 */  addu       $at, $at, $v0
    /* 5D070 8006D070 A01D23AC */  sw         $v1, %lo(storehold + 0x18)($at)
    /* 5D074 8006D074 0E80013C */  lui        $at, %hi(storehidx)
    /* 5D078 8006D078 21082400 */  addu       $at, $at, $a0
    /* 5D07C 8006D07C C83132A0 */  sb         $s2, %lo(storehidx)($at)
    /* 5D080 8006D080 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5D084 8006D084 00000000 */  nop
    /* 5D088 8006D088 01004224 */  addiu      $v0, $v0, 0x1
    /* 5D08C 8006D08C 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
  .L8006D090:
    /* 5D090 8006D090 FFFF5226 */  addiu      $s2, $s2, -0x1
    /* 5D094 8006D094 01001026 */  addiu      $s0, $s0, 0x1
    /* 5D098 8006D098 0800022A */  slti       $v0, $s0, 0x8
    /* 5D09C 8006D09C 7AFF4014 */  bnez       $v0, .L8006CE88
    /* 5D0A0 8006D0A0 6C003126 */   addiu     $s1, $s1, 0x6C
    /* 5D0A4 8006D0A4 FF006232 */  andi       $v0, $s3, 0xFF
    /* 5D0A8 8006D0A8 23004014 */  bnez       $v0, .L8006D138
    /* 5D0AC 8006D0AC 00000000 */   nop
    /* 5D0B0 8006D0B0 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5D0B4 8006D0B4 4AED010C */  jal        GetStr__Fi
    /* 5D0B8 8006D0B8 EB040424 */   addiu     $a0, $zero, 0x4EB
    /* 5D0BC 8006D0BC 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5D0C0 8006D0C0 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5D0C4 8006D0C4 1280053C */  lui        $a1, %hi(myplr)
    /* 5D0C8 8006D0C8 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5D0CC 8006D0CC 21200002 */  addu       $a0, $s0, $zero
    /* 5D0D0 8006D0D0 40180500 */  sll        $v1, $a1, 1
    /* 5D0D4 8006D0D4 21186500 */  addu       $v1, $v1, $a1
    /* 5D0D8 8006D0D8 80180300 */  sll        $v1, $v1, 2
    /* 5D0DC 8006D0DC 21186500 */  addu       $v1, $v1, $a1
    /* 5D0E0 8006D0E0 00190300 */  sll        $v1, $v1, 4
    /* 5D0E4 8006D0E4 23186500 */  subu       $v1, $v1, $a1
    /* 5D0E8 8006D0E8 80180300 */  sll        $v1, $v1, 2
    /* 5D0EC 8006D0EC 21186500 */  addu       $v1, $v1, $a1
    /* 5D0F0 8006D0F0 C0180300 */  sll        $v1, $v1, 3
    /* 5D0F4 8006D0F4 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5D0F8 8006D0F8 21082300 */  addu       $at, $at, $v1
    /* 5D0FC 8006D0FC 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5D100 8006D100 9767000C */  jal        sprintf
    /* 5D104 8006D104 21284000 */   addu      $a1, $v0, $zero
    /* 5D108 8006D108 21200000 */  addu       $a0, $zero, $zero
    /* 5D10C 8006D10C 01000524 */  addiu      $a1, $zero, 0x1
    /* 5D110 8006D110 01000624 */  addiu      $a2, $zero, 0x1
    /* 5D114 8006D114 21380002 */  addu       $a3, $s0, $zero
    /* 5D118 8006D118 03000224 */  addiu      $v0, $zero, 0x3
    /* 5D11C 8006D11C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5D120 8006D120 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5D124 8006D124 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5D128 8006D128 5CA7010C */  jal        AddSLine__Fi
    /* 5D12C 8006D12C 02000424 */   addiu     $a0, $zero, 0x2
    /* 5D130 8006D130 82B40108 */  j          .L8006D208
    /* 5D134 8006D134 00000000 */   nop
  .L8006D138:
    /* 5D138 8006D138 1280033C */  lui        $v1, %hi(myplr)
    /* 5D13C 8006D13C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5D140 8006D140 142180AF */  sw         $zero, %gp_rel(D_8011C894)($gp)
    /* 5D144 8006D144 40100300 */  sll        $v0, $v1, 1
    /* 5D148 8006D148 21104300 */  addu       $v0, $v0, $v1
    /* 5D14C 8006D14C 80100200 */  sll        $v0, $v0, 2
    /* 5D150 8006D150 21104300 */  addu       $v0, $v0, $v1
    /* 5D154 8006D154 00110200 */  sll        $v0, $v0, 4
    /* 5D158 8006D158 23104300 */  subu       $v0, $v0, $v1
    /* 5D15C 8006D15C 80100200 */  sll        $v0, $v0, 2
    /* 5D160 8006D160 21104300 */  addu       $v0, $v0, $v1
    /* 5D164 8006D164 C0100200 */  sll        $v0, $v0, 3
    /* 5D168 8006D168 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5D16C 8006D16C 21082200 */  addu       $at, $at, $v0
    /* 5D170 8006D170 BCBA238C */  lw         $v1, %lo(plr + 0x1584)($at)
    /* 5D174 8006D174 01000224 */  addiu      $v0, $zero, 0x1
    /* 5D178 8006D178 621382A3 */  sb         $v0, %gp_rel(stextscrl)($gp)
    /* 5D17C 8006D17C 182183AF */  sw         $v1, %gp_rel(D_8011C898)($gp)
    /* 5D180 8006D180 4AED010C */  jal        GetStr__Fi
    /* 5D184 8006D184 CF040424 */   addiu     $a0, $zero, 0x4CF
    /* 5D188 8006D188 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5D18C 8006D18C 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5D190 8006D190 1280053C */  lui        $a1, %hi(myplr)
    /* 5D194 8006D194 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5D198 8006D198 21200002 */  addu       $a0, $s0, $zero
    /* 5D19C 8006D19C 40180500 */  sll        $v1, $a1, 1
    /* 5D1A0 8006D1A0 21186500 */  addu       $v1, $v1, $a1
    /* 5D1A4 8006D1A4 80180300 */  sll        $v1, $v1, 2
    /* 5D1A8 8006D1A8 21186500 */  addu       $v1, $v1, $a1
    /* 5D1AC 8006D1AC 00190300 */  sll        $v1, $v1, 4
    /* 5D1B0 8006D1B0 23186500 */  subu       $v1, $v1, $a1
    /* 5D1B4 8006D1B4 80180300 */  sll        $v1, $v1, 2
    /* 5D1B8 8006D1B8 21186500 */  addu       $v1, $v1, $a1
    /* 5D1BC 8006D1BC C0180300 */  sll        $v1, $v1, 3
    /* 5D1C0 8006D1C0 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5D1C4 8006D1C4 21082300 */  addu       $at, $at, $v1
    /* 5D1C8 8006D1C8 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5D1CC 8006D1CC 9767000C */  jal        sprintf
    /* 5D1D0 8006D1D0 21284000 */   addu      $a1, $v0, $zero
    /* 5D1D4 8006D1D4 21200000 */  addu       $a0, $zero, $zero
    /* 5D1D8 8006D1D8 01000524 */  addiu      $a1, $zero, 0x1
    /* 5D1DC 8006D1DC 01000624 */  addiu      $a2, $zero, 0x1
    /* 5D1E0 8006D1E0 21380002 */  addu       $a3, $s0, $zero
    /* 5D1E4 8006D1E4 03000224 */  addiu      $v0, $zero, 0x3
    /* 5D1E8 8006D1E8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5D1EC 8006D1EC 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5D1F0 8006D1F0 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5D1F4 8006D1F4 5CA7010C */  jal        AddSLine__Fi
    /* 5D1F8 8006D1F8 02000424 */   addiu     $a0, $zero, 0x2
    /* 5D1FC 8006D1FC 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5D200 8006D200 2EAD010C */  jal        S_ScrollSSell__Fi
    /* 5D204 8006D204 00000000 */   nop
  .L8006D208:
    /* 5D208 8006D208 3400BF8F */  lw         $ra, 0x34($sp)
    /* 5D20C 8006D20C 3000B48F */  lw         $s4, 0x30($sp)
    /* 5D210 8006D210 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 5D214 8006D214 2800B28F */  lw         $s2, 0x28($sp)
    /* 5D218 8006D218 2400B18F */  lw         $s1, 0x24($sp)
    /* 5D21C 8006D21C 2000B08F */  lw         $s0, 0x20($sp)
    /* 5D220 8006D220 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 5D224 8006D224 0800E003 */  jr         $ra
    /* 5D228 8006D228 00000000 */   nop
endlabel S_StartWSell__Fv
