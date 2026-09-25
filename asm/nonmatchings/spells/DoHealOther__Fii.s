.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoHealOther__Fii, 0x25C

glabel DoHealOther__Fii
    /* 67AB8 80077AB8 1280023C */  lui        $v0, %hi(myplr)
    /* 67ABC 80077ABC 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 67AC0 80077AC0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 67AC4 80077AC4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 67AC8 80077AC8 21908000 */  addu       $s2, $a0, $zero
    /* 67ACC 80077ACC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 67AD0 80077AD0 2198A000 */  addu       $s3, $a1, $zero
    /* 67AD4 80077AD4 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 67AD8 80077AD8 2800B4AF */  sw         $s4, 0x28($sp)
    /* 67ADC 80077ADC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 67AE0 80077AE0 03004216 */  bne        $s2, $v0, .L80077AF0
    /* 67AE4 80077AE4 1800B0AF */   sw        $s0, 0x18($sp)
    /* 67AE8 80077AE8 01DE000C */  jal        NewCursor__Fi
    /* 67AEC 80077AEC 01000424 */   addiu     $a0, $zero, 0x1
  .L80077AF0:
    /* 67AF0 80077AF0 00161300 */  sll        $v0, $s3, 24
    /* 67AF4 80077AF4 03160200 */  sra        $v0, $v0, 24
    /* 67AF8 80077AF8 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 67AFC 80077AFC 7C004310 */  beq        $v0, $v1, .L80077CF0
    /* 67B00 80077B00 40101300 */   sll       $v0, $s3, 1
    /* 67B04 80077B04 21105300 */  addu       $v0, $v0, $s3
    /* 67B08 80077B08 80100200 */  sll        $v0, $v0, 2
    /* 67B0C 80077B0C 21105300 */  addu       $v0, $v0, $s3
    /* 67B10 80077B10 00110200 */  sll        $v0, $v0, 4
    /* 67B14 80077B14 23105300 */  subu       $v0, $v0, $s3
    /* 67B18 80077B18 80100200 */  sll        $v0, $v0, 2
    /* 67B1C 80077B1C 21105300 */  addu       $v0, $v0, $s3
    /* 67B20 80077B20 C0100200 */  sll        $v0, $v0, 3
    /* 67B24 80077B24 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 67B28 80077B28 21082200 */  addu       $at, $at, $v0
    /* 67B2C 80077B2C 54A6228C */  lw         $v0, %lo(plr + 0x11C)($at)
    /* 67B30 80077B30 00000000 */  nop
    /* 67B34 80077B34 83110200 */  sra        $v0, $v0, 6
    /* 67B38 80077B38 6D004018 */  blez       $v0, .L80077CF0
    /* 67B3C 80077B3C 00000000 */   nop
    /* 67B40 80077B40 C9F6000C */  jal        ENG_random__Fl
    /* 67B44 80077B44 0A000424 */   addiu     $a0, $zero, 0xA
    /* 67B48 80077B48 01004224 */  addiu      $v0, $v0, 0x1
    /* 67B4C 80077B4C 80890200 */  sll        $s1, $v0, 6
    /* 67B50 80077B50 40101200 */  sll        $v0, $s2, 1
    /* 67B54 80077B54 21105200 */  addu       $v0, $v0, $s2
    /* 67B58 80077B58 80100200 */  sll        $v0, $v0, 2
    /* 67B5C 80077B5C 21105200 */  addu       $v0, $v0, $s2
    /* 67B60 80077B60 00110200 */  sll        $v0, $v0, 4
    /* 67B64 80077B64 23105200 */  subu       $v0, $v0, $s2
    /* 67B68 80077B68 80100200 */  sll        $v0, $v0, 2
    /* 67B6C 80077B6C 21105200 */  addu       $v0, $v0, $s2
    /* 67B70 80077B70 C0180200 */  sll        $v1, $v0, 3
    /* 67B74 80077B74 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 67B78 80077B78 21082300 */  addu       $at, $at, $v1
    /* 67B7C 80077B7C 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 67B80 80077B80 00000000 */  nop
    /* 67B84 80077B84 0E004018 */  blez       $v0, .L80077BC0
    /* 67B88 80077B88 21800000 */   addu      $s0, $zero, $zero
    /* 67B8C 80077B8C 21A06000 */  addu       $s4, $v1, $zero
  .L80077B90:
    /* 67B90 80077B90 C9F6000C */  jal        ENG_random__Fl
    /* 67B94 80077B94 04000424 */   addiu     $a0, $zero, 0x4
    /* 67B98 80077B98 01004224 */  addiu      $v0, $v0, 0x1
    /* 67B9C 80077B9C 80110200 */  sll        $v0, $v0, 6
    /* 67BA0 80077BA0 21882202 */  addu       $s1, $s1, $v0
    /* 67BA4 80077BA4 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 67BA8 80077BA8 21083400 */  addu       $at, $at, $s4
    /* 67BAC 80077BAC 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 67BB0 80077BB0 01001026 */  addiu      $s0, $s0, 0x1
    /* 67BB4 80077BB4 2A100202 */  slt        $v0, $s0, $v0
    /* 67BB8 80077BB8 F5FF4014 */  bnez       $v0, .L80077B90
    /* 67BBC 80077BBC 00000000 */   nop
  .L80077BC0:
    /* 67BC0 80077BC0 21800000 */  addu       $s0, $zero, $zero
  .L80077BC4:
    /* 67BC4 80077BC4 21204002 */  addu       $a0, $s2, $zero
    /* 67BC8 80077BC8 0FE9040C */  jal        func_8013A43C
    /* 67BCC 80077BCC 22000524 */   addiu     $a1, $zero, 0x22
    /* 67BD0 80077BD0 2A100202 */  slt        $v0, $s0, $v0
    /* 67BD4 80077BD4 08004010 */  beqz       $v0, .L80077BF8
    /* 67BD8 80077BD8 40101200 */   sll       $v0, $s2, 1
    /* 67BDC 80077BDC C9F6000C */  jal        ENG_random__Fl
    /* 67BE0 80077BE0 06000424 */   addiu     $a0, $zero, 0x6
    /* 67BE4 80077BE4 01004224 */  addiu      $v0, $v0, 0x1
    /* 67BE8 80077BE8 80110200 */  sll        $v0, $v0, 6
    /* 67BEC 80077BEC 21882202 */  addu       $s1, $s1, $v0
    /* 67BF0 80077BF0 F1DE0108 */  j          .L80077BC4
    /* 67BF4 80077BF4 01001026 */   addiu     $s0, $s0, 0x1
  .L80077BF8:
    /* 67BF8 80077BF8 21105200 */  addu       $v0, $v0, $s2
    /* 67BFC 80077BFC 80100200 */  sll        $v0, $v0, 2
    /* 67C00 80077C00 21105200 */  addu       $v0, $v0, $s2
    /* 67C04 80077C04 00110200 */  sll        $v0, $v0, 4
    /* 67C08 80077C08 23105200 */  subu       $v0, $v0, $s2
    /* 67C0C 80077C0C 80100200 */  sll        $v0, $v0, 2
    /* 67C10 80077C10 21105200 */  addu       $v0, $v0, $s2
    /* 67C14 80077C14 C0100200 */  sll        $v0, $v0, 3
    /* 67C18 80077C18 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 67C1C 80077C1C 21082200 */  addu       $at, $at, $v0
    /* 67C20 80077C20 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 67C24 80077C24 00000000 */  nop
    /* 67C28 80077C28 02006014 */  bnez       $v1, .L80077C34
    /* 67C2C 80077C2C 01000224 */   addiu     $v0, $zero, 0x1
    /* 67C30 80077C30 40881100 */  sll        $s1, $s1, 1
  .L80077C34:
    /* 67C34 80077C34 04006214 */  bne        $v1, $v0, .L80077C48
    /* 67C38 80077C38 40101300 */   sll       $v0, $s3, 1
    /* 67C3C 80077C3C 43101100 */  sra        $v0, $s1, 1
    /* 67C40 80077C40 21882202 */  addu       $s1, $s1, $v0
    /* 67C44 80077C44 40101300 */  sll        $v0, $s3, 1
  .L80077C48:
    /* 67C48 80077C48 21105300 */  addu       $v0, $v0, $s3
    /* 67C4C 80077C4C 80100200 */  sll        $v0, $v0, 2
    /* 67C50 80077C50 21105300 */  addu       $v0, $v0, $s3
    /* 67C54 80077C54 00110200 */  sll        $v0, $v0, 4
    /* 67C58 80077C58 23105300 */  subu       $v0, $v0, $s3
    /* 67C5C 80077C5C 80100200 */  sll        $v0, $v0, 2
    /* 67C60 80077C60 21105300 */  addu       $v0, $v0, $s3
    /* 67C64 80077C64 C0180200 */  sll        $v1, $v0, 3
    /* 67C68 80077C68 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 67C6C 80077C6C 21082300 */  addu       $at, $at, $v1
    /* 67C70 80077C70 54A6228C */  lw         $v0, %lo(plr + 0x11C)($at)
    /* 67C74 80077C74 0E80013C */  lui        $at, %hi(plr + 0x120)
    /* 67C78 80077C78 21082300 */  addu       $at, $at, $v1
    /* 67C7C 80077C7C 58A6248C */  lw         $a0, %lo(plr + 0x120)($at)
    /* 67C80 80077C80 21105100 */  addu       $v0, $v0, $s1
    /* 67C84 80077C84 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 67C88 80077C88 21082300 */  addu       $at, $at, $v1
    /* 67C8C 80077C8C 54A622AC */  sw         $v0, %lo(plr + 0x11C)($at)
    /* 67C90 80077C90 2A108200 */  slt        $v0, $a0, $v0
    /* 67C94 80077C94 04004010 */  beqz       $v0, .L80077CA8
    /* 67C98 80077C98 00000000 */   nop
    /* 67C9C 80077C9C 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 67CA0 80077CA0 21082300 */  addu       $at, $at, $v1
    /* 67CA4 80077CA4 54A624AC */  sw         $a0, %lo(plr + 0x11C)($at)
  .L80077CA8:
    /* 67CA8 80077CA8 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 67CAC 80077CAC 21082300 */  addu       $at, $at, $v1
    /* 67CB0 80077CB0 4CA6228C */  lw         $v0, %lo(plr + 0x114)($at)
    /* 67CB4 80077CB4 0E80013C */  lui        $at, %hi(plr + 0x118)
    /* 67CB8 80077CB8 21082300 */  addu       $at, $at, $v1
    /* 67CBC 80077CBC 50A6248C */  lw         $a0, %lo(plr + 0x118)($at)
    /* 67CC0 80077CC0 21105100 */  addu       $v0, $v0, $s1
    /* 67CC4 80077CC4 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 67CC8 80077CC8 21082300 */  addu       $at, $at, $v1
    /* 67CCC 80077CCC 4CA622AC */  sw         $v0, %lo(plr + 0x114)($at)
    /* 67CD0 80077CD0 2A108200 */  slt        $v0, $a0, $v0
    /* 67CD4 80077CD4 04004010 */  beqz       $v0, .L80077CE8
    /* 67CD8 80077CD8 01000224 */   addiu     $v0, $zero, 0x1
    /* 67CDC 80077CDC 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 67CE0 80077CE0 21082300 */  addu       $at, $at, $v1
    /* 67CE4 80077CE4 4CA624AC */  sw         $a0, %lo(plr + 0x114)($at)
  .L80077CE8:
    /* 67CE8 80077CE8 1280013C */  lui        $at, %hi(drawhpflag)
    /* 67CEC 80077CEC BEB622A0 */  sb         $v0, %lo(drawhpflag)($at)
  .L80077CF0:
    /* 67CF0 80077CF0 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 67CF4 80077CF4 2800B48F */  lw         $s4, 0x28($sp)
    /* 67CF8 80077CF8 2400B38F */  lw         $s3, 0x24($sp)
    /* 67CFC 80077CFC 2000B28F */  lw         $s2, 0x20($sp)
    /* 67D00 80077D00 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 67D04 80077D04 1800B08F */  lw         $s0, 0x18($sp)
    /* 67D08 80077D08 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 67D0C 80077D0C 0800E003 */  jr         $ra
    /* 67D10 80077D10 00000000 */   nop
endlabel DoHealOther__Fii
