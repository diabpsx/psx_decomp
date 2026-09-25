.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlacePlayer__FiiiUc, 0x178

glabel PlacePlayer__FiiiUc
    /* 94080 800A4080 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 94084 800A4084 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 94088 800A4088 21A88000 */  addu       $s5, $a0, $zero
    /* 9408C 800A408C 3000B6AF */  sw         $s6, 0x30($sp)
    /* 94090 800A4090 21B0A000 */  addu       $s6, $a1, $zero
    /* 94094 800A4094 3400B7AF */  sw         $s7, 0x34($sp)
    /* 94098 800A4098 40101500 */  sll        $v0, $s5, 1
    /* 9409C 800A409C 21105500 */  addu       $v0, $v0, $s5
    /* 940A0 800A40A0 80100200 */  sll        $v0, $v0, 2
    /* 940A4 800A40A4 21105500 */  addu       $v0, $v0, $s5
    /* 940A8 800A40A8 00110200 */  sll        $v0, $v0, 4
    /* 940AC 800A40AC 23105500 */  subu       $v0, $v0, $s5
    /* 940B0 800A40B0 80100200 */  sll        $v0, $v0, 2
    /* 940B4 800A40B4 21105500 */  addu       $v0, $v0, $s5
    /* 940B8 800A40B8 C0100200 */  sll        $v0, $v0, 3
    /* 940BC 800A40BC 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 940C0 800A40C0 3800BEAF */  sw         $fp, 0x38($sp)
    /* 940C4 800A40C4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 940C8 800A40C8 2400B3AF */  sw         $s3, 0x24($sp)
    /* 940CC 800A40CC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 940D0 800A40D0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 940D4 800A40D4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 940D8 800A40D8 0E80013C */  lui        $at, %hi(plr)
    /* 940DC 800A40DC 21082200 */  addu       $at, $at, $v0
    /* 940E0 800A40E0 38A5238C */  lw         $v1, %lo(plr)($at)
    /* 940E4 800A40E4 08000224 */  addiu      $v0, $zero, 0x8
    /* 940E8 800A40E8 36006210 */  beq        $v1, $v0, .L800A41C4
    /* 940EC 800A40EC 21B8C000 */   addu      $s7, $a2, $zero
    /* 940F0 800A40F0 DB9A010C */  jal        PosOkPlayer__Fiii
    /* 940F4 800A40F4 21800000 */   addu      $s0, $zero, $zero
    /* 940F8 800A40F8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 940FC 800A40FC 05004010 */  beqz       $v0, .L800A4114
    /* 94100 800A4100 2120C002 */   addu      $a0, $s6, $zero
    /* 94104 800A4104 65DA010C */  jal        IsTrigger__Fii
    /* 94108 800A4108 2128E002 */   addu      $a1, $s7, $zero
    /* 9410C 800A410C 02004010 */  beqz       $v0, .L800A4118
    /* 94110 800A4110 00000000 */   nop
  .L800A4114:
    /* 94114 800A4114 01001024 */  addiu      $s0, $zero, 0x1
  .L800A4118:
    /* 94118 800A4118 25000012 */  beqz       $s0, .L800A41B0
    /* 9411C 800A411C 2120A002 */   addu      $a0, $s5, $zero
    /* 94120 800A4120 21F00000 */  addu       $fp, $zero, $zero
    /* 94124 800A4124 1280123C */  lui        $s2, %hi(offset_y)
    /* 94128 800A4128 B0C25226 */  addiu      $s2, $s2, %lo(offset_y)
    /* 9412C 800A412C 1280143C */  lui        $s4, %hi(offset_x)
    /* 94130 800A4130 A8C29426 */  addiu      $s4, $s4, %lo(offset_x)
    /* 94134 800A4134 08004726 */  addiu      $a3, $s2, 0x8
    /* 94138 800A4138 1000A7AF */  sw         $a3, 0x10($sp)
    /* 9413C 800A413C 21980000 */  addu       $s3, $zero, $zero
  .L800A4140:
    /* 94140 800A4140 00008282 */  lb         $v0, 0x0($s4)
    /* 94144 800A4144 2120A002 */  addu       $a0, $s5, $zero
    /* 94148 800A4148 2188C202 */  addu       $s1, $s6, $v0
    /* 9414C 800A414C 00004282 */  lb         $v0, 0x0($s2)
    /* 94150 800A4150 21282002 */  addu       $a1, $s1, $zero
    /* 94154 800A4154 2180E202 */  addu       $s0, $s7, $v0
    /* 94158 800A4158 DB9A010C */  jal        PosOkPlayer__Fiii
    /* 9415C 800A415C 21300002 */   addu      $a2, $s0, $zero
    /* 94160 800A4160 FF004230 */  andi       $v0, $v0, 0xFF
    /* 94164 800A4164 04004010 */  beqz       $v0, .L800A4178
    /* 94168 800A4168 21202002 */   addu      $a0, $s1, $zero
    /* 9416C 800A416C 65DA010C */  jal        IsTrigger__Fii
    /* 94170 800A4170 21280002 */   addu      $a1, $s0, $zero
    /* 94174 800A4174 0100532C */  sltiu      $s3, $v0, 0x1
  .L800A4178:
    /* 94178 800A4178 04006012 */  beqz       $s3, .L800A418C
    /* 9417C 800A417C 00000000 */   nop
    /* 94180 800A4180 01001E24 */  addiu      $fp, $zero, 0x1
    /* 94184 800A4184 21B02002 */  addu       $s6, $s1, $zero
    /* 94188 800A4188 21B80002 */  addu       $s7, $s0, $zero
  .L800A418C:
    /* 9418C 800A418C 01005226 */  addiu      $s2, $s2, 0x1
    /* 94190 800A4190 1000A78F */  lw         $a3, 0x10($sp)
    /* 94194 800A4194 00000000 */  nop
    /* 94198 800A4198 2A104702 */  slt        $v0, $s2, $a3
    /* 9419C 800A419C 03004010 */  beqz       $v0, .L800A41AC
    /* 941A0 800A41A0 01009426 */   addiu     $s4, $s4, 0x1
    /* 941A4 800A41A4 E6FFC013 */  beqz       $fp, .L800A4140
    /* 941A8 800A41A8 21980000 */   addu      $s3, $zero, $zero
  .L800A41AC:
    /* 941AC 800A41AC 2120A002 */  addu       $a0, $s5, $zero
  .L800A41B0:
    /* 941B0 800A41B0 C0281600 */  sll        $a1, $s6, 3
    /* 941B4 800A41B4 0400A534 */  ori        $a1, $a1, 0x4
    /* 941B8 800A41B8 C0301700 */  sll        $a2, $s7, 3
    /* 941BC 800A41BC 10E1010C */  jal        WorldToOffset__Fiii
    /* 941C0 800A41C0 0400C634 */   ori       $a2, $a2, 0x4
  .L800A41C4:
    /* 941C4 800A41C4 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 941C8 800A41C8 3800BE8F */  lw         $fp, 0x38($sp)
    /* 941CC 800A41CC 3400B78F */  lw         $s7, 0x34($sp)
    /* 941D0 800A41D0 3000B68F */  lw         $s6, 0x30($sp)
    /* 941D4 800A41D4 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 941D8 800A41D8 2800B48F */  lw         $s4, 0x28($sp)
    /* 941DC 800A41DC 2400B38F */  lw         $s3, 0x24($sp)
    /* 941E0 800A41E0 2000B28F */  lw         $s2, 0x20($sp)
    /* 941E4 800A41E4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 941E8 800A41E8 1800B08F */  lw         $s0, 0x18($sp)
    /* 941EC 800A41EC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 941F0 800A41F0 0800E003 */  jr         $ra
    /* 941F4 800A41F4 00000000 */   nop
endlabel PlacePlayer__FiiiUc
