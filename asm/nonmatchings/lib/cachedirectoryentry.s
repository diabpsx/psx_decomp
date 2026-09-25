.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching cachedirectoryentry, 0xBC

glabel cachedirectoryentry
    /* 17E48 80027E48 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 17E4C 80027E4C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 17E50 80027E50 2188A000 */  addu       $s1, $a1, $zero
    /* 17E54 80027E54 2000B2AF */  sw         $s2, 0x20($sp)
    /* 17E58 80027E58 2190C000 */  addu       $s2, $a2, $zero
    /* 17E5C 80027E5C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 17E60 80027E60 4A9F000C */  jal        basefilename
    /* 17E64 80027E64 1800B0AF */   sw        $s0, 0x18($sp)
    /* 17E68 80027E68 6C1C878F */  lw         $a3, %gp_rel(cachefiles)($gp)
    /* 17E6C 80027E6C 21180000 */  addu       $v1, $zero, $zero
    /* 17E70 80027E70 1D00E018 */  blez       $a3, .L80027EE8
    /* 17E74 80027E74 21284000 */   addu      $a1, $v0, $zero
    /* 17E78 80027E78 3423848F */  lw         $a0, %gp_rel(cachefile)($gp)
    /* 17E7C 80027E7C 00000000 */  nop
    /* 17E80 80027E80 21308000 */  addu       $a2, $a0, $zero
  .L80027E84:
    /* 17E84 80027E84 0C00C28C */  lw         $v0, 0xC($a2)
    /* 17E88 80027E88 00000000 */  nop
    /* 17E8C 80027E8C 16005110 */  beq        $v0, $s1, .L80027EE8
    /* 17E90 80027E90 00000000 */   nop
    /* 17E94 80027E94 05004010 */  beqz       $v0, .L80027EAC
    /* 17E98 80027E98 00000000 */   nop
    /* 17E9C 80027E9C 01006324 */  addiu      $v1, $v1, 0x1
    /* 17EA0 80027EA0 2A106700 */  slt        $v0, $v1, $a3
    /* 17EA4 80027EA4 F7FF4014 */  bnez       $v0, .L80027E84
    /* 17EA8 80027EA8 1400C624 */   addiu     $a2, $a2, 0x14
  .L80027EAC:
    /* 17EAC 80027EAC 6C1C828F */  lw         $v0, %gp_rel(cachefiles)($gp)
    /* 17EB0 80027EB0 00000000 */  nop
    /* 17EB4 80027EB4 2A106200 */  slt        $v0, $v1, $v0
    /* 17EB8 80027EB8 0B004010 */  beqz       $v0, .L80027EE8
    /* 17EBC 80027EBC 80800300 */   sll       $s0, $v1, 2
    /* 17EC0 80027EC0 21800302 */  addu       $s0, $s0, $v1
    /* 17EC4 80027EC4 80801000 */  sll        $s0, $s0, 2
    /* 17EC8 80027EC8 21209000 */  addu       $a0, $a0, $s0
    /* 17ECC 80027ECC 8367000C */  jal        strncpy
    /* 17ED0 80027ED0 0C000624 */   addiu     $a2, $zero, 0xC
    /* 17ED4 80027ED4 3423828F */  lw         $v0, %gp_rel(cachefile)($gp)
    /* 17ED8 80027ED8 00000000 */  nop
    /* 17EDC 80027EDC 21800202 */  addu       $s0, $s0, $v0
    /* 17EE0 80027EE0 0C0011AE */  sw         $s1, 0xC($s0)
    /* 17EE4 80027EE4 100012AE */  sw         $s2, 0x10($s0)
  .L80027EE8:
    /* 17EE8 80027EE8 2400BF8F */  lw         $ra, 0x24($sp)
    /* 17EEC 80027EEC 2000B28F */  lw         $s2, 0x20($sp)
    /* 17EF0 80027EF0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 17EF4 80027EF4 1800B08F */  lw         $s0, 0x18($sp)
    /* 17EF8 80027EF8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 17EFC 80027EFC 0800E003 */  jr         $ra
    /* 17F00 80027F00 00000000 */   nop
endlabel cachedirectoryentry
