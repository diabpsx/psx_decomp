.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_ArmorStand__Fi, 0x17C

glabel Theme_ArmorStand__Fi
    /* 24260 8015DE58 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 24264 8015DE5C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 24268 8015DE60 21A08000 */  addu       $s4, $a0, $zero
    /* 2426C 8015DE64 3400BFAF */  sw         $ra, 0x34($sp)
    /* 24270 8015DE68 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 24274 8015DE6C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 24278 8015DE70 2400B1AF */  sw         $s1, 0x24($sp)
    /* 2427C 8015DE74 2000B0AF */  sw         $s0, 0x20($sp)
    /* 24280 8015DE78 1280053C */  lui        $a1, %hi(D_8011C17C)
    /* 24284 8015DE7C 7CC1A524 */  addiu      $a1, $a1, %lo(D_8011C17C)
    /* 24288 8015DE80 0300A288 */  lwl        $v0, 0x3($a1)
    /* 2428C 8015DE84 0000A298 */  lwr        $v0, 0x0($a1)
    /* 24290 8015DE88 00000000 */  nop
    /* 24294 8015DE8C 1300A2AB */  swl        $v0, 0x13($sp)
    /* 24298 8015DE90 1000A2BB */  swr        $v0, 0x10($sp)
    /* 2429C 8015DE94 141A8293 */  lbu        $v0, %gp_rel(armorFlag)($gp)
    /* 242A0 8015DE98 1280063C */  lui        $a2, %hi(D_8011C16C)
    /* 242A4 8015DE9C 6CC1C624 */  addiu      $a2, $a2, %lo(D_8011C16C)
    /* 242A8 8015DEA0 0300C388 */  lwl        $v1, 0x3($a2)
    /* 242AC 8015DEA4 0000C398 */  lwr        $v1, 0x0($a2)
    /* 242B0 8015DEA8 00000000 */  nop
    /* 242B4 8015DEAC 1B00A3AB */  swl        $v1, 0x1B($sp)
    /* 242B8 8015DEB0 1800A3BB */  swr        $v1, 0x18($sp)
    /* 242BC 8015DEB4 08004010 */  beqz       $v0, .L8015DED8
    /* 242C0 8015DEB8 21900000 */   addu      $s2, $zero, $zero
    /* 242C4 8015DEBC D570050C */  jal        TFit_Obj3__Fi
    /* 242C8 8015DEC0 21208002 */   addu      $a0, $s4, $zero
    /* 242CC 8015DEC4 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 242D0 8015DEC8 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 242D4 8015DECC BE4E010C */  jal        AddObject__Fiii
    /* 242D8 8015DED0 4D000424 */   addiu     $a0, $zero, 0x4D
    /* 242DC 8015DED4 21900000 */  addu       $s2, $zero, $zero
  .L8015DED8:
    /* 242E0 8015DED8 21880000 */  addu       $s1, $zero, $zero
    /* 242E4 8015DEDC C0981200 */  sll        $s3, $s2, 3
  .L8015DEE0:
    /* 242E8 8015DEE0 C0101400 */  sll        $v0, $s4, 3
    /* 242EC 8015DEE4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 242F0 8015DEE8 21083300 */  addu       $at, $at, $s3
    /* 242F4 8015DEEC 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 242F8 8015DEF0 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 242FC 8015DEF4 21082200 */  addu       $at, $at, $v0
    /* 24300 8015DEF8 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 24304 8015DEFC 00000000 */  nop
    /* 24308 8015DF00 1B006214 */  bne        $v1, $v0, .L8015DF70
    /* 2430C 8015DF04 21202002 */   addu      $a0, $s1, $zero
    /* 24310 8015DF08 380B020C */  jal        GetSOLID__Fii
    /* 24314 8015DF0C 21284002 */   addu      $a1, $s2, $zero
    /* 24318 8015DF10 01004238 */  xori       $v0, $v0, 0x1
    /* 2431C 8015DF14 16004010 */  beqz       $v0, .L8015DF70
    /* 24320 8015DF18 21800000 */   addu      $s0, $zero, $zero
    /* 24324 8015DF1C 21202002 */  addu       $a0, $s1, $zero
    /* 24328 8015DF20 21284002 */  addu       $a1, $s2, $zero
    /* 2432C 8015DF24 21308002 */  addu       $a2, $s4, $zero
    /* 24330 8015DF28 8270050C */  jal        CheckThemeObj3__Fiiii
    /* 24334 8015DF2C FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 24338 8015DF30 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2433C 8015DF34 09004010 */  beqz       $v0, .L8015DF5C
    /* 24340 8015DF38 00000000 */   nop
    /* 24344 8015DF3C 1280023C */  lui        $v0, %hi(leveltype)
    /* 24348 8015DF40 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 2434C 8015DF44 00000000 */  nop
    /* 24350 8015DF48 2110A203 */  addu       $v0, $sp, $v0
    /* 24354 8015DF4C 0F004480 */  lb         $a0, 0xF($v0)
    /* 24358 8015DF50 C9F6000C */  jal        ENG_random__Fl
    /* 2435C 8015DF54 00000000 */   nop
    /* 24360 8015DF58 0100502C */  sltiu      $s0, $v0, 0x1
  .L8015DF5C:
    /* 24364 8015DF5C 04000012 */  beqz       $s0, .L8015DF70
    /* 24368 8015DF60 4E000424 */   addiu     $a0, $zero, 0x4E
    /* 2436C 8015DF64 21282002 */  addu       $a1, $s1, $zero
    /* 24370 8015DF68 BE4E010C */  jal        AddObject__Fiii
    /* 24374 8015DF6C 21304002 */   addu      $a2, $s2, $zero
  .L8015DF70:
    /* 24378 8015DF70 01003126 */  addiu      $s1, $s1, 0x1
    /* 2437C 8015DF74 6000222A */  slti       $v0, $s1, 0x60
    /* 24380 8015DF78 D9FF4014 */  bnez       $v0, .L8015DEE0
    /* 24384 8015DF7C 80037326 */   addiu     $s3, $s3, 0x380
    /* 24388 8015DF80 01005226 */  addiu      $s2, $s2, 0x1
    /* 2438C 8015DF84 6000422A */  slti       $v0, $s2, 0x60
    /* 24390 8015DF88 D3FF4014 */  bnez       $v0, .L8015DED8
    /* 24394 8015DF8C 00000000 */   nop
    /* 24398 8015DF90 1280023C */  lui        $v0, %hi(leveltype)
    /* 2439C 8015DF94 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 243A0 8015DF98 00000000 */  nop
    /* 243A4 8015DF9C 2110A203 */  addu       $v0, $sp, $v0
    /* 243A8 8015DFA0 17004580 */  lb         $a1, 0x17($v0)
    /* 243AC 8015DFA4 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 243B0 8015DFA8 21208002 */   addu      $a0, $s4, $zero
    /* 243B4 8015DFAC 141A80A3 */  sb         $zero, %gp_rel(armorFlag)($gp)
    /* 243B8 8015DFB0 3400BF8F */  lw         $ra, 0x34($sp)
    /* 243BC 8015DFB4 3000B48F */  lw         $s4, 0x30($sp)
    /* 243C0 8015DFB8 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 243C4 8015DFBC 2800B28F */  lw         $s2, 0x28($sp)
    /* 243C8 8015DFC0 2400B18F */  lw         $s1, 0x24($sp)
    /* 243CC 8015DFC4 2000B08F */  lw         $s0, 0x20($sp)
    /* 243D0 8015DFC8 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 243D4 8015DFCC 0800E003 */  jr         $ra
    /* 243D8 8015DFD0 00000000 */   nop
endlabel Theme_ArmorStand__Fi
