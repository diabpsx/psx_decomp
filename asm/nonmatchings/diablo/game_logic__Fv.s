.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching game_logic__Fv, 0x1E8

glabel game_logic__Fv
    /* 29BC8 80039BC8 24108293 */  lbu        $v0, %gp_rel(PauseMode)($gp)
    /* 29BCC 80039BCC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 29BD0 80039BD0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 29BD4 80039BD4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 29BD8 80039BD8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 29BDC 80039BDC 6D004014 */  bnez       $v0, .L80039D94
    /* 29BE0 80039BE0 1000B0AF */   sw        $s0, 0x10($sp)
    /* 29BE4 80039BE4 5C10838F */  lw         $v1, %gp_rel(GameSpeed)($gp)
    /* 29BE8 80039BE8 00000000 */  nop
    /* 29BEC 80039BEC 05006010 */  beqz       $v1, .L80039C04
    /* 29BF0 80039BF0 01000224 */   addiu     $v0, $zero, 0x1
    /* 29BF4 80039BF4 0A006210 */  beq        $v1, $v0, .L80039C20
    /* 29BF8 80039BF8 02001124 */   addiu     $s1, $zero, 0x2
    /* 29BFC 80039BFC 03E70008 */  j          .L80039C0C
    /* 29C00 80039C00 21200000 */   addu      $a0, $zero, $zero
  .L80039C04:
    /* 29C04 80039C04 08E70008 */  j          .L80039C20
    /* 29C08 80039C08 03001124 */   addiu     $s1, $zero, 0x3
  .L80039C0C:
    /* 29C0C 80039C0C 1180053C */  lui        $a1, %hi(D_80111164)
    /* 29C10 80039C10 6411A524 */  addiu      $a1, $a1, %lo(D_80111164)
    /* 29C14 80039C14 A583000C */  jal        DBG_Error
    /* 29C18 80039C18 7D0C0624 */   addiu     $a2, $zero, 0xC7D
    /* 29C1C 80039C1C 01001124 */  addiu      $s1, $zero, 0x1
  .L80039C20:
    /* 29C20 80039C20 2810828F */  lw         $v0, %gp_rel(D_8011B7A8)($gp)
    /* 29C24 80039C24 00000000 */  nop
    /* 29C28 80039C28 03004014 */  bnez       $v0, .L80039C38
    /* 29C2C 80039C2C 00000000 */   nop
    /* 29C30 80039C30 60DF000C */  jal        CheckCursMove__Fv
    /* 29C34 80039C34 00000000 */   nop
  .L80039C38:
    /* 29C38 80039C38 3E10020C */  jal        VID_GetTick__Fv
    /* 29C3C 80039C3C 21802002 */   addu      $s0, $s1, $zero
    /* 29C40 80039C40 21904000 */  addu       $s2, $v0, $zero
    /* 29C44 80039C44 5810838F */  lw         $v1, %gp_rel(LastFrCount)($gp)
    /* 29C48 80039C48 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 29C4C 80039C4C 03006210 */  beq        $v1, $v0, .L80039C5C
    /* 29C50 80039C50 0600022A */   slti      $v0, $s0, 0x6
    /* 29C54 80039C54 23804302 */  subu       $s0, $s2, $v1
    /* 29C58 80039C58 0600022A */  slti       $v0, $s0, 0x6
  .L80039C5C:
    /* 29C5C 80039C5C 03004014 */  bnez       $v0, .L80039C6C
    /* 29C60 80039C60 2A101102 */   slt       $v0, $s0, $s1
    /* 29C64 80039C64 05001024 */  addiu      $s0, $zero, 0x5
    /* 29C68 80039C68 2A101102 */  slt        $v0, $s0, $s1
  .L80039C6C:
    /* 29C6C 80039C6C 49004014 */  bnez       $v0, .L80039D94
    /* 29C70 80039C70 00000000 */   nop
    /* 29C74 80039C74 1280023C */  lui        $v0, %hi(demo_pad_time)
    /* 29C78 80039C78 B4AB428C */  lw         $v0, %lo(demo_pad_time)($v0)
    /* 29C7C 80039C7C 00000000 */  nop
    /* 29C80 80039C80 03004010 */  beqz       $v0, .L80039C90
    /* 29C84 80039C84 00000000 */   nop
    /* 29C88 80039C88 7E25020C */  jal        PAD_Handler__Fv
    /* 29C8C 80039C8C 00000000 */   nop
  .L80039C90:
    /* 29C90 80039C90 80108293 */  lbu        $v0, %gp_rel(gbProcessPlayers)($gp)
    /* 29C94 80039C94 00000000 */  nop
    /* 29C98 80039C98 03004010 */  beqz       $v0, .L80039CA8
    /* 29C9C 80039C9C 00000000 */   nop
    /* 29CA0 80039CA0 5A94010C */  jal        ProcessPlayers__Fv
    /* 29CA4 80039CA4 00000000 */   nop
  .L80039CA8:
    /* 29CA8 80039CA8 1280023C */  lui        $v0, %hi(leveltype)
    /* 29CAC 80039CAC 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 29CB0 80039CB0 00000000 */  nop
    /* 29CB4 80039CB4 0F004010 */  beqz       $v0, .L80039CF4
    /* 29CB8 80039CB8 00000000 */   nop
    /* 29CBC 80039CBC 7952050C */  jal        func_801549E4
    /* 29CC0 80039CC0 00000000 */   nop
    /* 29CC4 80039CC4 3755010C */  jal        ProcessObjects__Fv
    /* 29CC8 80039CC8 00000000 */   nop
    /* 29CCC 80039CCC A529050C */  jal        func_8014A694
    /* 29CD0 80039CD0 00000000 */   nop
    /* 29CD4 80039CD4 3316010C */  jal        ProcessItems__Fv
    /* 29CD8 80039CD8 00000000 */   nop
    /* 29CDC 80039CDC 0D35010C */  jal        ProcessLightList__Fv
    /* 29CE0 80039CE0 00000000 */   nop
    /* 29CE4 80039CE4 D535010C */  jal        ProcessVisionList__Fv
    /* 29CE8 80039CE8 00000000 */   nop
    /* 29CEC 80039CEC 47E70008 */  j          .L80039D1C
    /* 29CF0 80039CF0 00000000 */   nop
  .L80039CF4:
    /* 29CF4 80039CF4 46ED000C */  jal        ProcessTowners__Fv
    /* 29CF8 80039CF8 00000000 */   nop
    /* 29CFC 80039CFC 3316010C */  jal        ProcessItems__Fv
    /* 29D00 80039D00 00000000 */   nop
    /* 29D04 80039D04 0D35010C */  jal        ProcessLightList__Fv
    /* 29D08 80039D08 00000000 */   nop
    /* 29D0C 80039D0C 0EB2020C */  jal        ProcessBird__Fv
    /* 29D10 80039D10 00000000 */   nop
    /* 29D14 80039D14 A529050C */  jal        func_8014A694
    /* 29D18 80039D18 00000000 */   nop
  .L80039D1C:
    /* 29D1C 80039D1C 32F6000C */  jal        sound_update__Fv
    /* 29D20 80039D20 00000000 */   nop
    /* 29D24 80039D24 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 29D28 80039D28 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 29D2C 80039D2C 00000000 */  nop
    /* 29D30 80039D30 05004010 */  beqz       $v0, .L80039D48
    /* 29D34 80039D34 00000000 */   nop
    /* 29D38 80039D38 1280013C */  lui        $at, %hi(myplr)
    /* 29D3C 80039D3C 08BA20AC */  sw         $zero, %lo(myplr)($at)
    /* 29D40 80039D40 B2DA010C */  jal        CheckTriggers__Fi
    /* 29D44 80039D44 21200000 */   addu      $a0, $zero, $zero
  .L80039D48:
    /* 29D48 80039D48 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 29D4C 80039D4C 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 29D50 80039D50 00000000 */  nop
    /* 29D54 80039D54 05004010 */  beqz       $v0, .L80039D6C
    /* 29D58 80039D58 01000224 */   addiu     $v0, $zero, 0x1
    /* 29D5C 80039D5C 1280013C */  lui        $at, %hi(myplr)
    /* 29D60 80039D60 08BA22AC */  sw         $v0, %lo(myplr)($at)
    /* 29D64 80039D64 B2DA010C */  jal        CheckTriggers__Fi
    /* 29D68 80039D68 01000424 */   addiu     $a0, $zero, 0x1
  .L80039D6C:
    /* 29D6C 80039D6C 1280013C */  lui        $at, %hi(myplr)
    /* 29D70 80039D70 08BA20AC */  sw         $zero, %lo(myplr)($at)
    /* 29D74 80039D74 3D9D010C */  jal        CheckQuests__Fv
    /* 29D78 80039D78 00000000 */   nop
    /* 29D7C 80039D7C 23101102 */  subu       $v0, $s0, $s1
    /* 29D80 80039D80 1010838F */  lw         $v1, %gp_rel(force_redraw)($gp)
    /* 29D84 80039D84 23104202 */  subu       $v0, $s2, $v0
    /* 29D88 80039D88 581082AF */  sw         $v0, %gp_rel(LastFrCount)($gp)
    /* 29D8C 80039D8C 01006334 */  ori        $v1, $v1, 0x1
    /* 29D90 80039D90 101083AF */  sw         $v1, %gp_rel(force_redraw)($gp)
  .L80039D94:
    /* 29D94 80039D94 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 29D98 80039D98 1800B28F */  lw         $s2, 0x18($sp)
    /* 29D9C 80039D9C 1400B18F */  lw         $s1, 0x14($sp)
    /* 29DA0 80039DA0 1000B08F */  lw         $s0, 0x10($sp)
    /* 29DA4 80039DA4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 29DA8 80039DA8 0800E003 */  jr         $ra
    /* 29DAC 80039DAC 00000000 */   nop
endlabel game_logic__Fv
