.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SPELLXYD__FPC4TCmdi, 0xE8

glabel On_SPELLXYD__FPC4TCmdi
    /* 40C24 80050C24 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 40C28 80050C28 1400B1AF */  sw         $s1, 0x14($sp)
    /* 40C2C 80050C2C 21888000 */  addu       $s1, $a0, $zero
    /* 40C30 80050C30 1000B0AF */  sw         $s0, 0x10($sp)
    /* 40C34 80050C34 2180A000 */  addu       $s0, $a1, $zero
    /* 40C38 80050C38 1800B2AF */  sw         $s2, 0x18($sp)
    /* 40C3C 80050C3C 04003296 */  lhu        $s2, 0x4($s1)
    /* 40C40 80050C40 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 40C44 80050C44 959C010C */  jal        ClrPlrPath__Fi
    /* 40C48 80050C48 21200002 */   addu      $a0, $s0, $zero
    /* 40C4C 80050C4C 40101000 */  sll        $v0, $s0, 1
    /* 40C50 80050C50 21105000 */  addu       $v0, $v0, $s0
    /* 40C54 80050C54 80100200 */  sll        $v0, $v0, 2
    /* 40C58 80050C58 21105000 */  addu       $v0, $v0, $s0
    /* 40C5C 80050C5C 00110200 */  sll        $v0, $v0, 4
    /* 40C60 80050C60 23105000 */  subu       $v0, $v0, $s0
    /* 40C64 80050C64 80100200 */  sll        $v0, $v0, 2
    /* 40C68 80050C68 21105000 */  addu       $v0, $v0, $s0
    /* 40C6C 80050C6C C0100200 */  sll        $v0, $v0, 3
    /* 40C70 80050C70 01002492 */  lbu        $a0, 0x1($s1)
    /* 40C74 80050C74 02002592 */  lbu        $a1, 0x2($s1)
    /* 40C78 80050C78 06002696 */  lhu        $a2, 0x6($s1)
    /* 40C7C 80050C7C 08002796 */  lhu        $a3, 0x8($s1)
    /* 40C80 80050C80 0E80013C */  lui        $at, %hi(plr + 0x68)
    /* 40C84 80050C84 21082200 */  addu       $at, $at, $v0
    /* 40C88 80050C88 A0A52890 */  lbu        $t0, %lo(plr + 0x68)($at)
    /* 40C8C 80050C8C 1A000324 */  addiu      $v1, $zero, 0x1A
    /* 40C90 80050C90 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 40C94 80050C94 21082200 */  addu       $at, $at, $v0
    /* 40C98 80050C98 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 40C9C 80050C9C 0E80013C */  lui        $at, %hi(plr + 0x5F)
    /* 40CA0 80050CA0 21082200 */  addu       $at, $at, $v0
    /* 40CA4 80050CA4 97A520A0 */  sb         $zero, %lo(plr + 0x5F)($at)
    /* 40CA8 80050CA8 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 40CAC 80050CAC 21082200 */  addu       $at, $at, $v0
    /* 40CB0 80050CB0 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 40CB4 80050CB4 0E80013C */  lui        $at, %hi(plr + 0x20)
    /* 40CB8 80050CB8 21082200 */  addu       $at, $at, $v0
    /* 40CBC 80050CBC 58A525A0 */  sb         $a1, %lo(plr + 0x20)($at)
    /* 40CC0 80050CC0 0E80013C */  lui        $at, %hi(plr + 0x21)
    /* 40CC4 80050CC4 21082200 */  addu       $at, $at, $v0
    /* 40CC8 80050CC8 59A526A0 */  sb         $a2, %lo(plr + 0x21)($at)
    /* 40CCC 80050CCC 0E80013C */  lui        $at, %hi(plr + 0x22)
    /* 40CD0 80050CD0 21082200 */  addu       $at, $at, $v0
    /* 40CD4 80050CD4 5AA527A0 */  sb         $a3, %lo(plr + 0x22)($at)
    /* 40CD8 80050CD8 0E80013C */  lui        $at, %hi(plr + 0x5D)
    /* 40CDC 80050CDC 21082200 */  addu       $at, $at, $v0
    /* 40CE0 80050CE0 95A532A0 */  sb         $s2, %lo(plr + 0x5D)($at)
    /* 40CE4 80050CE4 0E80013C */  lui        $at, %hi(plr + 0x5E)
    /* 40CE8 80050CE8 21082200 */  addu       $at, $at, $v0
    /* 40CEC 80050CEC 96A528A0 */  sb         $t0, %lo(plr + 0x5E)($at)
    /* 40CF0 80050CF0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 40CF4 80050CF4 1800B28F */  lw         $s2, 0x18($sp)
    /* 40CF8 80050CF8 1400B18F */  lw         $s1, 0x14($sp)
    /* 40CFC 80050CFC 1000B08F */  lw         $s0, 0x10($sp)
    /* 40D00 80050D00 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 40D04 80050D04 0800E003 */  jr         $ra
    /* 40D08 80050D08 00000000 */   nop
endlabel On_SPELLXYD__FPC4TCmdi
