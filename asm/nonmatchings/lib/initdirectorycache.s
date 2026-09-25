.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initdirectorycache, 0x64

glabel initdirectorycache
    /* 17DE4 80027DE4 6C1C828F */  lw         $v0, %gp_rel(cachefiles)($gp)
    /* 17DE8 80027DE8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 17DEC 80027DEC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 17DF0 80027DF0 21808000 */  addu       $s0, $a0, $zero
    /* 17DF4 80027DF4 0A004014 */  bnez       $v0, .L80027E20
    /* 17DF8 80027DF8 1400BFAF */   sw        $ra, 0x14($sp)
    /* 17DFC 80027DFC 1180043C */  lui        $a0, %hi(D_8010F018)
    /* 17E00 80027E00 18F08424 */  addiu      $a0, $a0, %lo(D_8010F018)
    /* 17E04 80027E04 80281000 */  sll        $a1, $s0, 2
    /* 17E08 80027E08 2128B000 */  addu       $a1, $a1, $s0
    /* 17E0C 80027E0C 80280500 */  sll        $a1, $a1, 2
    /* 17E10 80027E10 6C1C90AF */  sw         $s0, %gp_rel(cachefiles)($gp)
    /* 17E14 80027E14 74A9000C */  jal        reservememadr
    /* 17E18 80027E18 20000624 */   addiu     $a2, $zero, 0x20
    /* 17E1C 80027E1C 342382AF */  sw         $v0, %gp_rel(cachefile)($gp)
  .L80027E20:
    /* 17E20 80027E20 3423848F */  lw         $a0, %gp_rel(cachefile)($gp)
    /* 17E24 80027E24 80281000 */  sll        $a1, $s0, 2
    /* 17E28 80027E28 2128B000 */  addu       $a1, $a1, $s0
    /* 17E2C 80027E2C A0B1000C */  jal        blockclear
    /* 17E30 80027E30 80280500 */   sll       $a1, $a1, 2
    /* 17E34 80027E34 1400BF8F */  lw         $ra, 0x14($sp)
    /* 17E38 80027E38 1000B08F */  lw         $s0, 0x10($sp)
    /* 17E3C 80027E3C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 17E40 80027E40 0800E003 */  jr         $ra
    /* 17E44 80027E44 00000000 */   nop
endlabel initdirectorycache
