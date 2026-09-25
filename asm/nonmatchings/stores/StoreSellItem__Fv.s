.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StoreSellItem__Fv, 0x344

glabel StoreSellItem__Fv
    /* 61A00 80071A00 21138283 */  lb         $v0, %gp_rel(WFlag)($gp)
    /* 61A04 80071A04 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 61A08 80071A08 2800BFAF */  sw         $ra, 0x28($sp)
    /* 61A0C 80071A0C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 61A10 80071A10 2000B2AF */  sw         $s2, 0x20($sp)
    /* 61A14 80071A14 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 61A18 80071A18 0F004010 */  beqz       $v0, .L80071A58
    /* 61A1C 80071A1C 1800B0AF */   sw        $s0, 0x18($sp)
    /* 61A20 80071A20 20138283 */  lb         $v0, %gp_rel(WStaffFlag)($gp)
    /* 61A24 80071A24 00000000 */  nop
    /* 61A28 80071A28 0B004014 */  bnez       $v0, .L80071A58
    /* 61A2C 80071A2C 00000000 */   nop
    /* 61A30 80071A30 0821838F */  lw         $v1, %gp_rel(D_8011C888)($gp)
    /* 61A34 80071A34 1C21828F */  lw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 61A38 80071A38 00000000 */  nop
    /* 61A3C 80071A3C 23106200 */  subu       $v0, $v1, $v0
    /* 61A40 80071A40 02004104 */  bgez       $v0, .L80071A4C
    /* 61A44 80071A44 00000000 */   nop
    /* 61A48 80071A48 03004224 */  addiu      $v0, $v0, 0x3
  .L80071A4C:
    /* 61A4C 80071A4C 1021838F */  lw         $v1, %gp_rel(D_8011C890)($gp)
    /* 61A50 80071A50 9FC60108 */  j          .L80071A7C
    /* 61A54 80071A54 83100200 */   sra       $v0, $v0, 2
  .L80071A58:
    /* 61A58 80071A58 0821838F */  lw         $v1, %gp_rel(D_8011C888)($gp)
    /* 61A5C 80071A5C 1C21828F */  lw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 61A60 80071A60 00000000 */  nop
    /* 61A64 80071A64 23106200 */  subu       $v0, $v1, $v0
    /* 61A68 80071A68 02004104 */  bgez       $v0, .L80071A74
    /* 61A6C 80071A6C 00000000 */   nop
    /* 61A70 80071A70 07004224 */  addiu      $v0, $v0, 0x7
  .L80071A74:
    /* 61A74 80071A74 1021838F */  lw         $v1, %gp_rel(D_8011C890)($gp)
    /* 61A78 80071A78 C3100200 */  sra        $v0, $v0, 3
  .L80071A7C:
    /* 61A7C 80071A7C 21804300 */  addu       $s0, $v0, $v1
    /* 61A80 80071A80 0E80013C */  lui        $at, %hi(storehidx)
    /* 61A84 80071A84 21083000 */  addu       $at, $at, $s0
    /* 61A88 80071A88 C8312580 */  lb         $a1, %lo(storehidx)($at)
    /* 61A8C 80071A8C 00000000 */  nop
    /* 61A90 80071A90 0700A004 */  bltz       $a1, .L80071AB0
    /* 61A94 80071A94 00000000 */   nop
    /* 61A98 80071A98 1280043C */  lui        $a0, %hi(myplr)
    /* 61A9C 80071A9C 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 61AA0 80071AA0 BF75050C */  jal        func_8015D6FC
    /* 61AA4 80071AA4 00000000 */   nop
    /* 61AA8 80071AA8 B1C60108 */  j          .L80071AC4
    /* 61AAC 80071AAC C0101000 */   sll       $v0, $s0, 3
  .L80071AB0:
    /* 61AB0 80071AB0 1280043C */  lui        $a0, %hi(myplr)
    /* 61AB4 80071AB4 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 61AB8 80071AB8 6B76050C */  jal        func_8015D9AC
    /* 61ABC 80071ABC 27280500 */   nor       $a1, $zero, $a1
    /* 61AC0 80071AC0 C0101000 */  sll        $v0, $s0, 3
  .L80071AC4:
    /* 61AC4 80071AC4 23105000 */  subu       $v0, $v0, $s0
    /* 61AC8 80071AC8 80100200 */  sll        $v0, $v0, 2
    /* 61ACC 80071ACC 23105000 */  subu       $v0, $v0, $s0
    /* 61AD0 80071AD0 80200200 */  sll        $a0, $v0, 2
    /* 61AD4 80071AD4 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 61AD8 80071AD8 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 61ADC 80071ADC 21082400 */  addu       $at, $at, $a0
    /* 61AE0 80071AE0 A01D318C */  lw         $s1, %lo(storehold + 0x18)($at)
    /* 61AE4 80071AE4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 61AE8 80071AE8 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 61AEC 80071AEC 28000212 */  beq        $s0, $v0, .L80071B90
    /* 61AF0 80071AF0 2A100202 */   slt       $v0, $s0, $v0
    /* 61AF4 80071AF4 26004010 */  beqz       $v0, .L80071B90
    /* 61AF8 80071AF8 00000000 */   nop
    /* 61AFC 80071AFC 0E80033C */  lui        $v1, %hi(storehold)
    /* 61B00 80071B00 881D6324 */  addiu      $v1, $v1, %lo(storehold)
    /* 61B04 80071B04 6C006224 */  addiu      $v0, $v1, 0x6C
    /* 61B08 80071B08 21488200 */  addu       $t1, $a0, $v0
    /* 61B0C 80071B0C 21508300 */  addu       $t2, $a0, $v1
  .L80071B10:
    /* 61B10 80071B10 21384001 */  addu       $a3, $t2, $zero
    /* 61B14 80071B14 21302001 */  addu       $a2, $t1, $zero
    /* 61B18 80071B18 60002825 */  addiu      $t0, $t1, 0x60
  .L80071B1C:
    /* 61B1C 80071B1C 0000C28C */  lw         $v0, 0x0($a2)
    /* 61B20 80071B20 0400C38C */  lw         $v1, 0x4($a2)
    /* 61B24 80071B24 0800C48C */  lw         $a0, 0x8($a2)
    /* 61B28 80071B28 0C00C58C */  lw         $a1, 0xC($a2)
    /* 61B2C 80071B2C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 61B30 80071B30 0400E3AC */  sw         $v1, 0x4($a3)
    /* 61B34 80071B34 0800E4AC */  sw         $a0, 0x8($a3)
    /* 61B38 80071B38 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 61B3C 80071B3C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 61B40 80071B40 F6FFC814 */  bne        $a2, $t0, .L80071B1C
    /* 61B44 80071B44 1000E724 */   addiu     $a3, $a3, 0x10
    /* 61B48 80071B48 0000C28C */  lw         $v0, 0x0($a2)
    /* 61B4C 80071B4C 0400C38C */  lw         $v1, 0x4($a2)
    /* 61B50 80071B50 0800C48C */  lw         $a0, 0x8($a2)
    /* 61B54 80071B54 0000E2AC */  sw         $v0, 0x0($a3)
    /* 61B58 80071B58 0400E3AC */  sw         $v1, 0x4($a3)
    /* 61B5C 80071B5C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 61B60 80071B60 6C002925 */  addiu      $t1, $t1, 0x6C
    /* 61B64 80071B64 0E80013C */  lui        $at, %hi(storehidx + 0x1)
    /* 61B68 80071B68 21083000 */  addu       $at, $at, $s0
    /* 61B6C 80071B6C C9312290 */  lbu        $v0, %lo(storehidx + 0x1)($at)
    /* 61B70 80071B70 0E80013C */  lui        $at, %hi(storehidx)
    /* 61B74 80071B74 21083000 */  addu       $at, $at, $s0
    /* 61B78 80071B78 C83122A0 */  sb         $v0, %lo(storehidx)($at)
    /* 61B7C 80071B7C 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 61B80 80071B80 01001026 */  addiu      $s0, $s0, 0x1
    /* 61B84 80071B84 2A100202 */  slt        $v0, $s0, $v0
    /* 61B88 80071B88 E1FF4014 */  bnez       $v0, .L80071B10
    /* 61B8C 80071B8C 6C004A25 */   addiu     $t2, $t2, 0x6C
  .L80071B90:
    /* 61B90 80071B90 1280033C */  lui        $v1, %hi(myplr)
    /* 61B94 80071B94 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 61B98 80071B98 00000000 */  nop
    /* 61B9C 80071B9C 40100300 */  sll        $v0, $v1, 1
    /* 61BA0 80071BA0 21104300 */  addu       $v0, $v0, $v1
    /* 61BA4 80071BA4 80100200 */  sll        $v0, $v0, 2
    /* 61BA8 80071BA8 21104300 */  addu       $v0, $v0, $v1
    /* 61BAC 80071BAC 00110200 */  sll        $v0, $v0, 4
    /* 61BB0 80071BB0 23104300 */  subu       $v0, $v0, $v1
    /* 61BB4 80071BB4 80100200 */  sll        $v0, $v0, 2
    /* 61BB8 80071BB8 21104300 */  addu       $v0, $v0, $v1
    /* 61BBC 80071BBC C0100200 */  sll        $v0, $v0, 3
    /* 61BC0 80071BC0 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 61BC4 80071BC4 21082200 */  addu       $at, $at, $v0
    /* 61BC8 80071BC8 88A6238C */  lw         $v1, %lo(plr + 0x150)($at)
    /* 61BCC 80071BCC 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 61BD0 80071BD0 21082200 */  addu       $at, $at, $v0
    /* 61BD4 80071BD4 BCBA248C */  lw         $a0, %lo(plr + 0x1584)($at)
    /* 61BD8 80071BD8 21187100 */  addu       $v1, $v1, $s1
    /* 61BDC 80071BDC 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 61BE0 80071BE0 21082200 */  addu       $at, $at, $v0
    /* 61BE4 80071BE4 88A623AC */  sw         $v1, %lo(plr + 0x150)($at)
    /* 61BE8 80071BE8 42008018 */  blez       $a0, .L80071CF4
    /* 61BEC 80071BEC 21800000 */   addu      $s0, $zero, $zero
    /* 61BF0 80071BF0 88131324 */  addiu      $s3, $zero, 0x1388
    /* 61BF4 80071BF4 21900000 */  addu       $s2, $zero, $zero
  .L80071BF8:
    /* 61BF8 80071BF8 4A00201A */  blez       $s1, .L80071D24
    /* 61BFC 80071BFC 00000000 */   nop
    /* 61C00 80071C00 1280043C */  lui        $a0, %hi(myplr)
    /* 61C04 80071C04 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 61C08 80071C08 00000000 */  nop
    /* 61C0C 80071C0C 40100400 */  sll        $v0, $a0, 1
    /* 61C10 80071C10 21104400 */  addu       $v0, $v0, $a0
    /* 61C14 80071C14 80100200 */  sll        $v0, $v0, 2
    /* 61C18 80071C18 21104400 */  addu       $v0, $v0, $a0
    /* 61C1C 80071C1C 00110200 */  sll        $v0, $v0, 4
    /* 61C20 80071C20 23104400 */  subu       $v0, $v0, $a0
    /* 61C24 80071C24 80100200 */  sll        $v0, $v0, 2
    /* 61C28 80071C28 21104400 */  addu       $v0, $v0, $a0
    /* 61C2C 80071C2C C0100200 */  sll        $v0, $v0, 3
    /* 61C30 80071C30 21304202 */  addu       $a2, $s2, $v0
    /* 61C34 80071C34 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 61C38 80071C38 21082600 */  addu       $at, $at, $a2
    /* 61C3C 80071C3C 08AA2384 */  lh         $v1, %lo(plr + 0x4D0)($at)
    /* 61C40 80071C40 0B000224 */  addiu      $v0, $zero, 0xB
    /* 61C44 80071C44 18006214 */  bne        $v1, $v0, .L80071CA8
    /* 61C48 80071C48 00000000 */   nop
    /* 61C4C 80071C4C 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 61C50 80071C50 21082600 */  addu       $at, $at, $a2
    /* 61C54 80071C54 F0A9238C */  lw         $v1, %lo(plr + 0x4B8)($at)
    /* 61C58 80071C58 00000000 */  nop
    /* 61C5C 80071C5C 12007310 */  beq        $v1, $s3, .L80071CA8
    /* 61C60 80071C60 00000000 */   nop
    /* 61C64 80071C64 21282302 */  addu       $a1, $s1, $v1
    /* 61C68 80071C68 8913A228 */  slti       $v0, $a1, 0x1389
    /* 61C6C 80071C6C 08004010 */  beqz       $v0, .L80071C90
    /* 61C70 80071C70 78EC2226 */   addiu     $v0, $s1, -0x1388
    /* 61C74 80071C74 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 61C78 80071C78 21082600 */  addu       $at, $at, $a2
    /* 61C7C 80071C7C F0A925AC */  sw         $a1, %lo(plr + 0x4B8)($at)
    /* 61C80 80071C80 92C1010C */  jal        SetGoldCurs__Fii
    /* 61C84 80071C84 21280002 */   addu      $a1, $s0, $zero
    /* 61C88 80071C88 2AC70108 */  j          .L80071CA8
    /* 61C8C 80071C8C 21880000 */   addu      $s1, $zero, $zero
  .L80071C90:
    /* 61C90 80071C90 21884300 */  addu       $s1, $v0, $v1
    /* 61C94 80071C94 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 61C98 80071C98 21082600 */  addu       $at, $at, $a2
    /* 61C9C 80071C9C F0A933AC */  sw         $s3, %lo(plr + 0x4B8)($at)
    /* 61CA0 80071CA0 92C1010C */  jal        SetGoldCurs__Fii
    /* 61CA4 80071CA4 21280002 */   addu      $a1, $s0, $zero
  .L80071CA8:
    /* 61CA8 80071CA8 1280023C */  lui        $v0, %hi(myplr)
    /* 61CAC 80071CAC 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 61CB0 80071CB0 00000000 */  nop
    /* 61CB4 80071CB4 40180200 */  sll        $v1, $v0, 1
    /* 61CB8 80071CB8 21186200 */  addu       $v1, $v1, $v0
    /* 61CBC 80071CBC 80180300 */  sll        $v1, $v1, 2
    /* 61CC0 80071CC0 21186200 */  addu       $v1, $v1, $v0
    /* 61CC4 80071CC4 00190300 */  sll        $v1, $v1, 4
    /* 61CC8 80071CC8 23186200 */  subu       $v1, $v1, $v0
    /* 61CCC 80071CCC 80180300 */  sll        $v1, $v1, 2
    /* 61CD0 80071CD0 21186200 */  addu       $v1, $v1, $v0
    /* 61CD4 80071CD4 C0180300 */  sll        $v1, $v1, 3
    /* 61CD8 80071CD8 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 61CDC 80071CDC 21082300 */  addu       $at, $at, $v1
    /* 61CE0 80071CE0 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 61CE4 80071CE4 01001026 */  addiu      $s0, $s0, 0x1
    /* 61CE8 80071CE8 2A100202 */  slt        $v0, $s0, $v0
    /* 61CEC 80071CEC C2FF4014 */  bnez       $v0, .L80071BF8
    /* 61CF0 80071CF0 6C005226 */   addiu     $s2, $s2, 0x6C
  .L80071CF4:
    /* 61CF4 80071CF4 0B00201A */  blez       $s1, .L80071D24
    /* 61CF8 80071CF8 8913222A */   slti      $v0, $s1, 0x1389
    /* 61CFC 80071CFC 07004014 */  bnez       $v0, .L80071D1C
    /* 61D00 80071D00 00000000 */   nop
  .L80071D04:
    /* 61D04 80071D04 D8C5010C */  jal        PlaceStoreGold__Fl
    /* 61D08 80071D08 88130424 */   addiu     $a0, $zero, 0x1388
    /* 61D0C 80071D0C 78EC3126 */  addiu      $s1, $s1, -0x1388
    /* 61D10 80071D10 8913222A */  slti       $v0, $s1, 0x1389
    /* 61D14 80071D14 FBFF4010 */  beqz       $v0, .L80071D04
    /* 61D18 80071D18 00000000 */   nop
  .L80071D1C:
    /* 61D1C 80071D1C D8C5010C */  jal        PlaceStoreGold__Fl
    /* 61D20 80071D20 21202002 */   addu      $a0, $s1, $zero
  .L80071D24:
    /* 61D24 80071D24 2800BF8F */  lw         $ra, 0x28($sp)
    /* 61D28 80071D28 2400B38F */  lw         $s3, 0x24($sp)
    /* 61D2C 80071D2C 2000B28F */  lw         $s2, 0x20($sp)
    /* 61D30 80071D30 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 61D34 80071D34 1800B08F */  lw         $s0, 0x18($sp)
    /* 61D38 80071D38 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 61D3C 80071D3C 0800E003 */  jr         $ra
    /* 61D40 80071D40 00000000 */   nop
endlabel StoreSellItem__Fv
