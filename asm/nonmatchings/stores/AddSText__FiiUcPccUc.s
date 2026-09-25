.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddSText__FiiUcPccUc, 0xBC

glabel AddSText__FiiUcPccUc
    /* 59E10 80069E10 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 59E14 80069E14 1800B2AF */  sw         $s2, 0x18($sp)
    /* 59E18 80069E18 3800B293 */  lbu        $s2, 0x38($sp)
    /* 59E1C 80069E1C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 59E20 80069E20 2000BFAF */  sw         $ra, 0x20($sp)
    /* 59E24 80069E24 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 59E28 80069E28 1000B0AF */  sw         $s0, 0x10($sp)
    /* 59E2C 80069E2C 0000E280 */  lb         $v0, 0x0($a3)
    /* 59E30 80069E30 3C00B393 */  lbu        $s3, 0x3C($sp)
    /* 59E34 80069E34 1D004010 */  beqz       $v0, .L80069EAC
    /* 59E38 80069E38 2188C000 */   addu      $s1, $a2, $zero
    /* 59E3C 80069E3C C0800500 */  sll        $s0, $a1, 3
    /* 59E40 80069E40 21800502 */  addu       $s0, $s0, $a1
    /* 59E44 80069E44 80801000 */  sll        $s0, $s0, 2
    /* 59E48 80069E48 23800502 */  subu       $s0, $s0, $a1
    /* 59E4C 80069E4C 80801000 */  sll        $s0, $s0, 2
    /* 59E50 80069E50 1380013C */  lui        $at, %hi(D_8012EE48)
    /* 59E54 80069E54 21083000 */  addu       $at, $at, $s0
    /* 59E58 80069E58 48EE24A0 */  sb         $a0, %lo(D_8012EE48)($at)
    /* 59E5C 80069E5C 1380043C */  lui        $a0, %hi(D_8012EE4A)
    /* 59E60 80069E60 4AEE8424 */  addiu      $a0, $a0, %lo(D_8012EE4A)
    /* 59E64 80069E64 21200402 */  addu       $a0, $s0, $a0
    /* 59E68 80069E68 1380013C */  lui        $at, %hi(D_8012EE49)
    /* 59E6C 80069E6C 21083000 */  addu       $at, $at, $s0
    /* 59E70 80069E70 49EE20A0 */  sb         $zero, %lo(D_8012EE49)($at)
    /* 59E74 80069E74 F240000C */  jal        strcpy
    /* 59E78 80069E78 2128E000 */   addu      $a1, $a3, $zero
    /* 59E7C 80069E7C 1380013C */  lui        $at, %hi(D_8012EECA)
    /* 59E80 80069E80 21083000 */  addu       $at, $at, $s0
    /* 59E84 80069E84 CAEE31A0 */  sb         $s1, %lo(D_8012EECA)($at)
    /* 59E88 80069E88 1380013C */  lui        $at, %hi(D_8012EECB)
    /* 59E8C 80069E8C 21083000 */  addu       $at, $at, $s0
    /* 59E90 80069E90 CBEE32A0 */  sb         $s2, %lo(D_8012EECB)($at)
    /* 59E94 80069E94 1380013C */  lui        $at, %hi(D_8012EECC)
    /* 59E98 80069E98 21083000 */  addu       $at, $at, $s0
    /* 59E9C 80069E9C CCEE20A0 */  sb         $zero, %lo(D_8012EECC)($at)
    /* 59EA0 80069EA0 1380013C */  lui        $at, %hi(D_8012EECD)
    /* 59EA4 80069EA4 21083000 */  addu       $at, $at, $s0
    /* 59EA8 80069EA8 CDEE33A0 */  sb         $s3, %lo(D_8012EECD)($at)
  .L80069EAC:
    /* 59EAC 80069EAC 2000BF8F */  lw         $ra, 0x20($sp)
    /* 59EB0 80069EB0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 59EB4 80069EB4 1800B28F */  lw         $s2, 0x18($sp)
    /* 59EB8 80069EB8 1400B18F */  lw         $s1, 0x14($sp)
    /* 59EBC 80069EBC 1000B08F */  lw         $s0, 0x10($sp)
    /* 59EC0 80069EC0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 59EC4 80069EC4 0800E003 */  jr         $ra
    /* 59EC8 80069EC8 00000000 */   nop
endlabel AddSText__FiiUcPccUc
