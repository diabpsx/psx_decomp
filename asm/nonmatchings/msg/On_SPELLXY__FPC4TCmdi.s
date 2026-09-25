.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SPELLXY__FPC4TCmdi, 0xD8

glabel On_SPELLXY__FPC4TCmdi
    /* 40D0C 80050D0C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 40D10 80050D10 1400B1AF */  sw         $s1, 0x14($sp)
    /* 40D14 80050D14 21888000 */  addu       $s1, $a0, $zero
    /* 40D18 80050D18 1000B0AF */  sw         $s0, 0x10($sp)
    /* 40D1C 80050D1C 2180A000 */  addu       $s0, $a1, $zero
    /* 40D20 80050D20 1800B2AF */  sw         $s2, 0x18($sp)
    /* 40D24 80050D24 04003296 */  lhu        $s2, 0x4($s1)
    /* 40D28 80050D28 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 40D2C 80050D2C 959C010C */  jal        ClrPlrPath__Fi
    /* 40D30 80050D30 21200002 */   addu      $a0, $s0, $zero
    /* 40D34 80050D34 40101000 */  sll        $v0, $s0, 1
    /* 40D38 80050D38 21105000 */  addu       $v0, $v0, $s0
    /* 40D3C 80050D3C 80100200 */  sll        $v0, $v0, 2
    /* 40D40 80050D40 21105000 */  addu       $v0, $v0, $s0
    /* 40D44 80050D44 00110200 */  sll        $v0, $v0, 4
    /* 40D48 80050D48 23105000 */  subu       $v0, $v0, $s0
    /* 40D4C 80050D4C 80100200 */  sll        $v0, $v0, 2
    /* 40D50 80050D50 21105000 */  addu       $v0, $v0, $s0
    /* 40D54 80050D54 C0100200 */  sll        $v0, $v0, 3
    /* 40D58 80050D58 01002492 */  lbu        $a0, 0x1($s1)
    /* 40D5C 80050D5C 02002592 */  lbu        $a1, 0x2($s1)
    /* 40D60 80050D60 06002696 */  lhu        $a2, 0x6($s1)
    /* 40D64 80050D64 0E80013C */  lui        $at, %hi(plr + 0x68)
    /* 40D68 80050D68 21082200 */  addu       $at, $at, $v0
    /* 40D6C 80050D6C A0A52790 */  lbu        $a3, %lo(plr + 0x68)($at)
    /* 40D70 80050D70 0C000324 */  addiu      $v1, $zero, 0xC
    /* 40D74 80050D74 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 40D78 80050D78 21082200 */  addu       $at, $at, $v0
    /* 40D7C 80050D7C 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 40D80 80050D80 0E80013C */  lui        $at, %hi(plr + 0x5F)
    /* 40D84 80050D84 21082200 */  addu       $at, $at, $v0
    /* 40D88 80050D88 97A520A0 */  sb         $zero, %lo(plr + 0x5F)($at)
    /* 40D8C 80050D8C 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 40D90 80050D90 21082200 */  addu       $at, $at, $v0
    /* 40D94 80050D94 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 40D98 80050D98 0E80013C */  lui        $at, %hi(plr + 0x20)
    /* 40D9C 80050D9C 21082200 */  addu       $at, $at, $v0
    /* 40DA0 80050DA0 58A525A0 */  sb         $a1, %lo(plr + 0x20)($at)
    /* 40DA4 80050DA4 0E80013C */  lui        $at, %hi(plr + 0x21)
    /* 40DA8 80050DA8 21082200 */  addu       $at, $at, $v0
    /* 40DAC 80050DAC 59A526A0 */  sb         $a2, %lo(plr + 0x21)($at)
    /* 40DB0 80050DB0 0E80013C */  lui        $at, %hi(plr + 0x5D)
    /* 40DB4 80050DB4 21082200 */  addu       $at, $at, $v0
    /* 40DB8 80050DB8 95A532A0 */  sb         $s2, %lo(plr + 0x5D)($at)
    /* 40DBC 80050DBC 0E80013C */  lui        $at, %hi(plr + 0x5E)
    /* 40DC0 80050DC0 21082200 */  addu       $at, $at, $v0
    /* 40DC4 80050DC4 96A527A0 */  sb         $a3, %lo(plr + 0x5E)($at)
    /* 40DC8 80050DC8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 40DCC 80050DCC 1800B28F */  lw         $s2, 0x18($sp)
    /* 40DD0 80050DD0 1400B18F */  lw         $s1, 0x14($sp)
    /* 40DD4 80050DD4 1000B08F */  lw         $s0, 0x10($sp)
    /* 40DD8 80050DD8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 40DDC 80050DDC 0800E003 */  jr         $ra
    /* 40DE0 80050DE0 00000000 */   nop
endlabel On_SPELLXY__FPC4TCmdi
