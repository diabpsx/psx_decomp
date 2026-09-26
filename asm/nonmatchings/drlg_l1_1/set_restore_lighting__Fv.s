.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching set_restore_lighting__Fv, 0x90

glabel set_restore_lighting__Fv
    /* 32D4 8013CECC 21300000 */  addu       $a2, $zero, $zero
    /* 32D8 8013CED0 10800D3C */  lui        $t5, %hi(dung_map_r)
    /* 32DC 8013CED4 2802AD25 */  addiu      $t5, $t5, %lo(dung_map_r)
    /* 32E0 8013CED8 10800C3C */  lui        $t4, %hi(dung_map_g)
    /* 32E4 8013CEDC 680E8C25 */  addiu      $t4, $t4, %lo(dung_map_g)
    /* 32E8 8013CEE0 10800B3C */  lui        $t3, %hi(dung_map_b)
    /* 32EC 8013CEE4 A81A6B25 */  addiu      $t3, $t3, %lo(dung_map_b)
  .L8013CEE8:
    /* 32F0 8013CEE8 21500000 */  addu       $t2, $zero, $zero
    /* 32F4 8013CEEC 21486001 */  addu       $t1, $t3, $zero
    /* 32F8 8013CEF0 21408001 */  addu       $t0, $t4, $zero
    /* 32FC 8013CEF4 2138A001 */  addu       $a3, $t5, $zero
  .L8013CEF8:
    /* 3300 8013CEF8 21282601 */  addu       $a1, $t1, $a2
    /* 3304 8013CEFC 38002925 */  addiu      $t1, $t1, 0x38
    /* 3308 8013CF00 21200601 */  addu       $a0, $t0, $a2
    /* 330C 8013CF04 38000825 */  addiu      $t0, $t0, 0x38
    /* 3310 8013CF08 1280033C */  lui        $v1, %hi(restore_r)
    /* 3314 8013CF0C F8B8638C */  lw         $v1, %lo(restore_r)($v1)
    /* 3318 8013CF10 2110E600 */  addu       $v0, $a3, $a2
    /* 331C 8013CF14 000043A0 */  sb         $v1, 0x0($v0)
    /* 3320 8013CF18 1280023C */  lui        $v0, %hi(restore_g)
    /* 3324 8013CF1C FCB8428C */  lw         $v0, %lo(restore_g)($v0)
    /* 3328 8013CF20 00000000 */  nop
    /* 332C 8013CF24 000082A0 */  sb         $v0, 0x0($a0)
    /* 3330 8013CF28 1280023C */  lui        $v0, %hi(restore_b)
    /* 3334 8013CF2C 00B9428C */  lw         $v0, %lo(restore_b)($v0)
    /* 3338 8013CF30 01004A25 */  addiu      $t2, $t2, 0x1
    /* 333C 8013CF34 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 3340 8013CF38 30004229 */  slti       $v0, $t2, 0x30
    /* 3344 8013CF3C EEFF4014 */  bnez       $v0, .L8013CEF8
    /* 3348 8013CF40 3800E724 */   addiu     $a3, $a3, 0x38
    /* 334C 8013CF44 0100C624 */  addiu      $a2, $a2, 0x1
    /* 3350 8013CF48 3000C228 */  slti       $v0, $a2, 0x30
    /* 3354 8013CF4C E6FF4014 */  bnez       $v0, .L8013CEE8
    /* 3358 8013CF50 00000000 */   nop
    /* 335C 8013CF54 0800E003 */  jr         $ra
    /* 3360 8013CF58 00000000 */   nop
endlabel set_restore_lighting__Fv
