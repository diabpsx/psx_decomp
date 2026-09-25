.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartSRepair__Fv, 0x4D0

glabel S_StartSRepair__Fv
    /* 5BDD4 8006BDD4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 5BDD8 8006BDD8 2800B2AF */  sw         $s2, 0x28($sp)
    /* 5BDDC 8006BDDC 21900000 */  addu       $s2, $zero, $zero
    /* 5BDE0 8006BDE0 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 5BDE4 8006BDE4 D4130324 */  addiu      $v1, $zero, 0x13D4
    /* 5BDE8 8006BDE8 02000224 */  addiu      $v0, $zero, 0x2
    /* 5BDEC 8006BDEC 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5BDF0 8006BDF0 01000224 */  addiu      $v0, $zero, 0x1
    /* 5BDF4 8006BDF4 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 5BDF8 8006BDF8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 5BDFC 8006BDFC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 5BE00 8006BE00 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5BE04 8006BE04 282180AF */  sw         $zero, %gp_rel(D_8011C8A8)($gp)
  .L8006BE08:
    /* 5BE08 8006BE08 0E80013C */  lui        $at, %hi(storehold + 0x2C)
    /* 5BE0C 8006BE0C 21082300 */  addu       $at, $at, $v1
    /* 5BE10 8006BE10 B41D24A4 */  sh         $a0, %lo(storehold + 0x2C)($at)
    /* 5BE14 8006BE14 94FF6324 */  addiu      $v1, $v1, -0x6C
    /* 5BE18 8006BE18 FBFF6104 */  bgez       $v1, .L8006BE08
    /* 5BE1C 8006BE1C 00000000 */   nop
    /* 5BE20 8006BE20 1280033C */  lui        $v1, %hi(myplr)
    /* 5BE24 8006BE24 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5BE28 8006BE28 00000000 */  nop
    /* 5BE2C 8006BE2C 40100300 */  sll        $v0, $v1, 1
    /* 5BE30 8006BE30 21104300 */  addu       $v0, $v0, $v1
    /* 5BE34 8006BE34 80100200 */  sll        $v0, $v0, 2
    /* 5BE38 8006BE38 21104300 */  addu       $v0, $v0, $v1
    /* 5BE3C 8006BE3C 00110200 */  sll        $v0, $v0, 4
    /* 5BE40 8006BE40 23104300 */  subu       $v0, $v0, $v1
    /* 5BE44 8006BE44 80100200 */  sll        $v0, $v0, 2
    /* 5BE48 8006BE48 21104300 */  addu       $v0, $v0, $v1
    /* 5BE4C 8006BE4C C0280200 */  sll        $a1, $v0, 3
    /* 5BE50 8006BE50 0E80013C */  lui        $at, %hi(plr + 0x1DC)
    /* 5BE54 8006BE54 21082500 */  addu       $at, $at, $a1
    /* 5BE58 8006BE58 14A72384 */  lh         $v1, %lo(plr + 0x1DC)($at)
    /* 5BE5C 8006BE5C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5BE60 8006BE60 10006210 */  beq        $v1, $v0, .L8006BEA4
    /* 5BE64 8006BE64 00000000 */   nop
    /* 5BE68 8006BE68 0E80013C */  lui        $at, %hi(plr + 0x1EE)
    /* 5BE6C 8006BE6C 21082500 */  addu       $at, $at, $a1
    /* 5BE70 8006BE70 26A72384 */  lh         $v1, %lo(plr + 0x1EE)($at)
    /* 5BE74 8006BE74 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 5BE78 8006BE78 21082500 */  addu       $at, $at, $a1
    /* 5BE7C 8006BE7C 28A72284 */  lh         $v0, %lo(plr + 0x1F0)($at)
    /* 5BE80 8006BE80 00000000 */  nop
    /* 5BE84 8006BE84 07006210 */  beq        $v1, $v0, .L8006BEA4
    /* 5BE88 8006BE88 00000000 */   nop
    /* 5BE8C 8006BE8C 01001224 */  addiu      $s2, $zero, 0x1
    /* 5BE90 8006BE90 0E80043C */  lui        $a0, %hi(plr + 0x1B0)
    /* 5BE94 8006BE94 E8A68424 */  addiu      $a0, $a0, %lo(plr + 0x1B0)
    /* 5BE98 8006BE98 2120A400 */  addu       $a0, $a1, $a0
    /* 5BE9C 8006BE9C FBAE010C */  jal        AddStoreHoldRepair__FP10ItemStructi
    /* 5BEA0 8006BEA0 FFFF0524 */   addiu     $a1, $zero, -0x1
  .L8006BEA4:
    /* 5BEA4 8006BEA4 1280033C */  lui        $v1, %hi(myplr)
    /* 5BEA8 8006BEA8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5BEAC 8006BEAC 00000000 */  nop
    /* 5BEB0 8006BEB0 40100300 */  sll        $v0, $v1, 1
    /* 5BEB4 8006BEB4 21104300 */  addu       $v0, $v0, $v1
    /* 5BEB8 8006BEB8 80100200 */  sll        $v0, $v0, 2
    /* 5BEBC 8006BEBC 21104300 */  addu       $v0, $v0, $v1
    /* 5BEC0 8006BEC0 00110200 */  sll        $v0, $v0, 4
    /* 5BEC4 8006BEC4 23104300 */  subu       $v0, $v0, $v1
    /* 5BEC8 8006BEC8 80100200 */  sll        $v0, $v0, 2
    /* 5BECC 8006BECC 21104300 */  addu       $v0, $v0, $v1
    /* 5BED0 8006BED0 C0280200 */  sll        $a1, $v0, 3
    /* 5BED4 8006BED4 0E80013C */  lui        $at, %hi(plr + 0x464)
    /* 5BED8 8006BED8 21082500 */  addu       $at, $at, $a1
    /* 5BEDC 8006BEDC 9CA92384 */  lh         $v1, %lo(plr + 0x464)($at)
    /* 5BEE0 8006BEE0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5BEE4 8006BEE4 10006210 */  beq        $v1, $v0, .L8006BF28
    /* 5BEE8 8006BEE8 00000000 */   nop
    /* 5BEEC 8006BEEC 0E80013C */  lui        $at, %hi(plr + 0x476)
    /* 5BEF0 8006BEF0 21082500 */  addu       $at, $at, $a1
    /* 5BEF4 8006BEF4 AEA92384 */  lh         $v1, %lo(plr + 0x476)($at)
    /* 5BEF8 8006BEF8 0E80013C */  lui        $at, %hi(plr + 0x478)
    /* 5BEFC 8006BEFC 21082500 */  addu       $at, $at, $a1
    /* 5BF00 8006BF00 B0A92284 */  lh         $v0, %lo(plr + 0x478)($at)
    /* 5BF04 8006BF04 00000000 */  nop
    /* 5BF08 8006BF08 07006210 */  beq        $v1, $v0, .L8006BF28
    /* 5BF0C 8006BF0C 00000000 */   nop
    /* 5BF10 8006BF10 01001224 */  addiu      $s2, $zero, 0x1
    /* 5BF14 8006BF14 0E80043C */  lui        $a0, %hi(plr + 0x438)
    /* 5BF18 8006BF18 70A98424 */  addiu      $a0, $a0, %lo(plr + 0x438)
    /* 5BF1C 8006BF1C 2120A400 */  addu       $a0, $a1, $a0
    /* 5BF20 8006BF20 FBAE010C */  jal        AddStoreHoldRepair__FP10ItemStructi
    /* 5BF24 8006BF24 FEFF0524 */   addiu     $a1, $zero, -0x2
  .L8006BF28:
    /* 5BF28 8006BF28 1280033C */  lui        $v1, %hi(myplr)
    /* 5BF2C 8006BF2C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5BF30 8006BF30 00000000 */  nop
    /* 5BF34 8006BF34 40100300 */  sll        $v0, $v1, 1
    /* 5BF38 8006BF38 21104300 */  addu       $v0, $v0, $v1
    /* 5BF3C 8006BF3C 80100200 */  sll        $v0, $v0, 2
    /* 5BF40 8006BF40 21104300 */  addu       $v0, $v0, $v1
    /* 5BF44 8006BF44 00110200 */  sll        $v0, $v0, 4
    /* 5BF48 8006BF48 23104300 */  subu       $v0, $v0, $v1
    /* 5BF4C 8006BF4C 80100200 */  sll        $v0, $v0, 2
    /* 5BF50 8006BF50 21104300 */  addu       $v0, $v0, $v1
    /* 5BF54 8006BF54 C0280200 */  sll        $a1, $v0, 3
    /* 5BF58 8006BF58 0E80013C */  lui        $at, %hi(plr + 0x38C)
    /* 5BF5C 8006BF5C 21082500 */  addu       $at, $at, $a1
    /* 5BF60 8006BF60 C4A82384 */  lh         $v1, %lo(plr + 0x38C)($at)
    /* 5BF64 8006BF64 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5BF68 8006BF68 10006210 */  beq        $v1, $v0, .L8006BFAC
    /* 5BF6C 8006BF6C 00000000 */   nop
    /* 5BF70 8006BF70 0E80013C */  lui        $at, %hi(plr + 0x39E)
    /* 5BF74 8006BF74 21082500 */  addu       $at, $at, $a1
    /* 5BF78 8006BF78 D6A82384 */  lh         $v1, %lo(plr + 0x39E)($at)
    /* 5BF7C 8006BF7C 0E80013C */  lui        $at, %hi(plr + 0x3A0)
    /* 5BF80 8006BF80 21082500 */  addu       $at, $at, $a1
    /* 5BF84 8006BF84 D8A82284 */  lh         $v0, %lo(plr + 0x3A0)($at)
    /* 5BF88 8006BF88 00000000 */  nop
    /* 5BF8C 8006BF8C 07006210 */  beq        $v1, $v0, .L8006BFAC
    /* 5BF90 8006BF90 00000000 */   nop
    /* 5BF94 8006BF94 01001224 */  addiu      $s2, $zero, 0x1
    /* 5BF98 8006BF98 0E80043C */  lui        $a0, %hi(plr + 0x360)
    /* 5BF9C 8006BF9C 98A88424 */  addiu      $a0, $a0, %lo(plr + 0x360)
    /* 5BFA0 8006BFA0 2120A400 */  addu       $a0, $a1, $a0
    /* 5BFA4 8006BFA4 FBAE010C */  jal        AddStoreHoldRepair__FP10ItemStructi
    /* 5BFA8 8006BFA8 FDFF0524 */   addiu     $a1, $zero, -0x3
  .L8006BFAC:
    /* 5BFAC 8006BFAC 1280033C */  lui        $v1, %hi(myplr)
    /* 5BFB0 8006BFB0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5BFB4 8006BFB4 00000000 */  nop
    /* 5BFB8 8006BFB8 40100300 */  sll        $v0, $v1, 1
    /* 5BFBC 8006BFBC 21104300 */  addu       $v0, $v0, $v1
    /* 5BFC0 8006BFC0 80100200 */  sll        $v0, $v0, 2
    /* 5BFC4 8006BFC4 21104300 */  addu       $v0, $v0, $v1
    /* 5BFC8 8006BFC8 00110200 */  sll        $v0, $v0, 4
    /* 5BFCC 8006BFCC 23104300 */  subu       $v0, $v0, $v1
    /* 5BFD0 8006BFD0 80100200 */  sll        $v0, $v0, 2
    /* 5BFD4 8006BFD4 21104300 */  addu       $v0, $v0, $v1
    /* 5BFD8 8006BFD8 C0280200 */  sll        $a1, $v0, 3
    /* 5BFDC 8006BFDC 0E80013C */  lui        $at, %hi(plr + 0x3F8)
    /* 5BFE0 8006BFE0 21082500 */  addu       $at, $at, $a1
    /* 5BFE4 8006BFE4 30A92384 */  lh         $v1, %lo(plr + 0x3F8)($at)
    /* 5BFE8 8006BFE8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5BFEC 8006BFEC 10006210 */  beq        $v1, $v0, .L8006C030
    /* 5BFF0 8006BFF0 00000000 */   nop
    /* 5BFF4 8006BFF4 0E80013C */  lui        $at, %hi(plr + 0x40A)
    /* 5BFF8 8006BFF8 21082500 */  addu       $at, $at, $a1
    /* 5BFFC 8006BFFC 42A92384 */  lh         $v1, %lo(plr + 0x40A)($at)
    /* 5C000 8006C000 0E80013C */  lui        $at, %hi(plr + 0x40C)
    /* 5C004 8006C004 21082500 */  addu       $at, $at, $a1
    /* 5C008 8006C008 44A92284 */  lh         $v0, %lo(plr + 0x40C)($at)
    /* 5C00C 8006C00C 00000000 */  nop
    /* 5C010 8006C010 07006210 */  beq        $v1, $v0, .L8006C030
    /* 5C014 8006C014 00000000 */   nop
    /* 5C018 8006C018 01001224 */  addiu      $s2, $zero, 0x1
    /* 5C01C 8006C01C 0E80043C */  lui        $a0, %hi(plr + 0x3CC)
    /* 5C020 8006C020 04A98424 */  addiu      $a0, $a0, %lo(plr + 0x3CC)
    /* 5C024 8006C024 2120A400 */  addu       $a0, $a1, $a0
    /* 5C028 8006C028 FBAE010C */  jal        AddStoreHoldRepair__FP10ItemStructi
    /* 5C02C 8006C02C FCFF0524 */   addiu     $a1, $zero, -0x4
  .L8006C030:
    /* 5C030 8006C030 1280023C */  lui        $v0, %hi(myplr)
    /* 5C034 8006C034 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5C038 8006C038 00000000 */  nop
    /* 5C03C 8006C03C 40180200 */  sll        $v1, $v0, 1
    /* 5C040 8006C040 21186200 */  addu       $v1, $v1, $v0
    /* 5C044 8006C044 80180300 */  sll        $v1, $v1, 2
    /* 5C048 8006C048 21186200 */  addu       $v1, $v1, $v0
    /* 5C04C 8006C04C 00190300 */  sll        $v1, $v1, 4
    /* 5C050 8006C050 23186200 */  subu       $v1, $v1, $v0
    /* 5C054 8006C054 80180300 */  sll        $v1, $v1, 2
    /* 5C058 8006C058 21186200 */  addu       $v1, $v1, $v0
    /* 5C05C 8006C05C C0180300 */  sll        $v1, $v1, 3
    /* 5C060 8006C060 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5C064 8006C064 21082300 */  addu       $at, $at, $v1
    /* 5C068 8006C068 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 5C06C 8006C06C 00000000 */  nop
    /* 5C070 8006C070 2C004018 */  blez       $v0, .L8006C124
    /* 5C074 8006C074 21800000 */   addu      $s0, $zero, $zero
    /* 5C078 8006C078 21880000 */  addu       $s1, $zero, $zero
  .L8006C07C:
    /* 5C07C 8006C07C D1AE010C */  jal        SmithRepairOk__Fi
    /* 5C080 8006C080 21200002 */   addu      $a0, $s0, $zero
    /* 5C084 8006C084 FF004230 */  andi       $v0, $v0, 0xFF
    /* 5C088 8006C088 13004010 */  beqz       $v0, .L8006C0D8
    /* 5C08C 8006C08C 21280002 */   addu      $a1, $s0, $zero
    /* 5C090 8006C090 01001224 */  addiu      $s2, $zero, 0x1
    /* 5C094 8006C094 1280023C */  lui        $v0, %hi(myplr)
    /* 5C098 8006C098 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5C09C 8006C09C 00000000 */  nop
    /* 5C0A0 8006C0A0 40200200 */  sll        $a0, $v0, 1
    /* 5C0A4 8006C0A4 21208200 */  addu       $a0, $a0, $v0
    /* 5C0A8 8006C0A8 80200400 */  sll        $a0, $a0, 2
    /* 5C0AC 8006C0AC 21208200 */  addu       $a0, $a0, $v0
    /* 5C0B0 8006C0B0 00210400 */  sll        $a0, $a0, 4
    /* 5C0B4 8006C0B4 23208200 */  subu       $a0, $a0, $v0
    /* 5C0B8 8006C0B8 80200400 */  sll        $a0, $a0, 2
    /* 5C0BC 8006C0BC 21208200 */  addu       $a0, $a0, $v0
    /* 5C0C0 8006C0C0 C0200400 */  sll        $a0, $a0, 3
    /* 5C0C4 8006C0C4 0E80023C */  lui        $v0, %hi(plr + 0x4A4)
    /* 5C0C8 8006C0C8 DCA94224 */  addiu      $v0, $v0, %lo(plr + 0x4A4)
    /* 5C0CC 8006C0CC 21208200 */  addu       $a0, $a0, $v0
    /* 5C0D0 8006C0D0 FBAE010C */  jal        AddStoreHoldRepair__FP10ItemStructi
    /* 5C0D4 8006C0D4 21209100 */   addu      $a0, $a0, $s1
  .L8006C0D8:
    /* 5C0D8 8006C0D8 1280023C */  lui        $v0, %hi(myplr)
    /* 5C0DC 8006C0DC 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5C0E0 8006C0E0 00000000 */  nop
    /* 5C0E4 8006C0E4 40180200 */  sll        $v1, $v0, 1
    /* 5C0E8 8006C0E8 21186200 */  addu       $v1, $v1, $v0
    /* 5C0EC 8006C0EC 80180300 */  sll        $v1, $v1, 2
    /* 5C0F0 8006C0F0 21186200 */  addu       $v1, $v1, $v0
    /* 5C0F4 8006C0F4 00190300 */  sll        $v1, $v1, 4
    /* 5C0F8 8006C0F8 23186200 */  subu       $v1, $v1, $v0
    /* 5C0FC 8006C0FC 80180300 */  sll        $v1, $v1, 2
    /* 5C100 8006C100 21186200 */  addu       $v1, $v1, $v0
    /* 5C104 8006C104 C0180300 */  sll        $v1, $v1, 3
    /* 5C108 8006C108 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5C10C 8006C10C 21082300 */  addu       $at, $at, $v1
    /* 5C110 8006C110 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 5C114 8006C114 01001026 */  addiu      $s0, $s0, 0x1
    /* 5C118 8006C118 2A100202 */  slt        $v0, $s0, $v0
    /* 5C11C 8006C11C D7FF4014 */  bnez       $v0, .L8006C07C
    /* 5C120 8006C120 6C003126 */   addiu     $s1, $s1, 0x6C
  .L8006C124:
    /* 5C124 8006C124 FF004232 */  andi       $v0, $s2, 0xFF
    /* 5C128 8006C128 23004014 */  bnez       $v0, .L8006C1B8
    /* 5C12C 8006C12C 00000000 */   nop
    /* 5C130 8006C130 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5C134 8006C134 4AED010C */  jal        GetStr__Fi
    /* 5C138 8006C138 EE040424 */   addiu     $a0, $zero, 0x4EE
    /* 5C13C 8006C13C 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5C140 8006C140 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5C144 8006C144 1280053C */  lui        $a1, %hi(myplr)
    /* 5C148 8006C148 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5C14C 8006C14C 21200002 */  addu       $a0, $s0, $zero
    /* 5C150 8006C150 40180500 */  sll        $v1, $a1, 1
    /* 5C154 8006C154 21186500 */  addu       $v1, $v1, $a1
    /* 5C158 8006C158 80180300 */  sll        $v1, $v1, 2
    /* 5C15C 8006C15C 21186500 */  addu       $v1, $v1, $a1
    /* 5C160 8006C160 00190300 */  sll        $v1, $v1, 4
    /* 5C164 8006C164 23186500 */  subu       $v1, $v1, $a1
    /* 5C168 8006C168 80180300 */  sll        $v1, $v1, 2
    /* 5C16C 8006C16C 21186500 */  addu       $v1, $v1, $a1
    /* 5C170 8006C170 C0180300 */  sll        $v1, $v1, 3
    /* 5C174 8006C174 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5C178 8006C178 21082300 */  addu       $at, $at, $v1
    /* 5C17C 8006C17C 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5C180 8006C180 9767000C */  jal        sprintf
    /* 5C184 8006C184 21284000 */   addu      $a1, $v0, $zero
    /* 5C188 8006C188 21200000 */  addu       $a0, $zero, $zero
    /* 5C18C 8006C18C 01000524 */  addiu      $a1, $zero, 0x1
    /* 5C190 8006C190 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C194 8006C194 21380002 */  addu       $a3, $s0, $zero
    /* 5C198 8006C198 03000224 */  addiu      $v0, $zero, 0x3
    /* 5C19C 8006C19C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5C1A0 8006C1A0 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C1A4 8006C1A4 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5C1A8 8006C1A8 5CA7010C */  jal        AddSLine__Fi
    /* 5C1AC 8006C1AC 02000424 */   addiu     $a0, $zero, 0x2
    /* 5C1B0 8006C1B0 A2B00108 */  j          .L8006C288
    /* 5C1B4 8006C1B4 00000000 */   nop
  .L8006C1B8:
    /* 5C1B8 8006C1B8 1280033C */  lui        $v1, %hi(myplr)
    /* 5C1BC 8006C1BC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5C1C0 8006C1C0 142180AF */  sw         $zero, %gp_rel(D_8011C894)($gp)
    /* 5C1C4 8006C1C4 40100300 */  sll        $v0, $v1, 1
    /* 5C1C8 8006C1C8 21104300 */  addu       $v0, $v0, $v1
    /* 5C1CC 8006C1CC 80100200 */  sll        $v0, $v0, 2
    /* 5C1D0 8006C1D0 21104300 */  addu       $v0, $v0, $v1
    /* 5C1D4 8006C1D4 00110200 */  sll        $v0, $v0, 4
    /* 5C1D8 8006C1D8 23104300 */  subu       $v0, $v0, $v1
    /* 5C1DC 8006C1DC 80100200 */  sll        $v0, $v0, 2
    /* 5C1E0 8006C1E0 21104300 */  addu       $v0, $v0, $v1
    /* 5C1E4 8006C1E4 C0100200 */  sll        $v0, $v0, 3
    /* 5C1E8 8006C1E8 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5C1EC 8006C1EC 21082200 */  addu       $at, $at, $v0
    /* 5C1F0 8006C1F0 BCBA238C */  lw         $v1, %lo(plr + 0x1584)($at)
    /* 5C1F4 8006C1F4 01000224 */  addiu      $v0, $zero, 0x1
    /* 5C1F8 8006C1F8 621382A3 */  sb         $v0, %gp_rel(stextscrl)($gp)
    /* 5C1FC 8006C1FC 182183AF */  sw         $v1, %gp_rel(D_8011C898)($gp)
    /* 5C200 8006C200 4AED010C */  jal        GetStr__Fi
    /* 5C204 8006C204 5C030424 */   addiu     $a0, $zero, 0x35C
    /* 5C208 8006C208 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5C20C 8006C20C 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5C210 8006C210 1280053C */  lui        $a1, %hi(myplr)
    /* 5C214 8006C214 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5C218 8006C218 21200002 */  addu       $a0, $s0, $zero
    /* 5C21C 8006C21C 40180500 */  sll        $v1, $a1, 1
    /* 5C220 8006C220 21186500 */  addu       $v1, $v1, $a1
    /* 5C224 8006C224 80180300 */  sll        $v1, $v1, 2
    /* 5C228 8006C228 21186500 */  addu       $v1, $v1, $a1
    /* 5C22C 8006C22C 00190300 */  sll        $v1, $v1, 4
    /* 5C230 8006C230 23186500 */  subu       $v1, $v1, $a1
    /* 5C234 8006C234 80180300 */  sll        $v1, $v1, 2
    /* 5C238 8006C238 21186500 */  addu       $v1, $v1, $a1
    /* 5C23C 8006C23C C0180300 */  sll        $v1, $v1, 3
    /* 5C240 8006C240 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5C244 8006C244 21082300 */  addu       $at, $at, $v1
    /* 5C248 8006C248 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5C24C 8006C24C 9767000C */  jal        sprintf
    /* 5C250 8006C250 21284000 */   addu      $a1, $v0, $zero
    /* 5C254 8006C254 21200000 */  addu       $a0, $zero, $zero
    /* 5C258 8006C258 01000524 */  addiu      $a1, $zero, 0x1
    /* 5C25C 8006C25C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5C260 8006C260 21380002 */  addu       $a3, $s0, $zero
    /* 5C264 8006C264 03000224 */  addiu      $v0, $zero, 0x3
    /* 5C268 8006C268 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5C26C 8006C26C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C270 8006C270 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5C274 8006C274 5CA7010C */  jal        AddSLine__Fi
    /* 5C278 8006C278 02000424 */   addiu     $a0, $zero, 0x2
    /* 5C27C 8006C27C 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5C280 8006C280 2EAD010C */  jal        S_ScrollSSell__Fi
    /* 5C284 8006C284 00000000 */   nop
  .L8006C288:
    /* 5C288 8006C288 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 5C28C 8006C28C 2800B28F */  lw         $s2, 0x28($sp)
    /* 5C290 8006C290 2400B18F */  lw         $s1, 0x24($sp)
    /* 5C294 8006C294 2000B08F */  lw         $s0, 0x20($sp)
    /* 5C298 8006C298 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 5C29C 8006C29C 0800E003 */  jr         $ra
    /* 5C2A0 8006C2A0 00000000 */   nop
endlabel S_StartSRepair__Fv
