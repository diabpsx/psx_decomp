.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Flash__Fi, 0x374

glabel MI_Flash__Fi
    /* C140 80145D38 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* C144 80145D3C 2800B2AF */  sw         $s2, 0x28($sp)
    /* C148 80145D40 21908000 */  addu       $s2, $a0, $zero
    /* C14C 80145D44 80101200 */  sll        $v0, $s2, 2
    /* C150 80145D48 21105200 */  addu       $v0, $v0, $s2
    /* C154 80145D4C 80100200 */  sll        $v0, $v0, 2
    /* C158 80145D50 23105200 */  subu       $v0, $v0, $s2
    /* C15C 80145D54 80100200 */  sll        $v0, $v0, 2
    /* C160 80145D58 1080033C */  lui        $v1, %hi(missile)
    /* C164 80145D5C 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* C168 80145D60 2400B1AF */  sw         $s1, 0x24($sp)
    /* C16C 80145D64 21884300 */  addu       $s1, $v0, $v1
    /* C170 80145D68 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* C174 80145D6C 2000B0AF */  sw         $s0, 0x20($sp)
    /* C178 80145D70 1A002296 */  lhu        $v0, 0x1A($s1)
    /* C17C 80145D74 00000000 */  nop
    /* C180 80145D78 11004014 */  bnez       $v0, .L80145DC0
    /* C184 80145D7C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* C188 80145D80 2E002386 */  lh         $v1, 0x2E($s1)
    /* C18C 80145D84 00000000 */  nop
    /* C190 80145D88 0D006210 */  beq        $v1, $v0, .L80145DC0
    /* C194 80145D8C 40100300 */   sll       $v0, $v1, 1
    /* C198 80145D90 21104300 */  addu       $v0, $v0, $v1
    /* C19C 80145D94 80100200 */  sll        $v0, $v0, 2
    /* C1A0 80145D98 21104300 */  addu       $v0, $v0, $v1
    /* C1A4 80145D9C 00110200 */  sll        $v0, $v0, 4
    /* C1A8 80145DA0 23104300 */  subu       $v0, $v0, $v1
    /* C1AC 80145DA4 80100200 */  sll        $v0, $v0, 2
    /* C1B0 80145DA8 21104300 */  addu       $v0, $v0, $v1
    /* C1B4 80145DAC C0100200 */  sll        $v0, $v0, 3
    /* C1B8 80145DB0 01000324 */  addiu      $v1, $zero, 0x1
    /* C1BC 80145DB4 0E80013C */  lui        $at, %hi(plr + 0xD3)
    /* C1C0 80145DB8 21082200 */  addu       $at, $at, $v0
    /* C1C4 80145DBC 0BA623A0 */  sb         $v1, %lo(plr + 0xD3)($at)
  .L80145DC0:
    /* C1C8 80145DC0 21204002 */  addu       $a0, $s2, $zero
    /* C1CC 80145DC4 18002296 */  lhu        $v0, 0x18($s1)
    /* C1D0 80145DC8 31002382 */  lb         $v1, 0x31($s1)
    /* C1D4 80145DCC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* C1D8 80145DD0 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* C1DC 80145DD4 180022A6 */  sh         $v0, 0x18($s1)
    /* C1E0 80145DD8 1000A3AF */  sw         $v1, 0x10($sp)
    /* C1E4 80145DDC 32002282 */  lb         $v0, 0x32($s1)
    /* C1E8 80145DE0 01001024 */  addiu      $s0, $zero, 0x1
    /* C1EC 80145DE4 1800B0AF */  sw         $s0, 0x18($sp)
    /* C1F0 80145DE8 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* C1F4 80145DEC 1400A2AF */  sw         $v0, 0x14($sp)
    /* C1F8 80145DF0 1000258E */  lw         $a1, 0x10($s1)
    /* C1FC 80145DF4 01000724 */  addiu      $a3, $zero, 0x1
    /* C200 80145DF8 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* C204 80145DFC 2130A000 */   addu      $a2, $a1, $zero
    /* C208 80145E00 31002282 */  lb         $v0, 0x31($s1)
    /* C20C 80145E04 00000000 */  nop
    /* C210 80145E08 1000A2AF */  sw         $v0, 0x10($sp)
    /* C214 80145E0C 32002282 */  lb         $v0, 0x32($s1)
    /* C218 80145E10 21204002 */  addu       $a0, $s2, $zero
    /* C21C 80145E14 1800B0AF */  sw         $s0, 0x18($sp)
    /* C220 80145E18 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* C224 80145E1C 1400A2AF */  sw         $v0, 0x14($sp)
    /* C228 80145E20 1000258E */  lw         $a1, 0x10($s1)
    /* C22C 80145E24 01000724 */  addiu      $a3, $zero, 0x1
    /* C230 80145E28 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* C234 80145E2C 2130A000 */   addu      $a2, $a1, $zero
    /* C238 80145E30 31002282 */  lb         $v0, 0x31($s1)
    /* C23C 80145E34 00000000 */  nop
    /* C240 80145E38 01004224 */  addiu      $v0, $v0, 0x1
    /* C244 80145E3C 1000A2AF */  sw         $v0, 0x10($sp)
    /* C248 80145E40 32002282 */  lb         $v0, 0x32($s1)
    /* C24C 80145E44 21204002 */  addu       $a0, $s2, $zero
    /* C250 80145E48 1800B0AF */  sw         $s0, 0x18($sp)
    /* C254 80145E4C 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* C258 80145E50 1400A2AF */  sw         $v0, 0x14($sp)
    /* C25C 80145E54 1000258E */  lw         $a1, 0x10($s1)
    /* C260 80145E58 01000724 */  addiu      $a3, $zero, 0x1
    /* C264 80145E5C 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* C268 80145E60 2130A000 */   addu      $a2, $a1, $zero
    /* C26C 80145E64 31002282 */  lb         $v0, 0x31($s1)
    /* C270 80145E68 00000000 */  nop
    /* C274 80145E6C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* C278 80145E70 1000A2AF */  sw         $v0, 0x10($sp)
    /* C27C 80145E74 32002282 */  lb         $v0, 0x32($s1)
    /* C280 80145E78 21204002 */  addu       $a0, $s2, $zero
    /* C284 80145E7C 1800B0AF */  sw         $s0, 0x18($sp)
    /* C288 80145E80 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* C28C 80145E84 01004224 */  addiu      $v0, $v0, 0x1
    /* C290 80145E88 1400A2AF */  sw         $v0, 0x14($sp)
    /* C294 80145E8C 1000258E */  lw         $a1, 0x10($s1)
    /* C298 80145E90 01000724 */  addiu      $a3, $zero, 0x1
    /* C29C 80145E94 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* C2A0 80145E98 2130A000 */   addu      $a2, $a1, $zero
    /* C2A4 80145E9C 31002282 */  lb         $v0, 0x31($s1)
    /* C2A8 80145EA0 00000000 */  nop
    /* C2AC 80145EA4 1000A2AF */  sw         $v0, 0x10($sp)
    /* C2B0 80145EA8 32002282 */  lb         $v0, 0x32($s1)
    /* C2B4 80145EAC 21204002 */  addu       $a0, $s2, $zero
    /* C2B8 80145EB0 1800B0AF */  sw         $s0, 0x18($sp)
    /* C2BC 80145EB4 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* C2C0 80145EB8 01004224 */  addiu      $v0, $v0, 0x1
    /* C2C4 80145EBC 1400A2AF */  sw         $v0, 0x14($sp)
    /* C2C8 80145EC0 1000258E */  lw         $a1, 0x10($s1)
    /* C2CC 80145EC4 01000724 */  addiu      $a3, $zero, 0x1
    /* C2D0 80145EC8 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* C2D4 80145ECC 2130A000 */   addu      $a2, $a1, $zero
    /* C2D8 80145ED0 31002282 */  lb         $v0, 0x31($s1)
    /* C2DC 80145ED4 00000000 */  nop
    /* C2E0 80145ED8 01004224 */  addiu      $v0, $v0, 0x1
    /* C2E4 80145EDC 1000A2AF */  sw         $v0, 0x10($sp)
    /* C2E8 80145EE0 32002282 */  lb         $v0, 0x32($s1)
    /* C2EC 80145EE4 21204002 */  addu       $a0, $s2, $zero
    /* C2F0 80145EE8 1800B0AF */  sw         $s0, 0x18($sp)
    /* C2F4 80145EEC 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* C2F8 80145EF0 01004224 */  addiu      $v0, $v0, 0x1
    /* C2FC 80145EF4 1400A2AF */  sw         $v0, 0x14($sp)
    /* C300 80145EF8 1000258E */  lw         $a1, 0x10($s1)
    /* C304 80145EFC 01000724 */  addiu      $a3, $zero, 0x1
    /* C308 80145F00 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* C30C 80145F04 2130A000 */   addu      $a2, $a1, $zero
    /* C310 80145F08 18002296 */  lhu        $v0, 0x18($s1)
    /* C314 80145F0C 00000000 */  nop
    /* C318 80145F10 1D004014 */  bnez       $v0, .L80145F88
    /* C31C 80145F14 01000224 */   addiu     $v0, $zero, 0x1
    /* C320 80145F18 380022A2 */  sb         $v0, 0x38($s1)
    /* C324 80145F1C D51A8293 */  lbu        $v0, %gp_rel(fadetor)($gp)
    /* C328 80145F20 D61A8393 */  lbu        $v1, %gp_rel(fadetog)($gp)
    /* C32C 80145F24 D71A8493 */  lbu        $a0, %gp_rel(fadetob)($gp)
    /* C330 80145F28 1A002596 */  lhu        $a1, 0x1A($s1)
    /* C334 80145F2C 1280013C */  lui        $at, %hi(restore_r)
    /* C338 80145F30 F8B822AC */  sw         $v0, %lo(restore_r)($at)
    /* C33C 80145F34 1280013C */  lui        $at, %hi(restore_g)
    /* C340 80145F38 FCB823AC */  sw         $v1, %lo(restore_g)($at)
    /* C344 80145F3C 1280013C */  lui        $at, %hi(restore_b)
    /* C348 80145F40 00B924AC */  sw         $a0, %lo(restore_b)($at)
    /* C34C 80145F44 1000A014 */  bnez       $a1, .L80145F88
    /* C350 80145F48 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* C354 80145F4C 2E002386 */  lh         $v1, 0x2E($s1)
    /* C358 80145F50 00000000 */  nop
    /* C35C 80145F54 0C006210 */  beq        $v1, $v0, .L80145F88
    /* C360 80145F58 40100300 */   sll       $v0, $v1, 1
    /* C364 80145F5C 21104300 */  addu       $v0, $v0, $v1
    /* C368 80145F60 80100200 */  sll        $v0, $v0, 2
    /* C36C 80145F64 21104300 */  addu       $v0, $v0, $v1
    /* C370 80145F68 00110200 */  sll        $v0, $v0, 4
    /* C374 80145F6C 23104300 */  subu       $v0, $v0, $v1
    /* C378 80145F70 80100200 */  sll        $v0, $v0, 2
    /* C37C 80145F74 21104300 */  addu       $v0, $v0, $v1
    /* C380 80145F78 C0100200 */  sll        $v0, $v0, 3
    /* C384 80145F7C 0E80013C */  lui        $at, %hi(plr + 0xD3)
    /* C388 80145F80 21082200 */  addu       $at, $at, $v0
    /* C38C 80145F84 0BA620A0 */  sb         $zero, %lo(plr + 0xD3)($at)
  .L80145F88:
    /* C390 80145F88 E338063C */  lui        $a2, (0x38E38E39 >> 16)
    /* C394 80145F8C 398EC634 */  ori        $a2, $a2, (0x38E38E39 & 0xFFFF)
    /* C398 80145F90 47002282 */  lb         $v0, 0x47($s1)
    /* C39C 80145F94 13000424 */  addiu      $a0, $zero, 0x13
    /* C3A0 80145F98 23108200 */  subu       $v0, $a0, $v0
    /* C3A4 80145F9C 18004600 */  mult       $v0, $a2
    /* C3A8 80145FA0 D51A8593 */  lbu        $a1, %gp_rel(fadetor)($gp)
    /* C3AC 80145FA4 C3170200 */  sra        $v0, $v0, 31
    /* C3B0 80145FA8 10400000 */  mfhi       $t0
    /* C3B4 80145FAC 83180800 */  sra        $v1, $t0, 2
    /* C3B8 80145FB0 23186200 */  subu       $v1, $v1, $v0
    /* C3BC 80145FB4 00110300 */  sll        $v0, $v1, 4
    /* C3C0 80145FB8 23104300 */  subu       $v0, $v0, $v1
    /* C3C4 80145FBC 00110200 */  sll        $v0, $v0, 4
    /* C3C8 80145FC0 2128A200 */  addu       $a1, $a1, $v0
    /* C3CC 80145FC4 1280013C */  lui        $at, %hi(restore_r)
    /* C3D0 80145FC8 F8B825AC */  sw         $a1, %lo(restore_r)($at)
    /* C3D4 80145FCC 47002282 */  lb         $v0, 0x47($s1)
    /* C3D8 80145FD0 00000000 */  nop
    /* C3DC 80145FD4 23108200 */  subu       $v0, $a0, $v0
    /* C3E0 80145FD8 18004600 */  mult       $v0, $a2
    /* C3E4 80145FDC C3170200 */  sra        $v0, $v0, 31
    /* C3E8 80145FE0 10400000 */  mfhi       $t0
    /* C3EC 80145FE4 83180800 */  sra        $v1, $t0, 2
    /* C3F0 80145FE8 23186200 */  subu       $v1, $v1, $v0
    /* C3F4 80145FEC 00110300 */  sll        $v0, $v1, 4
    /* C3F8 80145FF0 23104300 */  subu       $v0, $v0, $v1
    /* C3FC 80145FF4 D61A8393 */  lbu        $v1, %gp_rel(fadetog)($gp)
    /* C400 80145FF8 00110200 */  sll        $v0, $v0, 4
    /* C404 80145FFC 21386200 */  addu       $a3, $v1, $v0
    /* C408 80146000 1280013C */  lui        $at, %hi(restore_g)
    /* C40C 80146004 FCB827AC */  sw         $a3, %lo(restore_g)($at)
    /* C410 80146008 47002282 */  lb         $v0, 0x47($s1)
    /* C414 8014600C 00000000 */  nop
    /* C418 80146010 23208200 */  subu       $a0, $a0, $v0
    /* C41C 80146014 18008600 */  mult       $a0, $a2
    /* C420 80146018 0001A528 */  slti       $a1, $a1, 0x100
    /* C424 8014601C C3270400 */  sra        $a0, $a0, 31
    /* C428 80146020 10400000 */  mfhi       $t0
    /* C42C 80146024 83180800 */  sra        $v1, $t0, 2
    /* C430 80146028 23186400 */  subu       $v1, $v1, $a0
    /* C434 8014602C 00110300 */  sll        $v0, $v1, 4
    /* C438 80146030 23104300 */  subu       $v0, $v0, $v1
    /* C43C 80146034 D71A8393 */  lbu        $v1, %gp_rel(fadetob)($gp)
    /* C440 80146038 00110200 */  sll        $v0, $v0, 4
    /* C444 8014603C 21186200 */  addu       $v1, $v1, $v0
    /* C448 80146040 1280013C */  lui        $at, %hi(restore_b)
    /* C44C 80146044 00B923AC */  sw         $v1, %lo(restore_b)($at)
    /* C450 80146048 0500A014 */  bnez       $a1, .L80146060
    /* C454 8014604C 0001E228 */   slti      $v0, $a3, 0x100
    /* C458 80146050 FF000224 */  addiu      $v0, $zero, 0xFF
    /* C45C 80146054 1280013C */  lui        $at, %hi(restore_r)
    /* C460 80146058 F8B822AC */  sw         $v0, %lo(restore_r)($at)
    /* C464 8014605C 0001E228 */  slti       $v0, $a3, 0x100
  .L80146060:
    /* C468 80146060 05004014 */  bnez       $v0, .L80146078
    /* C46C 80146064 00016228 */   slti      $v0, $v1, 0x100
    /* C470 80146068 FF000224 */  addiu      $v0, $zero, 0xFF
    /* C474 8014606C 1280013C */  lui        $at, %hi(restore_g)
    /* C478 80146070 FCB822AC */  sw         $v0, %lo(restore_g)($at)
    /* C47C 80146074 00016228 */  slti       $v0, $v1, 0x100
  .L80146078:
    /* C480 80146078 03004014 */  bnez       $v0, .L80146088
    /* C484 8014607C FF000224 */   addiu     $v0, $zero, 0xFF
    /* C488 80146080 1280013C */  lui        $at, %hi(restore_b)
    /* C48C 80146084 00B922AC */  sw         $v0, %lo(restore_b)($at)
  .L80146088:
    /* C490 80146088 D1EA040C */  jal        PutMissile__Fi
    /* C494 8014608C 21204002 */   addu      $a0, $s2, $zero
    /* C498 80146090 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* C49C 80146094 2800B28F */  lw         $s2, 0x28($sp)
    /* C4A0 80146098 2400B18F */  lw         $s1, 0x24($sp)
    /* C4A4 8014609C 2000B08F */  lw         $s0, 0x20($sp)
    /* C4A8 801460A0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* C4AC 801460A4 0800E003 */  jr         $ra
    /* C4B0 801460A8 00000000 */   nop
endlabel MI_Flash__Fi
