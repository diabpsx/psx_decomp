.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_HealerEnter__Fv, 0x98

glabel S_HealerEnter__Fv
    /* 6381C 8007381C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 63820 80073820 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 63824 80073824 0B000224 */  addiu      $v0, $zero, 0xB
    /* 63828 80073828 19006210 */  beq        $v1, $v0, .L80073890
    /* 6382C 8007382C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 63830 80073830 0C006228 */  slti       $v0, $v1, 0xC
    /* 63834 80073834 05004010 */  beqz       $v0, .L8007384C
    /* 63838 80073838 09000224 */   addiu     $v0, $zero, 0x9
    /* 6383C 8007383C 08006210 */  beq        $v1, $v0, .L80073860
    /* 63840 80073840 01000224 */   addiu     $v0, $zero, 0x1
    /* 63844 80073844 29CE0108 */  j          .L800738A4
    /* 63848 80073848 00000000 */   nop
  .L8007384C:
    /* 6384C 8007384C 0D000224 */  addiu      $v0, $zero, 0xD
    /* 63850 80073850 13006210 */  beq        $v1, $v0, .L800738A0
    /* 63854 80073854 00000000 */   nop
    /* 63858 80073858 29CE0108 */  j          .L800738A4
    /* 6385C 8007385C 00000000 */   nop
  .L80073860:
    /* 63860 80073860 442182AF */  sw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 63864 80073864 0E000224 */  addiu      $v0, $zero, 0xE
    /* 63868 80073868 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 6386C 8007386C AA000224 */  addiu      $v0, $zero, 0xAA
    /* 63870 80073870 2C2182AF */  sw         $v0, %gp_rel(D_8011C8AC)($gp)
    /* 63874 80073874 B2000224 */  addiu      $v0, $zero, 0xB2
    /* 63878 80073878 082183AF */  sw         $v1, %gp_rel(D_8011C888)($gp)
    /* 6387C 8007387C 302182AF */  sw         $v0, %gp_rel(D_8011C8B0)($gp)
    /* 63880 80073880 5BBE010C */  jal        StartStore__Fc
    /* 63884 80073884 13000424 */   addiu     $a0, $zero, 0x13
    /* 63888 80073888 29CE0108 */  j          .L800738A4
    /* 6388C 8007388C 00000000 */   nop
  .L80073890:
    /* 63890 80073890 5BBE010C */  jal        StartStore__Fc
    /* 63894 80073894 10000424 */   addiu     $a0, $zero, 0x10
    /* 63898 80073898 29CE0108 */  j          .L800738A4
    /* 6389C 8007389C 00000000 */   nop
  .L800738A0:
    /* 638A0 800738A0 601380A3 */  sb         $zero, %gp_rel(stextflag)($gp)
  .L800738A4:
    /* 638A4 800738A4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 638A8 800738A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 638AC 800738AC 0800E003 */  jr         $ra
    /* 638B0 800738B0 00000000 */   nop
endlabel S_HealerEnter__Fv
