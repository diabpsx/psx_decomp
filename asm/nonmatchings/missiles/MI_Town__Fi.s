.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Town__Fi, 0x358

glabel MI_Town__Fi
    /* BDE8 801459E0 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* BDEC 801459E4 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* BDF0 801459E8 21888000 */  addu       $s1, $a0, $zero
    /* BDF4 801459EC 1000A727 */  addiu      $a3, $sp, 0x10
    /* BDF8 801459F0 1280063C */  lui        $a2, %hi(D_8011A0F8)
    /* BDFC 801459F4 F8A0C624 */  addiu      $a2, $a2, %lo(D_8011A0F8)
    /* BE00 801459F8 4000C824 */  addiu      $t0, $a2, 0x40
    /* BE04 801459FC 6000BFAF */  sw         $ra, 0x60($sp)
    /* BE08 80145A00 5800B0AF */  sw         $s0, 0x58($sp)
  .L80145A04:
    /* BE0C 80145A04 0000C28C */  lw         $v0, 0x0($a2)
    /* BE10 80145A08 0400C38C */  lw         $v1, 0x4($a2)
    /* BE14 80145A0C 0800C48C */  lw         $a0, 0x8($a2)
    /* BE18 80145A10 0C00C58C */  lw         $a1, 0xC($a2)
    /* BE1C 80145A14 0000E2AC */  sw         $v0, 0x0($a3)
    /* BE20 80145A18 0400E3AC */  sw         $v1, 0x4($a3)
    /* BE24 80145A1C 0800E4AC */  sw         $a0, 0x8($a3)
    /* BE28 80145A20 0C00E5AC */  sw         $a1, 0xC($a3)
    /* BE2C 80145A24 1000C624 */  addiu      $a2, $a2, 0x10
    /* BE30 80145A28 F6FFC814 */  bne        $a2, $t0, .L80145A04
    /* BE34 80145A2C 1000E724 */   addiu     $a3, $a3, 0x10
    /* BE38 80145A30 0000C28C */  lw         $v0, 0x0($a2)
    /* BE3C 80145A34 00000000 */  nop
    /* BE40 80145A38 0000E2AC */  sw         $v0, 0x0($a3)
    /* BE44 80145A3C 80101100 */  sll        $v0, $s1, 2
    /* BE48 80145A40 21105100 */  addu       $v0, $v0, $s1
    /* BE4C 80145A44 80100200 */  sll        $v0, $v0, 2
    /* BE50 80145A48 23105100 */  subu       $v0, $v0, $s1
    /* BE54 80145A4C 80800200 */  sll        $s0, $v0, 2
    /* BE58 80145A50 1080013C */  lui        $at, %hi(missile + 0x18)
    /* BE5C 80145A54 21083000 */  addu       $at, $at, $s0
    /* BE60 80145A58 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* BE64 80145A5C 00000000 */  nop
    /* BE68 80145A60 0200622C */  sltiu      $v0, $v1, 0x2
    /* BE6C 80145A64 04004014 */  bnez       $v0, .L80145A78
    /* BE70 80145A68 FFFF6224 */   addiu     $v0, $v1, -0x1
    /* BE74 80145A6C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* BE78 80145A70 21083000 */  addu       $at, $at, $s0
    /* BE7C 80145A74 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
  .L80145A78:
    /* BE80 80145A78 1080013C */  lui        $at, %hi(missile + 0x18)
    /* BE84 80145A7C 21083000 */  addu       $at, $at, $s0
    /* BE88 80145A80 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* BE8C 80145A84 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* BE90 80145A88 21083000 */  addu       $at, $at, $s0
    /* BE94 80145A8C 762C2284 */  lh         $v0, %lo(missile + 0x1E)($at)
    /* BE98 80145A90 00000000 */  nop
    /* BE9C 80145A94 03006214 */  bne        $v1, $v0, .L80145AA4
    /* BEA0 80145A98 21202002 */   addu      $a0, $s1, $zero
    /* BEA4 80145A9C 09F5040C */  jal        SetMissDir__Fii
    /* BEA8 80145AA0 01000524 */   addiu     $a1, $zero, 0x1
  .L80145AA4:
    /* BEAC 80145AA4 1280023C */  lui        $v0, %hi(currlevel)
    /* BEB0 80145AA8 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* BEB4 80145AAC 00000000 */  nop
    /* BEB8 80145AB0 3A004010 */  beqz       $v0, .L80145B9C
    /* BEBC 80145AB4 01000224 */   addiu     $v0, $zero, 0x1
    /* BEC0 80145AB8 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* BEC4 80145ABC 21083000 */  addu       $at, $at, $s0
    /* BEC8 80145AC0 972C2380 */  lb         $v1, %lo(missile + 0x3F)($at)
    /* BECC 80145AC4 00000000 */  nop
    /* BED0 80145AC8 35006210 */  beq        $v1, $v0, .L80145BA0
    /* BED4 80145ACC 21200000 */   addu      $a0, $zero, $zero
    /* BED8 80145AD0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* BEDC 80145AD4 21083000 */  addu       $at, $at, $s0
    /* BEE0 80145AD8 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* BEE4 80145ADC 00000000 */  nop
    /* BEE8 80145AE0 30004010 */  beqz       $v0, .L80145BA4
    /* BEEC 80145AE4 80101100 */   sll       $v0, $s1, 2
    /* BEF0 80145AE8 1080013C */  lui        $at, %hi(missile + 0x20)
    /* BEF4 80145AEC 21083000 */  addu       $at, $at, $s0
    /* BEF8 80145AF0 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* BEFC 80145AF4 00000000 */  nop
    /* BF00 80145AF8 0E004014 */  bnez       $v0, .L80145B34
    /* BF04 80145AFC 00000000 */   nop
    /* BF08 80145B00 1080013C */  lui        $at, %hi(missile + 0x31)
    /* BF0C 80145B04 21083000 */  addu       $at, $at, $s0
    /* BF10 80145B08 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* BF14 80145B0C 1000A68F */  lw         $a2, 0x10($sp)
    /* BF18 80145B10 1080013C */  lui        $at, %hi(missile + 0x32)
    /* BF1C 80145B14 21083000 */  addu       $at, $at, $s0
    /* BF20 80145B18 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* BF24 80145B1C 83300600 */  sra        $a2, $a2, 2
    /* BF28 80145B20 BA34010C */  jal        AddLight__Fiii
    /* BF2C 80145B24 4001C624 */   addiu     $a2, $a2, 0x140
    /* BF30 80145B28 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* BF34 80145B2C 21083000 */  addu       $at, $at, $s0
    /* BF38 80145B30 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
  .L80145B34:
    /* BF3C 80145B34 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* BF40 80145B38 21083000 */  addu       $at, $at, $s0
    /* BF44 80145B3C 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* BF48 80145B40 1080013C */  lui        $at, %hi(missile + 0x20)
    /* BF4C 80145B44 21083000 */  addu       $at, $at, $s0
    /* BF50 80145B48 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* BF54 80145B4C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* BF58 80145B50 21083000 */  addu       $at, $at, $s0
    /* BF5C 80145B54 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* BF60 80145B58 80100200 */  sll        $v0, $v0, 2
    /* BF64 80145B5C 2110A203 */  addu       $v0, $sp, $v0
    /* BF68 80145B60 1000478C */  lw         $a3, 0x10($v0)
    /* BF6C 80145B64 1080013C */  lui        $at, %hi(missile + 0x32)
    /* BF70 80145B68 21083000 */  addu       $at, $at, $s0
    /* BF74 80145B6C 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* BF78 80145B70 83380700 */  sra        $a3, $a3, 2
    /* BF7C 80145B74 F834010C */  jal        ChangeLight__Fiiii
    /* BF80 80145B78 4001E724 */   addiu     $a3, $a3, 0x140
    /* BF84 80145B7C 1080013C */  lui        $at, %hi(missile + 0x20)
    /* BF88 80145B80 21083000 */  addu       $at, $at, $s0
    /* BF8C 80145B84 782C2294 */  lhu        $v0, %lo(missile + 0x20)($at)
    /* BF90 80145B88 00000000 */  nop
    /* BF94 80145B8C 01004224 */  addiu      $v0, $v0, 0x1
    /* BF98 80145B90 1080013C */  lui        $at, %hi(missile + 0x20)
    /* BF9C 80145B94 21083000 */  addu       $at, $at, $s0
    /* BFA0 80145B98 782C22A4 */  sh         $v0, %lo(missile + 0x20)($at)
  .L80145B9C:
    /* BFA4 80145B9C 21200000 */  addu       $a0, $zero, $zero
  .L80145BA0:
    /* BFA8 80145BA0 80101100 */  sll        $v0, $s1, 2
  .L80145BA4:
    /* BFAC 80145BA4 21105100 */  addu       $v0, $v0, $s1
    /* BFB0 80145BA8 80100200 */  sll        $v0, $v0, 2
    /* BFB4 80145BAC 23105100 */  subu       $v0, $v0, $s1
    /* BFB8 80145BB0 80800200 */  sll        $s0, $v0, 2
    /* BFBC 80145BB4 21300000 */  addu       $a2, $zero, $zero
  .L80145BB8:
    /* BFC0 80145BB8 02008228 */  slti       $v0, $a0, 0x2
    /* BFC4 80145BBC 49004010 */  beqz       $v0, .L80145CE4
    /* BFC8 80145BC0 80101100 */   sll       $v0, $s1, 2
    /* BFCC 80145BC4 0E80023C */  lui        $v0, %hi(plr)
    /* BFD0 80145BC8 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* BFD4 80145BCC 2128C200 */  addu       $a1, $a2, $v0
    /* BFD8 80145BD0 1D00A290 */  lbu        $v0, 0x1D($a1)
    /* BFDC 80145BD4 00000000 */  nop
    /* BFE0 80145BD8 3F004010 */  beqz       $v0, .L80145CD8
    /* BFE4 80145BDC 00000000 */   nop
    /* BFE8 80145BE0 3000A384 */  lh         $v1, 0x30($a1)
    /* BFEC 80145BE4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* BFF0 80145BE8 21083000 */  addu       $at, $at, $s0
    /* BFF4 80145BEC 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* BFF8 80145BF0 00000000 */  nop
    /* BFFC 80145BF4 38006214 */  bne        $v1, $v0, .L80145CD8
    /* C000 80145BF8 00000000 */   nop
    /* C004 80145BFC 3200A384 */  lh         $v1, 0x32($a1)
    /* C008 80145C00 1080013C */  lui        $at, %hi(missile + 0x32)
    /* C00C 80145C04 21083000 */  addu       $at, $at, $s0
    /* C010 80145C08 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* C014 80145C0C 00000000 */  nop
    /* C018 80145C10 31006214 */  bne        $v1, $v0, .L80145CD8
    /* C01C 80145C14 00000000 */   nop
    /* C020 80145C18 1280023C */  lui        $v0, %hi(qtextflag)
    /* C024 80145C1C 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* C028 80145C20 00000000 */  nop
    /* C02C 80145C24 2C004014 */  bnez       $v0, .L80145CD8
    /* C030 80145C28 00000000 */   nop
    /* C034 80145C2C 1280023C */  lui        $v0, %hi(PauseMode)
    /* C038 80145C30 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* C03C 80145C34 00000000 */  nop
    /* C040 80145C38 27004014 */  bnez       $v0, .L80145CD8
    /* C044 80145C3C 02000224 */   addiu     $v0, $zero, 0x2
    /* C048 80145C40 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* C04C 80145C44 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* C050 80145C48 00000000 */  nop
    /* C054 80145C4C 16006214 */  bne        $v1, $v0, .L80145CA8
    /* C058 80145C50 01008238 */   xori      $v0, $a0, 0x1
    /* C05C 80145C54 40180200 */  sll        $v1, $v0, 1
    /* C060 80145C58 21186200 */  addu       $v1, $v1, $v0
    /* C064 80145C5C 80180300 */  sll        $v1, $v1, 2
    /* C068 80145C60 21186200 */  addu       $v1, $v1, $v0
    /* C06C 80145C64 00190300 */  sll        $v1, $v1, 4
    /* C070 80145C68 23186200 */  subu       $v1, $v1, $v0
    /* C074 80145C6C 80180300 */  sll        $v1, $v1, 2
    /* C078 80145C70 21186200 */  addu       $v1, $v1, $v0
    /* C07C 80145C74 C0180300 */  sll        $v1, $v1, 3
    /* C080 80145C78 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* C084 80145C7C 21082300 */  addu       $at, $at, $v1
    /* C088 80145C80 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* C08C 80145C84 00000000 */  nop
    /* C090 80145C88 07004010 */  beqz       $v0, .L80145CA8
    /* C094 80145C8C 0D000224 */   addiu     $v0, $zero, 0xD
    /* C098 80145C90 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* C09C 80145C94 21082300 */  addu       $at, $at, $v1
    /* C0A0 80145C98 56A52380 */  lb         $v1, %lo(plr + 0x1E)($at)
    /* C0A4 80145C9C 00000000 */  nop
    /* C0A8 80145CA0 0E006210 */  beq        $v1, $v0, .L80145CDC
    /* C0AC 80145CA4 E819C624 */   addiu     $a2, $a2, 0x19E8
  .L80145CA8:
    /* C0B0 80145CA8 959C010C */  jal        ClrPlrPath__Fi
    /* C0B4 80145CAC 00000000 */   nop
    /* C0B8 80145CB0 D1EA040C */  jal        PutMissile__Fi
    /* C0BC 80145CB4 21202002 */   addu      $a0, $s1, $zero
    /* C0C0 80145CB8 01000424 */  addiu      $a0, $zero, 0x1
    /* C0C4 80145CBC 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* C0C8 80145CC0 21083000 */  addu       $at, $at, $s0
    /* C0CC 80145CC4 862C2694 */  lhu        $a2, %lo(missile + 0x2E)($at)
    /* C0D0 80145CC8 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* C0D4 80145CCC 1F000524 */   addiu     $a1, $zero, 0x1F
    /* C0D8 80145CD0 48170508 */  j          .L80145D20
    /* C0DC 80145CD4 00000000 */   nop
  .L80145CD8:
    /* C0E0 80145CD8 E819C624 */  addiu      $a2, $a2, 0x19E8
  .L80145CDC:
    /* C0E4 80145CDC EE160508 */  j          .L80145BB8
    /* C0E8 80145CE0 01008424 */   addiu     $a0, $a0, 0x1
  .L80145CE4:
    /* C0EC 80145CE4 21105100 */  addu       $v0, $v0, $s1
    /* C0F0 80145CE8 80100200 */  sll        $v0, $v0, 2
    /* C0F4 80145CEC 23105100 */  subu       $v0, $v0, $s1
    /* C0F8 80145CF0 80180200 */  sll        $v1, $v0, 2
    /* C0FC 80145CF4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* C100 80145CF8 21082300 */  addu       $at, $at, $v1
    /* C104 80145CFC 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* C108 80145D00 00000000 */  nop
    /* C10C 80145D04 04004014 */  bnez       $v0, .L80145D18
    /* C110 80145D08 01000224 */   addiu     $v0, $zero, 0x1
    /* C114 80145D0C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* C118 80145D10 21082300 */  addu       $at, $at, $v1
    /* C11C 80145D14 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
  .L80145D18:
    /* C120 80145D18 D1EA040C */  jal        PutMissile__Fi
    /* C124 80145D1C 21202002 */   addu      $a0, $s1, $zero
  .L80145D20:
    /* C128 80145D20 6000BF8F */  lw         $ra, 0x60($sp)
    /* C12C 80145D24 5C00B18F */  lw         $s1, 0x5C($sp)
    /* C130 80145D28 5800B08F */  lw         $s0, 0x58($sp)
    /* C134 80145D2C 6800BD27 */  addiu      $sp, $sp, 0x68
    /* C138 80145D30 0800E003 */  jr         $ra
    /* C13C 80145D34 00000000 */   nop
endlabel MI_Town__Fi
