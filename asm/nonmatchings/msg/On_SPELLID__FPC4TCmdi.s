.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SPELLID__FPC4TCmdi, 0xC8

glabel On_SPELLID__FPC4TCmdi
    /* 41208 80051208 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4120C 8005120C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 41210 80051210 21888000 */  addu       $s1, $a0, $zero
    /* 41214 80051214 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41218 80051218 2180A000 */  addu       $s0, $a1, $zero
    /* 4121C 8005121C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 41220 80051220 04003296 */  lhu        $s2, 0x4($s1)
    /* 41224 80051224 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 41228 80051228 959C010C */  jal        ClrPlrPath__Fi
    /* 4122C 8005122C 21200002 */   addu      $a0, $s0, $zero
    /* 41230 80051230 40101000 */  sll        $v0, $s0, 1
    /* 41234 80051234 21105000 */  addu       $v0, $v0, $s0
    /* 41238 80051238 80100200 */  sll        $v0, $v0, 2
    /* 4123C 8005123C 21105000 */  addu       $v0, $v0, $s0
    /* 41240 80051240 00110200 */  sll        $v0, $v0, 4
    /* 41244 80051244 23105000 */  subu       $v0, $v0, $s0
    /* 41248 80051248 80100200 */  sll        $v0, $v0, 2
    /* 4124C 8005124C 21105000 */  addu       $v0, $v0, $s0
    /* 41250 80051250 C0100200 */  sll        $v0, $v0, 3
    /* 41254 80051254 02002496 */  lhu        $a0, 0x2($s1)
    /* 41258 80051258 06002596 */  lhu        $a1, 0x6($s1)
    /* 4125C 8005125C 0E80013C */  lui        $at, %hi(plr + 0x68)
    /* 41260 80051260 21082200 */  addu       $at, $at, $v0
    /* 41264 80051264 A0A52690 */  lbu        $a2, %lo(plr + 0x68)($at)
    /* 41268 80051268 18000324 */  addiu      $v1, $zero, 0x18
    /* 4126C 8005126C 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 41270 80051270 21082200 */  addu       $at, $at, $v0
    /* 41274 80051274 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 41278 80051278 0E80013C */  lui        $at, %hi(plr + 0x5F)
    /* 4127C 8005127C 21082200 */  addu       $at, $at, $v0
    /* 41280 80051280 97A520A0 */  sb         $zero, %lo(plr + 0x5F)($at)
    /* 41284 80051284 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 41288 80051288 21082200 */  addu       $at, $at, $v0
    /* 4128C 8005128C 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 41290 80051290 0E80013C */  lui        $at, %hi(plr + 0x20)
    /* 41294 80051294 21082200 */  addu       $at, $at, $v0
    /* 41298 80051298 58A525A0 */  sb         $a1, %lo(plr + 0x20)($at)
    /* 4129C 8005129C 0E80013C */  lui        $at, %hi(plr + 0x5D)
    /* 412A0 800512A0 21082200 */  addu       $at, $at, $v0
    /* 412A4 800512A4 95A532A0 */  sb         $s2, %lo(plr + 0x5D)($at)
    /* 412A8 800512A8 0E80013C */  lui        $at, %hi(plr + 0x5E)
    /* 412AC 800512AC 21082200 */  addu       $at, $at, $v0
    /* 412B0 800512B0 96A526A0 */  sb         $a2, %lo(plr + 0x5E)($at)
    /* 412B4 800512B4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 412B8 800512B8 1800B28F */  lw         $s2, 0x18($sp)
    /* 412BC 800512BC 1400B18F */  lw         $s1, 0x14($sp)
    /* 412C0 800512C0 1000B08F */  lw         $s0, 0x10($sp)
    /* 412C4 800512C4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 412C8 800512C8 0800E003 */  jr         $ra
    /* 412CC 800512CC 00000000 */   nop
endlabel On_SPELLID__FPC4TCmdi
