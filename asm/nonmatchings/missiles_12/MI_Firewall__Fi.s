.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Firewall__Fi, 0x31C

glabel MI_Firewall__Fi
    /* AC98 80144890 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* AC9C 80144894 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* ACA0 80144898 21888000 */  addu       $s1, $a0, $zero
    /* ACA4 8014489C 2000A727 */  addiu      $a3, $sp, 0x20
    /* ACA8 801448A0 1280063C */  lui        $a2, %hi(D_8011A0C0)
    /* ACAC 801448A4 C0A0C624 */  addiu      $a2, $a2, %lo(D_8011A0C0)
    /* ACB0 801448A8 3000C824 */  addiu      $t0, $a2, 0x30
    /* ACB4 801448AC 6000BFAF */  sw         $ra, 0x60($sp)
    /* ACB8 801448B0 5800B0AF */  sw         $s0, 0x58($sp)
  .L801448B4:
    /* ACBC 801448B4 0000C28C */  lw         $v0, 0x0($a2)
    /* ACC0 801448B8 0400C38C */  lw         $v1, 0x4($a2)
    /* ACC4 801448BC 0800C48C */  lw         $a0, 0x8($a2)
    /* ACC8 801448C0 0C00C58C */  lw         $a1, 0xC($a2)
    /* ACCC 801448C4 0000E2AC */  sw         $v0, 0x0($a3)
    /* ACD0 801448C8 0400E3AC */  sw         $v1, 0x4($a3)
    /* ACD4 801448CC 0800E4AC */  sw         $a0, 0x8($a3)
    /* ACD8 801448D0 0C00E5AC */  sw         $a1, 0xC($a3)
    /* ACDC 801448D4 1000C624 */  addiu      $a2, $a2, 0x10
    /* ACE0 801448D8 F6FFC814 */  bne        $a2, $t0, .L801448B4
    /* ACE4 801448DC 1000E724 */   addiu     $a3, $a3, 0x10
    /* ACE8 801448E0 0000C28C */  lw         $v0, 0x0($a2)
    /* ACEC 801448E4 0400C38C */  lw         $v1, 0x4($a2)
    /* ACF0 801448E8 0000E2AC */  sw         $v0, 0x0($a3)
    /* ACF4 801448EC 0400E3AC */  sw         $v1, 0x4($a3)
    /* ACF8 801448F0 80101100 */  sll        $v0, $s1, 2
    /* ACFC 801448F4 21105100 */  addu       $v0, $v0, $s1
    /* AD00 801448F8 80100200 */  sll        $v0, $v0, 2
    /* AD04 801448FC 23105100 */  subu       $v0, $v0, $s1
    /* AD08 80144900 80800200 */  sll        $s0, $v0, 2
    /* AD0C 80144904 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AD10 80144908 21083000 */  addu       $at, $at, $s0
    /* AD14 8014490C 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* AD18 80144910 00000000 */  nop
    /* AD1C 80144914 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* AD20 80144918 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AD24 8014491C 21083000 */  addu       $at, $at, $s0
    /* AD28 80144920 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* AD2C 80144924 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AD30 80144928 21083000 */  addu       $at, $at, $s0
    /* AD34 8014492C 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* AD38 80144930 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* AD3C 80144934 21083000 */  addu       $at, $at, $s0
    /* AD40 80144938 762C2284 */  lh         $v0, %lo(missile + 0x1E)($at)
    /* AD44 8014493C 00000000 */  nop
    /* AD48 80144940 0A006214 */  bne        $v1, $v0, .L8014496C
    /* AD4C 80144944 00000000 */   nop
    /* AD50 80144948 21202002 */  addu       $a0, $s1, $zero
    /* AD54 8014494C 09F5040C */  jal        SetMissDir__Fii
    /* AD58 80144950 01000524 */   addiu     $a1, $zero, 0x1
    /* AD5C 80144954 C9F6000C */  jal        ENG_random__Fl
    /* AD60 80144958 0B000424 */   addiu     $a0, $zero, 0xB
    /* AD64 8014495C 01004224 */  addiu      $v0, $v0, 0x1
    /* AD68 80144960 1080013C */  lui        $at, %hi(missile + 0x47)
    /* AD6C 80144964 21083000 */  addu       $at, $at, $s0
    /* AD70 80144968 9F2C22A0 */  sb         $v0, %lo(missile + 0x47)($at)
  .L8014496C:
    /* AD74 8014496C 1080013C */  lui        $at, %hi(missile + 0x42)
    /* AD78 80144970 21083000 */  addu       $at, $at, $s0
    /* AD7C 80144974 9A2C2280 */  lb         $v0, %lo(missile + 0x42)($at)
    /* AD80 80144978 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AD84 8014497C 21083000 */  addu       $at, $at, $s0
    /* AD88 80144980 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* AD8C 80144984 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* AD90 80144988 0C006214 */  bne        $v1, $v0, .L801449BC
    /* AD94 8014498C 21202002 */   addu      $a0, $s1, $zero
    /* AD98 80144990 09F5040C */  jal        SetMissDir__Fii
    /* AD9C 80144994 21280000 */   addu      $a1, $zero, $zero
    /* ADA0 80144998 0D000224 */  addiu      $v0, $zero, 0xD
    /* ADA4 8014499C 1080013C */  lui        $at, %hi(missile + 0x47)
    /* ADA8 801449A0 21083000 */  addu       $at, $at, $s0
    /* ADAC 801449A4 9F2C22A0 */  sb         $v0, %lo(missile + 0x47)($at)
    /* ADB0 801449A8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* ADB4 801449AC 1080013C */  lui        $at, %hi(missile + 0x46)
    /* ADB8 801449B0 21083000 */  addu       $at, $at, $s0
    /* ADBC 801449B4 9E2C22A0 */  sb         $v0, %lo(missile + 0x46)($at)
    /* ADC0 801449B8 21202002 */  addu       $a0, $s1, $zero
  .L801449BC:
    /* ADC4 801449BC 01000724 */  addiu      $a3, $zero, 0x1
    /* ADC8 801449C0 1080013C */  lui        $at, %hi(missile + 0x10)
    /* ADCC 801449C4 21083000 */  addu       $at, $at, $s0
    /* ADD0 801449C8 682C258C */  lw         $a1, %lo(missile + 0x10)($at)
    /* ADD4 801449CC 1080013C */  lui        $at, %hi(missile + 0x31)
    /* ADD8 801449D0 21083000 */  addu       $at, $at, $s0
    /* ADDC 801449D4 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* ADE0 801449D8 2130A000 */  addu       $a2, $a1, $zero
    /* ADE4 801449DC 1000A2AF */  sw         $v0, 0x10($sp)
    /* ADE8 801449E0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* ADEC 801449E4 21083000 */  addu       $at, $at, $s0
    /* ADF0 801449E8 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* ADF4 801449EC 01000224 */  addiu      $v0, $zero, 0x1
    /* ADF8 801449F0 1800A2AF */  sw         $v0, 0x18($sp)
    /* ADFC 801449F4 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* AE00 801449F8 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* AE04 801449FC 1400A3AF */   sw        $v1, 0x14($sp)
    /* AE08 80144A00 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AE0C 80144A04 21083000 */  addu       $at, $at, $s0
    /* AE10 80144A08 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* AE14 80144A0C 00000000 */  nop
    /* AE18 80144A10 0E004014 */  bnez       $v0, .L80144A4C
    /* AE1C 80144A14 80101100 */   sll       $v0, $s1, 2
    /* AE20 80144A18 01000224 */  addiu      $v0, $zero, 0x1
    /* AE24 80144A1C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* AE28 80144A20 21083000 */  addu       $at, $at, $s0
    /* AE2C 80144A24 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* AE30 80144A28 FF002232 */  andi       $v0, $s1, 0xFF
    /* AE34 80144A2C 07004010 */  beqz       $v0, .L80144A4C
    /* AE38 80144A30 80101100 */   sll       $v0, $s1, 2
    /* AE3C 80144A34 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* AE40 80144A38 21083000 */  addu       $at, $at, $s0
    /* AE44 80144A3C 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* AE48 80144A40 D034010C */  jal        AddUnLight__Fi
    /* AE4C 80144A44 00000000 */   nop
    /* AE50 80144A48 80101100 */  sll        $v0, $s1, 2
  .L80144A4C:
    /* AE54 80144A4C 21105100 */  addu       $v0, $v0, $s1
    /* AE58 80144A50 80100200 */  sll        $v0, $v0, 2
    /* AE5C 80144A54 23105100 */  subu       $v0, $v0, $s1
    /* AE60 80144A58 80800200 */  sll        $s0, $v0, 2
    /* AE64 80144A5C 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* AE68 80144A60 21083000 */  addu       $at, $at, $s0
    /* AE6C 80144A64 972C2280 */  lb         $v0, %lo(missile + 0x3F)($at)
    /* AE70 80144A68 00000000 */  nop
    /* AE74 80144A6C 47004010 */  beqz       $v0, .L80144B8C
    /* AE78 80144A70 00000000 */   nop
    /* AE7C 80144A74 1080013C */  lui        $at, %hi(missile + 0x18)
    /* AE80 80144A78 21083000 */  addu       $at, $at, $s0
    /* AE84 80144A7C 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* AE88 80144A80 00000000 */  nop
    /* AE8C 80144A84 41004010 */  beqz       $v0, .L80144B8C
    /* AE90 80144A88 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* AE94 80144A8C 1080013C */  lui        $at, %hi(missile + 0x46)
    /* AE98 80144A90 21083000 */  addu       $at, $at, $s0
    /* AE9C 80144A94 9E2C2380 */  lb         $v1, %lo(missile + 0x46)($at)
    /* AEA0 80144A98 00000000 */  nop
    /* AEA4 80144A9C 3B006210 */  beq        $v1, $v0, .L80144B8C
    /* AEA8 80144AA0 00000000 */   nop
    /* AEAC 80144AA4 1080013C */  lui        $at, %hi(missile + 0x20)
    /* AEB0 80144AA8 21083000 */  addu       $at, $at, $s0
    /* AEB4 80144AAC 782C2384 */  lh         $v1, %lo(missile + 0x20)($at)
    /* AEB8 80144AB0 00000000 */  nop
    /* AEBC 80144AB4 0C006228 */  slti       $v0, $v1, 0xC
    /* AEC0 80144AB8 34004010 */  beqz       $v0, .L80144B8C
    /* AEC4 80144ABC 00000000 */   nop
    /* AEC8 80144AC0 11006014 */  bnez       $v1, .L80144B08
    /* AECC 80144AC4 FF002232 */   andi      $v0, $s1, 0xFF
    /* AED0 80144AC8 24004010 */  beqz       $v0, .L80144B5C
    /* AED4 80144ACC 80101100 */   sll       $v0, $s1, 2
    /* AED8 80144AD0 1080013C */  lui        $at, %hi(missile + 0x31)
    /* AEDC 80144AD4 21083000 */  addu       $at, $at, $s0
    /* AEE0 80144AD8 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* AEE4 80144ADC 2000A68F */  lw         $a2, 0x20($sp)
    /* AEE8 80144AE0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* AEEC 80144AE4 21083000 */  addu       $at, $at, $s0
    /* AEF0 80144AE8 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* AEF4 80144AEC C3300600 */  sra        $a2, $a2, 3
    /* AEF8 80144AF0 BA34010C */  jal        AddLight__Fiii
    /* AEFC 80144AF4 1000C624 */   addiu     $a2, $a2, 0x10
    /* AF00 80144AF8 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* AF04 80144AFC 21083000 */  addu       $at, $at, $s0
    /* AF08 80144B00 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* AF0C 80144B04 FF002232 */  andi       $v0, $s1, 0xFF
  .L80144B08:
    /* AF10 80144B08 14004010 */  beqz       $v0, .L80144B5C
    /* AF14 80144B0C 80101100 */   sll       $v0, $s1, 2
    /* AF18 80144B10 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* AF1C 80144B14 21083000 */  addu       $at, $at, $s0
    /* AF20 80144B18 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* AF24 80144B1C 1080013C */  lui        $at, %hi(missile + 0x20)
    /* AF28 80144B20 21083000 */  addu       $at, $at, $s0
    /* AF2C 80144B24 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* AF30 80144B28 1080013C */  lui        $at, %hi(missile + 0x31)
    /* AF34 80144B2C 21083000 */  addu       $at, $at, $s0
    /* AF38 80144B30 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* AF3C 80144B34 80100200 */  sll        $v0, $v0, 2
    /* AF40 80144B38 2110A203 */  addu       $v0, $sp, $v0
    /* AF44 80144B3C 2000478C */  lw         $a3, 0x20($v0)
    /* AF48 80144B40 1080013C */  lui        $at, %hi(missile + 0x32)
    /* AF4C 80144B44 21083000 */  addu       $at, $at, $s0
    /* AF50 80144B48 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* AF54 80144B4C 83380700 */  sra        $a3, $a3, 2
    /* AF58 80144B50 F834010C */  jal        ChangeLight__Fiiii
    /* AF5C 80144B54 1000E724 */   addiu     $a3, $a3, 0x10
    /* AF60 80144B58 80101100 */  sll        $v0, $s1, 2
  .L80144B5C:
    /* AF64 80144B5C 21105100 */  addu       $v0, $v0, $s1
    /* AF68 80144B60 80100200 */  sll        $v0, $v0, 2
    /* AF6C 80144B64 23105100 */  subu       $v0, $v0, $s1
    /* AF70 80144B68 80100200 */  sll        $v0, $v0, 2
    /* AF74 80144B6C 1080013C */  lui        $at, %hi(missile + 0x20)
    /* AF78 80144B70 21082200 */  addu       $at, $at, $v0
    /* AF7C 80144B74 782C2394 */  lhu        $v1, %lo(missile + 0x20)($at)
    /* AF80 80144B78 00000000 */  nop
    /* AF84 80144B7C 01006324 */  addiu      $v1, $v1, 0x1
    /* AF88 80144B80 1080013C */  lui        $at, %hi(missile + 0x20)
    /* AF8C 80144B84 21082200 */  addu       $at, $at, $v0
    /* AF90 80144B88 782C23A4 */  sh         $v1, %lo(missile + 0x20)($at)
  .L80144B8C:
    /* AF94 80144B8C D1EA040C */  jal        PutMissile__Fi
    /* AF98 80144B90 21202002 */   addu      $a0, $s1, $zero
    /* AF9C 80144B94 6000BF8F */  lw         $ra, 0x60($sp)
    /* AFA0 80144B98 5C00B18F */  lw         $s1, 0x5C($sp)
    /* AFA4 80144B9C 5800B08F */  lw         $s0, 0x58($sp)
    /* AFA8 80144BA0 6800BD27 */  addiu      $sp, $sp, 0x68
    /* AFAC 80144BA4 0800E003 */  jr         $ra
    /* AFB0 80144BA8 00000000 */   nop
endlabel MI_Firewall__Fi
