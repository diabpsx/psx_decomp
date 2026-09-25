.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_REQUESTGITEM__FPC4TCmdi, 0x140

glabel On_REQUESTGITEM__FPC4TCmdi
    /* 401B0 800501B0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 401B4 800501B4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 401B8 800501B8 21888000 */  addu       $s1, $a0, $zero
    /* 401BC 800501BC 40100500 */  sll        $v0, $a1, 1
    /* 401C0 800501C0 21104500 */  addu       $v0, $v0, $a1
    /* 401C4 800501C4 80100200 */  sll        $v0, $v0, 2
    /* 401C8 800501C8 21104500 */  addu       $v0, $v0, $a1
    /* 401CC 800501CC 00110200 */  sll        $v0, $v0, 4
    /* 401D0 800501D0 23104500 */  subu       $v0, $v0, $a1
    /* 401D4 800501D4 80100200 */  sll        $v0, $v0, 2
    /* 401D8 800501D8 21104500 */  addu       $v0, $v0, $a1
    /* 401DC 800501DC C0100200 */  sll        $v0, $v0, 3
    /* 401E0 800501E0 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 401E4 800501E4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 401E8 800501E8 2400B3AF */  sw         $s3, 0x24($sp)
    /* 401EC 800501EC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 401F0 800501F0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 401F4 800501F4 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 401F8 800501F8 21082200 */  addu       $at, $at, $v0
    /* 401FC 800501FC 5CA5248C */  lw         $a0, %lo(plr + 0x24)($at)
    /* 40200 80050200 BC3F010C */  jal        i_own_level__Fi
    /* 40204 80050204 00000000 */   nop
    /* 40208 80050208 FF004230 */  andi       $v0, $v0, 0xFF
    /* 4020C 8005020C 2F004010 */  beqz       $v0, .L800502CC
    /* 40210 80050210 00000000 */   nop
    /* 40214 80050214 1400268E */  lw         $a2, 0x14($s1)
    /* 40218 80050218 0E003396 */  lhu        $s3, 0xE($s1)
    /* 4021C 8005021C 10003496 */  lhu        $s4, 0x10($s1)
    /* 40220 80050220 21206002 */  addu       $a0, $s3, $zero
    /* 40224 80050224 C709020C */  jal        FindGetItem__FiUsi
    /* 40228 80050228 21288002 */   addu      $a1, $s4, $zero
    /* 4022C 8005022C 21904000 */  addu       $s2, $v0, $zero
    /* 40230 80050230 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 40234 80050234 1A004212 */  beq        $s2, $v0, .L800502A0
    /* 40238 80050238 21200000 */   addu      $a0, $zero, $zero
    /* 4023C 8005023C 1280063C */  lui        $a2, %hi(myplr)
    /* 40240 80050240 08BAC690 */  lbu        $a2, %lo(myplr)($a2)
    /* 40244 80050244 02003092 */  lbu        $s0, 0x2($s1)
    /* 40248 80050248 08000524 */  addiu      $a1, $zero, 0x8
    /* 4024C 8005024C 1000B1AF */  sw         $s1, 0x10($sp)
    /* 40250 80050250 A13E010C */  jal        NetSendCmdGItem2__FUcUcUcUcPC9TCmdGItem
    /* 40254 80050254 21380002 */   addu      $a3, $s0, $zero
    /* 40258 80050258 1280023C */  lui        $v0, %hi(myplr)
    /* 4025C 8005025C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 40260 80050260 00000000 */  nop
    /* 40264 80050264 09000212 */  beq        $s0, $v0, .L8005028C
    /* 40268 80050268 21306002 */   addu      $a2, $s3, $zero
    /* 4026C 8005026C 05002492 */  lbu        $a0, 0x5($s1)
    /* 40270 80050270 06002592 */  lbu        $a1, 0x6($s1)
    /* 40274 80050274 1400228E */  lw         $v0, 0x14($s1)
    /* 40278 80050278 21388002 */  addu       $a3, $s4, $zero
    /* 4027C 8005027C AE7B050C */  jal        func_8015EEB8
    /* 40280 80050280 1000A2AF */   sw        $v0, 0x10($sp)
    /* 40284 80050284 B3400108 */  j          .L800502CC
    /* 40288 80050288 00000000 */   nop
  .L8005028C:
    /* 4028C 8005028C 21200002 */  addu       $a0, $s0, $zero
    /* 40290 80050290 6078050C */  jal        func_8015E180
    /* 40294 80050294 21284002 */   addu      $a1, $s2, $zero
    /* 40298 80050298 B3400108 */  j          .L800502CC
    /* 4029C 8005029C 00000000 */   nop
  .L800502A0:
    /* 402A0 800502A0 27000424 */  addiu      $a0, $zero, 0x27
    /* 402A4 800502A4 1280053C */  lui        $a1, %hi(myplr)
    /* 402A8 800502A8 08BAA590 */  lbu        $a1, %lo(myplr)($a1)
    /* 402AC 800502AC 02002692 */  lbu        $a2, 0x2($s1)
    /* 402B0 800502B0 C23E010C */  jal        NetSendCmdReq2__FUcUcUcPC9TCmdGItem
    /* 402B4 800502B4 21382002 */   addu      $a3, $s1, $zero
    /* 402B8 800502B8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 402BC 800502BC 03004014 */  bnez       $v0, .L800502CC
    /* 402C0 800502C0 00000000 */   nop
    /* 402C4 800502C4 DA3E010C */  jal        NetSendCmdExtra__FPC9TCmdGItem
    /* 402C8 800502C8 21202002 */   addu      $a0, $s1, $zero
  .L800502CC:
    /* 402CC 800502CC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 402D0 800502D0 2800B48F */  lw         $s4, 0x28($sp)
    /* 402D4 800502D4 2400B38F */  lw         $s3, 0x24($sp)
    /* 402D8 800502D8 2000B28F */  lw         $s2, 0x20($sp)
    /* 402DC 800502DC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 402E0 800502E0 1800B08F */  lw         $s0, 0x18($sp)
    /* 402E4 800502E4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 402E8 800502E8 0800E003 */  jr         $ra
    /* 402EC 800502EC 00000000 */   nop
endlabel On_REQUESTGITEM__FPC4TCmdi
