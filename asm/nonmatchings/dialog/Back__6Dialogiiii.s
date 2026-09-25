.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Back__6Dialogiiii, 0x1118

glabel Back__6Dialogiiii
    /* 7BEE0 8008BEE0 1280023C */  lui        $v0, %hi(qtextflag)
    /* 7BEE4 8008BEE4 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 7BEE8 8008BEE8 48FFBD27 */  addiu      $sp, $sp, -0xB8
    /* 7BEEC 8008BEEC 9800B2AF */  sw         $s2, 0x98($sp)
    /* 7BEF0 8008BEF0 21908000 */  addu       $s2, $a0, $zero
    /* 7BEF4 8008BEF4 9000B0AF */  sw         $s0, 0x90($sp)
    /* 7BEF8 8008BEF8 2180A000 */  addu       $s0, $a1, $zero
    /* 7BEFC 8008BEFC 9400B1AF */  sw         $s1, 0x94($sp)
    /* 7BF00 8008BF00 2188C000 */  addu       $s1, $a2, $zero
    /* 7BF04 8008BF04 9C00B3AF */  sw         $s3, 0x9C($sp)
    /* 7BF08 8008BF08 2198E000 */  addu       $s3, $a3, $zero
    /* 7BF0C 8008BF0C B400BFAF */  sw         $ra, 0xB4($sp)
    /* 7BF10 8008BF10 B000BEAF */  sw         $fp, 0xB0($sp)
    /* 7BF14 8008BF14 AC00B7AF */  sw         $s7, 0xAC($sp)
    /* 7BF18 8008BF18 A800B6AF */  sw         $s6, 0xA8($sp)
    /* 7BF1C 8008BF1C A400B5AF */  sw         $s5, 0xA4($sp)
    /* 7BF20 8008BF20 04004010 */  beqz       $v0, .L8008BF34
    /* 7BF24 8008BF24 A000B4AF */   sw        $s4, 0xA0($sp)
    /* 7BF28 8008BF28 F404848F */  lw         $a0, %gp_rel(MY_DialogOTpos)($gp)
    /* 7BF2C 8008BF2C C80E020C */  jal        PRIM_FullScreen__Fi
    /* 7BF30 8008BF30 02008424 */   addiu     $a0, $a0, 0x2
  .L8008BF34:
    /* 7BF34 8008BF34 21204002 */  addu       $a0, $s2, $zero
    /* 7BF38 8008BF38 21F00002 */  addu       $fp, $s0, $zero
    /* 7BF3C 8008BF3C 3000B3AF */  sw         $s3, 0x30($sp)
    /* 7BF40 8008BF40 3000A897 */  lhu        $t0, 0x30($sp)
    /* 7BF44 8008BF44 21B82002 */  addu       $s7, $s1, $zero
    /* 7BF48 8008BF48 2C00A8A7 */  sh         $t0, 0x2C($sp)
    /* 7BF4C 8008BF4C C800A88F */  lw         $t0, 0xC8($sp)
    /* 7BF50 8008BF50 CC1E80A3 */  sb         $zero, %gp_rel(D_8011C64C)($gp)
    /* 7BF54 8008BF54 2800BEA7 */  sh         $fp, 0x28($sp)
    /* 7BF58 8008BF58 2A00B7A7 */  sh         $s7, 0x2A($sp)
    /* 7BF5C 8008BF5C 3800A8AF */  sw         $t0, 0x38($sp)
    /* 7BF60 8008BF60 3800A897 */  lhu        $t0, 0x38($sp)
    /* 7BF64 8008BF64 172F020C */  jal        GetSizes__6Dialog
    /* 7BF68 8008BF68 2E00A8A7 */   sh        $t0, 0x2E($sp)
    /* 7BF6C 8008BF6C 8804838F */  lw         $v1, %gp_rel(DialogBackGfx)($gp)
    /* 7BF70 8008BF70 00000000 */  nop
    /* 7BF74 8008BF74 13046010 */  beqz       $v1, .L8008CFC4
    /* 7BF78 8008BF78 94000224 */   addiu     $v0, $zero, 0x94
    /* 7BF7C 8008BF7C 0F006214 */  bne        $v1, $v0, .L8008BFBC
    /* 7BF80 8008BF80 01000224 */   addiu     $v0, $zero, 0x1
    /* 7BF84 8008BF84 94000424 */  addiu      $a0, $zero, 0x94
    /* 7BF88 8008BF88 2128C003 */  addu       $a1, $fp, $zero
    /* 7BF8C 8008BF8C 2130E002 */  addu       $a2, $s7, $zero
    /* 7BF90 8008BF90 3000A78F */  lw         $a3, 0x30($sp)
    /* 7BF94 8008BF94 3800A88F */  lw         $t0, 0x38($sp)
    /* 7BF98 8008BF98 01000224 */  addiu      $v0, $zero, 0x1
    /* 7BF9C 8008BF9C CC1E80A3 */  sb         $zero, %gp_rel(D_8011C64C)($gp)
    /* 7BFA0 8008BFA0 1400A2AF */  sw         $v0, 0x14($sp)
    /* 7BFA4 8008BFA4 1800A2AF */  sw         $v0, 0x18($sp)
    /* 7BFA8 8008BFA8 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7BFAC 8008BFAC 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7BFB0 8008BFB0 2400A2AF */  sw         $v0, 0x24($sp)
    /* 7BFB4 8008BFB4 EC310208 */  j          .L8008C7B0
    /* 7BFB8 8008BFB8 1000A8AF */   sw        $t0, 0x10($sp)
  .L8008BFBC:
    /* 7BFBC 8008BFBC CC1E82A3 */  sb         $v0, %gp_rel(D_8011C64C)($gp)
    /* 7BFC0 8008BFC0 05000224 */  addiu      $v0, $zero, 0x5
    /* 7BFC4 8008BFC4 3B006214 */  bne        $v1, $v0, .L8008C0B4
    /* 7BFC8 8008BFC8 2120C003 */   addu      $a0, $fp, $zero
    /* 7BFCC 8008BFCC 3000A68F */  lw         $a2, 0x30($sp)
    /* 7BFD0 8008BFD0 3800A78F */  lw         $a3, 0x38($sp)
    /* 7BFD4 8008BFD4 202E020C */  jal        DropShadows__Fiiii
    /* 7BFD8 8008BFD8 2128E002 */   addu      $a1, $s7, $zero
    /* 7BFDC 8008BFDC 21800000 */  addu       $s0, $zero, $zero
    /* 7BFE0 8008BFE0 0C80023C */  lui        $v0, %hi(Cxy)
    /* 7BFE4 8008BFE4 108B4224 */  addiu      $v0, $v0, %lo(Cxy)
    /* 7BFE8 8008BFE8 04005324 */  addiu      $s3, $v0, 0x4
    /* 7BFEC 8008BFEC 21904000 */  addu       $s2, $v0, $zero
  .L8008BFF0:
    /* 7BFF0 8008BFF0 0E00022A */  slti       $v0, $s0, 0xE
    /* 7BFF4 8008BFF4 2F004010 */  beqz       $v0, .L8008C0B4
    /* 7BFF8 8008BFF8 C2171000 */   srl       $v0, $s0, 31
    /* 7BFFC 8008BFFC 21100202 */  addu       $v0, $s0, $v0
    /* 7C000 8008C000 43100200 */  sra        $v0, $v0, 1
    /* 7C004 8008C004 22005124 */  addiu      $s1, $v0, 0x22
    /* 7C008 8008C008 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7C00C 8008C00C 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7C010 8008C010 21282002 */   addu      $a1, $s1, $zero
    /* 7C014 8008C014 C0201000 */  sll        $a0, $s0, 3
    /* 7C018 8008C018 0800428C */  lw         $v0, 0x8($v0)
    /* 7C01C 8008C01C 0000468E */  lw         $a2, 0x0($s2)
    /* 7C020 8008C020 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C024 8008C024 421A0200 */  srl        $v1, $v0, 9
    /* 7C028 8008C028 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 7C02C 8008C02C 2110C200 */  addu       $v0, $a2, $v0
    /* 7C030 8008C030 2A104800 */  slt        $v0, $v0, $t0
    /* 7C034 8008C034 1C004010 */  beqz       $v0, .L8008C0A8
    /* 7C038 8008C038 FF016330 */   andi      $v1, $v1, 0x1FF
    /* 7C03C 8008C03C 21109300 */  addu       $v0, $a0, $s3
    /* 7C040 8008C040 0000448C */  lw         $a0, 0x0($v0)
    /* 7C044 8008C044 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C048 8008C048 21108300 */  addu       $v0, $a0, $v1
    /* 7C04C 8008C04C 2A104800 */  slt        $v0, $v0, $t0
    /* 7C050 8008C050 15004010 */  beqz       $v0, .L8008C0A8
    /* 7C054 8008C054 21282002 */   addu      $a1, $s1, $zero
    /* 7C058 8008C058 2138E402 */  addu       $a3, $s7, $a0
    /* 7C05C 8008C05C 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7C060 8008C060 01000232 */  andi       $v0, $s0, 0x1
    /* 7C064 8008C064 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7C068 8008C068 F404828F */  lw         $v0, %gp_rel(MY_DialogOTpos)($gp)
    /* 7C06C 8008C06C 2130C603 */  addu       $a2, $fp, $a2
    /* 7C070 8008C070 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7C074 8008C074 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 7C078 8008C078 1400A2AF */   sw        $v0, 0x14($sp)
    /* 7C07C 8008C07C 21204000 */  addu       $a0, $v0, $zero
    /* 7C080 8008C080 7A048393 */  lbu        $v1, %gp_rel(BACKR)($gp)
    /* 7C084 8008C084 07008290 */  lbu        $v0, 0x7($a0)
    /* 7C088 8008C088 040083A0 */  sb         $v1, 0x4($a0)
    /* 7C08C 8008C08C 7B048393 */  lbu        $v1, %gp_rel(BACKG)($gp)
    /* 7C090 8008C090 02004234 */  ori        $v0, $v0, 0x2
    /* 7C094 8008C094 050083A0 */  sb         $v1, 0x5($a0)
    /* 7C098 8008C098 7C048393 */  lbu        $v1, %gp_rel(BACKB)($gp)
    /* 7C09C 8008C09C FE004230 */  andi       $v0, $v0, 0xFE
    /* 7C0A0 8008C0A0 070082A0 */  sb         $v0, 0x7($a0)
    /* 7C0A4 8008C0A4 060083A0 */  sb         $v1, 0x6($a0)
  .L8008C0A8:
    /* 7C0A8 8008C0A8 08005226 */  addiu      $s2, $s2, 0x8
    /* 7C0AC 8008C0AC FC2F0208 */  j          .L8008BFF0
    /* 7C0B0 8008C0B0 01001026 */   addiu     $s0, $s0, 0x1
  .L8008C0B4:
    /* 7C0B4 8008C0B4 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C0B8 8008C0B8 8C04878F */  lw         $a3, %gp_rel(DialogBackW)($gp)
    /* 7C0BC 8008C0BC 9004848F */  lw         $a0, %gp_rel(DialogBackH)($gp)
    /* 7C0C0 8008C0C0 CD1E80A3 */  sb         $zero, %gp_rel(D_8011C64D)($gp)
    /* 7C0C4 8008C0C4 CE1E80A3 */  sb         $zero, %gp_rel(D_8011C64E)($gp)
    /* 7C0C8 8008C0C8 C21F0800 */  srl        $v1, $t0, 31
    /* 7C0CC 8008C0CC 21180301 */  addu       $v1, $t0, $v1
    /* 7C0D0 8008C0D0 43180300 */  sra        $v1, $v1, 1
    /* 7C0D4 8008C0D4 C2170700 */  srl        $v0, $a3, 31
    /* 7C0D8 8008C0D8 2110E200 */  addu       $v0, $a3, $v0
    /* 7C0DC 8008C0DC 43100200 */  sra        $v0, $v0, 1
    /* 7C0E0 8008C0E0 23906200 */  subu       $s2, $v1, $v0
    /* 7C0E4 8008C0E4 C2170400 */  srl        $v0, $a0, 31
    /* 7C0E8 8008C0E8 21108200 */  addu       $v0, $a0, $v0
    /* 7C0EC 8008C0EC 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C0F0 8008C0F0 43100200 */  sra        $v0, $v0, 1
    /* 7C0F4 8008C0F4 C21F0800 */  srl        $v1, $t0, 31
    /* 7C0F8 8008C0F8 21180301 */  addu       $v1, $t0, $v1
    /* 7C0FC 8008C0FC 43180300 */  sra        $v1, $v1, 1
    /* 7C100 8008C100 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C104 8008C104 23A06200 */  subu       $s4, $v1, $v0
    /* 7C108 8008C108 2A100701 */  slt        $v0, $t0, $a3
    /* 7C10C 8008C10C 5E004010 */  beqz       $v0, .L8008C288
    /* 7C110 8008C110 00000000 */   nop
    /* 7C114 8008C114 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C118 8008C118 00000000 */  nop
    /* 7C11C 8008C11C 2A100401 */  slt        $v0, $t0, $a0
    /* 7C120 8008C120 15004010 */  beqz       $v0, .L8008C178
    /* 7C124 8008C124 2128C003 */   addu      $a1, $fp, $zero
    /* 7C128 8008C128 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C12C 8008C12C 00000000 */  nop
    /* 7C130 8008C130 1A000701 */  div        $zero, $t0, $a3
    /* 7C134 8008C134 10980000 */  mfhi       $s3
    /* 7C138 8008C138 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C13C 8008C13C 00000000 */  nop
    /* 7C140 8008C140 1A000401 */  div        $zero, $t0, $a0
    /* 7C144 8008C144 10B00000 */  mfhi       $s6
    /* 7C148 8008C148 2130E002 */  addu       $a2, $s7, $zero
    /* 7C14C 8008C14C CE1E80A3 */  sb         $zero, %gp_rel(D_8011C64E)($gp)
    /* 7C150 8008C150 CD1E80A3 */  sb         $zero, %gp_rel(D_8011C64D)($gp)
    /* 7C154 8008C154 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C158 8008C158 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C15C 8008C15C 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7C160 8008C160 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C164 8008C164 21386002 */  addu       $a3, $s3, $zero
    /* 7C168 8008C168 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7C16C 8008C16C 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7C170 8008C170 EC310208 */  j          .L8008C7B0
    /* 7C174 8008C174 1800B6AF */   sw        $s6, 0x18($sp)
  .L8008C178:
    /* 7C178 8008C178 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C17C 8008C17C 00000000 */  nop
    /* 7C180 8008C180 1A000701 */  div        $zero, $t0, $a3
    /* 7C184 8008C184 10980000 */  mfhi       $s3
    /* 7C188 8008C188 00000000 */  nop
    /* 7C18C 8008C18C 00000000 */  nop
    /* 7C190 8008C190 1A008402 */  div        $zero, $s4, $a0
    /* 7C194 8008C194 10B00000 */  mfhi       $s6
    /* 7C198 8008C198 2130E002 */  addu       $a2, $s7, $zero
    /* 7C19C 8008C19C CE1E80A3 */  sb         $zero, %gp_rel(D_8011C64E)($gp)
    /* 7C1A0 8008C1A0 CD1E80A3 */  sb         $zero, %gp_rel(D_8011C64D)($gp)
    /* 7C1A4 8008C1A4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C1A8 8008C1A8 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C1AC 8008C1AC 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7C1B0 8008C1B0 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C1B4 8008C1B4 21386002 */  addu       $a3, $s3, $zero
    /* 7C1B8 8008C1B8 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7C1BC 8008C1BC 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7C1C0 8008C1C0 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C1C4 8008C1C4 1800B6AF */   sw        $s6, 0x18($sp)
    /* 7C1C8 8008C1C8 40101600 */  sll        $v0, $s6, 1
    /* 7C1CC 8008C1CC 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C1D0 8008C1D0 9004838F */  lw         $v1, %gp_rel(DialogBackH)($gp)
    /* 7C1D4 8008C1D4 23200201 */  subu       $a0, $t0, $v0
    /* 7C1D8 8008C1D8 1A008300 */  div        $zero, $a0, $v1
    /* 7C1DC 8008C1DC 12280000 */  mflo       $a1
    /* 7C1E0 8008C1E0 21900000 */  addu       $s2, $zero, $zero
    /* 7C1E4 8008C1E4 21A80000 */  addu       $s5, $zero, $zero
    /* 7C1E8 8008C1E8 CE1E8293 */  lbu        $v0, %gp_rel(D_8011C64E)($gp)
    /* 7C1EC 8008C1EC 00000000 */  nop
    /* 7C1F0 8008C1F0 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C1F4 8008C1F4 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7C1F8 8008C1F8 1900A018 */  blez       $a1, .L8008C260
    /* 7C1FC 8008C1FC 21A0C002 */   addu      $s4, $s6, $zero
    /* 7C200 8008C200 21808000 */  addu       $s0, $a0, $zero
  .L8008C204:
    /* 7C204 8008C204 2128D203 */  addu       $a1, $fp, $s2
    /* 7C208 8008C208 2130F402 */  addu       $a2, $s7, $s4
    /* 7C20C 8008C20C 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C210 8008C210 21386002 */  addu       $a3, $s3, $zero
    /* 7C214 8008C214 1000A3AF */  sw         $v1, 0x10($sp)
    /* 7C218 8008C218 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7C21C 8008C21C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7C220 8008C220 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C224 8008C224 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C228 8008C228 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C22C 8008C22C 2400A0AF */   sw        $zero, 0x24($sp)
    /* 7C230 8008C230 9004838F */  lw         $v1, %gp_rel(DialogBackH)($gp)
    /* 7C234 8008C234 00000000 */  nop
    /* 7C238 8008C238 1A000302 */  div        $zero, $s0, $v1
    /* 7C23C 8008C23C 12280000 */  mflo       $a1
    /* 7C240 8008C240 0100B526 */  addiu      $s5, $s5, 0x1
    /* 7C244 8008C244 CE1E8293 */  lbu        $v0, %gp_rel(D_8011C64E)($gp)
    /* 7C248 8008C248 00000000 */  nop
    /* 7C24C 8008C24C 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C250 8008C250 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7C254 8008C254 2A10A502 */  slt        $v0, $s5, $a1
    /* 7C258 8008C258 EAFF4014 */  bnez       $v0, .L8008C204
    /* 7C25C 8008C25C 21A08302 */   addu      $s4, $s4, $v1
  .L8008C260:
    /* 7C260 8008C260 2128D203 */  addu       $a1, $fp, $s2
    /* 7C264 8008C264 2130F402 */  addu       $a2, $s7, $s4
    /* 7C268 8008C268 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C26C 8008C26C 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C270 8008C270 21386002 */  addu       $a3, $s3, $zero
    /* 7C274 8008C274 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7C278 8008C278 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C27C 8008C27C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C280 8008C280 E8310208 */  j          .L8008C7A0
    /* 7C284 8008C284 2400A0AF */   sw        $zero, 0x24($sp)
  .L8008C288:
    /* 7C288 8008C288 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C28C 8008C28C 00000000 */  nop
    /* 7C290 8008C290 2A100401 */  slt        $v0, $t0, $a0
    /* 7C294 8008C294 46004010 */  beqz       $v0, .L8008C3B0
    /* 7C298 8008C298 2128C003 */   addu      $a1, $fp, $zero
    /* 7C29C 8008C29C 1A004702 */  div        $zero, $s2, $a3
    /* 7C2A0 8008C2A0 10980000 */  mfhi       $s3
    /* 7C2A4 8008C2A4 00000000 */  nop
    /* 7C2A8 8008C2A8 00000000 */  nop
    /* 7C2AC 8008C2AC 1A000401 */  div        $zero, $t0, $a0
    /* 7C2B0 8008C2B0 10B00000 */  mfhi       $s6
    /* 7C2B4 8008C2B4 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C2B8 8008C2B8 2130E002 */  addu       $a2, $s7, $zero
    /* 7C2BC 8008C2BC CE1E80A3 */  sb         $zero, %gp_rel(D_8011C64E)($gp)
    /* 7C2C0 8008C2C0 CD1E80A3 */  sb         $zero, %gp_rel(D_8011C64D)($gp)
    /* 7C2C4 8008C2C4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C2C8 8008C2C8 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C2CC 8008C2CC 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7C2D0 8008C2D0 21386002 */  addu       $a3, $s3, $zero
    /* 7C2D4 8008C2D4 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7C2D8 8008C2D8 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7C2DC 8008C2DC 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C2E0 8008C2E0 1800B6AF */   sw        $s6, 0x18($sp)
    /* 7C2E4 8008C2E4 40101300 */  sll        $v0, $s3, 1
    /* 7C2E8 8008C2E8 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C2EC 8008C2EC 8C04838F */  lw         $v1, %gp_rel(DialogBackW)($gp)
    /* 7C2F0 8008C2F0 23200201 */  subu       $a0, $t0, $v0
    /* 7C2F4 8008C2F4 1A008300 */  div        $zero, $a0, $v1
    /* 7C2F8 8008C2F8 12280000 */  mflo       $a1
    /* 7C2FC 8008C2FC 21880000 */  addu       $s1, $zero, $zero
    /* 7C300 8008C300 21A00000 */  addu       $s4, $zero, $zero
    /* 7C304 8008C304 CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C308 8008C308 00000000 */  nop
    /* 7C30C 8008C30C 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C310 8008C310 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C314 8008C314 1900A018 */  blez       $a1, .L8008C37C
    /* 7C318 8008C318 21906002 */   addu      $s2, $s3, $zero
    /* 7C31C 8008C31C 21808000 */  addu       $s0, $a0, $zero
  .L8008C320:
    /* 7C320 8008C320 2128D203 */  addu       $a1, $fp, $s2
    /* 7C324 8008C324 2130F402 */  addu       $a2, $s7, $s4
    /* 7C328 8008C328 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C32C 8008C32C 21386000 */  addu       $a3, $v1, $zero
    /* 7C330 8008C330 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7C334 8008C334 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7C338 8008C338 1800B6AF */  sw         $s6, 0x18($sp)
    /* 7C33C 8008C33C 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C340 8008C340 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C344 8008C344 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C348 8008C348 2400A0AF */   sw        $zero, 0x24($sp)
    /* 7C34C 8008C34C 8C04838F */  lw         $v1, %gp_rel(DialogBackW)($gp)
    /* 7C350 8008C350 00000000 */  nop
    /* 7C354 8008C354 1A000302 */  div        $zero, $s0, $v1
    /* 7C358 8008C358 12280000 */  mflo       $a1
    /* 7C35C 8008C35C 01003126 */  addiu      $s1, $s1, 0x1
    /* 7C360 8008C360 CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C364 8008C364 00000000 */  nop
    /* 7C368 8008C368 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C36C 8008C36C CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C370 8008C370 2A102502 */  slt        $v0, $s1, $a1
    /* 7C374 8008C374 EAFF4014 */  bnez       $v0, .L8008C320
    /* 7C378 8008C378 21904302 */   addu      $s2, $s2, $v1
  .L8008C37C:
    /* 7C37C 8008C37C 2128D203 */  addu       $a1, $fp, $s2
    /* 7C380 8008C380 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C384 8008C384 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C388 8008C388 2130F402 */  addu       $a2, $s7, $s4
    /* 7C38C 8008C38C 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7C390 8008C390 1800B6AF */  sw         $s6, 0x18($sp)
    /* 7C394 8008C394 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C398 8008C398 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C39C 8008C39C 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7C3A0 8008C3A0 01000731 */  andi       $a3, $t0, 0x1
    /* 7C3A4 8008C3A4 21386702 */  addu       $a3, $s3, $a3
    /* 7C3A8 8008C3A8 EC310208 */  j          .L8008C7B0
    /* 7C3AC 8008C3AC 1400A7AF */   sw        $a3, 0x14($sp)
  .L8008C3B0:
    /* 7C3B0 8008C3B0 1A008402 */  div        $zero, $s4, $a0
    /* 7C3B4 8008C3B4 10B00000 */  mfhi       $s6
    /* 7C3B8 8008C3B8 CE1E80A3 */  sb         $zero, %gp_rel(D_8011C64E)($gp)
    /* 7C3BC 8008C3BC 00000000 */  nop
    /* 7C3C0 8008C3C0 1A004702 */  div        $zero, $s2, $a3
    /* 7C3C4 8008C3C4 10980000 */  mfhi       $s3
    /* 7C3C8 8008C3C8 4800C01A */  blez       $s6, .L8008C4EC
    /* 7C3CC 8008C3CC 21A00000 */   addu      $s4, $zero, $zero
    /* 7C3D0 8008C3D0 CD1E80A3 */  sb         $zero, %gp_rel(D_8011C64D)($gp)
    /* 7C3D4 8008C3D4 0B00601A */  blez       $s3, .L8008C404
    /* 7C3D8 8008C3D8 2128C003 */   addu      $a1, $fp, $zero
    /* 7C3DC 8008C3DC 2130E002 */  addu       $a2, $s7, $zero
    /* 7C3E0 8008C3E0 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C3E4 8008C3E4 21386002 */  addu       $a3, $s3, $zero
    /* 7C3E8 8008C3E8 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7C3EC 8008C3EC 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7C3F0 8008C3F0 1800B6AF */  sw         $s6, 0x18($sp)
    /* 7C3F4 8008C3F4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C3F8 8008C3F8 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C3FC 8008C3FC 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C400 8008C400 2400A0AF */   sw        $zero, 0x24($sp)
  .L8008C404:
    /* 7C404 8008C404 CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C408 8008C408 8C04838F */  lw         $v1, %gp_rel(DialogBackW)($gp)
    /* 7C40C 8008C40C 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C410 8008C410 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C414 8008C414 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C418 8008C418 2A100301 */  slt        $v0, $t0, $v1
    /* 7C41C 8008C41C 21004014 */  bnez       $v0, .L8008C4A4
    /* 7C420 8008C420 21906002 */   addu      $s2, $s3, $zero
    /* 7C424 8008C424 40101300 */  sll        $v0, $s3, 1
    /* 7C428 8008C428 23200201 */  subu       $a0, $t0, $v0
    /* 7C42C 8008C42C 1A008300 */  div        $zero, $a0, $v1
    /* 7C430 8008C430 12280000 */  mflo       $a1
    /* 7C434 8008C434 00000000 */  nop
    /* 7C438 8008C438 2A108502 */  slt        $v0, $s4, $a1
    /* 7C43C 8008C43C 19004010 */  beqz       $v0, .L8008C4A4
    /* 7C440 8008C440 21880000 */   addu      $s1, $zero, $zero
    /* 7C444 8008C444 21808000 */  addu       $s0, $a0, $zero
  .L8008C448:
    /* 7C448 8008C448 2128D203 */  addu       $a1, $fp, $s2
    /* 7C44C 8008C44C 2130F402 */  addu       $a2, $s7, $s4
    /* 7C450 8008C450 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C454 8008C454 21386000 */  addu       $a3, $v1, $zero
    /* 7C458 8008C458 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7C45C 8008C45C 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7C460 8008C460 1800B6AF */  sw         $s6, 0x18($sp)
    /* 7C464 8008C464 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C468 8008C468 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C46C 8008C46C 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C470 8008C470 2400A0AF */   sw        $zero, 0x24($sp)
    /* 7C474 8008C474 8C04838F */  lw         $v1, %gp_rel(DialogBackW)($gp)
    /* 7C478 8008C478 00000000 */  nop
    /* 7C47C 8008C47C 1A000302 */  div        $zero, $s0, $v1
    /* 7C480 8008C480 12280000 */  mflo       $a1
    /* 7C484 8008C484 01003126 */  addiu      $s1, $s1, 0x1
    /* 7C488 8008C488 CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C48C 8008C48C 00000000 */  nop
    /* 7C490 8008C490 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C494 8008C494 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C498 8008C498 2A102502 */  slt        $v0, $s1, $a1
    /* 7C49C 8008C49C EAFF4014 */  bnez       $v0, .L8008C448
    /* 7C4A0 8008C4A0 21904302 */   addu      $s2, $s2, $v1
  .L8008C4A4:
    /* 7C4A4 8008C4A4 0D00601A */  blez       $s3, .L8008C4DC
    /* 7C4A8 8008C4A8 2128D203 */   addu      $a1, $fp, $s2
    /* 7C4AC 8008C4AC 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C4B0 8008C4B0 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C4B4 8008C4B4 2130F402 */  addu       $a2, $s7, $s4
    /* 7C4B8 8008C4B8 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7C4BC 8008C4BC 1800B6AF */  sw         $s6, 0x18($sp)
    /* 7C4C0 8008C4C0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C4C4 8008C4C4 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C4C8 8008C4C8 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7C4CC 8008C4CC 01000731 */  andi       $a3, $t0, 0x1
    /* 7C4D0 8008C4D0 21386702 */  addu       $a3, $s3, $a3
    /* 7C4D4 8008C4D4 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C4D8 8008C4D8 1400A7AF */   sw        $a3, 0x14($sp)
  .L8008C4DC:
    /* 7C4DC 8008C4DC CE1E8293 */  lbu        $v0, %gp_rel(D_8011C64E)($gp)
    /* 7C4E0 8008C4E0 21A09602 */  addu       $s4, $s4, $s6
    /* 7C4E4 8008C4E4 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C4E8 8008C4E8 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
  .L8008C4EC:
    /* 7C4EC 8008C4EC 9004838F */  lw         $v1, %gp_rel(DialogBackH)($gp)
    /* 7C4F0 8008C4F0 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C4F4 8008C4F4 00000000 */  nop
    /* 7C4F8 8008C4F8 2A100301 */  slt        $v0, $t0, $v1
    /* 7C4FC 8008C4FC 60004014 */  bnez       $v0, .L8008C680
    /* 7C500 8008C500 40101600 */   sll       $v0, $s6, 1
    /* 7C504 8008C504 23280201 */  subu       $a1, $t0, $v0
    /* 7C508 8008C508 1A00A300 */  div        $zero, $a1, $v1
    /* 7C50C 8008C50C 12200000 */  mflo       $a0
    /* 7C510 8008C510 00000000 */  nop
    /* 7C514 8008C514 5A008018 */  blez       $a0, .L8008C680
    /* 7C518 8008C518 21A80000 */   addu      $s5, $zero, $zero
    /* 7C51C 8008C51C 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C520 8008C520 40101300 */  sll        $v0, $s3, 1
    /* 7C524 8008C524 4000A5AF */  sw         $a1, 0x40($sp)
    /* 7C528 8008C528 23100201 */  subu       $v0, $t0, $v0
    /* 7C52C 8008C52C 6800A2AF */  sw         $v0, 0x68($sp)
    /* 7C530 8008C530 01000231 */  andi       $v0, $t0, 0x1
    /* 7C534 8008C534 21106202 */  addu       $v0, $s3, $v0
    /* 7C538 8008C538 4800A2AF */  sw         $v0, 0x48($sp)
  .L8008C53C:
    /* 7C53C 8008C53C CD1E80A3 */  sb         $zero, %gp_rel(D_8011C64D)($gp)
    /* 7C540 8008C540 0B00601A */  blez       $s3, .L8008C570
    /* 7C544 8008C544 2128C003 */   addu      $a1, $fp, $zero
    /* 7C548 8008C548 2130F402 */  addu       $a2, $s7, $s4
    /* 7C54C 8008C54C 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C550 8008C550 21386002 */  addu       $a3, $s3, $zero
    /* 7C554 8008C554 1000A3AF */  sw         $v1, 0x10($sp)
    /* 7C558 8008C558 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7C55C 8008C55C 1800A3AF */  sw         $v1, 0x18($sp)
    /* 7C560 8008C560 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C564 8008C564 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C568 8008C568 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C56C 8008C56C 2400A0AF */   sw        $zero, 0x24($sp)
  .L8008C570:
    /* 7C570 8008C570 CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C574 8008C574 8C04838F */  lw         $v1, %gp_rel(DialogBackW)($gp)
    /* 7C578 8008C578 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C57C 8008C57C 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C580 8008C580 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C584 8008C584 2A100301 */  slt        $v0, $t0, $v1
    /* 7C588 8008C588 23004014 */  bnez       $v0, .L8008C618
    /* 7C58C 8008C58C 21906002 */   addu      $s2, $s3, $zero
    /* 7C590 8008C590 6800A88F */  lw         $t0, 0x68($sp)
    /* 7C594 8008C594 00000000 */  nop
    /* 7C598 8008C598 1A000301 */  div        $zero, $t0, $v1
    /* 7C59C 8008C59C 12200000 */  mflo       $a0
    /* 7C5A0 8008C5A0 00000000 */  nop
    /* 7C5A4 8008C5A4 1C008018 */  blez       $a0, .L8008C618
    /* 7C5A8 8008C5A8 21880000 */   addu      $s1, $zero, $zero
    /* 7C5AC 8008C5AC 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C5B0 8008C5B0 40101300 */  sll        $v0, $s3, 1
    /* 7C5B4 8008C5B4 23800201 */  subu       $s0, $t0, $v0
  .L8008C5B8:
    /* 7C5B8 8008C5B8 2128D203 */  addu       $a1, $fp, $s2
    /* 7C5BC 8008C5BC 2130F402 */  addu       $a2, $s7, $s4
    /* 7C5C0 8008C5C0 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C5C4 8008C5C4 9004828F */  lw         $v0, %gp_rel(DialogBackH)($gp)
    /* 7C5C8 8008C5C8 21386000 */  addu       $a3, $v1, $zero
    /* 7C5CC 8008C5CC 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7C5D0 8008C5D0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C5D4 8008C5D4 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C5D8 8008C5D8 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7C5DC 8008C5DC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7C5E0 8008C5E0 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C5E4 8008C5E4 1800A2AF */   sw        $v0, 0x18($sp)
    /* 7C5E8 8008C5E8 8C04838F */  lw         $v1, %gp_rel(DialogBackW)($gp)
    /* 7C5EC 8008C5EC 00000000 */  nop
    /* 7C5F0 8008C5F0 1A000302 */  div        $zero, $s0, $v1
    /* 7C5F4 8008C5F4 12200000 */  mflo       $a0
    /* 7C5F8 8008C5F8 01003126 */  addiu      $s1, $s1, 0x1
    /* 7C5FC 8008C5FC CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C600 8008C600 00000000 */  nop
    /* 7C604 8008C604 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C608 8008C608 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C60C 8008C60C 2A102402 */  slt        $v0, $s1, $a0
    /* 7C610 8008C610 E9FF4014 */  bnez       $v0, .L8008C5B8
    /* 7C614 8008C614 21904302 */   addu      $s2, $s2, $v1
  .L8008C618:
    /* 7C618 8008C618 0C00601A */  blez       $s3, .L8008C64C
    /* 7C61C 8008C61C 2128D203 */   addu      $a1, $fp, $s2
    /* 7C620 8008C620 4800A78F */  lw         $a3, 0x48($sp)
    /* 7C624 8008C624 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C628 8008C628 9004828F */  lw         $v0, %gp_rel(DialogBackH)($gp)
    /* 7C62C 8008C62C 2130F402 */  addu       $a2, $s7, $s4
    /* 7C630 8008C630 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C634 8008C634 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C638 8008C638 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7C63C 8008C63C 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7C640 8008C640 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7C644 8008C644 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C648 8008C648 1800A2AF */   sw        $v0, 0x18($sp)
  .L8008C64C:
    /* 7C64C 8008C64C 9004838F */  lw         $v1, %gp_rel(DialogBackH)($gp)
    /* 7C650 8008C650 4000A88F */  lw         $t0, 0x40($sp)
    /* 7C654 8008C654 00000000 */  nop
    /* 7C658 8008C658 1A000301 */  div        $zero, $t0, $v1
    /* 7C65C 8008C65C 12200000 */  mflo       $a0
    /* 7C660 8008C660 0100B526 */  addiu      $s5, $s5, 0x1
    /* 7C664 8008C664 CE1E8293 */  lbu        $v0, %gp_rel(D_8011C64E)($gp)
    /* 7C668 8008C668 00000000 */  nop
    /* 7C66C 8008C66C 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C670 8008C670 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7C674 8008C674 2A10A402 */  slt        $v0, $s5, $a0
    /* 7C678 8008C678 B0FF4014 */  bnez       $v0, .L8008C53C
    /* 7C67C 8008C67C 21A08302 */   addu      $s4, $s4, $v1
  .L8008C680:
    /* 7C680 8008C680 4D00C01A */  blez       $s6, .L8008C7B8
    /* 7C684 8008C684 00000000 */   nop
    /* 7C688 8008C688 CD1E80A3 */  sb         $zero, %gp_rel(D_8011C64D)($gp)
    /* 7C68C 8008C68C 0E00601A */  blez       $s3, .L8008C6C8
    /* 7C690 8008C690 2128C003 */   addu      $a1, $fp, $zero
    /* 7C694 8008C694 2130F402 */  addu       $a2, $s7, $s4
    /* 7C698 8008C698 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C69C 8008C69C 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C6A0 8008C6A0 21386002 */  addu       $a3, $s3, $zero
    /* 7C6A4 8008C6A4 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7C6A8 8008C6A8 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C6AC 8008C6AC 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C6B0 8008C6B0 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7C6B4 8008C6B4 01000231 */  andi       $v0, $t0, 0x1
    /* 7C6B8 8008C6B8 2110C202 */  addu       $v0, $s6, $v0
    /* 7C6BC 8008C6BC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7C6C0 8008C6C0 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C6C4 8008C6C4 1800A2AF */   sw        $v0, 0x18($sp)
  .L8008C6C8:
    /* 7C6C8 8008C6C8 CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C6CC 8008C6CC 8C04838F */  lw         $v1, %gp_rel(DialogBackW)($gp)
    /* 7C6D0 8008C6D0 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C6D4 8008C6D4 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C6D8 8008C6D8 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C6DC 8008C6DC 2A100301 */  slt        $v0, $t0, $v1
    /* 7C6E0 8008C6E0 23004014 */  bnez       $v0, .L8008C770
    /* 7C6E4 8008C6E4 21906002 */   addu      $s2, $s3, $zero
    /* 7C6E8 8008C6E8 40101300 */  sll        $v0, $s3, 1
    /* 7C6EC 8008C6EC 23280201 */  subu       $a1, $t0, $v0
    /* 7C6F0 8008C6F0 1A00A300 */  div        $zero, $a1, $v1
    /* 7C6F4 8008C6F4 12200000 */  mflo       $a0
    /* 7C6F8 8008C6F8 00000000 */  nop
    /* 7C6FC 8008C6FC 1C008018 */  blez       $a0, .L8008C770
    /* 7C700 8008C700 21880000 */   addu      $s1, $zero, $zero
    /* 7C704 8008C704 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C708 8008C708 2180A000 */  addu       $s0, $a1, $zero
    /* 7C70C 8008C70C 01000231 */  andi       $v0, $t0, 0x1
    /* 7C710 8008C710 21A8C202 */  addu       $s5, $s6, $v0
  .L8008C714:
    /* 7C714 8008C714 2128D203 */  addu       $a1, $fp, $s2
    /* 7C718 8008C718 2130F402 */  addu       $a2, $s7, $s4
    /* 7C71C 8008C71C 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C720 8008C720 21386000 */  addu       $a3, $v1, $zero
    /* 7C724 8008C724 1000B5AF */  sw         $s5, 0x10($sp)
    /* 7C728 8008C728 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7C72C 8008C72C 1800B5AF */  sw         $s5, 0x18($sp)
    /* 7C730 8008C730 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C734 8008C734 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C738 8008C738 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C73C 8008C73C 2400A0AF */   sw        $zero, 0x24($sp)
    /* 7C740 8008C740 8C04838F */  lw         $v1, %gp_rel(DialogBackW)($gp)
    /* 7C744 8008C744 00000000 */  nop
    /* 7C748 8008C748 1A000302 */  div        $zero, $s0, $v1
    /* 7C74C 8008C74C 12200000 */  mflo       $a0
    /* 7C750 8008C750 01003126 */  addiu      $s1, $s1, 0x1
    /* 7C754 8008C754 CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C758 8008C758 00000000 */  nop
    /* 7C75C 8008C75C 01004224 */  addiu      $v0, $v0, 0x1
    /* 7C760 8008C760 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7C764 8008C764 2A102402 */  slt        $v0, $s1, $a0
    /* 7C768 8008C768 EAFF4014 */  bnez       $v0, .L8008C714
    /* 7C76C 8008C76C 21904302 */   addu      $s2, $s2, $v1
  .L8008C770:
    /* 7C770 8008C770 1100601A */  blez       $s3, .L8008C7B8
    /* 7C774 8008C774 2128D203 */   addu      $a1, $fp, $s2
    /* 7C778 8008C778 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C77C 8008C77C 8804848F */  lw         $a0, %gp_rel(DialogBackGfx)($gp)
    /* 7C780 8008C780 2130F402 */  addu       $a2, $s7, $s4
    /* 7C784 8008C784 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C788 8008C788 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C78C 8008C78C 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7C790 8008C790 01000731 */  andi       $a3, $t0, 0x1
    /* 7C794 8008C794 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C798 8008C798 21386702 */  addu       $a3, $s3, $a3
    /* 7C79C 8008C79C 1400A7AF */  sw         $a3, 0x14($sp)
  .L8008C7A0:
    /* 7C7A0 8008C7A0 01000231 */  andi       $v0, $t0, 0x1
    /* 7C7A4 8008C7A4 2110C202 */  addu       $v0, $s6, $v0
    /* 7C7A8 8008C7A8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7C7AC 8008C7AC 1800A2AF */  sw         $v0, 0x18($sp)
  .L8008C7B0:
    /* 7C7B0 8008C7B0 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C7B4 8008C7B4 00000000 */   nop
  .L8008C7B8:
    /* 7C7B8 8008C7B8 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7C7BC 8008C7BC 12000224 */  addiu      $v0, $zero, 0x12
    /* 7C7C0 8008C7C0 CC1E80A3 */  sb         $zero, %gp_rel(D_8011C64C)($gp)
    /* 7C7C4 8008C7C4 0200A210 */  beq        $a1, $v0, .L8008C7D0
    /* 7C7C8 8008C7C8 02000224 */   addiu     $v0, $zero, 0x2
    /* 7C7CC 8008C7CC CC1E82A3 */  sb         $v0, %gp_rel(D_8011C64C)($gp)
  .L8008C7D0:
    /* 7C7D0 8008C7D0 FFFFC627 */  addiu      $a2, $fp, -0x1
    /* 7C7D4 8008C7D4 FFFFF026 */  addiu      $s0, $s7, -0x1
    /* 7C7D8 8008C7D8 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7C7DC 8008C7DC F404828F */  lw         $v0, %gp_rel(MY_DialogOTpos)($gp)
    /* 7C7E0 8008C7E0 21380002 */  addu       $a3, $s0, $zero
    /* 7C7E4 8008C7E4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 7C7E8 8008C7E8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7C7EC 8008C7EC 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 7C7F0 8008C7F0 1400A2AF */   sw        $v0, 0x14($sp)
    /* 7C7F4 8008C7F4 7D048393 */  lbu        $v1, %gp_rel(DialogRed)($gp)
    /* 7C7F8 8008C7F8 21204000 */  addu       $a0, $v0, $zero
    /* 7C7FC 8008C7FC 040083A0 */  sb         $v1, 0x4($a0)
    /* 7C800 8008C800 7E048293 */  lbu        $v0, %gp_rel(DialogGreen)($gp)
    /* 7C804 8008C804 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C808 8008C808 21380002 */  addu       $a3, $s0, $zero
    /* 7C80C 8008C80C 050082A0 */  sb         $v0, 0x5($a0)
    /* 7C810 8008C810 07008290 */  lbu        $v0, 0x7($a0)
    /* 7C814 8008C814 7F048393 */  lbu        $v1, %gp_rel(DialogBlue)($gp)
    /* 7C818 8008C818 FC004230 */  andi       $v0, $v0, 0xFC
    /* 7C81C 8008C81C 070082A0 */  sb         $v0, 0x7($a0)
    /* 7C820 8008C820 060083A0 */  sb         $v1, 0x6($a0)
    /* 7C824 8008C824 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7C828 8008C828 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7C82C 8008C82C F404828F */  lw         $v0, %gp_rel(MY_DialogOTpos)($gp)
    /* 7C830 8008C830 2130C803 */  addu       $a2, $fp, $t0
    /* 7C834 8008C834 1000A0AF */  sw         $zero, 0x10($sp)
    /* 7C838 8008C838 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7C83C 8008C83C 0200A524 */  addiu      $a1, $a1, 0x2
    /* 7C840 8008C840 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 7C844 8008C844 1400A2AF */   sw        $v0, 0x14($sp)
    /* 7C848 8008C848 7D048393 */  lbu        $v1, %gp_rel(DialogRed)($gp)
    /* 7C84C 8008C84C 21204000 */  addu       $a0, $v0, $zero
    /* 7C850 8008C850 040083A0 */  sb         $v1, 0x4($a0)
    /* 7C854 8008C854 7E048293 */  lbu        $v0, %gp_rel(DialogGreen)($gp)
    /* 7C858 8008C858 00000000 */  nop
    /* 7C85C 8008C85C 050082A0 */  sb         $v0, 0x5($a0)
    /* 7C860 8008C860 07008290 */  lbu        $v0, 0x7($a0)
    /* 7C864 8008C864 7F048393 */  lbu        $v1, %gp_rel(DialogBlue)($gp)
    /* 7C868 8008C868 FC004230 */  andi       $v0, $v0, 0xFC
    /* 7C86C 8008C86C 070082A0 */  sb         $v0, 0x7($a0)
    /* 7C870 8008C870 060083A0 */  sb         $v1, 0x6($a0)
    /* 7C874 8008C874 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7C878 8008C878 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C87C 8008C87C 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7C880 8008C880 F404828F */  lw         $v0, %gp_rel(MY_DialogOTpos)($gp)
    /* 7C884 8008C884 FFFFC627 */  addiu      $a2, $fp, -0x1
    /* 7C888 8008C888 1000A0AF */  sw         $zero, 0x10($sp)
    /* 7C88C 8008C88C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7C890 8008C890 2138E802 */  addu       $a3, $s7, $t0
    /* 7C894 8008C894 0500A524 */  addiu      $a1, $a1, 0x5
    /* 7C898 8008C898 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 7C89C 8008C89C 1400A2AF */   sw        $v0, 0x14($sp)
    /* 7C8A0 8008C8A0 7D048393 */  lbu        $v1, %gp_rel(DialogRed)($gp)
    /* 7C8A4 8008C8A4 21204000 */  addu       $a0, $v0, $zero
    /* 7C8A8 8008C8A8 040083A0 */  sb         $v1, 0x4($a0)
    /* 7C8AC 8008C8AC 7E048293 */  lbu        $v0, %gp_rel(DialogGreen)($gp)
    /* 7C8B0 8008C8B0 00000000 */  nop
    /* 7C8B4 8008C8B4 050082A0 */  sb         $v0, 0x5($a0)
    /* 7C8B8 8008C8B8 7F048293 */  lbu        $v0, %gp_rel(DialogBlue)($gp)
    /* 7C8BC 8008C8BC 00000000 */  nop
    /* 7C8C0 8008C8C0 060082A0 */  sb         $v0, 0x6($a0)
    /* 7C8C4 8008C8C4 07008290 */  lbu        $v0, 0x7($a0)
    /* 7C8C8 8008C8C8 00000000 */  nop
    /* 7C8CC 8008C8CC FD004230 */  andi       $v0, $v0, 0xFD
    /* 7C8D0 8008C8D0 070082A0 */  sb         $v0, 0x7($a0)
    /* 7C8D4 8008C8D4 3000A88F */  lw         $t0, 0x30($sp)
    /* 7C8D8 8008C8D8 07008290 */  lbu        $v0, 0x7($a0)
    /* 7C8DC 8008C8DC 2130C803 */  addu       $a2, $fp, $t0
    /* 7C8E0 8008C8E0 FE004230 */  andi       $v0, $v0, 0xFE
    /* 7C8E4 8008C8E4 070082A0 */  sb         $v0, 0x7($a0)
    /* 7C8E8 8008C8E8 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7C8EC 8008C8EC 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C8F0 8008C8F0 9404858F */  lw         $a1, %gp_rel(DialogBorderGfx)($gp)
    /* 7C8F4 8008C8F4 F404828F */  lw         $v0, %gp_rel(MY_DialogOTpos)($gp)
    /* 7C8F8 8008C8F8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 7C8FC 8008C8FC 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7C900 8008C900 2138E802 */  addu       $a3, $s7, $t0
    /* 7C904 8008C904 0700A524 */  addiu      $a1, $a1, 0x7
    /* 7C908 8008C908 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 7C90C 8008C90C 1400A2AF */   sw        $v0, 0x14($sp)
    /* 7C910 8008C910 7D048393 */  lbu        $v1, %gp_rel(DialogRed)($gp)
    /* 7C914 8008C914 21204000 */  addu       $a0, $v0, $zero
    /* 7C918 8008C918 040083A0 */  sb         $v1, 0x4($a0)
    /* 7C91C 8008C91C 7E048293 */  lbu        $v0, %gp_rel(DialogGreen)($gp)
    /* 7C920 8008C920 00000000 */  nop
    /* 7C924 8008C924 050082A0 */  sb         $v0, 0x5($a0)
    /* 7C928 8008C928 7F048293 */  lbu        $v0, %gp_rel(DialogBlue)($gp)
    /* 7C92C 8008C92C 00000000 */  nop
    /* 7C930 8008C930 060082A0 */  sb         $v0, 0x6($a0)
    /* 7C934 8008C934 07008290 */  lbu        $v0, 0x7($a0)
    /* 7C938 8008C938 00000000 */  nop
    /* 7C93C 8008C93C FD004230 */  andi       $v0, $v0, 0xFD
    /* 7C940 8008C940 070082A0 */  sb         $v0, 0x7($a0)
    /* 7C944 8008C944 07008290 */  lbu        $v0, 0x7($a0)
    /* 7C948 8008C948 01000624 */  addiu      $a2, $zero, 0x1
    /* 7C94C 8008C94C FE004230 */  andi       $v0, $v0, 0xFE
    /* 7C950 8008C950 070082A0 */  sb         $v0, 0x7($a0)
    /* 7C954 8008C954 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7C958 8008C958 12000224 */  addiu      $v0, $zero, 0x12
    /* 7C95C 8008C95C CD1E86A3 */  sb         $a2, %gp_rel(D_8011C64D)($gp)
    /* 7C960 8008C960 CE1E86A3 */  sb         $a2, %gp_rel(D_8011C64E)($gp)
    /* 7C964 8008C964 03008210 */  beq        $a0, $v0, .L8008C974
    /* 7C968 8008C968 1A000224 */   addiu     $v0, $zero, 0x1A
    /* 7C96C 8008C96C 3A008214 */  bne        $a0, $v0, .L8008CA58
    /* 7C970 8008C970 00000000 */   nop
  .L8008C974:
    /* 7C974 8008C974 01008424 */  addiu      $a0, $a0, 0x1
    /* 7C978 8008C978 2128C003 */  addu       $a1, $fp, $zero
    /* 7C97C 8008C97C FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 7C980 8008C980 21400000 */  addu       $t0, $zero, $zero
    /* 7C984 8008C984 00860800 */  sll        $s0, $t0, 24
    /* 7C988 8008C988 3000A78F */  lw         $a3, 0x30($sp)
    /* 7C98C 8008C98C BC04828F */  lw         $v0, %gp_rel(DialogBorderTH)($gp)
    /* 7C990 8008C990 03861000 */  sra        $s0, $s0, 24
    /* 7C994 8008C994 1400A0AF */  sw         $zero, 0x14($sp)
    /* 7C998 8008C998 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7C99C 8008C99C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 7C9A0 8008C9A0 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7C9A4 8008C9A4 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7C9A8 8008C9A8 2330E202 */  subu       $a2, $s7, $v0
    /* 7C9AC 8008C9AC 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C9B0 8008C9B0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 7C9B4 8008C9B4 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C9B8 8008C9B8 3000A78F */  lw         $a3, 0x30($sp)
    /* 7C9BC 8008C9BC 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7C9C0 8008C9C0 C404828F */  lw         $v0, %gp_rel(DialogBorderBH)($gp)
    /* 7C9C4 8008C9C4 2128C003 */  addu       $a1, $fp, $zero
    /* 7C9C8 8008C9C8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 7C9CC 8008C9CC 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7C9D0 8008C9D0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7C9D4 8008C9D4 2000B1AF */  sw         $s1, 0x20($sp)
    /* 7C9D8 8008C9D8 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7C9DC 8008C9DC 2130E802 */  addu       $a2, $s7, $t0
    /* 7C9E0 8008C9E0 06008424 */  addiu      $a0, $a0, 0x6
    /* 7C9E4 8008C9E4 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7C9E8 8008C9E8 1000A2AF */   sw        $v0, 0x10($sp)
    /* 7C9EC 8008C9EC 3800A88F */  lw         $t0, 0x38($sp)
    /* 7C9F0 8008C9F0 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7C9F4 8008C9F4 C804878F */  lw         $a3, %gp_rel(DialogBorderLW)($gp)
    /* 7C9F8 8008C9F8 2130E002 */  addu       $a2, $s7, $zero
    /* 7C9FC 8008C9FC 1400A0AF */  sw         $zero, 0x14($sp)
    /* 7CA00 8008CA00 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7CA04 8008CA04 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CA08 8008CA08 2000B1AF */  sw         $s1, 0x20($sp)
    /* 7CA0C 8008CA0C 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CA10 8008CA10 03008424 */  addiu      $a0, $a0, 0x3
    /* 7CA14 8008CA14 2328C703 */  subu       $a1, $fp, $a3
    /* 7CA18 8008CA18 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CA1C 8008CA1C 1000A8AF */   sw        $t0, 0x10($sp)
    /* 7CA20 8008CA20 3000A88F */  lw         $t0, 0x30($sp)
    /* 7CA24 8008CA24 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CA28 8008CA28 D004878F */  lw         $a3, %gp_rel(DialogBorderRW)($gp)
    /* 7CA2C 8008CA2C 2130E002 */  addu       $a2, $s7, $zero
    /* 7CA30 8008CA30 1400A0AF */  sw         $zero, 0x14($sp)
    /* 7CA34 8008CA34 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7CA38 8008CA38 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CA3C 8008CA3C 2000B1AF */  sw         $s1, 0x20($sp)
    /* 7CA40 8008CA40 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CA44 8008CA44 2128C803 */  addu       $a1, $fp, $t0
    /* 7CA48 8008CA48 3800A88F */  lw         $t0, 0x38($sp)
    /* 7CA4C 8008CA4C 04008424 */  addiu      $a0, $a0, 0x4
    /* 7CA50 8008CA50 E7330208 */  j          .L8008CF9C
    /* 7CA54 8008CA54 1000A8AF */   sw        $t0, 0x10($sp)
  .L8008CA58:
    /* 7CA58 8008CA58 B804878F */  lw         $a3, %gp_rel(DialogBorderTW)($gp)
    /* 7CA5C 8008CA5C 3000A88F */  lw         $t0, 0x30($sp)
    /* 7CA60 8008CA60 00000000 */  nop
    /* 7CA64 8008CA64 2A100701 */  slt        $v0, $t0, $a3
    /* 7CA68 8008CA68 81004014 */  bnez       $v0, .L8008CC70
    /* 7CA6C 8008CA6C C21F0800 */   srl       $v1, $t0, 31
    /* 7CA70 8008CA70 21180301 */  addu       $v1, $t0, $v1
    /* 7CA74 8008CA74 43180300 */  sra        $v1, $v1, 1
    /* 7CA78 8008CA78 C2170700 */  srl        $v0, $a3, 31
    /* 7CA7C 8008CA7C 2110E200 */  addu       $v0, $a3, $v0
    /* 7CA80 8008CA80 43100200 */  sra        $v0, $v0, 1
    /* 7CA84 8008CA84 23906200 */  subu       $s2, $v1, $v0
    /* 7CA88 8008CA88 1A004702 */  div        $zero, $s2, $a3
    /* 7CA8C 8008CA8C 10980000 */  mfhi       $s3
    /* 7CA90 8008CA90 CD1E86A3 */  sb         $a2, %gp_rel(D_8011C64D)($gp)
    /* 7CA94 8008CA94 2000601A */  blez       $s3, .L8008CB18
    /* 7CA98 8008CA98 01008424 */   addiu     $a0, $a0, 0x1
    /* 7CA9C 8008CA9C 2128C003 */  addu       $a1, $fp, $zero
    /* 7CAA0 8008CAA0 21386002 */  addu       $a3, $s3, $zero
    /* 7CAA4 8008CAA4 21400000 */  addu       $t0, $zero, $zero
    /* 7CAA8 8008CAA8 00860800 */  sll        $s0, $t0, 24
    /* 7CAAC 8008CAAC BC04828F */  lw         $v0, %gp_rel(DialogBorderTH)($gp)
    /* 7CAB0 8008CAB0 03861000 */  sra        $s0, $s0, 24
    /* 7CAB4 8008CAB4 CE1E86A3 */  sb         $a2, %gp_rel(D_8011C64E)($gp)
    /* 7CAB8 8008CAB8 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7CABC 8008CABC 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CAC0 8008CAC0 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CAC4 8008CAC4 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CAC8 8008CAC8 2330E202 */  subu       $a2, $s7, $v0
    /* 7CACC 8008CACC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7CAD0 8008CAD0 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CAD4 8008CAD4 1800A2AF */   sw        $v0, 0x18($sp)
    /* 7CAD8 8008CAD8 2128C003 */  addu       $a1, $fp, $zero
    /* 7CADC 8008CADC 3800A88F */  lw         $t0, 0x38($sp)
    /* 7CAE0 8008CAE0 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CAE4 8008CAE4 03000224 */  addiu      $v0, $zero, 0x3
    /* 7CAE8 8008CAE8 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7CAEC 8008CAEC C404828F */  lw         $v0, %gp_rel(DialogBorderBH)($gp)
    /* 7CAF0 8008CAF0 21386002 */  addu       $a3, $s3, $zero
    /* 7CAF4 8008CAF4 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7CAF8 8008CAF8 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CAFC 8008CAFC 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CB00 8008CB00 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CB04 8008CB04 2130E802 */  addu       $a2, $s7, $t0
    /* 7CB08 8008CB08 06008424 */  addiu      $a0, $a0, 0x6
    /* 7CB0C 8008CB0C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7CB10 8008CB10 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CB14 8008CB14 1800A2AF */   sw        $v0, 0x18($sp)
  .L8008CB18:
    /* 7CB18 8008CB18 CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7CB1C 8008CB1C B804838F */  lw         $v1, %gp_rel(DialogBorderTW)($gp)
    /* 7CB20 8008CB20 3000A88F */  lw         $t0, 0x30($sp)
    /* 7CB24 8008CB24 01004224 */  addiu      $v0, $v0, 0x1
    /* 7CB28 8008CB28 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7CB2C 8008CB2C 2A106800 */  slt        $v0, $v1, $t0
    /* 7CB30 8008CB30 36004010 */  beqz       $v0, .L8008CC0C
    /* 7CB34 8008CB34 21906002 */   addu      $s2, $s3, $zero
    /* 7CB38 8008CB38 23101301 */  subu       $v0, $t0, $s3
    /* 7CB3C 8008CB3C 1A004300 */  div        $zero, $v0, $v1
    /* 7CB40 8008CB40 12200000 */  mflo       $a0
    /* 7CB44 8008CB44 00000000 */  nop
    /* 7CB48 8008CB48 30008018 */  blez       $a0, .L8008CC0C
    /* 7CB4C 8008CB4C 21880000 */   addu      $s1, $zero, $zero
    /* 7CB50 8008CB50 00161100 */  sll        $v0, $s1, 24
    /* 7CB54 8008CB54 03A60200 */  sra        $s4, $v0, 24
  .L8008CB58:
    /* 7CB58 8008CB58 2180D203 */  addu       $s0, $fp, $s2
    /* 7CB5C 8008CB5C 21280002 */  addu       $a1, $s0, $zero
    /* 7CB60 8008CB60 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CB64 8008CB64 01000224 */  addiu      $v0, $zero, 0x1
    /* 7CB68 8008CB68 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7CB6C 8008CB6C BC04828F */  lw         $v0, %gp_rel(DialogBorderTH)($gp)
    /* 7CB70 8008CB70 21386000 */  addu       $a3, $v1, $zero
    /* 7CB74 8008CB74 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7CB78 8008CB78 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CB7C 8008CB7C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CB80 8008CB80 2400B4AF */  sw         $s4, 0x24($sp)
    /* 7CB84 8008CB84 01008424 */  addiu      $a0, $a0, 0x1
    /* 7CB88 8008CB88 2330E202 */  subu       $a2, $s7, $v0
    /* 7CB8C 8008CB8C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7CB90 8008CB90 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CB94 8008CB94 1800A2AF */   sw        $v0, 0x18($sp)
    /* 7CB98 8008CB98 3800A88F */  lw         $t0, 0x38($sp)
    /* 7CB9C 8008CB9C 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CBA0 8008CBA0 C004878F */  lw         $a3, %gp_rel(DialogBorderBW)($gp)
    /* 7CBA4 8008CBA4 03000224 */  addiu      $v0, $zero, 0x3
    /* 7CBA8 8008CBA8 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7CBAC 8008CBAC C404828F */  lw         $v0, %gp_rel(DialogBorderBH)($gp)
    /* 7CBB0 8008CBB0 21280002 */  addu       $a1, $s0, $zero
    /* 7CBB4 8008CBB4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CBB8 8008CBB8 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CBBC 8008CBBC 2400B4AF */  sw         $s4, 0x24($sp)
    /* 7CBC0 8008CBC0 2130E802 */  addu       $a2, $s7, $t0
    /* 7CBC4 8008CBC4 06008424 */  addiu      $a0, $a0, 0x6
    /* 7CBC8 8008CBC8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7CBCC 8008CBCC 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7CBD0 8008CBD0 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CBD4 8008CBD4 1800A2AF */   sw        $v0, 0x18($sp)
    /* 7CBD8 8008CBD8 3000A88F */  lw         $t0, 0x30($sp)
    /* 7CBDC 8008CBDC B804838F */  lw         $v1, %gp_rel(DialogBorderTW)($gp)
    /* 7CBE0 8008CBE0 23101301 */  subu       $v0, $t0, $s3
    /* 7CBE4 8008CBE4 1A004300 */  div        $zero, $v0, $v1
    /* 7CBE8 8008CBE8 12200000 */  mflo       $a0
    /* 7CBEC 8008CBEC 01003126 */  addiu      $s1, $s1, 0x1
    /* 7CBF0 8008CBF0 CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7CBF4 8008CBF4 00000000 */  nop
    /* 7CBF8 8008CBF8 01004224 */  addiu      $v0, $v0, 0x1
    /* 7CBFC 8008CBFC CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7CC00 8008CC00 2A102402 */  slt        $v0, $s1, $a0
    /* 7CC04 8008CC04 D4FF4014 */  bnez       $v0, .L8008CB58
    /* 7CC08 8008CC08 21904302 */   addu      $s2, $s2, $v1
  .L8008CC0C:
    /* 7CC0C 8008CC0C 3000A88F */  lw         $t0, 0x30($sp)
    /* 7CC10 8008CC10 00000000 */  nop
    /* 7CC14 8008CC14 23981201 */  subu       $s3, $t0, $s2
    /* 7CC18 8008CC18 3900601A */  blez       $s3, .L8008CD00
    /* 7CC1C 8008CC1C 2188D203 */   addu      $s1, $fp, $s2
    /* 7CC20 8008CC20 21282002 */  addu       $a1, $s1, $zero
    /* 7CC24 8008CC24 21386002 */  addu       $a3, $s3, $zero
    /* 7CC28 8008CC28 01000224 */  addiu      $v0, $zero, 0x1
    /* 7CC2C 8008CC2C 21400000 */  addu       $t0, $zero, $zero
    /* 7CC30 8008CC30 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CC34 8008CC34 00860800 */  sll        $s0, $t0, 24
    /* 7CC38 8008CC38 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7CC3C 8008CC3C BC04828F */  lw         $v0, %gp_rel(DialogBorderTH)($gp)
    /* 7CC40 8008CC40 03861000 */  sra        $s0, $s0, 24
    /* 7CC44 8008CC44 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7CC48 8008CC48 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CC4C 8008CC4C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CC50 8008CC50 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CC54 8008CC54 01008424 */  addiu      $a0, $a0, 0x1
    /* 7CC58 8008CC58 2330E202 */  subu       $a2, $s7, $v0
    /* 7CC5C 8008CC5C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7CC60 8008CC60 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CC64 8008CC64 1800A2AF */   sw        $v0, 0x18($sp)
    /* 7CC68 8008CC68 31330208 */  j          .L8008CCC4
    /* 7CC6C 8008CC6C 21282002 */   addu      $a1, $s1, $zero
  .L8008CC70:
    /* 7CC70 8008CC70 1A000701 */  div        $zero, $t0, $a3
    /* 7CC74 8008CC74 10980000 */  mfhi       $s3
    /* 7CC78 8008CC78 CD1E86A3 */  sb         $a2, %gp_rel(D_8011C64D)($gp)
    /* 7CC7C 8008CC7C 2000601A */  blez       $s3, .L8008CD00
    /* 7CC80 8008CC80 01008424 */   addiu     $a0, $a0, 0x1
    /* 7CC84 8008CC84 2128C003 */  addu       $a1, $fp, $zero
    /* 7CC88 8008CC88 21386002 */  addu       $a3, $s3, $zero
    /* 7CC8C 8008CC8C 21400000 */  addu       $t0, $zero, $zero
    /* 7CC90 8008CC90 00860800 */  sll        $s0, $t0, 24
    /* 7CC94 8008CC94 BC04828F */  lw         $v0, %gp_rel(DialogBorderTH)($gp)
    /* 7CC98 8008CC98 03861000 */  sra        $s0, $s0, 24
    /* 7CC9C 8008CC9C CE1E86A3 */  sb         $a2, %gp_rel(D_8011C64E)($gp)
    /* 7CCA0 8008CCA0 1400B3AF */  sw         $s3, 0x14($sp)
    /* 7CCA4 8008CCA4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CCA8 8008CCA8 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CCAC 8008CCAC 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CCB0 8008CCB0 2330E202 */  subu       $a2, $s7, $v0
    /* 7CCB4 8008CCB4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7CCB8 8008CCB8 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CCBC 8008CCBC 1800A2AF */   sw        $v0, 0x18($sp)
    /* 7CCC0 8008CCC0 2128C003 */  addu       $a1, $fp, $zero
  .L8008CCC4:
    /* 7CCC4 8008CCC4 3800A88F */  lw         $t0, 0x38($sp)
    /* 7CCC8 8008CCC8 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CCCC 8008CCCC 03000224 */  addiu      $v0, $zero, 0x3
    /* 7CCD0 8008CCD0 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7CCD4 8008CCD4 C404828F */  lw         $v0, %gp_rel(DialogBorderBH)($gp)
    /* 7CCD8 8008CCD8 21386002 */  addu       $a3, $s3, $zero
    /* 7CCDC 8008CCDC 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7CCE0 8008CCE0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CCE4 8008CCE4 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CCE8 8008CCE8 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CCEC 8008CCEC 2130E802 */  addu       $a2, $s7, $t0
    /* 7CCF0 8008CCF0 06008424 */  addiu      $a0, $a0, 0x6
    /* 7CCF4 8008CCF4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7CCF8 8008CCF8 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CCFC 8008CCFC 1800A2AF */   sw        $v0, 0x18($sp)
  .L8008CD00:
    /* 7CD00 8008CD00 CC04848F */  lw         $a0, %gp_rel(DialogBorderLH)($gp)
    /* 7CD04 8008CD04 3800A88F */  lw         $t0, 0x38($sp)
    /* 7CD08 8008CD08 01000524 */  addiu      $a1, $zero, 0x1
    /* 7CD0C 8008CD0C CD1E85A3 */  sb         $a1, %gp_rel(D_8011C64D)($gp)
    /* 7CD10 8008CD10 2A100401 */  slt        $v0, $t0, $a0
    /* 7CD14 8008CD14 7E004014 */  bnez       $v0, .L8008CF10
    /* 7CD18 8008CD18 2130E002 */   addu      $a2, $s7, $zero
    /* 7CD1C 8008CD1C C21F0800 */  srl        $v1, $t0, 31
    /* 7CD20 8008CD20 21180301 */  addu       $v1, $t0, $v1
    /* 7CD24 8008CD24 43180300 */  sra        $v1, $v1, 1
    /* 7CD28 8008CD28 C2170400 */  srl        $v0, $a0, 31
    /* 7CD2C 8008CD2C 21108200 */  addu       $v0, $a0, $v0
    /* 7CD30 8008CD30 43100200 */  sra        $v0, $v0, 1
    /* 7CD34 8008CD34 23A06200 */  subu       $s4, $v1, $v0
    /* 7CD38 8008CD38 1A008402 */  div        $zero, $s4, $a0
    /* 7CD3C 8008CD3C 10B00000 */  mfhi       $s6
    /* 7CD40 8008CD40 CE1E85A3 */  sb         $a1, %gp_rel(D_8011C64E)($gp)
    /* 7CD44 8008CD44 1E00C01A */  blez       $s6, .L8008CDC0
    /* 7CD48 8008CD48 21400000 */   addu      $t0, $zero, $zero
    /* 7CD4C 8008CD4C 00860800 */  sll        $s0, $t0, 24
    /* 7CD50 8008CD50 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CD54 8008CD54 C804878F */  lw         $a3, %gp_rel(DialogBorderLW)($gp)
    /* 7CD58 8008CD58 03861000 */  sra        $s0, $s0, 24
    /* 7CD5C 8008CD5C CD1E85A3 */  sb         $a1, %gp_rel(D_8011C64D)($gp)
    /* 7CD60 8008CD60 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7CD64 8008CD64 1800B6AF */  sw         $s6, 0x18($sp)
    /* 7CD68 8008CD68 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CD6C 8008CD6C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CD70 8008CD70 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CD74 8008CD74 03008424 */  addiu      $a0, $a0, 0x3
    /* 7CD78 8008CD78 2328C703 */  subu       $a1, $fp, $a3
    /* 7CD7C 8008CD7C 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CD80 8008CD80 1400A7AF */   sw        $a3, 0x14($sp)
    /* 7CD84 8008CD84 2130E002 */  addu       $a2, $s7, $zero
    /* 7CD88 8008CD88 3000A88F */  lw         $t0, 0x30($sp)
    /* 7CD8C 8008CD8C 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CD90 8008CD90 D004878F */  lw         $a3, %gp_rel(DialogBorderRW)($gp)
    /* 7CD94 8008CD94 03000224 */  addiu      $v0, $zero, 0x3
    /* 7CD98 8008CD98 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7CD9C 8008CD9C 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7CDA0 8008CDA0 1800B6AF */  sw         $s6, 0x18($sp)
    /* 7CDA4 8008CDA4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CDA8 8008CDA8 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CDAC 8008CDAC 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CDB0 8008CDB0 2128C803 */  addu       $a1, $fp, $t0
    /* 7CDB4 8008CDB4 04008424 */  addiu      $a0, $a0, 0x4
    /* 7CDB8 8008CDB8 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CDBC 8008CDBC 1400A7AF */   sw        $a3, 0x14($sp)
  .L8008CDC0:
    /* 7CDC0 8008CDC0 CE1E8293 */  lbu        $v0, %gp_rel(D_8011C64E)($gp)
    /* 7CDC4 8008CDC4 CC04838F */  lw         $v1, %gp_rel(DialogBorderLH)($gp)
    /* 7CDC8 8008CDC8 3800A88F */  lw         $t0, 0x38($sp)
    /* 7CDCC 8008CDCC 01004224 */  addiu      $v0, $v0, 0x1
    /* 7CDD0 8008CDD0 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7CDD4 8008CDD4 2A106800 */  slt        $v0, $v1, $t0
    /* 7CDD8 8008CDD8 35004010 */  beqz       $v0, .L8008CEB0
    /* 7CDDC 8008CDDC 21A0C002 */   addu      $s4, $s6, $zero
    /* 7CDE0 8008CDE0 23101601 */  subu       $v0, $t0, $s6
    /* 7CDE4 8008CDE4 1A004300 */  div        $zero, $v0, $v1
    /* 7CDE8 8008CDE8 12200000 */  mflo       $a0
    /* 7CDEC 8008CDEC 00000000 */  nop
    /* 7CDF0 8008CDF0 2F008018 */  blez       $a0, .L8008CEB0
    /* 7CDF4 8008CDF4 21A80000 */   addu      $s5, $zero, $zero
    /* 7CDF8 8008CDF8 00161500 */  sll        $v0, $s5, 24
    /* 7CDFC 8008CDFC 038E0200 */  sra        $s1, $v0, 24
  .L8008CE00:
    /* 7CE00 8008CE00 2180F402 */  addu       $s0, $s7, $s4
    /* 7CE04 8008CE04 21300002 */  addu       $a2, $s0, $zero
    /* 7CE08 8008CE08 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CE0C 8008CE0C C804878F */  lw         $a3, %gp_rel(DialogBorderLW)($gp)
    /* 7CE10 8008CE10 01000224 */  addiu      $v0, $zero, 0x1
    /* 7CE14 8008CE14 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7CE18 8008CE18 1000A3AF */  sw         $v1, 0x10($sp)
    /* 7CE1C 8008CE1C 1800A3AF */  sw         $v1, 0x18($sp)
    /* 7CE20 8008CE20 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CE24 8008CE24 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CE28 8008CE28 2400B1AF */  sw         $s1, 0x24($sp)
    /* 7CE2C 8008CE2C 03008424 */  addiu      $a0, $a0, 0x3
    /* 7CE30 8008CE30 2328C703 */  subu       $a1, $fp, $a3
    /* 7CE34 8008CE34 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CE38 8008CE38 1400A7AF */   sw        $a3, 0x14($sp)
    /* 7CE3C 8008CE3C 3000A88F */  lw         $t0, 0x30($sp)
    /* 7CE40 8008CE40 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CE44 8008CE44 D004878F */  lw         $a3, %gp_rel(DialogBorderRW)($gp)
    /* 7CE48 8008CE48 03000224 */  addiu      $v0, $zero, 0x3
    /* 7CE4C 8008CE4C CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7CE50 8008CE50 D404828F */  lw         $v0, %gp_rel(DialogBorderRH)($gp)
    /* 7CE54 8008CE54 21300002 */  addu       $a2, $s0, $zero
    /* 7CE58 8008CE58 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CE5C 8008CE5C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CE60 8008CE60 2400B1AF */  sw         $s1, 0x24($sp)
    /* 7CE64 8008CE64 2128C803 */  addu       $a1, $fp, $t0
    /* 7CE68 8008CE68 04008424 */  addiu      $a0, $a0, 0x4
    /* 7CE6C 8008CE6C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7CE70 8008CE70 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7CE74 8008CE74 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CE78 8008CE78 1800A2AF */   sw        $v0, 0x18($sp)
    /* 7CE7C 8008CE7C 3800A88F */  lw         $t0, 0x38($sp)
    /* 7CE80 8008CE80 CC04838F */  lw         $v1, %gp_rel(DialogBorderLH)($gp)
    /* 7CE84 8008CE84 23101601 */  subu       $v0, $t0, $s6
    /* 7CE88 8008CE88 1A004300 */  div        $zero, $v0, $v1
    /* 7CE8C 8008CE8C 12200000 */  mflo       $a0
    /* 7CE90 8008CE90 0100B526 */  addiu      $s5, $s5, 0x1
    /* 7CE94 8008CE94 CE1E8293 */  lbu        $v0, %gp_rel(D_8011C64E)($gp)
    /* 7CE98 8008CE98 00000000 */  nop
    /* 7CE9C 8008CE9C 01004224 */  addiu      $v0, $v0, 0x1
    /* 7CEA0 8008CEA0 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7CEA4 8008CEA4 2A10A402 */  slt        $v0, $s5, $a0
    /* 7CEA8 8008CEA8 D5FF4014 */  bnez       $v0, .L8008CE00
    /* 7CEAC 8008CEAC 21A08302 */   addu      $s4, $s4, $v1
  .L8008CEB0:
    /* 7CEB0 8008CEB0 3800A88F */  lw         $t0, 0x38($sp)
    /* 7CEB4 8008CEB4 00000000 */  nop
    /* 7CEB8 8008CEB8 23B01401 */  subu       $s6, $t0, $s4
    /* 7CEBC 8008CEBC 3900C01A */  blez       $s6, .L8008CFA4
    /* 7CEC0 8008CEC0 2188F402 */   addu      $s1, $s7, $s4
    /* 7CEC4 8008CEC4 21302002 */  addu       $a2, $s1, $zero
    /* 7CEC8 8008CEC8 01000224 */  addiu      $v0, $zero, 0x1
    /* 7CECC 8008CECC 21400000 */  addu       $t0, $zero, $zero
    /* 7CED0 8008CED0 00860800 */  sll        $s0, $t0, 24
    /* 7CED4 8008CED4 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CED8 8008CED8 C804878F */  lw         $a3, %gp_rel(DialogBorderLW)($gp)
    /* 7CEDC 8008CEDC 03861000 */  sra        $s0, $s0, 24
    /* 7CEE0 8008CEE0 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7CEE4 8008CEE4 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7CEE8 8008CEE8 1800B6AF */  sw         $s6, 0x18($sp)
    /* 7CEEC 8008CEEC 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CEF0 8008CEF0 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CEF4 8008CEF4 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CEF8 8008CEF8 03008424 */  addiu      $a0, $a0, 0x3
    /* 7CEFC 8008CEFC 2328C703 */  subu       $a1, $fp, $a3
    /* 7CF00 8008CF00 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CF04 8008CF04 1400A7AF */   sw        $a3, 0x14($sp)
    /* 7CF08 8008CF08 DA330208 */  j          .L8008CF68
    /* 7CF0C 8008CF0C 21302002 */   addu      $a2, $s1, $zero
  .L8008CF10:
    /* 7CF10 8008CF10 3800A88F */  lw         $t0, 0x38($sp)
    /* 7CF14 8008CF14 00000000 */  nop
    /* 7CF18 8008CF18 1A000401 */  div        $zero, $t0, $a0
    /* 7CF1C 8008CF1C 10B00000 */  mfhi       $s6
    /* 7CF20 8008CF20 C804878F */  lw         $a3, %gp_rel(DialogBorderLW)($gp)
    /* 7CF24 8008CF24 CD1E85A3 */  sb         $a1, %gp_rel(D_8011C64D)($gp)
    /* 7CF28 8008CF28 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CF2C 8008CF2C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CF30 8008CF30 06000224 */  addiu      $v0, $zero, 0x6
    /* 7CF34 8008CF34 21400000 */  addu       $t0, $zero, $zero
    /* 7CF38 8008CF38 00860800 */  sll        $s0, $t0, 24
    /* 7CF3C 8008CF3C 03861000 */  sra        $s0, $s0, 24
    /* 7CF40 8008CF40 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CF44 8008CF44 2328C703 */  subu       $a1, $fp, $a3
    /* 7CF48 8008CF48 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7CF4C 8008CF4C 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CF50 8008CF50 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7CF54 8008CF54 03008424 */  addiu      $a0, $a0, 0x3
    /* 7CF58 8008CF58 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7CF5C 8008CF5C 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CF60 8008CF60 1800B6AF */   sw        $s6, 0x18($sp)
    /* 7CF64 8008CF64 2130E002 */  addu       $a2, $s7, $zero
  .L8008CF68:
    /* 7CF68 8008CF68 3000A88F */  lw         $t0, 0x30($sp)
    /* 7CF6C 8008CF6C 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7CF70 8008CF70 D004878F */  lw         $a3, %gp_rel(DialogBorderRW)($gp)
    /* 7CF74 8008CF74 03000224 */  addiu      $v0, $zero, 0x3
    /* 7CF78 8008CF78 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7CF7C 8008CF7C 1000B6AF */  sw         $s6, 0x10($sp)
    /* 7CF80 8008CF80 1800B6AF */  sw         $s6, 0x18($sp)
    /* 7CF84 8008CF84 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7CF88 8008CF88 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7CF8C 8008CF8C 2400B0AF */  sw         $s0, 0x24($sp)
    /* 7CF90 8008CF90 2128C803 */  addu       $a1, $fp, $t0
    /* 7CF94 8008CF94 04008424 */  addiu      $a0, $a0, 0x4
    /* 7CF98 8008CF98 1400A7AF */  sw         $a3, 0x14($sp)
  .L8008CF9C:
    /* 7CF9C 8008CF9C 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7CFA0 8008CFA0 00000000 */   nop
  .L8008CFA4:
    /* 7CFA4 8008CFA4 1280023C */  lui        $v0, %hi(qtextflag)
    /* 7CFA8 8008CFA8 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 7CFAC 8008CFAC 00000000 */  nop
    /* 7CFB0 8008CFB0 04004010 */  beqz       $v0, .L8008CFC4
    /* 7CFB4 8008CFB4 2800A427 */   addiu     $a0, $sp, 0x28
    /* 7CFB8 8008CFB8 F404858F */  lw         $a1, %gp_rel(MY_DialogOTpos)($gp)
    /* 7CFBC 8008CFBC 7B0E020C */  jal        PRIM_Clip__FP4RECTi
    /* 7CFC0 8008CFC0 0100A524 */   addiu     $a1, $a1, 0x1
  .L8008CFC4:
    /* 7CFC4 8008CFC4 B400BF8F */  lw         $ra, 0xB4($sp)
    /* 7CFC8 8008CFC8 B000BE8F */  lw         $fp, 0xB0($sp)
    /* 7CFCC 8008CFCC AC00B78F */  lw         $s7, 0xAC($sp)
    /* 7CFD0 8008CFD0 A800B68F */  lw         $s6, 0xA8($sp)
    /* 7CFD4 8008CFD4 A400B58F */  lw         $s5, 0xA4($sp)
    /* 7CFD8 8008CFD8 A000B48F */  lw         $s4, 0xA0($sp)
    /* 7CFDC 8008CFDC 9C00B38F */  lw         $s3, 0x9C($sp)
    /* 7CFE0 8008CFE0 9800B28F */  lw         $s2, 0x98($sp)
    /* 7CFE4 8008CFE4 9400B18F */  lw         $s1, 0x94($sp)
    /* 7CFE8 8008CFE8 9000B08F */  lw         $s0, 0x90($sp)
    /* 7CFEC 8008CFEC B800BD27 */  addiu      $sp, $sp, 0xB8
    /* 7CFF0 8008CFF0 0800E003 */  jr         $ra
    /* 7CFF4 8008CFF4 00000000 */   nop
endlabel Back__6Dialogiiii
