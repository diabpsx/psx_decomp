.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_cw, 0x40C

glabel CD_cw
    /* BEE0 8001BEE0 0B80023C */  lui        $v0, %hi(CD_debug)
    /* BEE4 8001BEE4 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* BEE8 8001BEE8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* BEEC 8001BEEC 1800B0AF */  sw         $s0, 0x18($sp)
    /* BEF0 8001BEF0 2180A000 */  addu       $s0, $a1, $zero
    /* BEF4 8001BEF4 3000B6AF */  sw         $s6, 0x30($sp)
    /* BEF8 8001BEF8 21B0C000 */  addu       $s6, $a2, $zero
    /* BEFC 8001BEFC 2000B2AF */  sw         $s2, 0x20($sp)
    /* BF00 8001BF00 2190E000 */  addu       $s2, $a3, $zero
    /* BF04 8001BF04 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* BF08 8001BF08 21888000 */  addu       $s1, $a0, $zero
    /* BF0C 8001BF0C 3400BFAF */  sw         $ra, 0x34($sp)
    /* BF10 8001BF10 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* BF14 8001BF14 2800B4AF */  sw         $s4, 0x28($sp)
    /* BF18 8001BF18 02004228 */  slti       $v0, $v0, 0x2
    /* BF1C 8001BF1C 09004014 */  bnez       $v0, .L8001BF44
    /* BF20 8001BF20 2400B3AF */   sw        $s3, 0x24($sp)
    /* BF24 8001BF24 FF002232 */  andi       $v0, $s1, 0xFF
    /* BF28 8001BF28 80100200 */  sll        $v0, $v0, 2
    /* BF2C 8001BF2C 0B80053C */  lui        $a1, %hi(CD_comstr)
    /* BF30 8001BF30 2128A200 */  addu       $a1, $a1, $v0
    /* BF34 8001BF34 1C5FA58C */  lw         $a1, %lo(CD_comstr)($a1)
    /* BF38 8001BF38 1180043C */  lui        $a0, %hi(D_8010E450)
    /* BF3C 8001BF3C 9367000C */  jal        printf
    /* BF40 8001BF40 50E48424 */   addiu     $a0, $a0, %lo(D_8010E450)
  .L8001BF44:
    /* BF44 8001BF44 FF002232 */  andi       $v0, $s1, 0xFF
    /* BF48 8001BF48 80180200 */  sll        $v1, $v0, 2
    /* BF4C 8001BF4C 0B80023C */  lui        $v0, %hi(D_800B613C)
    /* BF50 8001BF50 21104300 */  addu       $v0, $v0, $v1
    /* BF54 8001BF54 3C61428C */  lw         $v0, %lo(D_800B613C)($v0)
    /* BF58 8001BF58 00000000 */  nop
    /* BF5C 8001BF5C 10004010 */  beqz       $v0, .L8001BFA0
    /* BF60 8001BF60 21200000 */   addu      $a0, $zero, $zero
    /* BF64 8001BF64 0E000016 */  bnez       $s0, .L8001BFA0
    /* BF68 8001BF68 00000000 */   nop
    /* BF6C 8001BF6C 0B80023C */  lui        $v0, %hi(CD_debug)
    /* BF70 8001BF70 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* BF74 8001BF74 00000000 */  nop
    /* BF78 8001BF78 D2004018 */  blez       $v0, .L8001C2C4
    /* BF7C 8001BF7C FEFF0224 */   addiu     $v0, $zero, -0x2
    /* BF80 8001BF80 0B80053C */  lui        $a1, %hi(CD_comstr)
    /* BF84 8001BF84 2128A300 */  addu       $a1, $a1, $v1
    /* BF88 8001BF88 1C5FA58C */  lw         $a1, %lo(CD_comstr)($a1)
    /* BF8C 8001BF8C 1180043C */  lui        $a0, %hi(D_8010E458)
    /* BF90 8001BF90 9367000C */  jal        printf
    /* BF94 8001BF94 58E48424 */   addiu     $a0, $a0, %lo(D_8010E458)
    /* BF98 8001BF98 B1700008 */  j          .L8001C2C4
    /* BF9C 8001BF9C FEFF0224 */   addiu     $v0, $zero, -0x2
  .L8001BFA0:
    /* BFA0 8001BFA0 666E000C */  jal        CD_sync
    /* BFA4 8001BFA4 21280000 */   addu      $a1, $zero, $zero
    /* BFA8 8001BFA8 FF002332 */  andi       $v1, $s1, 0xFF
    /* BFAC 8001BFAC 02000224 */  addiu      $v0, $zero, 0x2
    /* BFB0 8001BFB0 0D006214 */  bne        $v1, $v0, .L8001BFE8
    /* BFB4 8001BFB4 0E000224 */   addiu     $v0, $zero, 0xE
    /* BFB8 8001BFB8 21200000 */  addu       $a0, $zero, $zero
    /* BFBC 8001BFBC 21100402 */  addu       $v0, $s0, $a0
  .L8001BFC0:
    /* BFC0 8001BFC0 00004290 */  lbu        $v0, 0x0($v0)
    /* BFC4 8001BFC4 0B80013C */  lui        $at, %hi(CD_pos)
    /* BFC8 8001BFC8 21082400 */  addu       $at, $at, $a0
    /* BFCC 8001BFCC 105F22A0 */  sb         $v0, %lo(CD_pos)($at)
    /* BFD0 8001BFD0 01008424 */  addiu      $a0, $a0, 0x1
    /* BFD4 8001BFD4 04008228 */  slti       $v0, $a0, 0x4
    /* BFD8 8001BFD8 F9FF4014 */  bnez       $v0, .L8001BFC0
    /* BFDC 8001BFDC 21100402 */   addu      $v0, $s0, $a0
    /* BFE0 8001BFE0 FF002332 */  andi       $v1, $s1, 0xFF
    /* BFE4 8001BFE4 0E000224 */  addiu      $v0, $zero, 0xE
  .L8001BFE8:
    /* BFE8 8001BFE8 04006214 */  bne        $v1, $v0, .L8001BFFC
    /* BFEC 8001BFEC 00000000 */   nop
    /* BFF0 8001BFF0 00000292 */  lbu        $v0, 0x0($s0)
    /* BFF4 8001BFF4 0B80013C */  lui        $at, %hi(CD_mode)
    /* BFF8 8001BFF8 145F22A0 */  sb         $v0, %lo(CD_mode)($at)
  .L8001BFFC:
    /* BFFC 8001BFFC 0B80053C */  lui        $a1, %hi(D_800B61D4)
    /* C000 8001C000 D461A524 */  addiu      $a1, $a1, %lo(D_800B61D4)
    /* C004 8001C004 80200300 */  sll        $a0, $v1, 2
    /* C008 8001C008 0000A0A0 */  sb         $zero, 0x0($a1)
    /* C00C 8001C00C 0B80023C */  lui        $v0, %hi(D_800B603C)
    /* C010 8001C010 21104400 */  addu       $v0, $v0, $a0
    /* C014 8001C014 3C60428C */  lw         $v0, %lo(D_800B603C)($v0)
    /* C018 8001C018 0B80033C */  lui        $v1, %hi(D_800B603C)
    /* C01C 8001C01C 02004010 */  beqz       $v0, .L8001C028
    /* C020 8001C020 3C606324 */   addiu     $v1, $v1, %lo(D_800B603C)
    /* C024 8001C024 0100A0A0 */  sb         $zero, 0x1($a1)
  .L8001C028:
    /* C028 8001C028 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* C02C 8001C02C BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* C030 8001C030 00000000 */  nop
    /* C034 8001C034 000040A0 */  sb         $zero, 0x0($v0)
    /* C038 8001C038 00016224 */  addiu      $v0, $v1, 0x100
    /* C03C 8001C03C 21188200 */  addu       $v1, $a0, $v0
    /* C040 8001C040 0000628C */  lw         $v0, 0x0($v1)
    /* C044 8001C044 00000000 */  nop
    /* C048 8001C048 0D004018 */  blez       $v0, .L8001C080
    /* C04C 8001C04C 21200000 */   addu      $a0, $zero, $zero
    /* C050 8001C050 21286000 */  addu       $a1, $v1, $zero
    /* C054 8001C054 21100402 */  addu       $v0, $s0, $a0
  .L8001C058:
    /* C058 8001C058 0B80033C */  lui        $v1, %hi(D_800B61C4)
    /* C05C 8001C05C C461638C */  lw         $v1, %lo(D_800B61C4)($v1)
    /* C060 8001C060 00004290 */  lbu        $v0, 0x0($v0)
    /* C064 8001C064 00000000 */  nop
    /* C068 8001C068 000062A0 */  sb         $v0, 0x0($v1)
    /* C06C 8001C06C 0000A28C */  lw         $v0, 0x0($a1)
    /* C070 8001C070 01008424 */  addiu      $a0, $a0, 0x1
    /* C074 8001C074 2A108200 */  slt        $v0, $a0, $v0
    /* C078 8001C078 F7FF4014 */  bnez       $v0, .L8001C058
    /* C07C 8001C07C 21100402 */   addu      $v0, $s0, $a0
  .L8001C080:
    /* C080 8001C080 0B80023C */  lui        $v0, %hi(D_800B61C0)
    /* C084 8001C084 C061428C */  lw         $v0, %lo(D_800B61C0)($v0)
    /* C088 8001C088 0B80013C */  lui        $at, %hi(CD_com)
    /* C08C 8001C08C 155F31A0 */  sb         $s1, %lo(CD_com)($at)
    /* C090 8001C090 000051A0 */  sb         $s1, 0x0($v0)
    /* C094 8001C094 8B004016 */  bnez       $s2, .L8001C2C4
    /* C098 8001C098 21100000 */   addu      $v0, $zero, $zero
    /* C09C 8001C09C 1748000C */  jal        VSync
    /* C0A0 8001C0A0 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* C0A4 8001C0A4 C0034224 */  addiu      $v0, $v0, 0x3C0
    /* C0A8 8001C0A8 0B80043C */  lui        $a0, %hi(D_800B61D4)
    /* C0AC 8001C0AC D4618424 */  addiu      $a0, $a0, %lo(D_800B61D4)
    /* C0B0 8001C0B0 1380013C */  lui        $at, %hi(D_80130158)
    /* C0B4 8001C0B4 580122AC */  sw         $v0, %lo(D_80130158)($at)
    /* C0B8 8001C0B8 1380013C */  lui        $at, %hi(D_8013015C)
    /* C0BC 8001C0BC 5C0120AC */  sw         $zero, %lo(D_8013015C)($at)
    /* C0C0 8001C0C0 00008390 */  lbu        $v1, 0x0($a0)
    /* C0C4 8001C0C4 1180023C */  lui        $v0, %hi(D_8010E468)
    /* C0C8 8001C0C8 68E44224 */  addiu      $v0, $v0, %lo(D_8010E468)
    /* C0CC 8001C0CC 1380013C */  lui        $at, %hi(D_80130160)
    /* C0D0 8001C0D0 600122AC */  sw         $v0, %lo(D_80130160)($at)
    /* C0D4 8001C0D4 67006014 */  bnez       $v1, .L8001C274
    /* C0D8 8001C0D8 2130C002 */   addu      $a2, $s6, $zero
    /* C0DC 8001C0DC 0B80153C */  lui        $s5, %hi(CD_comstr)
    /* C0E0 8001C0E0 1C5FB526 */  addiu      $s5, $s5, %lo(CD_comstr)
    /* C0E4 8001C0E4 0B80133C */  lui        $s3, %hi(CD_intstr)
    /* C0E8 8001C0E8 9C5F7326 */  addiu      $s3, $s3, %lo(CD_intstr)
    /* C0EC 8001C0EC 21908000 */  addu       $s2, $a0, $zero
    /* C0F0 8001C0F0 01005426 */  addiu      $s4, $s2, 0x1
  .L8001C0F4:
    /* C0F4 8001C0F4 1748000C */  jal        VSync
    /* C0F8 8001C0F8 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* C0FC 8001C0FC 1380033C */  lui        $v1, %hi(D_80130158)
    /* C100 8001C100 5801638C */  lw         $v1, %lo(D_80130158)($v1)
    /* C104 8001C104 00000000 */  nop
    /* C108 8001C108 2A186200 */  slt        $v1, $v1, $v0
    /* C10C 8001C10C 0C006014 */  bnez       $v1, .L8001C140
    /* C110 8001C110 00000000 */   nop
    /* C114 8001C114 1380023C */  lui        $v0, %hi(D_8013015C)
    /* C118 8001C118 5C01428C */  lw         $v0, %lo(D_8013015C)($v0)
    /* C11C 8001C11C 00000000 */  nop
    /* C120 8001C120 21184000 */  addu       $v1, $v0, $zero
    /* C124 8001C124 01004224 */  addiu      $v0, $v0, 0x1
    /* C128 8001C128 1380013C */  lui        $at, %hi(D_8013015C)
    /* C12C 8001C12C 5C0122AC */  sw         $v0, %lo(D_8013015C)($at)
    /* C130 8001C130 3C00023C */  lui        $v0, (0x3C0000 >> 16)
    /* C134 8001C134 2A104300 */  slt        $v0, $v0, $v1
    /* C138 8001C138 1B004010 */  beqz       $v0, .L8001C1A8
    /* C13C 8001C13C 00000000 */   nop
  .L8001C140:
    /* C140 8001C140 1180043C */  lui        $a0, %hi(D_8010E3B4)
    /* C144 8001C144 7567000C */  jal        puts
    /* C148 8001C148 B4E38424 */   addiu     $a0, $a0, %lo(D_8010E3B4)
    /* C14C 8001C14C 00004492 */  lbu        $a0, 0x0($s2)
    /* C150 8001C150 01004292 */  lbu        $v0, 0x1($s2)
    /* C154 8001C154 1380053C */  lui        $a1, %hi(D_80130160)
    /* C158 8001C158 6001A58C */  lw         $a1, %lo(D_80130160)($a1)
    /* C15C 8001C15C 80100200 */  sll        $v0, $v0, 2
    /* C160 8001C160 21105300 */  addu       $v0, $v0, $s3
    /* C164 8001C164 80200400 */  sll        $a0, $a0, 2
    /* C168 8001C168 0000438C */  lw         $v1, 0x0($v0)
    /* C16C 8001C16C 0B80023C */  lui        $v0, %hi(CD_com)
    /* C170 8001C170 155F4290 */  lbu        $v0, %lo(CD_com)($v0)
    /* C174 8001C174 21209300 */  addu       $a0, $a0, $s3
    /* C178 8001C178 80100200 */  sll        $v0, $v0, 2
    /* C17C 8001C17C 21105500 */  addu       $v0, $v0, $s5
    /* C180 8001C180 1000A3AF */  sw         $v1, 0x10($sp)
    /* C184 8001C184 0000468C */  lw         $a2, 0x0($v0)
    /* C188 8001C188 0000878C */  lw         $a3, 0x0($a0)
    /* C18C 8001C18C 1180043C */  lui        $a0, %hi(D_8010E3C4)
    /* C190 8001C190 9367000C */  jal        printf
    /* C194 8001C194 C4E38424 */   addiu     $a0, $a0, %lo(D_8010E3C4)
    /* C198 8001C198 DD70000C */  jal        CD_flush
    /* C19C 8001C19C 00000000 */   nop
    /* C1A0 8001C1A0 6B700008 */  j          .L8001C1AC
    /* C1A4 8001C1A4 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8001C1A8:
    /* C1A8 8001C1A8 21100000 */  addu       $v0, $zero, $zero
  .L8001C1AC:
    /* C1AC 8001C1AC 45004014 */  bnez       $v0, .L8001C2C4
    /* C1B0 8001C1B0 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* C1B4 8001C1B4 F448000C */  jal        CheckCallback
    /* C1B8 8001C1B8 00000000 */   nop
    /* C1BC 8001C1BC 29004010 */  beqz       $v0, .L8001C264
    /* C1C0 8001C1C0 00000000 */   nop
    /* C1C4 8001C1C4 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* C1C8 8001C1C8 BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* C1CC 8001C1CC 00000000 */  nop
    /* C1D0 8001C1D0 00004290 */  lbu        $v0, 0x0($v0)
    /* C1D4 8001C1D4 00000000 */  nop
    /* C1D8 8001C1D8 03005130 */  andi       $s1, $v0, 0x3
  .L8001C1DC:
    /* C1DC 8001C1DC 0F6D000C */  jal        func_8001B43C
    /* C1E0 8001C1E0 00000000 */   nop
    /* C1E4 8001C1E4 21804000 */  addu       $s0, $v0, $zero
    /* C1E8 8001C1E8 1A000012 */  beqz       $s0, .L8001C254
    /* C1EC 8001C1EC 04000232 */   andi      $v0, $s0, 0x4
    /* C1F0 8001C1F0 0B004010 */  beqz       $v0, .L8001C220
    /* C1F4 8001C1F4 02000232 */   andi      $v0, $s0, 0x2
    /* C1F8 8001C1F8 0B80023C */  lui        $v0, %hi(CD_cbready)
    /* C1FC 8001C1FC F85E428C */  lw         $v0, %lo(CD_cbready)($v0)
    /* C200 8001C200 00000000 */  nop
    /* C204 8001C204 05004010 */  beqz       $v0, .L8001C21C
    /* C208 8001C208 00000000 */   nop
    /* C20C 8001C20C 00008492 */  lbu        $a0, 0x0($s4)
    /* C210 8001C210 1380053C */  lui        $a1, %hi(D_80130148)
    /* C214 8001C214 09F84000 */  jalr       $v0
    /* C218 8001C218 4801A524 */   addiu     $a1, $a1, %lo(D_80130148)
  .L8001C21C:
    /* C21C 8001C21C 02000232 */  andi       $v0, $s0, 0x2
  .L8001C220:
    /* C220 8001C220 EEFF4010 */  beqz       $v0, .L8001C1DC
    /* C224 8001C224 00000000 */   nop
    /* C228 8001C228 0B80023C */  lui        $v0, %hi(CD_cbsync)
    /* C22C 8001C22C F45E428C */  lw         $v0, %lo(CD_cbsync)($v0)
    /* C230 8001C230 00000000 */  nop
    /* C234 8001C234 E9FF4010 */  beqz       $v0, .L8001C1DC
    /* C238 8001C238 00000000 */   nop
    /* C23C 8001C23C 00004492 */  lbu        $a0, 0x0($s2)
    /* C240 8001C240 1380053C */  lui        $a1, %hi(D_80130140)
    /* C244 8001C244 09F84000 */  jalr       $v0
    /* C248 8001C248 4001A524 */   addiu     $a1, $a1, %lo(D_80130140)
    /* C24C 8001C24C 77700008 */  j          .L8001C1DC
    /* C250 8001C250 00000000 */   nop
  .L8001C254:
    /* C254 8001C254 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* C258 8001C258 BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* C25C 8001C25C 00000000 */  nop
    /* C260 8001C260 000051A0 */  sb         $s1, 0x0($v0)
  .L8001C264:
    /* C264 8001C264 00004292 */  lbu        $v0, 0x0($s2)
    /* C268 8001C268 00000000 */  nop
    /* C26C 8001C26C A1FF4010 */  beqz       $v0, .L8001C0F4
    /* C270 8001C270 2130C002 */   addu      $a2, $s6, $zero
  .L8001C274:
    /* C274 8001C274 1380043C */  lui        $a0, %hi(D_80130140)
    /* C278 8001C278 40018424 */  addiu      $a0, $a0, %lo(D_80130140)
    /* C27C 8001C27C 0800C010 */  beqz       $a2, .L8001C2A0
    /* C280 8001C280 07000324 */   addiu     $v1, $zero, 0x7
    /* C284 8001C284 FFFF0524 */  addiu      $a1, $zero, -0x1
  .L8001C288:
    /* C288 8001C288 00008290 */  lbu        $v0, 0x0($a0)
    /* C28C 8001C28C 01008424 */  addiu      $a0, $a0, 0x1
    /* C290 8001C290 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* C294 8001C294 0000C2A0 */  sb         $v0, 0x0($a2)
    /* C298 8001C298 FBFF6514 */  bne        $v1, $a1, .L8001C288
    /* C29C 8001C29C 0100C624 */   addiu     $a2, $a2, 0x1
  .L8001C2A0:
    /* C2A0 8001C2A0 21200000 */  addu       $a0, $zero, $zero
    /* C2A4 8001C2A4 0B80023C */  lui        $v0, %hi(D_800B61D4)
    /* C2A8 8001C2A8 D4614224 */  addiu      $v0, $v0, %lo(D_800B61D4)
    /* C2AC 8001C2AC 00004390 */  lbu        $v1, 0x0($v0)
    /* C2B0 8001C2B0 05000224 */  addiu      $v0, $zero, 0x5
    /* C2B4 8001C2B4 03006214 */  bne        $v1, $v0, .L8001C2C4
    /* C2B8 8001C2B8 21108000 */   addu      $v0, $a0, $zero
    /* C2BC 8001C2BC FFFF0424 */  addiu      $a0, $zero, -0x1
    /* C2C0 8001C2C0 21108000 */  addu       $v0, $a0, $zero
  .L8001C2C4:
    /* C2C4 8001C2C4 3400BF8F */  lw         $ra, 0x34($sp)
    /* C2C8 8001C2C8 3000B68F */  lw         $s6, 0x30($sp)
    /* C2CC 8001C2CC 2C00B58F */  lw         $s5, 0x2C($sp)
    /* C2D0 8001C2D0 2800B48F */  lw         $s4, 0x28($sp)
    /* C2D4 8001C2D4 2400B38F */  lw         $s3, 0x24($sp)
    /* C2D8 8001C2D8 2000B28F */  lw         $s2, 0x20($sp)
    /* C2DC 8001C2DC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* C2E0 8001C2E0 1800B08F */  lw         $s0, 0x18($sp)
    /* C2E4 8001C2E4 0800E003 */  jr         $ra
    /* C2E8 8001C2E8 3800BD27 */   addiu     $sp, $sp, 0x38
endlabel CD_cw
