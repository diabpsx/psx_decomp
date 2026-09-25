.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoLighting__Fiiii, 0xCD4

glabel DoLighting__Fiiii
    /* 3BE20 8004BE20 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 3BE24 8004BE24 4000B0AF */  sw         $s0, 0x40($sp)
    /* 3BE28 8004BE28 21808000 */  addu       $s0, $a0, $zero
    /* 3BE2C 8004BE2C 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 3BE30 8004BE30 2198A000 */  addu       $s3, $a1, $zero
    /* 3BE34 8004BE34 21480000 */  addu       $t1, $zero, $zero
    /* 3BE38 8004BE38 21500000 */  addu       $t2, $zero, $zero
    /* 3BE3C 8004BE3C 03110600 */  sra        $v0, $a2, 4
    /* 3BE40 8004BE40 5800B6AF */  sw         $s6, 0x58($sp)
    /* 3BE44 8004BE44 07005630 */  andi       $s6, $v0, 0x7
    /* 3BE48 8004BE48 C3110600 */  sra        $v0, $a2, 7
    /* 3BE4C 8004BE4C 4400B1AF */  sw         $s1, 0x44($sp)
    /* 3BE50 8004BE50 3F005130 */  andi       $s1, $v0, 0x3F
    /* 3BE54 8004BE54 01000C24 */  addiu      $t4, $zero, 0x1
    /* 3BE58 8004BE58 0E80043C */  lui        $a0, %hi(plr + 0x1D)
    /* 3BE5C 8004BE5C 55A58490 */  lbu        $a0, %lo(plr + 0x1D)($a0)
    /* 3BE60 8004BE60 83130600 */  sra        $v0, $a2, 14
    /* 3BE64 8004BE64 4800B2AF */  sw         $s2, 0x48($sp)
    /* 3BE68 8004BE68 01005230 */  andi       $s2, $v0, 0x1
    /* 3BE6C 8004BE6C 6400BFAF */  sw         $ra, 0x64($sp)
    /* 3BE70 8004BE70 6000BEAF */  sw         $fp, 0x60($sp)
    /* 3BE74 8004BE74 5C00B7AF */  sw         $s7, 0x5C($sp)
    /* 3BE78 8004BE78 5400B5AF */  sw         $s5, 0x54($sp)
    /* 3BE7C 8004BE7C 05004016 */  bnez       $s2, .L8004BE94
    /* 3BE80 8004BE80 5000B4AF */   sw        $s4, 0x50($sp)
    /* 3BE84 8004BE84 6020828F */  lw         $v0, %gp_rel(D_8011C7E0)($gp)
    /* 3BE88 8004BE88 00000000 */  nop
    /* 3BE8C 8004BE8C 0C034C10 */  beq        $v0, $t4, .L8004CAC0
    /* 3BE90 8004BE90 00000000 */   nop
  .L8004BE94:
    /* 3BE94 8004BE94 02004C16 */  bne        $s2, $t4, .L8004BEA0
    /* 3BE98 8004BE98 C3130600 */   sra       $v0, $a2, 15
    /* 3BE9C 8004BE9C 602092AF */  sw         $s2, %gp_rel(D_8011C7E0)($gp)
  .L8004BEA0:
    /* 3BEA0 8004BEA0 01004B30 */  andi       $t3, $v0, 0x1
    /* 3BEA4 8004BEA4 1280033C */  lui        $v1, %hi(leveltype)
    /* 3BEA8 8004BEA8 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 3BEAC 8004BEAC 03000224 */  addiu      $v0, $zero, 0x3
    /* 3BEB0 8004BEB0 14006214 */  bne        $v1, $v0, .L8004BF04
    /* 3BEB4 8004BEB4 0F00C630 */   andi      $a2, $a2, 0xF
    /* 3BEB8 8004BEB8 07008010 */  beqz       $a0, .L8004BED8
    /* 3BEBC 8004BEBC 00000000 */   nop
    /* 3BEC0 8004BEC0 0E80023C */  lui        $v0, %hi(plr + 0x5B)
    /* 3BEC4 8004BEC4 93A54280 */  lb         $v0, %lo(plr + 0x5B)($v0)
    /* 3BEC8 8004BEC8 00000000 */  nop
    /* 3BECC 8004BECC 0200E214 */  bne        $a3, $v0, .L8004BED8
    /* 3BED0 8004BED0 00000000 */   nop
    /* 3BED4 8004BED4 0A000624 */  addiu      $a2, $zero, 0xA
  .L8004BED8:
    /* 3BED8 8004BED8 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 3BEDC 8004BEDC 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 3BEE0 8004BEE0 00000000 */  nop
    /* 3BEE4 8004BEE4 07004010 */  beqz       $v0, .L8004BF04
    /* 3BEE8 8004BEE8 00000000 */   nop
    /* 3BEEC 8004BEEC 0E80023C */  lui        $v0, %hi(plr + 0x1A43)
    /* 3BEF0 8004BEF0 7BBF4280 */  lb         $v0, %lo(plr + 0x1A43)($v0)
    /* 3BEF4 8004BEF4 00000000 */  nop
    /* 3BEF8 8004BEF8 0200E214 */  bne        $a3, $v0, .L8004BF04
    /* 3BEFC 8004BEFC 00000000 */   nop
    /* 3BF00 8004BF00 0A000624 */  addiu      $a2, $zero, 0xA
  .L8004BF04:
    /* 3BF04 8004BF04 1280023C */  lui        $v0, %hi(leveltype)
    /* 3BF08 8004BF08 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 3BF0C 8004BF0C 1280013C */  lui        $at, %hi(light_level)
    /* 3BF10 8004BF10 21082200 */  addu       $at, $at, $v0
    /* 3BF14 8004BF14 04B92280 */  lb         $v0, %lo(light_level)($at)
    /* 3BF18 8004BF18 00000000 */  nop
    /* 3BF1C 8004BF1C 2130C200 */  addu       $a2, $a2, $v0
    /* 3BF20 8004BF20 1000C228 */  slti       $v0, $a2, 0x10
    /* 3BF24 8004BF24 02004014 */  bnez       $v0, .L8004BF30
    /* 3BF28 8004BF28 00000000 */   nop
    /* 3BF2C 8004BF2C 0F000624 */  addiu      $a2, $zero, 0xF
  .L8004BF30:
    /* 3BF30 8004BF30 0D80013C */  lui        $at, %hi(D_800D62E0)
    /* 3BF34 8004BF34 21082600 */  addu       $at, $at, $a2
    /* 3BF38 8004BF38 E0622280 */  lb         $v0, %lo(D_800D62E0)($at)
    /* 3BF3C 8004BF3C 00000000 */  nop
    /* 3BF40 8004BF40 7C2082AF */  sw         $v0, %gp_rel(D_8011C7FC)($gp)
    /* 3BF44 8004BF44 0D80013C */  lui        $at, %hi(D_800D62F0)
    /* 3BF48 8004BF48 21082600 */  addu       $at, $at, $a2
    /* 3BF4C 8004BF4C F0622280 */  lb         $v0, %lo(D_800D62F0)($at)
    /* 3BF50 8004BF50 00000000 */  nop
    /* 3BF54 8004BF54 802082AF */  sw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3BF58 8004BF58 20004012 */  beqz       $s2, .L8004BFDC
    /* 3BF5C 8004BF5C 40000224 */   addiu     $v0, $zero, 0x40
    /* 3BF60 8004BF60 6420848F */  lw         $a0, %gp_rel(D_8011C7E4)($gp)
    /* 3BF64 8004BF64 6820838F */  lw         $v1, %gp_rel(D_8011C7E8)($gp)
    /* 3BF68 8004BF68 7C2082AF */  sw         $v0, %gp_rel(D_8011C7FC)($gp)
    /* 3BF6C 8004BF6C 04000224 */  addiu      $v0, $zero, 0x4
    /* 3BF70 8004BF70 802082AF */  sw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3BF74 8004BF74 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 3BF78 8004BF78 842082AF */  sw         $v0, %gp_rel(D_8011C804)($gp)
    /* 3BF7C 8004BF7C 6C20828F */  lw         $v0, %gp_rel(D_8011C7EC)($gp)
    /* 3BF80 8004BF80 7820858F */  lw         $a1, %gp_rel(D_8011C7F8)($gp)
    /* 3BF84 8004BF84 21408300 */  addu       $t0, $a0, $v1
    /* 3BF88 8004BF88 7020848F */  lw         $a0, %gp_rel(D_8011C7F0)($gp)
    /* 3BF8C 8004BF8C 7420838F */  lw         $v1, %gp_rel(D_8011C7F4)($gp)
    /* 3BF90 8004BF90 642088AF */  sw         $t0, %gp_rel(D_8011C7E4)($gp)
    /* 3BF94 8004BF94 21104400 */  addu       $v0, $v0, $a0
    /* 3BF98 8004BF98 21186500 */  addu       $v1, $v1, $a1
    /* 3BF9C 8004BF9C 6C2082AF */  sw         $v0, %gp_rel(D_8011C7EC)($gp)
    /* 3BFA0 8004BFA0 742083AF */  sw         $v1, %gp_rel(D_8011C7F4)($gp)
    /* 3BFA4 8004BFA4 0D006015 */  bnez       $t3, .L8004BFDC
    /* 3BFA8 8004BFA8 00C80234 */   ori       $v0, $zero, 0xC800
    /* 3BFAC 8004BFAC 2A104800 */  slt        $v0, $v0, $t0
    /* 3BFB0 8004BFB0 0A004010 */  beqz       $v0, .L8004BFDC
    /* 3BFB4 8004BFB4 C0100700 */   sll       $v0, $a3, 3
    /* 3BFB8 8004BFB8 01000324 */  addiu      $v1, $zero, 0x1
    /* 3BFBC 8004BFBC 602080AF */  sw         $zero, %gp_rel(D_8011C7E0)($gp)
    /* 3BFC0 8004BFC0 0D80013C */  lui        $at, %hi(LightList + 0x5)
    /* 3BFC4 8004BFC4 21082200 */  addu       $at, $at, $v0
    /* 3BFC8 8004BFC8 056323A0 */  sb         $v1, %lo(LightList + 0x5)($at)
    /* 3BFCC 8004BFCC 80000224 */  addiu      $v0, $zero, 0x80
    /* 3BFD0 8004BFD0 842082AF */  sw         $v0, %gp_rel(D_8011C804)($gp)
    /* 3BFD4 8004BFD4 B0320108 */  j          .L8004CAC0
    /* 3BFD8 8004BFD8 00000000 */   nop
  .L8004BFDC:
    /* 3BFDC 8004BFDC 0900E004 */  bltz       $a3, .L8004C004
    /* 3BFE0 8004BFE0 C0100700 */   sll       $v0, $a3, 3
    /* 3BFE4 8004BFE4 0D80013C */  lui        $at, %hi(LightList + 0x6)
    /* 3BFE8 8004BFE8 21082200 */  addu       $at, $at, $v0
    /* 3BFEC 8004BFEC 06632380 */  lb         $v1, %lo(LightList + 0x6)($at)
    /* 3BFF0 8004BFF0 0D80013C */  lui        $at, %hi(LightList + 0x7)
    /* 3BFF4 8004BFF4 21082200 */  addu       $at, $at, $v0
    /* 3BFF8 8004BFF8 07632280 */  lb         $v0, %lo(LightList + 0x7)($at)
    /* 3BFFC 8004BFFC 08006924 */  addiu      $t1, $v1, 0x8
    /* 3C000 8004C000 08004A24 */  addiu      $t2, $v0, 0x8
  .L8004C004:
    /* 3C004 8004C004 1280023C */  lui        $v0, %hi(leveltype)
    /* 3C008 8004C008 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 3C00C 8004C00C 00000000 */  nop
    /* 3C010 8004C010 10004010 */  beqz       $v0, .L8004C054
    /* 3C014 8004C014 F0FF0226 */   addiu     $v0, $s0, -0x10
    /* 3C018 8004C018 C21F0200 */  srl        $v1, $v0, 31
    /* 3C01C 8004C01C 21104300 */  addu       $v0, $v0, $v1
    /* 3C020 8004C020 43800200 */  sra        $s0, $v0, 1
    /* 3C024 8004C024 F0FF6226 */  addiu      $v0, $s3, -0x10
    /* 3C028 8004C028 C21F0200 */  srl        $v1, $v0, 31
    /* 3C02C 8004C02C 21104300 */  addu       $v0, $v0, $v1
    /* 3C030 8004C030 43980200 */  sra        $s3, $v0, 1
    /* 3C034 8004C034 00111000 */  sll        $v0, $s0, 4
    /* 3C038 8004C038 25104900 */  or         $v0, $v0, $t1
    /* 3C03C 8004C03C F8FF4224 */  addiu      $v0, $v0, -0x8
    /* 3C040 8004C040 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3C044 8004C044 00111300 */  sll        $v0, $s3, 4
    /* 3C048 8004C048 25104A00 */  or         $v0, $v0, $t2
    /* 3C04C 8004C04C 26300108 */  j          .L8004C098
    /* 3C050 8004C050 F8FF4224 */   addiu     $v0, $v0, -0x8
  .L8004C054:
    /* 3C054 8004C054 02000226 */  addiu      $v0, $s0, 0x2
    /* 3C058 8004C058 C21F0200 */  srl        $v1, $v0, 31
    /* 3C05C 8004C05C 21104300 */  addu       $v0, $v0, $v1
    /* 3C060 8004C060 43100200 */  sra        $v0, $v0, 1
    /* 3C064 8004C064 FEFF5024 */  addiu      $s0, $v0, -0x2
    /* 3C068 8004C068 02006226 */  addiu      $v0, $s3, 0x2
    /* 3C06C 8004C06C C21F0200 */  srl        $v1, $v0, 31
    /* 3C070 8004C070 21104300 */  addu       $v0, $v0, $v1
    /* 3C074 8004C074 43100200 */  sra        $v0, $v0, 1
    /* 3C078 8004C078 FEFF5324 */  addiu      $s3, $v0, -0x2
    /* 3C07C 8004C07C 00111000 */  sll        $v0, $s0, 4
    /* 3C080 8004C080 25104900 */  or         $v0, $v0, $t1
    /* 3C084 8004C084 04004224 */  addiu      $v0, $v0, 0x4
    /* 3C088 8004C088 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3C08C 8004C08C 00111300 */  sll        $v0, $s3, 4
    /* 3C090 8004C090 25104A00 */  or         $v0, $v0, $t2
    /* 3C094 8004C094 04004224 */  addiu      $v0, $v0, 0x4
  .L8004C098:
    /* 3C098 8004C098 8902C004 */  bltz       $a2, .L8004CAC0
    /* 3C09C 8004C09C 1800A2AF */   sw        $v0, 0x18($sp)
    /* 3C0A0 8004C0A0 0D008015 */  bnez       $t4, .L8004C0D8
    /* 3C0A4 8004C0A4 6666053C */   lui       $a1, (0x66666667 >> 16)
    /* 3C0A8 8004C0A8 3D83000C */  jal        GU_GetRnd
    /* 3C0AC 8004C0AC 00000000 */   nop
    /* 3C0B0 8004C0B0 1000AD8F */  lw         $t5, 0x10($sp)
    /* 3C0B4 8004C0B4 01004230 */  andi       $v0, $v0, 0x1
    /* 3C0B8 8004C0B8 2168A201 */  addu       $t5, $t5, $v0
    /* 3C0BC 8004C0BC 3D83000C */  jal        GU_GetRnd
    /* 3C0C0 8004C0C0 1000ADAF */   sw        $t5, 0x10($sp)
    /* 3C0C4 8004C0C4 1800AD8F */  lw         $t5, 0x18($sp)
    /* 3C0C8 8004C0C8 01004230 */  andi       $v0, $v0, 0x1
    /* 3C0CC 8004C0CC 2168A201 */  addu       $t5, $t5, $v0
    /* 3C0D0 8004C0D0 1800ADAF */  sw         $t5, 0x18($sp)
    /* 3C0D4 8004C0D4 6666053C */  lui        $a1, (0x66666667 >> 16)
  .L8004C0D8:
    /* 3C0D8 8004C0D8 1280033C */  lui        $v1, %hi(gr_scrxoff)
    /* 3C0DC 8004C0DC 98B0638C */  lw         $v1, %lo(gr_scrxoff)($v1)
    /* 3C0E0 8004C0E0 6766A534 */  ori        $a1, $a1, (0x66666667 & 0xFFFF)
    /* 3C0E4 8004C0E4 03140300 */  sra        $v0, $v1, 16
    /* 3C0E8 8004C0E8 18004500 */  mult       $v0, $a1
    /* 3C0EC 8004C0EC 1280043C */  lui        $a0, %hi(gr_scryoff)
    /* 3C0F0 8004C0F0 9CB0848C */  lw         $a0, %lo(gr_scryoff)($a0)
    /* 3C0F4 8004C0F4 10580000 */  mfhi       $t3
    /* 3C0F8 8004C0F8 21300002 */  addu       $a2, $s0, $zero
    /* 3C0FC 8004C0FC 03140400 */  sra        $v0, $a0, 16
    /* 3C100 8004C100 18004500 */  mult       $v0, $a1
    /* 3C104 8004C104 7C208A8F */  lw         $t2, %gp_rel(D_8011C7FC)($gp)
    /* 3C108 8004C108 C31F0300 */  sra        $v1, $v1, 31
    /* 3C10C 8004C10C C3270400 */  sra        $a0, $a0, 31
    /* 3C110 8004C110 21286002 */  addu       $a1, $s3, $zero
    /* 3C114 8004C114 03110A00 */  sra        $v0, $t2, 4
    /* 3C118 8004C118 2368C200 */  subu       $t5, $a2, $v0
    /* 3C11C 8004C11C 2348A200 */  subu       $t1, $a1, $v0
    /* 3C120 8004C120 03110B00 */  sra        $v0, $t3, 4
    /* 3C124 8004C124 23184300 */  subu       $v1, $v0, $v1
    /* 3C128 8004C128 FEFF6724 */  addiu      $a3, $v1, -0x2
    /* 3C12C 8004C12C 2000ADAF */  sw         $t5, 0x20($sp)
    /* 3C130 8004C130 10400000 */  mfhi       $t0
    /* 3C134 8004C134 03110800 */  sra        $v0, $t0, 4
    /* 3C138 8004C138 23204400 */  subu       $a0, $v0, $a0
    /* 3C13C 8004C13C 1280023C */  lui        $v0, %hi(leveltype)
    /* 3C140 8004C140 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 3C144 8004C144 00000000 */  nop
    /* 3C148 8004C148 03004014 */  bnez       $v0, .L8004C158
    /* 3C14C 8004C14C F8FF8824 */   addiu     $t0, $a0, -0x8
    /* 3C150 8004C150 FAFFC624 */  addiu      $a2, $a2, -0x6
    /* 3C154 8004C154 F8FFA524 */  addiu      $a1, $a1, -0x8
  .L8004C158:
    /* 3C158 8004C158 0800C224 */  addiu      $v0, $a2, 0x8
    /* 3C15C 8004C15C 2A10E200 */  slt        $v0, $a3, $v0
    /* 3C160 8004C160 57024010 */  beqz       $v0, .L8004CAC0
    /* 3C164 8004C164 06006224 */   addiu     $v0, $v1, 0x6
    /* 3C168 8004C168 2A10C200 */  slt        $v0, $a2, $v0
    /* 3C16C 8004C16C 54024010 */  beqz       $v0, .L8004CAC0
    /* 3C170 8004C170 0800A224 */   addiu     $v0, $a1, 0x8
    /* 3C174 8004C174 2A100201 */  slt        $v0, $t0, $v0
    /* 3C178 8004C178 51024010 */  beqz       $v0, .L8004CAC0
    /* 3C17C 8004C17C 2A10A400 */   slt       $v0, $a1, $a0
    /* 3C180 8004C180 4F024010 */  beqz       $v0, .L8004CAC0
    /* 3C184 8004C184 30000B24 */   addiu     $t3, $zero, 0x30
    /* 3C188 8004C188 0C002005 */  bltz       $t1, .L8004C1BC
    /* 3C18C 8004C18C C3A80A00 */   sra       $s5, $t2, 3
    /* 3C190 8004C190 21103501 */  addu       $v0, $t1, $s5
    /* 3C194 8004C194 2A106201 */  slt        $v0, $t3, $v0
    /* 3C198 8004C198 08004014 */  bnez       $v0, .L8004C1BC
    /* 3C19C 8004C19C 00000000 */   nop
    /* 3C1A0 8004C1A0 2000AD8F */  lw         $t5, 0x20($sp)
    /* 3C1A4 8004C1A4 00000000 */  nop
    /* 3C1A8 8004C1A8 0400A005 */  bltz       $t5, .L8004C1BC
    /* 3C1AC 8004C1AC 2110B501 */   addu      $v0, $t5, $s5
    /* 3C1B0 8004C1B0 2A106201 */  slt        $v0, $t3, $v0
    /* 3C1B4 8004C1B4 2D014010 */  beqz       $v0, .L8004C66C
    /* 3C1B8 8004C1B8 00000000 */   nop
  .L8004C1BC:
    /* 3C1BC 8004C1BC 95002016 */  bnez       $s1, .L8004C414
    /* 3C1C0 8004C1C0 00000000 */   nop
    /* 3C1C4 8004C1C4 3E02A006 */  bltz       $s5, .L8004CAC0
    /* 3C1C8 8004C1C8 21882001 */   addu      $s1, $t1, $zero
  .L8004C1CC:
    /* 3C1CC 8004C1CC 8A002006 */  bltz       $s1, .L8004C3F8
    /* 3C1D0 8004C1D0 3000222A */   slti      $v0, $s1, 0x30
    /* 3C1D4 8004C1D4 88004010 */  beqz       $v0, .L8004C3F8
    /* 3C1D8 8004C1D8 00000000 */   nop
    /* 3C1DC 8004C1DC 8600A006 */  bltz       $s5, .L8004C3F8
    /* 3C1E0 8004C1E0 21A00000 */   addu      $s4, $zero, $zero
    /* 3C1E4 8004C1E4 00111100 */  sll        $v0, $s1, 4
    /* 3C1E8 8004C1E8 1800AD8F */  lw         $t5, 0x18($sp)
    /* 3C1EC 8004C1EC 2000B08F */  lw         $s0, 0x20($sp)
    /* 3C1F0 8004C1F0 23B8A201 */  subu       $s7, $t5, $v0
  .L8004C1F4:
    /* 3C1F4 8004C1F4 00211000 */  sll        $a0, $s0, 4
    /* 3C1F8 8004C1F8 1000AD8F */  lw         $t5, 0x10($sp)
    /* 3C1FC 8004C1FC 2128E002 */  addu       $a1, $s7, $zero
    /* 3C200 8004C200 3400A9AF */  sw         $t1, 0x34($sp)
    /* 3C204 8004C204 3C00ABAF */  sw         $t3, 0x3C($sp)
    /* 3C208 8004C208 1A2F010C */  jal        veclen2__Fii
    /* 3C20C 8004C20C 2320A401 */   subu      $a0, $t5, $a0
    /* 3C210 8004C210 7C20838F */  lw         $v1, %gp_rel(D_8011C7FC)($gp)
    /* 3C214 8004C214 3400A98F */  lw         $t1, 0x34($sp)
    /* 3C218 8004C218 3C00AB8F */  lw         $t3, 0x3C($sp)
    /* 3C21C 8004C21C 23386200 */  subu       $a3, $v1, $v0
    /* 3C220 8004C220 0200E104 */  bgez       $a3, .L8004C22C
    /* 3C224 8004C224 00000000 */   nop
    /* 3C228 8004C228 21380000 */  addu       $a3, $zero, $zero
  .L8004C22C:
    /* 3C22C 8004C22C 6E000006 */  bltz       $s0, .L8004C3E8
    /* 3C230 8004C230 2A100B02 */   slt       $v0, $s0, $t3
    /* 3C234 8004C234 6C004010 */  beqz       $v0, .L8004C3E8
    /* 3C238 8004C238 0100C232 */   andi      $v0, $s6, 0x1
    /* 3C23C 8004C23C 22004010 */  beqz       $v0, .L8004C2C8
    /* 3C240 8004C240 00000000 */   nop
    /* 3C244 8004C244 0C004012 */  beqz       $s2, .L8004C278
    /* 3C248 8004C248 00000000 */   nop
    /* 3C24C 8004C24C 6420828F */  lw         $v0, %gp_rel(D_8011C7E4)($gp)
    /* 3C250 8004C250 5C20838F */  lw         $v1, %gp_rel(D_8011C7DC)($gp)
    /* 3C254 8004C254 03120200 */  sra        $v0, $v0, 8
    /* 3C258 8004C258 2110E200 */  addu       $v0, $a3, $v0
    /* 3C25C 8004C25C 24104300 */  and        $v0, $v0, $v1
    /* 3C260 8004C260 1380013C */  lui        $at, %hi(D_8012ED58)
    /* 3C264 8004C264 21082200 */  addu       $at, $at, $v0
    /* 3C268 8004C268 58ED2390 */  lbu        $v1, %lo(D_8012ED58)($at)
    /* 3C26C 8004C26C 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C270 8004C270 A1300108 */  j          .L8004C284
    /* 3C274 8004C274 18006200 */   mult      $v1, $v0
  .L8004C278:
    /* 3C278 8004C278 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C27C 8004C27C 00000000 */  nop
    /* 3C280 8004C280 1800E200 */  mult       $a3, $v0
  .L8004C284:
    /* 3C284 8004C284 12280000 */  mflo       $a1
    /* 3C288 8004C288 1080033C */  lui        $v1, %hi(dung_map_r)
    /* 3C28C 8004C28C 28026324 */  addiu      $v1, $v1, %lo(dung_map_r)
    /* 3C290 8004C290 C0101000 */  sll        $v0, $s0, 3
    /* 3C294 8004C294 23105000 */  subu       $v0, $v0, $s0
    /* 3C298 8004C298 C0100200 */  sll        $v0, $v0, 3
    /* 3C29C 8004C29C 21104300 */  addu       $v0, $v0, $v1
    /* 3C2A0 8004C2A0 21305100 */  addu       $a2, $v0, $s1
    /* 3C2A4 8004C2A4 FF00A330 */  andi       $v1, $a1, 0xFF
    /* 3C2A8 8004C2A8 0000C290 */  lbu        $v0, 0x0($a2)
    /* 3C2AC 8004C2AC 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C2B0 8004C2B0 21184300 */  addu       $v1, $v0, $v1
    /* 3C2B4 8004C2B4 2A108300 */  slt        $v0, $a0, $v1
    /* 3C2B8 8004C2B8 02004010 */  beqz       $v0, .L8004C2C4
    /* 3C2BC 8004C2BC 00000000 */   nop
    /* 3C2C0 8004C2C0 21188000 */  addu       $v1, $a0, $zero
  .L8004C2C4:
    /* 3C2C4 8004C2C4 0000C3A0 */  sb         $v1, 0x0($a2)
  .L8004C2C8:
    /* 3C2C8 8004C2C8 0200C232 */  andi       $v0, $s6, 0x2
    /* 3C2CC 8004C2CC 22004010 */  beqz       $v0, .L8004C358
    /* 3C2D0 8004C2D0 00000000 */   nop
    /* 3C2D4 8004C2D4 0C004012 */  beqz       $s2, .L8004C308
    /* 3C2D8 8004C2D8 00000000 */   nop
    /* 3C2DC 8004C2DC 6C20828F */  lw         $v0, %gp_rel(D_8011C7EC)($gp)
    /* 3C2E0 8004C2E0 5C20838F */  lw         $v1, %gp_rel(D_8011C7DC)($gp)
    /* 3C2E4 8004C2E4 03120200 */  sra        $v0, $v0, 8
    /* 3C2E8 8004C2E8 2110E200 */  addu       $v0, $a3, $v0
    /* 3C2EC 8004C2EC 24104300 */  and        $v0, $v0, $v1
    /* 3C2F0 8004C2F0 1380013C */  lui        $at, %hi(D_8012ED58)
    /* 3C2F4 8004C2F4 21082200 */  addu       $at, $at, $v0
    /* 3C2F8 8004C2F8 58ED2390 */  lbu        $v1, %lo(D_8012ED58)($at)
    /* 3C2FC 8004C2FC 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C300 8004C300 C5300108 */  j          .L8004C314
    /* 3C304 8004C304 18006200 */   mult      $v1, $v0
  .L8004C308:
    /* 3C308 8004C308 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C30C 8004C30C 00000000 */  nop
    /* 3C310 8004C310 1800E200 */  mult       $a3, $v0
  .L8004C314:
    /* 3C314 8004C314 12280000 */  mflo       $a1
    /* 3C318 8004C318 1080033C */  lui        $v1, %hi(dung_map_g)
    /* 3C31C 8004C31C 680E6324 */  addiu      $v1, $v1, %lo(dung_map_g)
    /* 3C320 8004C320 C0101000 */  sll        $v0, $s0, 3
    /* 3C324 8004C324 23105000 */  subu       $v0, $v0, $s0
    /* 3C328 8004C328 C0100200 */  sll        $v0, $v0, 3
    /* 3C32C 8004C32C 21104300 */  addu       $v0, $v0, $v1
    /* 3C330 8004C330 21305100 */  addu       $a2, $v0, $s1
    /* 3C334 8004C334 FF00A330 */  andi       $v1, $a1, 0xFF
    /* 3C338 8004C338 0000C290 */  lbu        $v0, 0x0($a2)
    /* 3C33C 8004C33C 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C340 8004C340 21184300 */  addu       $v1, $v0, $v1
    /* 3C344 8004C344 2A108300 */  slt        $v0, $a0, $v1
    /* 3C348 8004C348 02004010 */  beqz       $v0, .L8004C354
    /* 3C34C 8004C34C 00000000 */   nop
    /* 3C350 8004C350 21188000 */  addu       $v1, $a0, $zero
  .L8004C354:
    /* 3C354 8004C354 0000C3A0 */  sb         $v1, 0x0($a2)
  .L8004C358:
    /* 3C358 8004C358 0400C232 */  andi       $v0, $s6, 0x4
    /* 3C35C 8004C35C 22004010 */  beqz       $v0, .L8004C3E8
    /* 3C360 8004C360 00000000 */   nop
    /* 3C364 8004C364 0C004012 */  beqz       $s2, .L8004C398
    /* 3C368 8004C368 00000000 */   nop
    /* 3C36C 8004C36C 7420828F */  lw         $v0, %gp_rel(D_8011C7F4)($gp)
    /* 3C370 8004C370 5C20838F */  lw         $v1, %gp_rel(D_8011C7DC)($gp)
    /* 3C374 8004C374 03120200 */  sra        $v0, $v0, 8
    /* 3C378 8004C378 2110E200 */  addu       $v0, $a3, $v0
    /* 3C37C 8004C37C 24104300 */  and        $v0, $v0, $v1
    /* 3C380 8004C380 1380013C */  lui        $at, %hi(D_8012ED58)
    /* 3C384 8004C384 21082200 */  addu       $at, $at, $v0
    /* 3C388 8004C388 58ED2390 */  lbu        $v1, %lo(D_8012ED58)($at)
    /* 3C38C 8004C38C 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C390 8004C390 E9300108 */  j          .L8004C3A4
    /* 3C394 8004C394 18006200 */   mult      $v1, $v0
  .L8004C398:
    /* 3C398 8004C398 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C39C 8004C39C 00000000 */  nop
    /* 3C3A0 8004C3A0 1800E200 */  mult       $a3, $v0
  .L8004C3A4:
    /* 3C3A4 8004C3A4 12280000 */  mflo       $a1
    /* 3C3A8 8004C3A8 1080033C */  lui        $v1, %hi(dung_map_b)
    /* 3C3AC 8004C3AC A81A6324 */  addiu      $v1, $v1, %lo(dung_map_b)
    /* 3C3B0 8004C3B0 C0101000 */  sll        $v0, $s0, 3
    /* 3C3B4 8004C3B4 23105000 */  subu       $v0, $v0, $s0
    /* 3C3B8 8004C3B8 C0100200 */  sll        $v0, $v0, 3
    /* 3C3BC 8004C3BC 21104300 */  addu       $v0, $v0, $v1
    /* 3C3C0 8004C3C0 21305100 */  addu       $a2, $v0, $s1
    /* 3C3C4 8004C3C4 FF00A330 */  andi       $v1, $a1, 0xFF
    /* 3C3C8 8004C3C8 0000C290 */  lbu        $v0, 0x0($a2)
    /* 3C3CC 8004C3CC 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C3D0 8004C3D0 21184300 */  addu       $v1, $v0, $v1
    /* 3C3D4 8004C3D4 2A108300 */  slt        $v0, $a0, $v1
    /* 3C3D8 8004C3D8 02004010 */  beqz       $v0, .L8004C3E4
    /* 3C3DC 8004C3DC 00000000 */   nop
    /* 3C3E0 8004C3E0 21188000 */  addu       $v1, $a0, $zero
  .L8004C3E4:
    /* 3C3E4 8004C3E4 0000C3A0 */  sb         $v1, 0x0($a2)
  .L8004C3E8:
    /* 3C3E8 8004C3E8 01009426 */  addiu      $s4, $s4, 0x1
    /* 3C3EC 8004C3EC 2A10B402 */  slt        $v0, $s5, $s4
    /* 3C3F0 8004C3F0 80FF4010 */  beqz       $v0, .L8004C1F4
    /* 3C3F4 8004C3F4 01001026 */   addiu     $s0, $s0, 0x1
  .L8004C3F8:
    /* 3C3F8 8004C3F8 01003126 */  addiu      $s1, $s1, 0x1
    /* 3C3FC 8004C3FC 2110A902 */  addu       $v0, $s5, $t1
    /* 3C400 8004C400 2A105100 */  slt        $v0, $v0, $s1
    /* 3C404 8004C404 71FF4010 */  beqz       $v0, .L8004C1CC
    /* 3C408 8004C408 00000000 */   nop
    /* 3C40C 8004C40C B0320108 */  j          .L8004CAC0
    /* 3C410 8004C410 00000000 */   nop
  .L8004C414:
    /* 3C414 8004C414 AA01A006 */  bltz       $s5, .L8004CAC0
    /* 3C418 8004C418 21982001 */   addu      $s3, $t1, $zero
    /* 3C41C 8004C41C 1080083C */  lui        $t0, %hi(dung_map_r)
    /* 3C420 8004C420 28020825 */  addiu      $t0, $t0, %lo(dung_map_r)
    /* 3C424 8004C424 1080073C */  lui        $a3, %hi(dung_map_g)
    /* 3C428 8004C428 680EE724 */  addiu      $a3, $a3, %lo(dung_map_g)
    /* 3C42C 8004C42C 1080063C */  lui        $a2, %hi(dung_map_b)
    /* 3C430 8004C430 A81AC624 */  addiu      $a2, $a2, %lo(dung_map_b)
  .L8004C434:
    /* 3C434 8004C434 86006006 */  bltz       $s3, .L8004C650
    /* 3C438 8004C438 3000622A */   slti      $v0, $s3, 0x30
    /* 3C43C 8004C43C 84004010 */  beqz       $v0, .L8004C650
    /* 3C440 8004C440 00000000 */   nop
    /* 3C444 8004C444 8200A006 */  bltz       $s5, .L8004C650
    /* 3C448 8004C448 21A00000 */   addu      $s4, $zero, $zero
    /* 3C44C 8004C44C 21F06002 */  addu       $fp, $s3, $zero
    /* 3C450 8004C450 00111300 */  sll        $v0, $s3, 4
    /* 3C454 8004C454 21906002 */  addu       $s2, $s3, $zero
    /* 3C458 8004C458 1800AD8F */  lw         $t5, 0x18($sp)
    /* 3C45C 8004C45C 2000B08F */  lw         $s0, 0x20($sp)
    /* 3C460 8004C460 23B8A201 */  subu       $s7, $t5, $v0
  .L8004C464:
    /* 3C464 8004C464 00211000 */  sll        $a0, $s0, 4
    /* 3C468 8004C468 1000AD8F */  lw         $t5, 0x10($sp)
    /* 3C46C 8004C46C 2128E002 */  addu       $a1, $s7, $zero
    /* 3C470 8004C470 2800A6AF */  sw         $a2, 0x28($sp)
    /* 3C474 8004C474 2C00A7AF */  sw         $a3, 0x2C($sp)
    /* 3C478 8004C478 3000A8AF */  sw         $t0, 0x30($sp)
    /* 3C47C 8004C47C 3400A9AF */  sw         $t1, 0x34($sp)
    /* 3C480 8004C480 3C00ABAF */  sw         $t3, 0x3C($sp)
    /* 3C484 8004C484 1A2F010C */  jal        veclen2__Fii
    /* 3C488 8004C488 2320A401 */   subu      $a0, $t5, $a0
    /* 3C48C 8004C48C 7C20838F */  lw         $v1, %gp_rel(D_8011C7FC)($gp)
    /* 3C490 8004C490 8020848F */  lw         $a0, %gp_rel(D_8011C800)($gp)
    /* 3C494 8004C494 23186200 */  subu       $v1, $v1, $v0
    /* 3C498 8004C498 18006400 */  mult       $v1, $a0
    /* 3C49C 8004C49C 2800A68F */  lw         $a2, 0x28($sp)
    /* 3C4A0 8004C4A0 2C00A78F */  lw         $a3, 0x2C($sp)
    /* 3C4A4 8004C4A4 3000A88F */  lw         $t0, 0x30($sp)
    /* 3C4A8 8004C4A8 3400A98F */  lw         $t1, 0x34($sp)
    /* 3C4AC 8004C4AC 3C00AB8F */  lw         $t3, 0x3C($sp)
    /* 3C4B0 8004C4B0 12280000 */  mflo       $a1
    /* 3C4B4 8004C4B4 0200A104 */  bgez       $a1, .L8004C4C0
    /* 3C4B8 8004C4B8 00000000 */   nop
    /* 3C4BC 8004C4BC 21280000 */  addu       $a1, $zero, $zero
  .L8004C4C0:
    /* 3C4C0 8004C4C0 5F000006 */  bltz       $s0, .L8004C640
    /* 3C4C4 8004C4C4 2A100B02 */   slt       $v0, $s0, $t3
    /* 3C4C8 8004C4C8 5D004010 */  beqz       $v0, .L8004C640
    /* 3C4CC 8004C4CC C0101000 */   sll       $v0, $s0, 3
    /* 3C4D0 8004C4D0 23105000 */  subu       $v0, $v0, $s0
    /* 3C4D4 8004C4D4 C0100200 */  sll        $v0, $v0, 3
    /* 3C4D8 8004C4D8 21104800 */  addu       $v0, $v0, $t0
    /* 3C4DC 8004C4DC 21105E00 */  addu       $v0, $v0, $fp
    /* 3C4E0 8004C4E0 00004390 */  lbu        $v1, 0x0($v0)
    /* 3C4E4 8004C4E4 0100C232 */  andi       $v0, $s6, 0x1
    /* 3C4E8 8004C4E8 17004010 */  beqz       $v0, .L8004C548
    /* 3C4EC 8004C4EC 09002232 */   andi      $v0, $s1, 0x9
    /* 3C4F0 8004C4F0 03004014 */  bnez       $v0, .L8004C500
    /* 3C4F4 8004C4F4 01002232 */   andi      $v0, $s1, 0x1
    /* 3C4F8 8004C4F8 47310108 */  j          .L8004C51C
    /* 3C4FC 8004C4FC 21186500 */   addu      $v1, $v1, $a1
  .L8004C500:
    /* 3C500 8004C500 02004010 */  beqz       $v0, .L8004C50C
    /* 3C504 8004C504 43100500 */   sra       $v0, $a1, 1
    /* 3C508 8004C508 21186200 */  addu       $v1, $v1, $v0
  .L8004C50C:
    /* 3C50C 8004C50C 08002232 */  andi       $v0, $s1, 0x8
    /* 3C510 8004C510 02004010 */  beqz       $v0, .L8004C51C
    /* 3C514 8004C514 40100500 */   sll       $v0, $a1, 1
    /* 3C518 8004C518 21186200 */  addu       $v1, $v1, $v0
  .L8004C51C:
    /* 3C51C 8004C51C 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C520 8004C520 00000000 */  nop
    /* 3C524 8004C524 2A108300 */  slt        $v0, $a0, $v1
    /* 3C528 8004C528 02004010 */  beqz       $v0, .L8004C534
    /* 3C52C 8004C52C C0101000 */   sll       $v0, $s0, 3
    /* 3C530 8004C530 21188000 */  addu       $v1, $a0, $zero
  .L8004C534:
    /* 3C534 8004C534 23105000 */  subu       $v0, $v0, $s0
    /* 3C538 8004C538 C0100200 */  sll        $v0, $v0, 3
    /* 3C53C 8004C53C 21104800 */  addu       $v0, $v0, $t0
    /* 3C540 8004C540 21105200 */  addu       $v0, $v0, $s2
    /* 3C544 8004C544 000043A0 */  sb         $v1, 0x0($v0)
  .L8004C548:
    /* 3C548 8004C548 C0101000 */  sll        $v0, $s0, 3
    /* 3C54C 8004C54C 23105000 */  subu       $v0, $v0, $s0
    /* 3C550 8004C550 C0100200 */  sll        $v0, $v0, 3
    /* 3C554 8004C554 21104700 */  addu       $v0, $v0, $a3
    /* 3C558 8004C558 21105200 */  addu       $v0, $v0, $s2
    /* 3C55C 8004C55C 00004390 */  lbu        $v1, 0x0($v0)
    /* 3C560 8004C560 0200C232 */  andi       $v0, $s6, 0x2
    /* 3C564 8004C564 17004010 */  beqz       $v0, .L8004C5C4
    /* 3C568 8004C568 12002232 */   andi      $v0, $s1, 0x12
    /* 3C56C 8004C56C 03004014 */  bnez       $v0, .L8004C57C
    /* 3C570 8004C570 02002232 */   andi      $v0, $s1, 0x2
    /* 3C574 8004C574 66310108 */  j          .L8004C598
    /* 3C578 8004C578 21186500 */   addu      $v1, $v1, $a1
  .L8004C57C:
    /* 3C57C 8004C57C 02004010 */  beqz       $v0, .L8004C588
    /* 3C580 8004C580 43100500 */   sra       $v0, $a1, 1
    /* 3C584 8004C584 21186200 */  addu       $v1, $v1, $v0
  .L8004C588:
    /* 3C588 8004C588 10002232 */  andi       $v0, $s1, 0x10
    /* 3C58C 8004C58C 02004010 */  beqz       $v0, .L8004C598
    /* 3C590 8004C590 40100500 */   sll       $v0, $a1, 1
    /* 3C594 8004C594 21186200 */  addu       $v1, $v1, $v0
  .L8004C598:
    /* 3C598 8004C598 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C59C 8004C59C 00000000 */  nop
    /* 3C5A0 8004C5A0 2A108300 */  slt        $v0, $a0, $v1
    /* 3C5A4 8004C5A4 02004010 */  beqz       $v0, .L8004C5B0
    /* 3C5A8 8004C5A8 C0101000 */   sll       $v0, $s0, 3
    /* 3C5AC 8004C5AC 21188000 */  addu       $v1, $a0, $zero
  .L8004C5B0:
    /* 3C5B0 8004C5B0 23105000 */  subu       $v0, $v0, $s0
    /* 3C5B4 8004C5B4 C0100200 */  sll        $v0, $v0, 3
    /* 3C5B8 8004C5B8 21104700 */  addu       $v0, $v0, $a3
    /* 3C5BC 8004C5BC 21105200 */  addu       $v0, $v0, $s2
    /* 3C5C0 8004C5C0 000043A0 */  sb         $v1, 0x0($v0)
  .L8004C5C4:
    /* 3C5C4 8004C5C4 C0101000 */  sll        $v0, $s0, 3
    /* 3C5C8 8004C5C8 23105000 */  subu       $v0, $v0, $s0
    /* 3C5CC 8004C5CC C0100200 */  sll        $v0, $v0, 3
    /* 3C5D0 8004C5D0 21104600 */  addu       $v0, $v0, $a2
    /* 3C5D4 8004C5D4 21105200 */  addu       $v0, $v0, $s2
    /* 3C5D8 8004C5D8 00004390 */  lbu        $v1, 0x0($v0)
    /* 3C5DC 8004C5DC 0400C232 */  andi       $v0, $s6, 0x4
    /* 3C5E0 8004C5E0 17004010 */  beqz       $v0, .L8004C640
    /* 3C5E4 8004C5E4 24002232 */   andi      $v0, $s1, 0x24
    /* 3C5E8 8004C5E8 03004014 */  bnez       $v0, .L8004C5F8
    /* 3C5EC 8004C5EC 04002232 */   andi      $v0, $s1, 0x4
    /* 3C5F0 8004C5F0 85310108 */  j          .L8004C614
    /* 3C5F4 8004C5F4 21186500 */   addu      $v1, $v1, $a1
  .L8004C5F8:
    /* 3C5F8 8004C5F8 02004010 */  beqz       $v0, .L8004C604
    /* 3C5FC 8004C5FC 43100500 */   sra       $v0, $a1, 1
    /* 3C600 8004C600 21186200 */  addu       $v1, $v1, $v0
  .L8004C604:
    /* 3C604 8004C604 20002232 */  andi       $v0, $s1, 0x20
    /* 3C608 8004C608 02004010 */  beqz       $v0, .L8004C614
    /* 3C60C 8004C60C 40100500 */   sll       $v0, $a1, 1
    /* 3C610 8004C610 21186200 */  addu       $v1, $v1, $v0
  .L8004C614:
    /* 3C614 8004C614 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C618 8004C618 00000000 */  nop
    /* 3C61C 8004C61C 2A108300 */  slt        $v0, $a0, $v1
    /* 3C620 8004C620 02004010 */  beqz       $v0, .L8004C62C
    /* 3C624 8004C624 C0101000 */   sll       $v0, $s0, 3
    /* 3C628 8004C628 21188000 */  addu       $v1, $a0, $zero
  .L8004C62C:
    /* 3C62C 8004C62C 23105000 */  subu       $v0, $v0, $s0
    /* 3C630 8004C630 C0100200 */  sll        $v0, $v0, 3
    /* 3C634 8004C634 21104600 */  addu       $v0, $v0, $a2
    /* 3C638 8004C638 21105200 */  addu       $v0, $v0, $s2
    /* 3C63C 8004C63C 000043A0 */  sb         $v1, 0x0($v0)
  .L8004C640:
    /* 3C640 8004C640 01009426 */  addiu      $s4, $s4, 0x1
    /* 3C644 8004C644 2A10B402 */  slt        $v0, $s5, $s4
    /* 3C648 8004C648 86FF4010 */  beqz       $v0, .L8004C464
    /* 3C64C 8004C64C 01001026 */   addiu     $s0, $s0, 0x1
  .L8004C650:
    /* 3C650 8004C650 01007326 */  addiu      $s3, $s3, 0x1
    /* 3C654 8004C654 2110A902 */  addu       $v0, $s5, $t1
    /* 3C658 8004C658 2A105300 */  slt        $v0, $v0, $s3
    /* 3C65C 8004C65C 75FF4010 */  beqz       $v0, .L8004C434
    /* 3C660 8004C660 00000000 */   nop
    /* 3C664 8004C664 B0320108 */  j          .L8004CAC0
    /* 3C668 8004C668 00000000 */   nop
  .L8004C66C:
    /* 3C66C 8004C66C 8A002016 */  bnez       $s1, .L8004C898
    /* 3C670 8004C670 00000000 */   nop
    /* 3C674 8004C674 1201A006 */  bltz       $s5, .L8004CAC0
    /* 3C678 8004C678 21F00000 */   addu      $fp, $zero, $zero
    /* 3C67C 8004C67C 21882001 */  addu       $s1, $t1, $zero
  .L8004C680:
    /* 3C680 8004C680 7F00A006 */  bltz       $s5, .L8004C880
    /* 3C684 8004C684 21A00000 */   addu      $s4, $zero, $zero
    /* 3C688 8004C688 00111100 */  sll        $v0, $s1, 4
    /* 3C68C 8004C68C 1800AD8F */  lw         $t5, 0x18($sp)
    /* 3C690 8004C690 2000B08F */  lw         $s0, 0x20($sp)
    /* 3C694 8004C694 23B8A201 */  subu       $s7, $t5, $v0
  .L8004C698:
    /* 3C698 8004C698 00211000 */  sll        $a0, $s0, 4
    /* 3C69C 8004C69C 1000AD8F */  lw         $t5, 0x10($sp)
    /* 3C6A0 8004C6A0 2128E002 */  addu       $a1, $s7, $zero
    /* 3C6A4 8004C6A4 1A2F010C */  jal        veclen2__Fii
    /* 3C6A8 8004C6A8 2320A401 */   subu      $a0, $t5, $a0
    /* 3C6AC 8004C6AC 7C20838F */  lw         $v1, %gp_rel(D_8011C7FC)($gp)
    /* 3C6B0 8004C6B0 00000000 */  nop
    /* 3C6B4 8004C6B4 23386200 */  subu       $a3, $v1, $v0
    /* 3C6B8 8004C6B8 0200E104 */  bgez       $a3, .L8004C6C4
    /* 3C6BC 8004C6BC 0100C232 */   andi      $v0, $s6, 0x1
    /* 3C6C0 8004C6C0 21380000 */  addu       $a3, $zero, $zero
  .L8004C6C4:
    /* 3C6C4 8004C6C4 22004010 */  beqz       $v0, .L8004C750
    /* 3C6C8 8004C6C8 00000000 */   nop
    /* 3C6CC 8004C6CC 0C004012 */  beqz       $s2, .L8004C700
    /* 3C6D0 8004C6D0 00000000 */   nop
    /* 3C6D4 8004C6D4 6420828F */  lw         $v0, %gp_rel(D_8011C7E4)($gp)
    /* 3C6D8 8004C6D8 5C20838F */  lw         $v1, %gp_rel(D_8011C7DC)($gp)
    /* 3C6DC 8004C6DC 03120200 */  sra        $v0, $v0, 8
    /* 3C6E0 8004C6E0 2110E200 */  addu       $v0, $a3, $v0
    /* 3C6E4 8004C6E4 24104300 */  and        $v0, $v0, $v1
    /* 3C6E8 8004C6E8 1380013C */  lui        $at, %hi(D_8012ED58)
    /* 3C6EC 8004C6EC 21082200 */  addu       $at, $at, $v0
    /* 3C6F0 8004C6F0 58ED2390 */  lbu        $v1, %lo(D_8012ED58)($at)
    /* 3C6F4 8004C6F4 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C6F8 8004C6F8 C3310108 */  j          .L8004C70C
    /* 3C6FC 8004C6FC 18006200 */   mult      $v1, $v0
  .L8004C700:
    /* 3C700 8004C700 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C704 8004C704 00000000 */  nop
    /* 3C708 8004C708 1800E200 */  mult       $a3, $v0
  .L8004C70C:
    /* 3C70C 8004C70C 12280000 */  mflo       $a1
    /* 3C710 8004C710 1080033C */  lui        $v1, %hi(dung_map_r)
    /* 3C714 8004C714 28026324 */  addiu      $v1, $v1, %lo(dung_map_r)
    /* 3C718 8004C718 C0101000 */  sll        $v0, $s0, 3
    /* 3C71C 8004C71C 23105000 */  subu       $v0, $v0, $s0
    /* 3C720 8004C720 C0100200 */  sll        $v0, $v0, 3
    /* 3C724 8004C724 21104300 */  addu       $v0, $v0, $v1
    /* 3C728 8004C728 21305100 */  addu       $a2, $v0, $s1
    /* 3C72C 8004C72C FF00A330 */  andi       $v1, $a1, 0xFF
    /* 3C730 8004C730 0000C290 */  lbu        $v0, 0x0($a2)
    /* 3C734 8004C734 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C738 8004C738 21184300 */  addu       $v1, $v0, $v1
    /* 3C73C 8004C73C 2A108300 */  slt        $v0, $a0, $v1
    /* 3C740 8004C740 02004010 */  beqz       $v0, .L8004C74C
    /* 3C744 8004C744 00000000 */   nop
    /* 3C748 8004C748 21188000 */  addu       $v1, $a0, $zero
  .L8004C74C:
    /* 3C74C 8004C74C 0000C3A0 */  sb         $v1, 0x0($a2)
  .L8004C750:
    /* 3C750 8004C750 0200C232 */  andi       $v0, $s6, 0x2
    /* 3C754 8004C754 22004010 */  beqz       $v0, .L8004C7E0
    /* 3C758 8004C758 00000000 */   nop
    /* 3C75C 8004C75C 0C004012 */  beqz       $s2, .L8004C790
    /* 3C760 8004C760 00000000 */   nop
    /* 3C764 8004C764 6C20828F */  lw         $v0, %gp_rel(D_8011C7EC)($gp)
    /* 3C768 8004C768 5C20838F */  lw         $v1, %gp_rel(D_8011C7DC)($gp)
    /* 3C76C 8004C76C 03120200 */  sra        $v0, $v0, 8
    /* 3C770 8004C770 2110E200 */  addu       $v0, $a3, $v0
    /* 3C774 8004C774 24104300 */  and        $v0, $v0, $v1
    /* 3C778 8004C778 1380013C */  lui        $at, %hi(D_8012ED58)
    /* 3C77C 8004C77C 21082200 */  addu       $at, $at, $v0
    /* 3C780 8004C780 58ED2390 */  lbu        $v1, %lo(D_8012ED58)($at)
    /* 3C784 8004C784 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C788 8004C788 E7310108 */  j          .L8004C79C
    /* 3C78C 8004C78C 18006200 */   mult      $v1, $v0
  .L8004C790:
    /* 3C790 8004C790 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C794 8004C794 00000000 */  nop
    /* 3C798 8004C798 1800E200 */  mult       $a3, $v0
  .L8004C79C:
    /* 3C79C 8004C79C 12280000 */  mflo       $a1
    /* 3C7A0 8004C7A0 1080033C */  lui        $v1, %hi(dung_map_g)
    /* 3C7A4 8004C7A4 680E6324 */  addiu      $v1, $v1, %lo(dung_map_g)
    /* 3C7A8 8004C7A8 C0101000 */  sll        $v0, $s0, 3
    /* 3C7AC 8004C7AC 23105000 */  subu       $v0, $v0, $s0
    /* 3C7B0 8004C7B0 C0100200 */  sll        $v0, $v0, 3
    /* 3C7B4 8004C7B4 21104300 */  addu       $v0, $v0, $v1
    /* 3C7B8 8004C7B8 21305100 */  addu       $a2, $v0, $s1
    /* 3C7BC 8004C7BC FF00A330 */  andi       $v1, $a1, 0xFF
    /* 3C7C0 8004C7C0 0000C290 */  lbu        $v0, 0x0($a2)
    /* 3C7C4 8004C7C4 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C7C8 8004C7C8 21184300 */  addu       $v1, $v0, $v1
    /* 3C7CC 8004C7CC 2A108300 */  slt        $v0, $a0, $v1
    /* 3C7D0 8004C7D0 02004010 */  beqz       $v0, .L8004C7DC
    /* 3C7D4 8004C7D4 00000000 */   nop
    /* 3C7D8 8004C7D8 21188000 */  addu       $v1, $a0, $zero
  .L8004C7DC:
    /* 3C7DC 8004C7DC 0000C3A0 */  sb         $v1, 0x0($a2)
  .L8004C7E0:
    /* 3C7E0 8004C7E0 0400C232 */  andi       $v0, $s6, 0x4
    /* 3C7E4 8004C7E4 22004010 */  beqz       $v0, .L8004C870
    /* 3C7E8 8004C7E8 00000000 */   nop
    /* 3C7EC 8004C7EC 0C004012 */  beqz       $s2, .L8004C820
    /* 3C7F0 8004C7F0 00000000 */   nop
    /* 3C7F4 8004C7F4 7420828F */  lw         $v0, %gp_rel(D_8011C7F4)($gp)
    /* 3C7F8 8004C7F8 5C20838F */  lw         $v1, %gp_rel(D_8011C7DC)($gp)
    /* 3C7FC 8004C7FC 03120200 */  sra        $v0, $v0, 8
    /* 3C800 8004C800 2110E200 */  addu       $v0, $a3, $v0
    /* 3C804 8004C804 24104300 */  and        $v0, $v0, $v1
    /* 3C808 8004C808 1380013C */  lui        $at, %hi(D_8012ED58)
    /* 3C80C 8004C80C 21082200 */  addu       $at, $at, $v0
    /* 3C810 8004C810 58ED2390 */  lbu        $v1, %lo(D_8012ED58)($at)
    /* 3C814 8004C814 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C818 8004C818 0B320108 */  j          .L8004C82C
    /* 3C81C 8004C81C 18006200 */   mult      $v1, $v0
  .L8004C820:
    /* 3C820 8004C820 8020828F */  lw         $v0, %gp_rel(D_8011C800)($gp)
    /* 3C824 8004C824 00000000 */  nop
    /* 3C828 8004C828 1800E200 */  mult       $a3, $v0
  .L8004C82C:
    /* 3C82C 8004C82C 12280000 */  mflo       $a1
    /* 3C830 8004C830 1080033C */  lui        $v1, %hi(dung_map_b)
    /* 3C834 8004C834 A81A6324 */  addiu      $v1, $v1, %lo(dung_map_b)
    /* 3C838 8004C838 C0101000 */  sll        $v0, $s0, 3
    /* 3C83C 8004C83C 23105000 */  subu       $v0, $v0, $s0
    /* 3C840 8004C840 C0100200 */  sll        $v0, $v0, 3
    /* 3C844 8004C844 21104300 */  addu       $v0, $v0, $v1
    /* 3C848 8004C848 21305100 */  addu       $a2, $v0, $s1
    /* 3C84C 8004C84C FF00A330 */  andi       $v1, $a1, 0xFF
    /* 3C850 8004C850 0000C290 */  lbu        $v0, 0x0($a2)
    /* 3C854 8004C854 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C858 8004C858 21184300 */  addu       $v1, $v0, $v1
    /* 3C85C 8004C85C 2A108300 */  slt        $v0, $a0, $v1
    /* 3C860 8004C860 02004010 */  beqz       $v0, .L8004C86C
    /* 3C864 8004C864 00000000 */   nop
    /* 3C868 8004C868 21188000 */  addu       $v1, $a0, $zero
  .L8004C86C:
    /* 3C86C 8004C86C 0000C3A0 */  sb         $v1, 0x0($a2)
  .L8004C870:
    /* 3C870 8004C870 01009426 */  addiu      $s4, $s4, 0x1
    /* 3C874 8004C874 2A10B402 */  slt        $v0, $s5, $s4
    /* 3C878 8004C878 87FF4010 */  beqz       $v0, .L8004C698
    /* 3C87C 8004C87C 01001026 */   addiu     $s0, $s0, 0x1
  .L8004C880:
    /* 3C880 8004C880 0100DE27 */  addiu      $fp, $fp, 0x1
    /* 3C884 8004C884 2A10BE02 */  slt        $v0, $s5, $fp
    /* 3C888 8004C888 7DFF4010 */  beqz       $v0, .L8004C680
    /* 3C88C 8004C88C 01003126 */   addiu     $s1, $s1, 0x1
    /* 3C890 8004C890 B0320108 */  j          .L8004CAC0
    /* 3C894 8004C894 00000000 */   nop
  .L8004C898:
    /* 3C898 8004C898 8900A006 */  bltz       $s5, .L8004CAC0
    /* 3C89C 8004C89C 21F00000 */   addu      $fp, $zero, $zero
    /* 3C8A0 8004C8A0 10800A3C */  lui        $t2, %hi(dung_map_r)
    /* 3C8A4 8004C8A4 28024A25 */  addiu      $t2, $t2, %lo(dung_map_r)
    /* 3C8A8 8004C8A8 1080083C */  lui        $t0, %hi(dung_map_g)
    /* 3C8AC 8004C8AC 680E0825 */  addiu      $t0, $t0, %lo(dung_map_g)
    /* 3C8B0 8004C8B0 1080073C */  lui        $a3, %hi(dung_map_b)
    /* 3C8B4 8004C8B4 A81AE724 */  addiu      $a3, $a3, %lo(dung_map_b)
    /* 3C8B8 8004C8B8 21982001 */  addu       $s3, $t1, $zero
  .L8004C8BC:
    /* 3C8BC 8004C8BC 7C00A006 */  bltz       $s5, .L8004CAB0
    /* 3C8C0 8004C8C0 21A00000 */   addu      $s4, $zero, $zero
    /* 3C8C4 8004C8C4 21306002 */  addu       $a2, $s3, $zero
    /* 3C8C8 8004C8C8 00111300 */  sll        $v0, $s3, 4
    /* 3C8CC 8004C8CC 21906002 */  addu       $s2, $s3, $zero
    /* 3C8D0 8004C8D0 1800AD8F */  lw         $t5, 0x18($sp)
    /* 3C8D4 8004C8D4 2000B08F */  lw         $s0, 0x20($sp)
    /* 3C8D8 8004C8D8 23B8A201 */  subu       $s7, $t5, $v0
  .L8004C8DC:
    /* 3C8DC 8004C8DC 00211000 */  sll        $a0, $s0, 4
    /* 3C8E0 8004C8E0 1000AD8F */  lw         $t5, 0x10($sp)
    /* 3C8E4 8004C8E4 2128E002 */  addu       $a1, $s7, $zero
    /* 3C8E8 8004C8E8 2800A6AF */  sw         $a2, 0x28($sp)
    /* 3C8EC 8004C8EC 2C00A7AF */  sw         $a3, 0x2C($sp)
    /* 3C8F0 8004C8F0 3000A8AF */  sw         $t0, 0x30($sp)
    /* 3C8F4 8004C8F4 3800AAAF */  sw         $t2, 0x38($sp)
    /* 3C8F8 8004C8F8 1A2F010C */  jal        veclen2__Fii
    /* 3C8FC 8004C8FC 2320A401 */   subu      $a0, $t5, $a0
    /* 3C900 8004C900 7C20838F */  lw         $v1, %gp_rel(D_8011C7FC)($gp)
    /* 3C904 8004C904 8020848F */  lw         $a0, %gp_rel(D_8011C800)($gp)
    /* 3C908 8004C908 23186200 */  subu       $v1, $v1, $v0
    /* 3C90C 8004C90C 18006400 */  mult       $v1, $a0
    /* 3C910 8004C910 2800A68F */  lw         $a2, 0x28($sp)
    /* 3C914 8004C914 2C00A78F */  lw         $a3, 0x2C($sp)
    /* 3C918 8004C918 3000A88F */  lw         $t0, 0x30($sp)
    /* 3C91C 8004C91C 3800AA8F */  lw         $t2, 0x38($sp)
    /* 3C920 8004C920 12280000 */  mflo       $a1
    /* 3C924 8004C924 0200A104 */  bgez       $a1, .L8004C930
    /* 3C928 8004C928 C0101000 */   sll       $v0, $s0, 3
    /* 3C92C 8004C92C 21280000 */  addu       $a1, $zero, $zero
  .L8004C930:
    /* 3C930 8004C930 23105000 */  subu       $v0, $v0, $s0
    /* 3C934 8004C934 C0100200 */  sll        $v0, $v0, 3
    /* 3C938 8004C938 21104A00 */  addu       $v0, $v0, $t2
    /* 3C93C 8004C93C 21104600 */  addu       $v0, $v0, $a2
    /* 3C940 8004C940 00004390 */  lbu        $v1, 0x0($v0)
    /* 3C944 8004C944 0100C232 */  andi       $v0, $s6, 0x1
    /* 3C948 8004C948 17004010 */  beqz       $v0, .L8004C9A8
    /* 3C94C 8004C94C 09002232 */   andi      $v0, $s1, 0x9
    /* 3C950 8004C950 03004014 */  bnez       $v0, .L8004C960
    /* 3C954 8004C954 01002232 */   andi      $v0, $s1, 0x1
    /* 3C958 8004C958 5F320108 */  j          .L8004C97C
    /* 3C95C 8004C95C 21186500 */   addu      $v1, $v1, $a1
  .L8004C960:
    /* 3C960 8004C960 02004010 */  beqz       $v0, .L8004C96C
    /* 3C964 8004C964 43100500 */   sra       $v0, $a1, 1
    /* 3C968 8004C968 21186200 */  addu       $v1, $v1, $v0
  .L8004C96C:
    /* 3C96C 8004C96C 08002232 */  andi       $v0, $s1, 0x8
    /* 3C970 8004C970 02004010 */  beqz       $v0, .L8004C97C
    /* 3C974 8004C974 40100500 */   sll       $v0, $a1, 1
    /* 3C978 8004C978 21186200 */  addu       $v1, $v1, $v0
  .L8004C97C:
    /* 3C97C 8004C97C 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C980 8004C980 00000000 */  nop
    /* 3C984 8004C984 2A108300 */  slt        $v0, $a0, $v1
    /* 3C988 8004C988 02004010 */  beqz       $v0, .L8004C994
    /* 3C98C 8004C98C C0101000 */   sll       $v0, $s0, 3
    /* 3C990 8004C990 21188000 */  addu       $v1, $a0, $zero
  .L8004C994:
    /* 3C994 8004C994 23105000 */  subu       $v0, $v0, $s0
    /* 3C998 8004C998 C0100200 */  sll        $v0, $v0, 3
    /* 3C99C 8004C99C 21104A00 */  addu       $v0, $v0, $t2
    /* 3C9A0 8004C9A0 21105200 */  addu       $v0, $v0, $s2
    /* 3C9A4 8004C9A4 000043A0 */  sb         $v1, 0x0($v0)
  .L8004C9A8:
    /* 3C9A8 8004C9A8 C0101000 */  sll        $v0, $s0, 3
    /* 3C9AC 8004C9AC 23105000 */  subu       $v0, $v0, $s0
    /* 3C9B0 8004C9B0 C0100200 */  sll        $v0, $v0, 3
    /* 3C9B4 8004C9B4 21104800 */  addu       $v0, $v0, $t0
    /* 3C9B8 8004C9B8 21105200 */  addu       $v0, $v0, $s2
    /* 3C9BC 8004C9BC 00004390 */  lbu        $v1, 0x0($v0)
    /* 3C9C0 8004C9C0 0200C232 */  andi       $v0, $s6, 0x2
    /* 3C9C4 8004C9C4 17004010 */  beqz       $v0, .L8004CA24
    /* 3C9C8 8004C9C8 12002232 */   andi      $v0, $s1, 0x12
    /* 3C9CC 8004C9CC 03004014 */  bnez       $v0, .L8004C9DC
    /* 3C9D0 8004C9D0 02002232 */   andi      $v0, $s1, 0x2
    /* 3C9D4 8004C9D4 7E320108 */  j          .L8004C9F8
    /* 3C9D8 8004C9D8 21186500 */   addu      $v1, $v1, $a1
  .L8004C9DC:
    /* 3C9DC 8004C9DC 02004010 */  beqz       $v0, .L8004C9E8
    /* 3C9E0 8004C9E0 43100500 */   sra       $v0, $a1, 1
    /* 3C9E4 8004C9E4 21186200 */  addu       $v1, $v1, $v0
  .L8004C9E8:
    /* 3C9E8 8004C9E8 10002232 */  andi       $v0, $s1, 0x10
    /* 3C9EC 8004C9EC 02004010 */  beqz       $v0, .L8004C9F8
    /* 3C9F0 8004C9F0 40100500 */   sll       $v0, $a1, 1
    /* 3C9F4 8004C9F4 21186200 */  addu       $v1, $v1, $v0
  .L8004C9F8:
    /* 3C9F8 8004C9F8 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3C9FC 8004C9FC 00000000 */  nop
    /* 3CA00 8004CA00 2A108300 */  slt        $v0, $a0, $v1
    /* 3CA04 8004CA04 02004010 */  beqz       $v0, .L8004CA10
    /* 3CA08 8004CA08 C0101000 */   sll       $v0, $s0, 3
    /* 3CA0C 8004CA0C 21188000 */  addu       $v1, $a0, $zero
  .L8004CA10:
    /* 3CA10 8004CA10 23105000 */  subu       $v0, $v0, $s0
    /* 3CA14 8004CA14 C0100200 */  sll        $v0, $v0, 3
    /* 3CA18 8004CA18 21104800 */  addu       $v0, $v0, $t0
    /* 3CA1C 8004CA1C 21105200 */  addu       $v0, $v0, $s2
    /* 3CA20 8004CA20 000043A0 */  sb         $v1, 0x0($v0)
  .L8004CA24:
    /* 3CA24 8004CA24 C0101000 */  sll        $v0, $s0, 3
    /* 3CA28 8004CA28 23105000 */  subu       $v0, $v0, $s0
    /* 3CA2C 8004CA2C C0100200 */  sll        $v0, $v0, 3
    /* 3CA30 8004CA30 21104700 */  addu       $v0, $v0, $a3
    /* 3CA34 8004CA34 21105200 */  addu       $v0, $v0, $s2
    /* 3CA38 8004CA38 00004390 */  lbu        $v1, 0x0($v0)
    /* 3CA3C 8004CA3C 0400C232 */  andi       $v0, $s6, 0x4
    /* 3CA40 8004CA40 17004010 */  beqz       $v0, .L8004CAA0
    /* 3CA44 8004CA44 24002232 */   andi      $v0, $s1, 0x24
    /* 3CA48 8004CA48 03004014 */  bnez       $v0, .L8004CA58
    /* 3CA4C 8004CA4C 04002232 */   andi      $v0, $s1, 0x4
    /* 3CA50 8004CA50 9D320108 */  j          .L8004CA74
    /* 3CA54 8004CA54 21186500 */   addu      $v1, $v1, $a1
  .L8004CA58:
    /* 3CA58 8004CA58 02004010 */  beqz       $v0, .L8004CA64
    /* 3CA5C 8004CA5C 43100500 */   sra       $v0, $a1, 1
    /* 3CA60 8004CA60 21186200 */  addu       $v1, $v1, $v0
  .L8004CA64:
    /* 3CA64 8004CA64 20002232 */  andi       $v0, $s1, 0x20
    /* 3CA68 8004CA68 02004010 */  beqz       $v0, .L8004CA74
    /* 3CA6C 8004CA6C 40100500 */   sll       $v0, $a1, 1
    /* 3CA70 8004CA70 21186200 */  addu       $v1, $v1, $v0
  .L8004CA74:
    /* 3CA74 8004CA74 8420848F */  lw         $a0, %gp_rel(D_8011C804)($gp)
    /* 3CA78 8004CA78 00000000 */  nop
    /* 3CA7C 8004CA7C 2A108300 */  slt        $v0, $a0, $v1
    /* 3CA80 8004CA80 02004010 */  beqz       $v0, .L8004CA8C
    /* 3CA84 8004CA84 C0101000 */   sll       $v0, $s0, 3
    /* 3CA88 8004CA88 21188000 */  addu       $v1, $a0, $zero
  .L8004CA8C:
    /* 3CA8C 8004CA8C 23105000 */  subu       $v0, $v0, $s0
    /* 3CA90 8004CA90 C0100200 */  sll        $v0, $v0, 3
    /* 3CA94 8004CA94 21104700 */  addu       $v0, $v0, $a3
    /* 3CA98 8004CA98 21105200 */  addu       $v0, $v0, $s2
    /* 3CA9C 8004CA9C 000043A0 */  sb         $v1, 0x0($v0)
  .L8004CAA0:
    /* 3CAA0 8004CAA0 01009426 */  addiu      $s4, $s4, 0x1
    /* 3CAA4 8004CAA4 2A10B402 */  slt        $v0, $s5, $s4
    /* 3CAA8 8004CAA8 8CFF4010 */  beqz       $v0, .L8004C8DC
    /* 3CAAC 8004CAAC 01001026 */   addiu     $s0, $s0, 0x1
  .L8004CAB0:
    /* 3CAB0 8004CAB0 0100DE27 */  addiu      $fp, $fp, 0x1
    /* 3CAB4 8004CAB4 2A10BE02 */  slt        $v0, $s5, $fp
    /* 3CAB8 8004CAB8 80FF4010 */  beqz       $v0, .L8004C8BC
    /* 3CABC 8004CABC 01007326 */   addiu     $s3, $s3, 0x1
  .L8004CAC0:
    /* 3CAC0 8004CAC0 6400BF8F */  lw         $ra, 0x64($sp)
    /* 3CAC4 8004CAC4 6000BE8F */  lw         $fp, 0x60($sp)
    /* 3CAC8 8004CAC8 5C00B78F */  lw         $s7, 0x5C($sp)
    /* 3CACC 8004CACC 5800B68F */  lw         $s6, 0x58($sp)
    /* 3CAD0 8004CAD0 5400B58F */  lw         $s5, 0x54($sp)
    /* 3CAD4 8004CAD4 5000B48F */  lw         $s4, 0x50($sp)
    /* 3CAD8 8004CAD8 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 3CADC 8004CADC 4800B28F */  lw         $s2, 0x48($sp)
    /* 3CAE0 8004CAE0 4400B18F */  lw         $s1, 0x44($sp)
    /* 3CAE4 8004CAE4 4000B08F */  lw         $s0, 0x40($sp)
    /* 3CAE8 8004CAE8 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 3CAEC 8004CAEC 0800E003 */  jr         $ra
    /* 3CAF0 8004CAF0 00000000 */   nop
endlabel DoLighting__Fiiii
