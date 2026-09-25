.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_ScrollSBuy__Fi, 0x208

glabel S_ScrollSBuy__Fi
    /* 5ABD8 8006ABD8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 5ABDC 8006ABDC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5ABE0 8006ABE0 21808000 */  addu       $s0, $a0, $zero
    /* 5ABE4 8006ABE4 05000424 */  addiu      $a0, $zero, 0x5
    /* 5ABE8 8006ABE8 15000524 */  addiu      $a1, $zero, 0x15
    /* 5ABEC 8006ABEC 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 5ABF0 8006ABF0 2800B4AF */  sw         $s4, 0x28($sp)
    /* 5ABF4 8006ABF4 2400B3AF */  sw         $s3, 0x24($sp)
    /* 5ABF8 8006ABF8 2000B2AF */  sw         $s2, 0x20($sp)
    /* 5ABFC 8006ABFC 36A7010C */  jal        ClearSText__Fii
    /* 5AC00 8006AC00 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 5AC04 8006AC04 05000224 */  addiu      $v0, $zero, 0x5
    /* 5AC08 8006AC08 05001124 */  addiu      $s1, $zero, 0x5
    /* 5AC0C 8006AC0C 0E80033C */  lui        $v1, %hi(_smithitem)
    /* 5AC10 8006AC10 28E46324 */  addiu      $v1, $v1, %lo(_smithitem)
    /* 5AC14 8006AC14 1C2182AF */  sw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 5AC18 8006AC18 C0101000 */  sll        $v0, $s0, 3
    /* 5AC1C 8006AC1C 23105000 */  subu       $v0, $v0, $s0
    /* 5AC20 8006AC20 80100200 */  sll        $v0, $v0, 2
    /* 5AC24 8006AC24 23105000 */  subu       $v0, $v0, $s0
    /* 5AC28 8006AC28 80100200 */  sll        $v0, $v0, 2
    /* 5AC2C 8006AC2C 21904300 */  addu       $s2, $v0, $v1
    /* 5AC30 8006AC30 21984000 */  addu       $s3, $v0, $zero
  .L8006AC34:
    /* 5AC34 8006AC34 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5AC38 8006AC38 00000000 */  nop
    /* 5AC3C 8006AC3C 00110300 */  sll        $v0, $v1, 4
    /* 5AC40 8006AC40 21104300 */  addu       $v0, $v0, $v1
    /* 5AC44 8006AC44 C0100200 */  sll        $v0, $v0, 3
    /* 5AC48 8006AC48 23104300 */  subu       $v0, $v0, $v1
    /* 5AC4C 8006AC4C 00210200 */  sll        $a0, $v0, 4
    /* 5AC50 8006AC50 21286402 */  addu       $a1, $s3, $a0
    /* 5AC54 8006AC54 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 5AC58 8006AC58 21082500 */  addu       $at, $at, $a1
    /* 5AC5C 8006AC5C 54E42384 */  lh         $v1, %lo(_smithitem + 0x2C)($at)
    /* 5AC60 8006AC60 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5AC64 8006AC64 3F006210 */  beq        $v1, $v0, .L8006AD64
    /* 5AC68 8006AC68 00000000 */   nop
    /* 5AC6C 8006AC6C 0E80013C */  lui        $at, %hi(_smithitem + 0x51)
    /* 5AC70 8006AC70 21082500 */  addu       $at, $at, $a1
    /* 5AC74 8006AC74 79E42380 */  lb         $v1, %lo(_smithitem + 0x51)($at)
    /* 5AC78 8006AC78 00000000 */  nop
    /* 5AC7C 8006AC7C 2B100300 */  sltu       $v0, $zero, $v1
    /* 5AC80 8006AC80 21804000 */  addu       $s0, $v0, $zero
    /* 5AC84 8006AC84 0E80013C */  lui        $at, %hi(_smithitem + 0x66)
    /* 5AC88 8006AC88 21082500 */  addu       $at, $at, $a1
    /* 5AC8C 8006AC8C 8EE42280 */  lb         $v0, %lo(_smithitem + 0x66)($at)
    /* 5AC90 8006AC90 00000000 */  nop
    /* 5AC94 8006AC94 02004014 */  bnez       $v0, .L8006ACA0
    /* 5AC98 8006AC98 21A02002 */   addu      $s4, $s1, $zero
    /* 5AC9C 8006AC9C 02001024 */  addiu      $s0, $zero, 0x2
  .L8006ACA0:
    /* 5ACA0 8006ACA0 07006010 */  beqz       $v1, .L8006ACC0
    /* 5ACA4 8006ACA4 00000000 */   nop
    /* 5ACA8 8006ACA8 38218697 */  lhu        $a2, %gp_rel(D_8011C8B8)($gp)
    /* 5ACAC 8006ACAC 0E80013C */  lui        $at, %hi(_smithitem + 0x28)
    /* 5ACB0 8006ACB0 21082500 */  addu       $at, $at, $a1
    /* 5ACB4 8006ACB4 50E42594 */  lhu        $a1, %lo(_smithitem + 0x28)($at)
    /* 5ACB8 8006ACB8 35AB0108 */  j          .L8006ACD4
    /* 5ACBC 8006ACBC 21209200 */   addu      $a0, $a0, $s2
  .L8006ACC0:
    /* 5ACC0 8006ACC0 21209200 */  addu       $a0, $a0, $s2
    /* 5ACC4 8006ACC4 38218697 */  lhu        $a2, %gp_rel(D_8011C8B8)($gp)
    /* 5ACC8 8006ACC8 0E80013C */  lui        $at, %hi(_smithitem + 0x26)
    /* 5ACCC 8006ACCC 21082500 */  addu       $at, $at, $a1
    /* 5ACD0 8006ACD0 4EE42594 */  lhu        $a1, %lo(_smithitem + 0x26)($at)
  .L8006ACD4:
    /* 5ACD4 8006ACD4 BCFFC624 */  addiu      $a2, $a2, -0x44
    /* 5ACD8 8006ACD8 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 5ACDC 8006ACDC FFFFC630 */   andi      $a2, $a2, 0xFFFF
    /* 5ACE0 8006ACE0 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5ACE4 8006ACE4 21282002 */  addu       $a1, $s1, $zero
    /* 5ACE8 8006ACE8 21300000 */  addu       $a2, $zero, $zero
    /* 5ACEC 8006ACEC 21384000 */  addu       $a3, $v0, $zero
    /* 5ACF0 8006ACF0 01000224 */  addiu      $v0, $zero, 0x1
    /* 5ACF4 8006ACF4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5ACF8 8006ACF8 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5ACFC 8006ACFC 1400A2AF */   sw        $v0, 0x14($sp)
    /* 5AD00 8006AD00 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5AD04 8006AD04 21202002 */  addu       $a0, $s1, $zero
    /* 5AD08 8006AD08 00110300 */  sll        $v0, $v1, 4
    /* 5AD0C 8006AD0C 21104300 */  addu       $v0, $v0, $v1
    /* 5AD10 8006AD10 C0100200 */  sll        $v0, $v0, 3
    /* 5AD14 8006AD14 23104300 */  subu       $v0, $v0, $v1
    /* 5AD18 8006AD18 00110200 */  sll        $v0, $v0, 4
    /* 5AD1C 8006AD1C 21106202 */  addu       $v0, $s3, $v0
    /* 5AD20 8006AD20 0E80013C */  lui        $at, %hi(_smithitem + 0x18)
    /* 5AD24 8006AD24 21082200 */  addu       $at, $at, $v0
    /* 5AD28 8006AD28 40E4258C */  lw         $a1, %lo(_smithitem + 0x18)($at)
    /* 5AD2C 8006AD2C 70A7010C */  jal        AddSTextVal__Fii
    /* 5AD30 8006AD30 6C007326 */   addiu     $s3, $s3, 0x6C
    /* 5AD34 8006AD34 01002526 */  addiu      $a1, $s1, 0x1
    /* 5AD38 8006AD38 3413828F */  lw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 5AD3C 8006AD3C 21300002 */  addu       $a2, $s0, $zero
    /* 5AD40 8006AD40 00210200 */  sll        $a0, $v0, 4
    /* 5AD44 8006AD44 21208200 */  addu       $a0, $a0, $v0
    /* 5AD48 8006AD48 C0200400 */  sll        $a0, $a0, 3
    /* 5AD4C 8006AD4C 23208200 */  subu       $a0, $a0, $v0
    /* 5AD50 8006AD50 00210400 */  sll        $a0, $a0, 4
    /* 5AD54 8006AD54 B3A7010C */  jal        PrintStoreItem__FPC10ItemStructic
    /* 5AD58 8006AD58 21209200 */   addu      $a0, $a0, $s2
    /* 5AD5C 8006AD5C 6C005226 */  addiu      $s2, $s2, 0x6C
    /* 5AD60 8006AD60 202194AF */  sw         $s4, %gp_rel(D_8011C8A0)($gp)
  .L8006AD64:
    /* 5AD64 8006AD64 04003126 */  addiu      $s1, $s1, 0x4
    /* 5AD68 8006AD68 0F00222A */  slti       $v0, $s1, 0xF
    /* 5AD6C 8006AD6C B1FF4014 */  bnez       $v0, .L8006AC34
    /* 5AD70 8006AD70 00000000 */   nop
    /* 5AD74 8006AD74 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 5AD78 8006AD78 00000000 */  nop
    /* 5AD7C 8006AD7C C0100300 */  sll        $v0, $v1, 3
    /* 5AD80 8006AD80 21104300 */  addu       $v0, $v0, $v1
    /* 5AD84 8006AD84 80100200 */  sll        $v0, $v0, 2
    /* 5AD88 8006AD88 23104300 */  subu       $v0, $v0, $v1
    /* 5AD8C 8006AD8C 80100200 */  sll        $v0, $v0, 2
    /* 5AD90 8006AD90 1380013C */  lui        $at, %hi(D_8012EECD)
    /* 5AD94 8006AD94 21082200 */  addu       $at, $at, $v0
    /* 5AD98 8006AD98 CDEE2290 */  lbu        $v0, %lo(D_8012EECD)($at)
    /* 5AD9C 8006AD9C 00000000 */  nop
    /* 5ADA0 8006ADA0 06004014 */  bnez       $v0, .L8006ADBC
    /* 5ADA4 8006ADA4 16000224 */   addiu     $v0, $zero, 0x16
    /* 5ADA8 8006ADA8 04006210 */  beq        $v1, $v0, .L8006ADBC
    /* 5ADAC 8006ADAC 00000000 */   nop
    /* 5ADB0 8006ADB0 2021828F */  lw         $v0, %gp_rel(D_8011C8A0)($gp)
    /* 5ADB4 8006ADB4 00000000 */  nop
    /* 5ADB8 8006ADB8 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
  .L8006ADBC:
    /* 5ADBC 8006ADBC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 5ADC0 8006ADC0 2800B48F */  lw         $s4, 0x28($sp)
    /* 5ADC4 8006ADC4 2400B38F */  lw         $s3, 0x24($sp)
    /* 5ADC8 8006ADC8 2000B28F */  lw         $s2, 0x20($sp)
    /* 5ADCC 8006ADCC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5ADD0 8006ADD0 1800B08F */  lw         $s0, 0x18($sp)
    /* 5ADD4 8006ADD4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 5ADD8 8006ADD8 0800E003 */  jr         $ra
    /* 5ADDC 8006ADDC 00000000 */   nop
endlabel S_ScrollSBuy__Fi
