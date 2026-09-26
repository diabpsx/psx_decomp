.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching rebuild_mdec_polys, 0x1D4

glabel rebuild_mdec_polys
    /* 1D1DC 80156DD4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D1E0 80156DD8 21508000 */  addu       $t2, $a0, $zero
    /* 1D1E4 80156DDC 2158A000 */  addu       $t3, $a1, $zero
    /* 1D1E8 80156DE0 1C0D858F */  lw         $a1, %gp_rel(mbuf)($gp)
    /* 1D1EC 80156DE4 1580033C */  lui        $v1, %hi(tmdc_pol)
    /* 1D1F0 80156DE8 A44F6324 */  addiu      $v1, $v1, %lo(tmdc_pol)
    /* 1D1F4 80156DEC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1D1F8 80156DF0 40100500 */  sll        $v0, $a1, 1
    /* 1D1FC 80156DF4 21104500 */  addu       $v0, $v0, $a1
    /* 1D200 80156DF8 C0100200 */  sll        $v0, $v0, 3
    /* 1D204 80156DFC 21104500 */  addu       $v0, $v0, $a1
    /* 1D208 80156E00 00110200 */  sll        $v0, $v0, 4
    /* 1D20C 80156E04 21784300 */  addu       $t7, $v0, $v1
    /* 1D210 80156E08 80100500 */  sll        $v0, $a1, 2
    /* 1D214 80156E0C 1280013C */  lui        $at, %hi(mdec_ph)
    /* 1D218 80156E10 21082200 */  addu       $at, $at, $v0
    /* 1D21C 80156E14 9CB5228C */  lw         $v0, %lo(mdec_ph)($at)
    /* 1D220 80156E18 1280033C */  lui        $v1, %hi(mdec_ph)
    /* 1D224 80156E1C 9CB56324 */  addiu      $v1, $v1, %lo(mdec_ph)
    /* 1D228 80156E20 5D004018 */  blez       $v0, .L80156F98
    /* 1D22C 80156E24 21700000 */   addu      $t6, $zero, $zero
    /* 1D230 80156E28 1280193C */  lui        $t9, %hi(mdec_pw)
    /* 1D234 80156E2C 94B53927 */  addiu      $t9, $t9, %lo(mdec_pw)
    /* 1D238 80156E30 21806000 */  addu       $s0, $v1, $zero
    /* 1D23C 80156E34 08001824 */  addiu      $t8, $zero, 0x8
  .L80156E38:
    /* 1D240 80156E38 21380000 */  addu       $a3, $zero, $zero
    /* 1D244 80156E3C 80100500 */  sll        $v0, $a1, 2
    /* 1D248 80156E40 21105900 */  addu       $v0, $v0, $t9
    /* 1D24C 80156E44 0000428C */  lw         $v0, 0x0($v0)
    /* 1D250 80156E48 00000000 */  nop
    /* 1D254 80156E4C 49004018 */  blez       $v0, .L80156F74
    /* 1D258 80156E50 2148A000 */   addu      $t1, $a1, $zero
    /* 1D25C 80156E54 C0680E00 */  sll        $t5, $t6, 3
    /* 1D260 80156E58 21600003 */  addu       $t4, $t8, $zero
    /* 1D264 80156E5C 2200E825 */  addiu      $t0, $t7, 0x22
  .L80156E60:
    /* 1D268 80156E60 80300700 */  sll        $a2, $a3, 2
    /* 1D26C 80156E64 2130C700 */  addu       $a2, $a2, $a3
    /* 1D270 80156E68 00310600 */  sll        $a2, $a2, 4
    /* 1D274 80156E6C 2118A601 */  addu       $v1, $t5, $a2
    /* 1D278 80156E70 40280900 */  sll        $a1, $t1, 1
    /* 1D27C 80156E74 2128A900 */  addu       $a1, $a1, $t1
    /* 1D280 80156E78 C0280500 */  sll        $a1, $a1, 3
    /* 1D284 80156E7C 2128A900 */  addu       $a1, $a1, $t1
    /* 1D288 80156E80 40290500 */  sll        $a1, $a1, 5
    /* 1D28C 80156E84 21186500 */  addu       $v1, $v1, $a1
    /* 1D290 80156E88 0100E724 */  addiu      $a3, $a3, 0x1
    /* 1D294 80156E8C 80200700 */  sll        $a0, $a3, 2
    /* 1D298 80156E90 21208700 */  addu       $a0, $a0, $a3
    /* 1D29C 80156E94 1580013C */  lui        $at, %hi(tmdc_pol_offs)
    /* 1D2A0 80156E98 21082300 */  addu       $at, $at, $v1
    /* 1D2A4 80156E9C F4552294 */  lhu        $v0, %lo(tmdc_pol_offs)($at)
    /* 1D2A8 80156EA0 00210400 */  sll        $a0, $a0, 4
    /* 1D2AC 80156EA4 21104A00 */  addu       $v0, $v0, $t2
    /* 1D2B0 80156EA8 E6FF02A5 */  sh         $v0, -0x1A($t0)
    /* 1D2B4 80156EAC 1580013C */  lui        $at, %hi(tmdc_pol_offs + 0x2)
    /* 1D2B8 80156EB0 21082300 */  addu       $at, $at, $v1
    /* 1D2BC 80156EB4 F6552294 */  lhu        $v0, %lo(tmdc_pol_offs + 0x2)($at)
    /* 1D2C0 80156EB8 2118A401 */  addu       $v1, $t5, $a0
    /* 1D2C4 80156EBC 21186500 */  addu       $v1, $v1, $a1
    /* 1D2C8 80156EC0 21104B00 */  addu       $v0, $v0, $t3
    /* 1D2CC 80156EC4 E8FF02A5 */  sh         $v0, -0x18($t0)
    /* 1D2D0 80156EC8 1580013C */  lui        $at, %hi(tmdc_pol_offs)
    /* 1D2D4 80156ECC 21082300 */  addu       $at, $at, $v1
    /* 1D2D8 80156ED0 F4552294 */  lhu        $v0, %lo(tmdc_pol_offs)($at)
    /* 1D2DC 80156ED4 21308601 */  addu       $a2, $t4, $a2
    /* 1D2E0 80156ED8 21104A00 */  addu       $v0, $v0, $t2
    /* 1D2E4 80156EDC EEFF02A5 */  sh         $v0, -0x12($t0)
    /* 1D2E8 80156EE0 1580013C */  lui        $at, %hi(tmdc_pol_offs + 0x2)
    /* 1D2EC 80156EE4 21082300 */  addu       $at, $at, $v1
    /* 1D2F0 80156EE8 F6552294 */  lhu        $v0, %lo(tmdc_pol_offs + 0x2)($at)
    /* 1D2F4 80156EEC 2130C500 */  addu       $a2, $a2, $a1
    /* 1D2F8 80156EF0 21104B00 */  addu       $v0, $v0, $t3
    /* 1D2FC 80156EF4 F0FF02A5 */  sh         $v0, -0x10($t0)
    /* 1D300 80156EF8 1580013C */  lui        $at, %hi(tmdc_pol_offs)
    /* 1D304 80156EFC 21082600 */  addu       $at, $at, $a2
    /* 1D308 80156F00 F4552294 */  lhu        $v0, %lo(tmdc_pol_offs)($at)
    /* 1D30C 80156F04 21208401 */  addu       $a0, $t4, $a0
    /* 1D310 80156F08 21104A00 */  addu       $v0, $v0, $t2
    /* 1D314 80156F0C F6FF02A5 */  sh         $v0, -0xA($t0)
    /* 1D318 80156F10 1580013C */  lui        $at, %hi(tmdc_pol_offs + 0x2)
    /* 1D31C 80156F14 21082600 */  addu       $at, $at, $a2
    /* 1D320 80156F18 F6552294 */  lhu        $v0, %lo(tmdc_pol_offs + 0x2)($at)
    /* 1D324 80156F1C 21208500 */  addu       $a0, $a0, $a1
    /* 1D328 80156F20 21104B00 */  addu       $v0, $v0, $t3
    /* 1D32C 80156F24 F8FF02A5 */  sh         $v0, -0x8($t0)
    /* 1D330 80156F28 1580013C */  lui        $at, %hi(tmdc_pol_offs)
    /* 1D334 80156F2C 21082400 */  addu       $at, $at, $a0
    /* 1D338 80156F30 F4552294 */  lhu        $v0, %lo(tmdc_pol_offs)($at)
    /* 1D33C 80156F34 00000000 */  nop
    /* 1D340 80156F38 21104A00 */  addu       $v0, $v0, $t2
    /* 1D344 80156F3C FEFF02A5 */  sh         $v0, -0x2($t0)
    /* 1D348 80156F40 1580013C */  lui        $at, %hi(tmdc_pol_offs + 0x2)
    /* 1D34C 80156F44 21082400 */  addu       $at, $at, $a0
    /* 1D350 80156F48 F6552294 */  lhu        $v0, %lo(tmdc_pol_offs + 0x2)($at)
    /* 1D354 80156F4C 2800EF25 */  addiu      $t7, $t7, 0x28
    /* 1D358 80156F50 21104B00 */  addu       $v0, $v0, $t3
    /* 1D35C 80156F54 000002A5 */  sh         $v0, 0x0($t0)
    /* 1D360 80156F58 80100900 */  sll        $v0, $t1, 2
    /* 1D364 80156F5C 21105900 */  addu       $v0, $v0, $t9
    /* 1D368 80156F60 0000428C */  lw         $v0, 0x0($v0)
    /* 1D36C 80156F64 00000000 */  nop
    /* 1D370 80156F68 2A10E200 */  slt        $v0, $a3, $v0
    /* 1D374 80156F6C BCFF4014 */  bnez       $v0, .L80156E60
    /* 1D378 80156F70 28000825 */   addiu     $t0, $t0, 0x28
  .L80156F74:
    /* 1D37C 80156F74 1C0D858F */  lw         $a1, %gp_rel(mbuf)($gp)
    /* 1D380 80156F78 00000000 */  nop
    /* 1D384 80156F7C 80100500 */  sll        $v0, $a1, 2
    /* 1D388 80156F80 21105000 */  addu       $v0, $v0, $s0
    /* 1D38C 80156F84 0000428C */  lw         $v0, 0x0($v0)
    /* 1D390 80156F88 0100CE25 */  addiu      $t6, $t6, 0x1
    /* 1D394 80156F8C 2A10C201 */  slt        $v0, $t6, $v0
    /* 1D398 80156F90 A9FF4014 */  bnez       $v0, .L80156E38
    /* 1D39C 80156F94 08001827 */   addiu     $t8, $t8, 0x8
  .L80156F98:
    /* 1D3A0 80156F98 1800B08F */  lw         $s0, 0x18($sp)
    /* 1D3A4 80156F9C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D3A8 80156FA0 0800E003 */  jr         $ra
    /* 1D3AC 80156FA4 00000000 */   nop
endlabel rebuild_mdec_polys
