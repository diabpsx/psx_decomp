.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LittleStart__FUcUc, 0xC4

glabel LittleStart__FUcUc
    /* 28148 80038148 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2814C 8003814C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 28150 80038150 21808000 */  addu       $s0, $a0, $zero
    /* 28154 80038154 FF00A430 */  andi       $a0, $a1, 0xFF
    /* 28158 80038158 1000A527 */  addiu      $a1, $sp, 0x10
    /* 2815C 8003815C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 28160 80038160 7C4B010C */  jal        NetInit__FUcPUc
    /* 28164 80038164 1000A0A3 */   sb        $zero, 0x10($sp)
    /* 28168 80038168 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2816C 8003816C 06004014 */  bnez       $v0, .L80038188
    /* 28170 80038170 FF000232 */   andi      $v0, $s0, 0xFF
    /* 28174 80038174 1000A293 */  lbu        $v0, 0x10($sp)
    /* 28178 80038178 00000000 */  nop
    /* 2817C 8003817C 0100422C */  sltiu      $v0, $v0, 0x1
    /* 28180 80038180 831082A3 */  sb         $v0, %gp_rel(gbRunGameResult)($gp)
    /* 28184 80038184 FF000232 */  andi       $v0, $s0, 0xFF
  .L80038188:
    /* 28188 80038188 06004014 */  bnez       $v0, .L800381A4
    /* 2818C 8003818C 01000224 */   addiu     $v0, $zero, 0x1
    /* 28190 80038190 1280023C */  lui        $v0, %hi(gbValidSaveFile)
    /* 28194 80038194 F0B94290 */  lbu        $v0, %lo(gbValidSaveFile)($v0)
    /* 28198 80038198 00000000 */  nop
    /* 2819C 8003819C 13004014 */  bnez       $v0, .L800381EC
    /* 281A0 800381A0 01000224 */   addiu     $v0, $zero, 0x1
  .L800381A4:
    /* 281A4 800381A4 1280013C */  lui        $at, %hi(currlevel)
    /* 281A8 800381A8 0CC122A0 */  sb         $v0, %lo(currlevel)($at)
    /* 281AC 800381AC 1280013C */  lui        $at, %hi(leveltype)
    /* 281B0 800381B0 0DC122A0 */  sb         $v0, %lo(leveltype)($at)
    /* 281B4 800381B4 1280013C */  lui        $at, %hi(setlevel)
    /* 281B8 800381B8 0EC122A0 */  sb         $v0, %lo(setlevel)($at)
    /* 281BC 800381BC F26E050C */  jal        func_8015BBC8
    /* 281C0 800381C0 00000000 */   nop
    /* 281C4 800381C4 F779050C */  jal        func_8015E7DC
    /* 281C8 800381C8 00000000 */   nop
    /* 281CC 800381CC DF79050C */  jal        func_8015E77C
    /* 281D0 800381D0 00000000 */   nop
    /* 281D4 800381D4 1280043C */  lui        $a0, %hi(myplr)
    /* 281D8 800381D8 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 281DC 800381DC 499C010C */  jal        InitDungMsgs__Fi
    /* 281E0 800381E0 00000000 */   nop
    /* 281E4 800381E4 7CE00008 */  j          .L800381F0
    /* 281E8 800381E8 4A000424 */   addiu     $a0, $zero, 0x4A
  .L800381EC:
    /* 281EC 800381EC 4B000424 */  addiu      $a0, $zero, 0x4B
  .L800381F0:
    /* 281F0 800381F0 F9DF000C */  jal        start_game__FUi
    /* 281F4 800381F4 00000000 */   nop
    /* 281F8 800381F8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 281FC 800381FC 1800B08F */  lw         $s0, 0x18($sp)
    /* 28200 80038200 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28204 80038204 0800E003 */  jr         $ra
    /* 28208 80038208 00000000 */   nop
endlabel LittleStart__FUcUc
