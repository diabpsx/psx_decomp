.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GivePlayerDosh__Fil, 0x1B4

glabel GivePlayerDosh__Fil
    /* 74B44 80084B44 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 74B48 80084B48 1800B0AF */  sw         $s0, 0x18($sp)
    /* 74B4C 80084B4C 21808000 */  addu       $s0, $a0, $zero
    /* 74B50 80084B50 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 74B54 80084B54 2188A000 */  addu       $s1, $a1, $zero
    /* 74B58 80084B58 40281000 */  sll        $a1, $s0, 1
    /* 74B5C 80084B5C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 74B60 80084B60 2110B000 */  addu       $v0, $a1, $s0
    /* 74B64 80084B64 80100200 */  sll        $v0, $v0, 2
    /* 74B68 80084B68 21105000 */  addu       $v0, $v0, $s0
    /* 74B6C 80084B6C 00110200 */  sll        $v0, $v0, 4
    /* 74B70 80084B70 23105000 */  subu       $v0, $v0, $s0
    /* 74B74 80084B74 80100200 */  sll        $v0, $v0, 2
    /* 74B78 80084B78 21105000 */  addu       $v0, $v0, $s0
    /* 74B7C 80084B7C C0100200 */  sll        $v0, $v0, 3
    /* 74B80 80084B80 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 74B84 80084B84 2800B4AF */  sw         $s4, 0x28($sp)
    /* 74B88 80084B88 2400B3AF */  sw         $s3, 0x24($sp)
    /* 74B8C 80084B8C 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 74B90 80084B90 21082200 */  addu       $at, $at, $v0
    /* 74B94 80084B94 88A6238C */  lw         $v1, %lo(plr + 0x150)($at)
    /* 74B98 80084B98 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 74B9C 80084B9C 21082200 */  addu       $at, $at, $v0
    /* 74BA0 80084BA0 BCBA248C */  lw         $a0, %lo(plr + 0x1584)($at)
    /* 74BA4 80084BA4 21187100 */  addu       $v1, $v1, $s1
    /* 74BA8 80084BA8 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 74BAC 80084BAC 21082200 */  addu       $at, $at, $v0
    /* 74BB0 80084BB0 88A623AC */  sw         $v1, %lo(plr + 0x150)($at)
    /* 74BB4 80084BB4 3B008018 */  blez       $a0, .L80084CA4
    /* 74BB8 80084BB8 21900000 */   addu      $s2, $zero, $zero
    /* 74BBC 80084BBC 88131424 */  addiu      $s4, $zero, 0x1388
    /* 74BC0 80084BC0 21980000 */  addu       $s3, $zero, $zero
  .L80084BC4:
    /* 74BC4 80084BC4 4300201A */  blez       $s1, .L80084CD4
    /* 74BC8 80084BC8 2110B000 */   addu      $v0, $a1, $s0
    /* 74BCC 80084BCC 80100200 */  sll        $v0, $v0, 2
    /* 74BD0 80084BD0 21105000 */  addu       $v0, $v0, $s0
    /* 74BD4 80084BD4 00110200 */  sll        $v0, $v0, 4
    /* 74BD8 80084BD8 23105000 */  subu       $v0, $v0, $s0
    /* 74BDC 80084BDC 80100200 */  sll        $v0, $v0, 2
    /* 74BE0 80084BE0 21105000 */  addu       $v0, $v0, $s0
    /* 74BE4 80084BE4 C0100200 */  sll        $v0, $v0, 3
    /* 74BE8 80084BE8 21286202 */  addu       $a1, $s3, $v0
    /* 74BEC 80084BEC 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 74BF0 80084BF0 21082500 */  addu       $at, $at, $a1
    /* 74BF4 80084BF4 08AA2384 */  lh         $v1, %lo(plr + 0x4D0)($at)
    /* 74BF8 80084BF8 0B000224 */  addiu      $v0, $zero, 0xB
    /* 74BFC 80084BFC 19006214 */  bne        $v1, $v0, .L80084C64
    /* 74C00 80084C00 00000000 */   nop
    /* 74C04 80084C04 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 74C08 80084C08 21082500 */  addu       $at, $at, $a1
    /* 74C0C 80084C0C F0A9238C */  lw         $v1, %lo(plr + 0x4B8)($at)
    /* 74C10 80084C10 00000000 */  nop
    /* 74C14 80084C14 13007410 */  beq        $v1, $s4, .L80084C64
    /* 74C18 80084C18 21202302 */   addu      $a0, $s1, $v1
    /* 74C1C 80084C1C 89138228 */  slti       $v0, $a0, 0x1389
    /* 74C20 80084C20 09004010 */  beqz       $v0, .L80084C48
    /* 74C24 80084C24 78EC2226 */   addiu     $v0, $s1, -0x1388
    /* 74C28 80084C28 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 74C2C 80084C2C 21082500 */  addu       $at, $at, $a1
    /* 74C30 80084C30 F0A924AC */  sw         $a0, %lo(plr + 0x4B8)($at)
    /* 74C34 80084C34 21200002 */  addu       $a0, $s0, $zero
    /* 74C38 80084C38 92C1010C */  jal        SetGoldCurs__Fii
    /* 74C3C 80084C3C 21284002 */   addu      $a1, $s2, $zero
    /* 74C40 80084C40 19130208 */  j          .L80084C64
    /* 74C44 80084C44 21880000 */   addu      $s1, $zero, $zero
  .L80084C48:
    /* 74C48 80084C48 21884300 */  addu       $s1, $v0, $v1
    /* 74C4C 80084C4C 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 74C50 80084C50 21082500 */  addu       $at, $at, $a1
    /* 74C54 80084C54 F0A934AC */  sw         $s4, %lo(plr + 0x4B8)($at)
    /* 74C58 80084C58 21200002 */  addu       $a0, $s0, $zero
    /* 74C5C 80084C5C 92C1010C */  jal        SetGoldCurs__Fii
    /* 74C60 80084C60 21284002 */   addu      $a1, $s2, $zero
  .L80084C64:
    /* 74C64 80084C64 40281000 */  sll        $a1, $s0, 1
    /* 74C68 80084C68 2110B000 */  addu       $v0, $a1, $s0
    /* 74C6C 80084C6C 80100200 */  sll        $v0, $v0, 2
    /* 74C70 80084C70 21105000 */  addu       $v0, $v0, $s0
    /* 74C74 80084C74 00110200 */  sll        $v0, $v0, 4
    /* 74C78 80084C78 23105000 */  subu       $v0, $v0, $s0
    /* 74C7C 80084C7C 80100200 */  sll        $v0, $v0, 2
    /* 74C80 80084C80 21105000 */  addu       $v0, $v0, $s0
    /* 74C84 80084C84 C0100200 */  sll        $v0, $v0, 3
    /* 74C88 80084C88 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 74C8C 80084C8C 21082200 */  addu       $at, $at, $v0
    /* 74C90 80084C90 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 74C94 80084C94 01005226 */  addiu      $s2, $s2, 0x1
    /* 74C98 80084C98 2A104202 */  slt        $v0, $s2, $v0
    /* 74C9C 80084C9C C9FF4014 */  bnez       $v0, .L80084BC4
    /* 74CA0 80084CA0 6C007326 */   addiu     $s3, $s3, 0x6C
  .L80084CA4:
    /* 74CA4 80084CA4 0B00201A */  blez       $s1, .L80084CD4
    /* 74CA8 80084CA8 8913222A */   slti      $v0, $s1, 0x1389
    /* 74CAC 80084CAC 07004014 */  bnez       $v0, .L80084CCC
    /* 74CB0 80084CB0 21200002 */   addu      $a0, $s0, $zero
  .L80084CB4:
    /* 74CB4 80084CB4 4712020C */  jal        PlaceStoreGold2__Fil
    /* 74CB8 80084CB8 88130524 */   addiu     $a1, $zero, 0x1388
    /* 74CBC 80084CBC 78EC3126 */  addiu      $s1, $s1, -0x1388
    /* 74CC0 80084CC0 8913222A */  slti       $v0, $s1, 0x1389
    /* 74CC4 80084CC4 FBFF4010 */  beqz       $v0, .L80084CB4
    /* 74CC8 80084CC8 21200002 */   addu      $a0, $s0, $zero
  .L80084CCC:
    /* 74CCC 80084CCC 4712020C */  jal        PlaceStoreGold2__Fil
    /* 74CD0 80084CD0 21282002 */   addu      $a1, $s1, $zero
  .L80084CD4:
    /* 74CD4 80084CD4 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 74CD8 80084CD8 2800B48F */  lw         $s4, 0x28($sp)
    /* 74CDC 80084CDC 2400B38F */  lw         $s3, 0x24($sp)
    /* 74CE0 80084CE0 2000B28F */  lw         $s2, 0x20($sp)
    /* 74CE4 80084CE4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 74CE8 80084CE8 1800B08F */  lw         $s0, 0x18($sp)
    /* 74CEC 80084CEC 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 74CF0 80084CF0 0800E003 */  jr         $ra
    /* 74CF4 80084CF4 00000000 */   nop
endlabel GivePlayerDosh__Fil
