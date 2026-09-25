.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_FsetRXXa, 0xA4

glabel _spu_FsetRXXa
    /* 712C 8001712C 0B80023C */  lui        $v0, %hi(_spu_mem_mode)
    /* 7130 80017130 705A428C */  lw         $v0, %lo(_spu_mem_mode)($v0)
    /* 7134 80017134 00000000 */  nop
    /* 7138 80017138 10004010 */  beqz       $v0, .L8001717C
    /* 713C 8001713C 21308000 */   addu      $a2, $a0, $zero
    /* 7140 80017140 0B80043C */  lui        $a0, %hi(_spu_mem_mode_unit)
    /* 7144 80017144 785A848C */  lw         $a0, %lo(_spu_mem_mode_unit)($a0)
    /* 7148 80017148 00000000 */  nop
    /* 714C 8001714C 1B00A400 */  divu       $zero, $a1, $a0
    /* 7150 80017150 02008014 */  bnez       $a0, .L8001715C
    /* 7154 80017154 00000000 */   nop
    /* 7158 80017158 0D000700 */  break      7
  .L8001715C:
    /* 715C 8001715C 10100000 */  mfhi       $v0
    /* 7160 80017160 06004010 */  beqz       $v0, .L8001717C
    /* 7164 80017164 00000000 */   nop
    /* 7168 80017168 0B80023C */  lui        $v0, %hi(_spu_mem_mode_unitM)
    /* 716C 8001716C 7C5A428C */  lw         $v0, %lo(_spu_mem_mode_unitM)($v0)
    /* 7170 80017170 2128A400 */  addu       $a1, $a1, $a0
    /* 7174 80017174 27100200 */  nor        $v0, $zero, $v0
    /* 7178 80017178 2428A200 */  and        $a1, $a1, $v0
  .L8001717C:
    /* 717C 8001717C 0B80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
    /* 7180 80017180 745A428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
    /* 7184 80017184 00000000 */  nop
    /* 7188 80017188 06384500 */  srlv       $a3, $a1, $v0
    /* 718C 8001718C FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 7190 80017190 0600C210 */  beq        $a2, $v0, .L800171AC
    /* 7194 80017194 2118E000 */   addu      $v1, $a3, $zero
    /* 7198 80017198 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 719C 8001719C 0500C214 */  bne        $a2, $v0, .L800171B4
    /* 71A0 800171A0 2110A000 */   addu      $v0, $a1, $zero
    /* 71A4 800171A4 725C0008 */  j          .L800171C8
    /* 71A8 800171A8 FFFF6230 */   andi      $v0, $v1, 0xFFFF
  .L800171AC:
    /* 71AC 800171AC 725C0008 */  j          .L800171C8
    /* 71B0 800171B0 2110A000 */   addu      $v0, $a1, $zero
  .L800171B4:
    /* 71B4 800171B4 0B80043C */  lui        $a0, %hi(_spu_RXX)
    /* 71B8 800171B8 4C5A848C */  lw         $a0, %lo(_spu_RXX)($a0)
    /* 71BC 800171BC 40180600 */  sll        $v1, $a2, 1
    /* 71C0 800171C0 21186400 */  addu       $v1, $v1, $a0
    /* 71C4 800171C4 000067A4 */  sh         $a3, 0x0($v1)
  .L800171C8:
    /* 71C8 800171C8 0800E003 */  jr         $ra
    /* 71CC 800171CC 00000000 */   nop
endlabel _spu_FsetRXXa
