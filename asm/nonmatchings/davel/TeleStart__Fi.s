.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TeleStart__Fi, 0xC0

glabel TeleStart__Fi
    /* 9034C 800A034C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 90350 800A0350 40280400 */  sll        $a1, $a0, 1
    /* 90354 800A0354 2128A400 */  addu       $a1, $a1, $a0
    /* 90358 800A0358 80280500 */  sll        $a1, $a1, 2
    /* 9035C 800A035C 2128A400 */  addu       $a1, $a1, $a0
    /* 90360 800A0360 00290500 */  sll        $a1, $a1, 4
    /* 90364 800A0364 2328A400 */  subu       $a1, $a1, $a0
    /* 90368 800A0368 80280500 */  sll        $a1, $a1, 2
    /* 9036C 800A036C 2128A400 */  addu       $a1, $a1, $a0
    /* 90370 800A0370 C0280500 */  sll        $a1, $a1, 3
    /* 90374 800A0374 0E80023C */  lui        $v0, %hi(plr)
    /* 90378 800A0378 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 9037C 800A037C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 90380 800A0380 C0800400 */  sll        $s0, $a0, 3
    /* 90384 800A0384 21800402 */  addu       $s0, $s0, $a0
    /* 90388 800A0388 C0801000 */  sll        $s0, $s0, 3
    /* 9038C 800A038C 0D80043C */  lui        $a0, %hi(SpellFXDat)
    /* 90390 800A0390 DCC68424 */  addiu      $a0, $a0, %lo(SpellFXDat)
    /* 90394 800A0394 21200402 */  addu       $a0, $s0, $a0
    /* 90398 800A0398 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9039C 800A039C 2080020C */  jal        GetPlrPos__11SPELLFX_DATP12PlayerStruct
    /* 903A0 800A03A0 2128A200 */   addu      $a1, $a1, $v0
    /* 903A4 800A03A4 01000224 */  addiu      $v0, $zero, 0x1
    /* 903A8 800A03A8 0D80013C */  lui        $at, %hi(SpellFXDat + 0x8)
    /* 903AC 800A03AC 21083000 */  addu       $at, $at, $s0
    /* 903B0 800A03B0 E4C622AC */  sw         $v0, %lo(SpellFXDat + 0x8)($at)
    /* 903B4 800A03B4 0D80013C */  lui        $at, %hi(SpellFXDat + 0x28)
    /* 903B8 800A03B8 21083000 */  addu       $at, $at, $s0
    /* 903BC 800A03BC 04C7228C */  lw         $v0, %lo(SpellFXDat + 0x28)($at)
    /* 903C0 800A03C0 0D80013C */  lui        $at, %hi(SpellFXDat + 0x28)
    /* 903C4 800A03C4 21083000 */  addu       $at, $at, $s0
    /* 903C8 800A03C8 04C7238C */  lw         $v1, %lo(SpellFXDat + 0x28)($at)
    /* 903CC 800A03CC 0D80013C */  lui        $at, %hi(SpellFXDat + 0x40)
    /* 903D0 800A03D0 21083000 */  addu       $at, $at, $s0
    /* 903D4 800A03D4 1CC720AC */  sw         $zero, %lo(SpellFXDat + 0x40)($at)
    /* 903D8 800A03D8 E0FF4224 */  addiu      $v0, $v0, -0x20
    /* 903DC 800A03DC 20006324 */  addiu      $v1, $v1, 0x20
    /* 903E0 800A03E0 0D80013C */  lui        $at, %hi(SpellFXDat + 0x38)
    /* 903E4 800A03E4 21083000 */  addu       $at, $at, $s0
    /* 903E8 800A03E8 14C722AC */  sw         $v0, %lo(SpellFXDat + 0x38)($at)
    /* 903EC 800A03EC 0D80013C */  lui        $at, %hi(SpellFXDat + 0x3C)
    /* 903F0 800A03F0 21083000 */  addu       $at, $at, $s0
    /* 903F4 800A03F4 18C723AC */  sw         $v1, %lo(SpellFXDat + 0x3C)($at)
    /* 903F8 800A03F8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 903FC 800A03FC 1000B08F */  lw         $s0, 0x10($sp)
    /* 90400 800A0400 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 90404 800A0404 0800E003 */  jr         $ra
    /* 90408 800A0408 00000000 */   nop
endlabel TeleStart__Fi
