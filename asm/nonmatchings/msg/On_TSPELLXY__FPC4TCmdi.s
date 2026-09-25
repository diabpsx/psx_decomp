.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_TSPELLXY__FPC4TCmdi, 0xDC

glabel On_TSPELLXY__FPC4TCmdi
    /* 40DE4 80050DE4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 40DE8 80050DE8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 40DEC 80050DEC 21888000 */  addu       $s1, $a0, $zero
    /* 40DF0 80050DF0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 40DF4 80050DF4 2180A000 */  addu       $s0, $a1, $zero
    /* 40DF8 80050DF8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 40DFC 80050DFC 04003296 */  lhu        $s2, 0x4($s1)
    /* 40E00 80050E00 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 40E04 80050E04 959C010C */  jal        ClrPlrPath__Fi
    /* 40E08 80050E08 21200002 */   addu      $a0, $s0, $zero
    /* 40E0C 80050E0C 40101000 */  sll        $v0, $s0, 1
    /* 40E10 80050E10 21105000 */  addu       $v0, $v0, $s0
    /* 40E14 80050E14 80100200 */  sll        $v0, $v0, 2
    /* 40E18 80050E18 21105000 */  addu       $v0, $v0, $s0
    /* 40E1C 80050E1C 00110200 */  sll        $v0, $v0, 4
    /* 40E20 80050E20 23105000 */  subu       $v0, $v0, $s0
    /* 40E24 80050E24 80100200 */  sll        $v0, $v0, 2
    /* 40E28 80050E28 21105000 */  addu       $v0, $v0, $s0
    /* 40E2C 80050E2C C0100200 */  sll        $v0, $v0, 3
    /* 40E30 80050E30 01002492 */  lbu        $a0, 0x1($s1)
    /* 40E34 80050E34 02002592 */  lbu        $a1, 0x2($s1)
    /* 40E38 80050E38 06002696 */  lhu        $a2, 0x6($s1)
    /* 40E3C 80050E3C 0E80013C */  lui        $at, %hi(plr + 0x61)
    /* 40E40 80050E40 21082200 */  addu       $at, $at, $v0
    /* 40E44 80050E44 99A52790 */  lbu        $a3, %lo(plr + 0x61)($at)
    /* 40E48 80050E48 0C000324 */  addiu      $v1, $zero, 0xC
    /* 40E4C 80050E4C 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 40E50 80050E50 21082200 */  addu       $at, $at, $v0
    /* 40E54 80050E54 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 40E58 80050E58 02000324 */  addiu      $v1, $zero, 0x2
    /* 40E5C 80050E5C 0E80013C */  lui        $at, %hi(plr + 0x5F)
    /* 40E60 80050E60 21082200 */  addu       $at, $at, $v0
    /* 40E64 80050E64 97A523A0 */  sb         $v1, %lo(plr + 0x5F)($at)
    /* 40E68 80050E68 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 40E6C 80050E6C 21082200 */  addu       $at, $at, $v0
    /* 40E70 80050E70 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 40E74 80050E74 0E80013C */  lui        $at, %hi(plr + 0x20)
    /* 40E78 80050E78 21082200 */  addu       $at, $at, $v0
    /* 40E7C 80050E7C 58A525A0 */  sb         $a1, %lo(plr + 0x20)($at)
    /* 40E80 80050E80 0E80013C */  lui        $at, %hi(plr + 0x21)
    /* 40E84 80050E84 21082200 */  addu       $at, $at, $v0
    /* 40E88 80050E88 59A526A0 */  sb         $a2, %lo(plr + 0x21)($at)
    /* 40E8C 80050E8C 0E80013C */  lui        $at, %hi(plr + 0x5D)
    /* 40E90 80050E90 21082200 */  addu       $at, $at, $v0
    /* 40E94 80050E94 95A532A0 */  sb         $s2, %lo(plr + 0x5D)($at)
    /* 40E98 80050E98 0E80013C */  lui        $at, %hi(plr + 0x5E)
    /* 40E9C 80050E9C 21082200 */  addu       $at, $at, $v0
    /* 40EA0 80050EA0 96A527A0 */  sb         $a3, %lo(plr + 0x5E)($at)
    /* 40EA4 80050EA4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 40EA8 80050EA8 1800B28F */  lw         $s2, 0x18($sp)
    /* 40EAC 80050EAC 1400B18F */  lw         $s1, 0x14($sp)
    /* 40EB0 80050EB0 1000B08F */  lw         $s0, 0x10($sp)
    /* 40EB4 80050EB4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 40EB8 80050EB8 0800E003 */  jr         $ra
    /* 40EBC 80050EBC 00000000 */   nop
endlabel On_TSPELLXY__FPC4TCmdi
