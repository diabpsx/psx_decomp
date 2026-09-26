.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InvMoveCursDown__Fv, 0x308

glabel InvMoveCursDown__Fv
    /* 27F58 80161B50 1280023C */  lui        $v0, %hi(myplr)
    /* 27F5C 80161B54 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 27F60 80161B58 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 27F64 80161B5C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 27F68 80161B60 1800BFAF */  sw         $ra, 0x18($sp)
    /* 27F6C 80161B64 1000B0AF */  sw         $s0, 0x10($sp)
    /* 27F70 80161B68 80100200 */  sll        $v0, $v0, 2
    /* 27F74 80161B6C 1280013C */  lui        $at, %hi(_pcurs)
    /* 27F78 80161B70 21082200 */  addu       $at, $at, $v0
    /* 27F7C 80161B74 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 27F80 80161B78 B41B908F */  lw         $s0, %gp_rel(InvCursPos)($gp)
    /* 27F84 80161B7C 0C004228 */  slti       $v0, $v0, 0xC
    /* 27F88 80161B80 4B004010 */  beqz       $v0, .L80161CB0
    /* 27F8C 80161B84 21880000 */   addu      $s1, $zero, $zero
    /* 27F90 80161B88 1400022E */  sltiu      $v0, $s0, 0x14
    /* 27F94 80161B8C 0F004010 */  beqz       $v0, .L80161BCC
    /* 27F98 80161B90 80101000 */   sll       $v0, $s0, 2
    /* 27F9C 80161B94 1280013C */  lui        $at, %hi(jtbl_8011A698)
    /* 27FA0 80161B98 21082200 */  addu       $at, $at, $v0
    /* 27FA4 80161B9C 98A6228C */  lw         $v0, %lo(jtbl_8011A698)($at)
    /* 27FA8 80161BA0 00000000 */  nop
    /* 27FAC 80161BA4 08004000 */  jr         $v0
    /* 27FB0 80161BA8 00000000 */   nop
    /* 27FB4 80161BAC 06000224 */  addiu      $v0, $zero, 0x6
    /* 27FB8 80161BB0 B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
    /* 27FBC 80161BB4 4C870508 */  j          .L80161D30
    /* 27FC0 80161BB8 00000000 */   nop
    /* 27FC4 80161BBC 13000224 */  addiu      $v0, $zero, 0x13
    /* 27FC8 80161BC0 B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
    /* 27FCC 80161BC4 4C870508 */  j          .L80161D30
    /* 27FD0 80161BC8 00000000 */   nop
  .L80161BCC:
    /* 27FD4 80161BCC B41B858F */  lw         $a1, %gp_rel(InvCursPos)($gp)
    /* 27FD8 80161BD0 00000000 */  nop
    /* 27FDC 80161BD4 E7FFA424 */  addiu      $a0, $a1, -0x19
    /* 27FE0 80161BD8 2800822C */  sltiu      $v0, $a0, 0x28
    /* 27FE4 80161BDC 8A004010 */  beqz       $v0, .L80161E08
    /* 27FE8 80161BE0 00000000 */   nop
    /* 27FEC 80161BE4 1280023C */  lui        $v0, %hi(myplr)
    /* 27FF0 80161BE8 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 27FF4 80161BEC 00000000 */  nop
    /* 27FF8 80161BF0 40180200 */  sll        $v1, $v0, 1
    /* 27FFC 80161BF4 21186200 */  addu       $v1, $v1, $v0
    /* 28000 80161BF8 80180300 */  sll        $v1, $v1, 2
    /* 28004 80161BFC 21186200 */  addu       $v1, $v1, $v0
    /* 28008 80161C00 00190300 */  sll        $v1, $v1, 4
    /* 2800C 80161C04 23186200 */  subu       $v1, $v1, $v0
    /* 28010 80161C08 80180300 */  sll        $v1, $v1, 2
    /* 28014 80161C0C 21186200 */  addu       $v1, $v1, $v0
    /* 28018 80161C10 C0180300 */  sll        $v1, $v1, 3
    /* 2801C 80161C14 21186500 */  addu       $v1, $v1, $a1
    /* 28020 80161C18 0E80013C */  lui        $at, %hi(plr + 0x156F)
    /* 28024 80161C1C 21082300 */  addu       $at, $at, $v1
    /* 28028 80161C20 A7BA2280 */  lb         $v0, %lo(plr + 0x156F)($at)
    /* 2802C 80161C24 00000000 */  nop
    /* 28030 80161C28 16004010 */  beqz       $v0, .L80161C84
    /* 28034 80161C2C 3800A228 */   slti      $v0, $a1, 0x38
    /* 28038 80161C30 2C84050C */  jal        InvGetItemWH__Fi
    /* 2803C 80161C34 00000000 */   nop
    /* 28040 80161C38 B41B848F */  lw         $a0, %gp_rel(InvCursPos)($gp)
    /* 28044 80161C3C 00000000 */  nop
    /* 28048 80161C40 39008228 */  slti       $v0, $a0, 0x39
    /* 2804C 80161C44 06004014 */  bnez       $v0, .L80161C60
    /* 28050 80161C48 00000000 */   nop
    /* 28054 80161C4C CC1B838F */  lw         $v1, %gp_rel(ItemH)($gp)
    /* 28058 80161C50 00000000 */  nop
    /* 2805C 80161C54 C0100300 */  sll        $v0, $v1, 3
    /* 28060 80161C58 1D870508 */  j          .L80161C74
    /* 28064 80161C5C 21104300 */   addu      $v0, $v0, $v1
  .L80161C60:
    /* 28068 80161C60 CC1B838F */  lw         $v1, %gp_rel(ItemH)($gp)
    /* 2806C 80161C64 00000000 */  nop
    /* 28070 80161C68 80100300 */  sll        $v0, $v1, 2
    /* 28074 80161C6C 21104300 */  addu       $v0, $v0, $v1
    /* 28078 80161C70 40100200 */  sll        $v0, $v0, 1
  .L80161C74:
    /* 2807C 80161C74 21108200 */  addu       $v0, $a0, $v0
    /* 28080 80161C78 B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
    /* 28084 80161C7C 4C870508 */  j          .L80161D30
    /* 28088 80161C80 00000000 */   nop
  .L80161C84:
    /* 2808C 80161C84 05004014 */  bnez       $v0, .L80161C9C
    /* 28090 80161C88 4100A228 */   slti      $v0, $a1, 0x41
    /* 28094 80161C8C 0900A224 */  addiu      $v0, $a1, 0x9
    /* 28098 80161C90 B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
    /* 2809C 80161C94 4C870508 */  j          .L80161D30
    /* 280A0 80161C98 00000000 */   nop
  .L80161C9C:
    /* 280A4 80161C9C 24004010 */  beqz       $v0, .L80161D30
    /* 280A8 80161CA0 0A00A224 */   addiu     $v0, $a1, 0xA
    /* 280AC 80161CA4 B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
    /* 280B0 80161CA8 4C870508 */  j          .L80161D30
    /* 280B4 80161CAC 00000000 */   nop
  .L80161CB0:
    /* 280B8 80161CB0 1400022E */  sltiu      $v0, $s0, 0x14
    /* 280BC 80161CB4 13004010 */  beqz       $v0, .L80161D04
    /* 280C0 80161CB8 80101000 */   sll       $v0, $s0, 2
    /* 280C4 80161CBC 1280013C */  lui        $at, %hi(jtbl_8011A6E8)
    /* 280C8 80161CC0 21082200 */  addu       $at, $at, $v0
    /* 280CC 80161CC4 E8A6228C */  lw         $v0, %lo(jtbl_8011A6E8)($at)
    /* 280D0 80161CC8 00000000 */  nop
    /* 280D4 80161CCC 08004000 */  jr         $v0
    /* 280D8 80161CD0 00000000 */   nop
    /* 280DC 80161CD4 19000224 */  addiu      $v0, $zero, 0x19
    /* 280E0 80161CD8 B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
    /* 280E4 80161CDC 4C870508 */  j          .L80161D30
    /* 280E8 80161CE0 00000000 */   nop
    /* 280EC 80161CE4 22000224 */  addiu      $v0, $zero, 0x22
    /* 280F0 80161CE8 B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
    /* 280F4 80161CEC 4C870508 */  j          .L80161D30
    /* 280F8 80161CF0 00000000 */   nop
    /* 280FC 80161CF4 1D000224 */  addiu      $v0, $zero, 0x1D
    /* 28100 80161CF8 B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
    /* 28104 80161CFC 4C870508 */  j          .L80161D30
    /* 28108 80161D00 00000000 */   nop
  .L80161D04:
    /* 2810C 80161D04 B41B838F */  lw         $v1, %gp_rel(InvCursPos)($gp)
    /* 28110 80161D08 00000000 */  nop
    /* 28114 80161D0C E7FF6224 */  addiu      $v0, $v1, -0x19
    /* 28118 80161D10 2800422C */  sltiu      $v0, $v0, 0x28
    /* 2811C 80161D14 03004010 */  beqz       $v0, .L80161D24
    /* 28120 80161D18 41006228 */   slti      $v0, $v1, 0x41
    /* 28124 80161D1C 4C870508 */  j          .L80161D30
    /* 28128 80161D20 01001124 */   addiu     $s1, $zero, 0x1
  .L80161D24:
    /* 2812C 80161D24 02004014 */  bnez       $v0, .L80161D30
    /* 28130 80161D28 00000000 */   nop
    /* 28134 80161D2C 21880000 */  addu       $s1, $zero, $zero
  .L80161D30:
    /* 28138 80161D30 B41B848F */  lw         $a0, %gp_rel(InvCursPos)($gp)
    /* 2813C 80161D34 00000000 */  nop
    /* 28140 80161D38 E7FF8224 */  addiu      $v0, $a0, -0x19
    /* 28144 80161D3C 2800422C */  sltiu      $v0, $v0, 0x28
    /* 28148 80161D40 31004010 */  beqz       $v0, .L80161E08
    /* 2814C 80161D44 00000000 */   nop
    /* 28150 80161D48 2F002012 */  beqz       $s1, .L80161E08
    /* 28154 80161D4C 00000000 */   nop
    /* 28158 80161D50 1280033C */  lui        $v1, %hi(myplr)
    /* 2815C 80161D54 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 28160 80161D58 00000000 */  nop
    /* 28164 80161D5C 40100300 */  sll        $v0, $v1, 1
    /* 28168 80161D60 21104300 */  addu       $v0, $v0, $v1
    /* 2816C 80161D64 80100200 */  sll        $v0, $v0, 2
    /* 28170 80161D68 21104300 */  addu       $v0, $v0, $v1
    /* 28174 80161D6C 00110200 */  sll        $v0, $v0, 4
    /* 28178 80161D70 23104300 */  subu       $v0, $v0, $v1
    /* 2817C 80161D74 80100200 */  sll        $v0, $v0, 2
    /* 28180 80161D78 21104300 */  addu       $v0, $v0, $v1
    /* 28184 80161D7C C0100200 */  sll        $v0, $v0, 3
    /* 28188 80161D80 0E80013C */  lui        $at, %hi(plr + 0x195C)
    /* 2818C 80161D84 21082200 */  addu       $at, $at, $v0
    /* 28190 80161D88 94BE2390 */  lbu        $v1, %lo(plr + 0x195C)($at)
    /* 28194 80161D8C 00000000 */  nop
    /* 28198 80161D90 D01B83AF */  sw         $v1, %gp_rel(ItemNo)($gp)
    /* 2819C 80161D94 1180013C */  lui        $at, %hi(InvItemWidth + 0xC)
    /* 281A0 80161D98 21082300 */  addu       $at, $at, $v1
    /* 281A4 80161D9C 24D52290 */  lbu        $v0, %lo(InvItemWidth + 0xC)($at)
    /* 281A8 80161DA0 00000000 */  nop
    /* 281AC 80161DA4 02110200 */  srl        $v0, $v0, 4
    /* 281B0 80161DA8 C81B82AF */  sw         $v0, %gp_rel(ItemW)($gp)
    /* 281B4 80161DAC 1180013C */  lui        $at, %hi(InvItemHeight + 0xC)
    /* 281B8 80161DB0 21082300 */  addu       $at, $at, $v1
    /* 281BC 80161DB4 D8D52290 */  lbu        $v0, %lo(InvItemHeight + 0xC)($at)
    /* 281C0 80161DB8 00000000 */  nop
    /* 281C4 80161DBC 02190200 */  srl        $v1, $v0, 4
    /* 281C8 80161DC0 38008228 */  slti       $v0, $a0, 0x38
    /* 281CC 80161DC4 CC1B83AF */  sw         $v1, %gp_rel(ItemH)($gp)
    /* 281D0 80161DC8 0A004010 */  beqz       $v0, .L80161DF4
    /* 281D4 80161DCC FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 281D8 80161DD0 80100300 */  sll        $v0, $v1, 2
    /* 281DC 80161DD4 21104300 */  addu       $v0, $v0, $v1
    /* 281E0 80161DD8 40100200 */  sll        $v0, $v0, 1
    /* 281E4 80161DDC 21108200 */  addu       $v0, $a0, $v0
    /* 281E8 80161DE0 37004228 */  slti       $v0, $v0, 0x37
    /* 281EC 80161DE4 08004010 */  beqz       $v0, .L80161E08
    /* 281F0 80161DE8 0A008224 */   addiu     $v0, $a0, 0xA
    /* 281F4 80161DEC 81870508 */  j          .L80161E04
    /* 281F8 80161DF0 00000000 */   nop
  .L80161DF4:
    /* 281FC 80161DF4 37000224 */  addiu      $v0, $zero, 0x37
    /* 28200 80161DF8 02008214 */  bne        $a0, $v0, .L80161E04
    /* 28204 80161DFC 09008224 */   addiu     $v0, $a0, 0x9
    /* 28208 80161E00 41000224 */  addiu      $v0, $zero, 0x41
  .L80161E04:
    /* 2820C 80161E04 B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
  .L80161E08:
    /* 28210 80161E08 B41B828F */  lw         $v0, %gp_rel(InvCursPos)($gp)
    /* 28214 80161E0C 00000000 */  nop
    /* 28218 80161E10 49004228 */  slti       $v0, $v0, 0x49
    /* 2821C 80161E14 02004014 */  bnez       $v0, .L80161E20
    /* 28220 80161E18 48000224 */   addiu     $v0, $zero, 0x48
    /* 28224 80161E1C B41B82AF */  sw         $v0, %gp_rel(InvCursPos)($gp)
  .L80161E20:
    /* 28228 80161E20 D784050C */  jal        InvSetItemCurs__Fv
    /* 2822C 80161E24 00000000 */   nop
    /* 28230 80161E28 B41B828F */  lw         $v0, %gp_rel(InvCursPos)($gp)
    /* 28234 80161E2C 00000000 */  nop
    /* 28238 80161E30 03000212 */  beq        $s0, $v0, .L80161E40
    /* 2823C 80161E34 00000000 */   nop
    /* 28240 80161E38 C6F5000C */  jal        PlaySFX__Fi
    /* 28244 80161E3C 32000424 */   addiu     $a0, $zero, 0x32
  .L80161E40:
    /* 28248 80161E40 1800BF8F */  lw         $ra, 0x18($sp)
    /* 2824C 80161E44 1400B18F */  lw         $s1, 0x14($sp)
    /* 28250 80161E48 1000B08F */  lw         $s0, 0x10($sp)
    /* 28254 80161E4C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28258 80161E50 0800E003 */  jr         $ra
    /* 2825C 80161E54 00000000 */   nop
endlabel InvMoveCursDown__Fv
