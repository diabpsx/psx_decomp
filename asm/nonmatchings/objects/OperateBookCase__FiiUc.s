.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateBookCase__FiiUc, 0x218

glabel OperateBookCase__FiiUc
    /* 4C9C8 8005C9C8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 4C9CC 8005C9CC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 4C9D0 8005C9D0 21988000 */  addu       $s3, $a0, $zero
    /* 4C9D4 8005C9D4 2400B1AF */  sw         $s1, 0x24($sp)
    /* 4C9D8 8005C9D8 2188A000 */  addu       $s1, $a1, $zero
    /* 4C9DC 8005C9DC 40101100 */  sll        $v0, $s1, 1
    /* 4C9E0 8005C9E0 21105100 */  addu       $v0, $v0, $s1
    /* 4C9E4 8005C9E4 80100200 */  sll        $v0, $v0, 2
    /* 4C9E8 8005C9E8 23105100 */  subu       $v0, $v0, $s1
    /* 4C9EC 8005C9EC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 4C9F0 8005C9F0 80800200 */  sll        $s0, $v0, 2
    /* 4C9F4 8005C9F4 3000BFAF */  sw         $ra, 0x30($sp)
    /* 4C9F8 8005C9F8 2800B2AF */  sw         $s2, 0x28($sp)
    /* 4C9FC 8005C9FC 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4CA00 8005CA00 21083000 */  addu       $at, $at, $s0
    /* 4CA04 8005CA04 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4CA08 8005CA08 00000000 */  nop
    /* 4CA0C 8005CA0C 6C004010 */  beqz       $v0, .L8005CBC0
    /* 4CA10 8005CA10 2190C000 */   addu      $s2, $a2, $zero
    /* 4CA14 8005CA14 1280023C */  lui        $v0, %hi(deltaload)
    /* 4CA18 8005CA18 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4CA1C 8005CA1C 00000000 */  nop
    /* 4CA20 8005CA20 09004014 */  bnez       $v0, .L8005CA48
    /* 4CA24 8005CA24 00000000 */   nop
    /* 4CA28 8005CA28 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4CA2C 8005CA2C 21083000 */  addu       $at, $at, $s0
    /* 4CA30 8005CA30 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4CA34 8005CA34 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4CA38 8005CA38 21083000 */  addu       $at, $at, $s0
    /* 4CA3C 8005CA3C 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4CA40 8005CA40 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4CA44 8005CA44 26000424 */   addiu     $a0, $zero, 0x26
  .L8005CA48:
    /* 4CA48 8005CA48 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4CA4C 8005CA4C 21083000 */  addu       $at, $at, $s0
    /* 4CA50 8005CA50 6D8C2290 */  lbu        $v0, %lo(object + 0x21)($at)
    /* 4CA54 8005CA54 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4CA58 8005CA58 21083000 */  addu       $at, $at, $s0
    /* 4CA5C 8005CA5C 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4CA60 8005CA60 FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 4CA64 8005CA64 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4CA68 8005CA68 21083000 */  addu       $at, $at, $s0
    /* 4CA6C 8005CA6C 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 4CA70 8005CA70 DC9E010C */  jal        QuestStatus__Fi
    /* 4CA74 8005CA74 03000424 */   addiu     $a0, $zero, 0x3
    /* 4CA78 8005CA78 FF004230 */  andi       $v0, $v0, 0xFF
    /* 4CA7C 8005CA7C 2C004010 */  beqz       $v0, .L8005CB30
    /* 4CA80 8005CA80 00000000 */   nop
    /* 4CA84 8005CA84 1180033C */  lui        $v1, %hi(UniqMonst + 0x32)
    /* 4CA88 8005CA88 3AC76394 */  lhu        $v1, %lo(UniqMonst + 0x32)($v1)
    /* 4CA8C 8005CA8C 1080023C */  lui        $v0, %hi(monster + 0x1FC)
    /* 4CA90 8005CA90 9055428C */  lw         $v0, %lo(monster + 0x1FC)($v0)
    /* 4CA94 8005CA94 00000000 */  nop
    /* 4CA98 8005CA98 25004314 */  bne        $v0, $v1, .L8005CB30
    /* 4CA9C 8005CA9C 03000224 */   addiu     $v0, $zero, 0x3
    /* 4CAA0 8005CAA0 0E80103C */  lui        $s0, %hi(quests + 0x4C)
    /* 4CAA4 8005CAA4 8CDA1026 */  addiu      $s0, $s0, %lo(quests + 0x4C)
    /* 4CAA8 8005CAA8 00000392 */  lbu        $v1, 0x0($s0)
    /* 4CAAC 8005CAAC 00000000 */  nop
    /* 4CAB0 8005CAB0 1F006210 */  beq        $v1, $v0, .L8005CB30
    /* 4CAB4 8005CAB4 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 4CAB8 8005CAB8 1080033C */  lui        $v1, %hi(monster + 0x1EE)
    /* 4CABC 8005CABC 82556390 */  lbu        $v1, %lo(monster + 0x1EE)($v1)
    /* 4CAC0 8005CAC0 00000000 */  nop
    /* 4CAC4 8005CAC4 1A006214 */  bne        $v1, $v0, .L8005CB30
    /* 4CAC8 8005CAC8 00000000 */   nop
    /* 4CACC 8005CACC 1080023C */  lui        $v0, %hi(monster + 0x1B0)
    /* 4CAD0 8005CAD0 4455428C */  lw         $v0, %lo(monster + 0x1B0)($v0)
    /* 4CAD4 8005CAD4 00000000 */  nop
    /* 4CAD8 8005CAD8 15004010 */  beqz       $v0, .L8005CB30
    /* 4CADC 8005CADC 95000224 */   addiu     $v0, $zero, 0x95
    /* 4CAE0 8005CAE0 1080053C */  lui        $a1, %hi(monster + 0x1DC)
    /* 4CAE4 8005CAE4 7055A580 */  lb         $a1, %lo(monster + 0x1DC)($a1)
    /* 4CAE8 8005CAE8 1080013C */  lui        $at, %hi(monster + 0x1A0)
    /* 4CAEC 8005CAEC 345522AC */  sw         $v0, %lo(monster + 0x1A0)($at)
    /* 4CAF0 8005CAF0 9CFF010C */  jal        M_StartStand__Fii
    /* 4CAF4 8005CAF4 21200000 */   addu      $a0, $zero, $zero
    /* 4CAF8 8005CAF8 1280033C */  lui        $v1, %hi(deltaload)
    /* 4CAFC 8005CAFC 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 4CB00 8005CB00 05000224 */  addiu      $v0, $zero, 0x5
    /* 4CB04 8005CB04 1080013C */  lui        $at, %hi(monster + 0x1E9)
    /* 4CB08 8005CB08 7D5522A0 */  sb         $v0, %lo(monster + 0x1E9)($at)
    /* 4CB0C 8005CB0C 11000224 */  addiu      $v0, $zero, 0x11
    /* 4CB10 8005CB10 1080013C */  lui        $at, %hi(monster + 0x1D3)
    /* 4CB14 8005CB14 675522A0 */  sb         $v0, %lo(monster + 0x1D3)($at)
    /* 4CB18 8005CB18 03000224 */  addiu      $v0, $zero, 0x3
    /* 4CB1C 8005CB1C 28006014 */  bnez       $v1, .L8005CBC0
    /* 4CB20 8005CB20 000002A2 */   sb        $v0, 0x0($s0)
    /* 4CB24 8005CB24 01000424 */  addiu      $a0, $zero, 0x1
    /* 4CB28 8005CB28 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 4CB2C 8005CB2C 03000524 */   addiu     $a1, $zero, 0x3
  .L8005CB30:
    /* 4CB30 8005CB30 1280023C */  lui        $v0, %hi(deltaload)
    /* 4CB34 8005CB34 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4CB38 8005CB38 00000000 */  nop
    /* 4CB3C 8005CB3C 20004014 */  bnez       $v0, .L8005CBC0
    /* 4CB40 8005CB40 40801100 */   sll       $s0, $s1, 1
    /* 4CB44 8005CB44 21801102 */  addu       $s0, $s0, $s1
    /* 4CB48 8005CB48 80801000 */  sll        $s0, $s0, 2
    /* 4CB4C 8005CB4C 23801102 */  subu       $s0, $s0, $s1
    /* 4CB50 8005CB50 80801000 */  sll        $s0, $s0, 2
    /* 4CB54 8005CB54 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4CB58 8005CB58 21083000 */  addu       $at, $at, $s0
    /* 4CB5C 8005CB5C 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 4CB60 8005CB60 B3F6000C */  jal        SetRndSeed__Fl
    /* 4CB64 8005CB64 00000000 */   nop
    /* 4CB68 8005CB68 21300000 */  addu       $a2, $zero, $zero
    /* 4CB6C 8005CB6C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4CB70 8005CB70 21083000 */  addu       $at, $at, $s0
    /* 4CB74 8005CB74 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4CB78 8005CB78 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4CB7C 8005CB7C 21083000 */  addu       $at, $at, $s0
    /* 4CB80 8005CB80 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4CB84 8005CB84 18000224 */  addiu      $v0, $zero, 0x18
    /* 4CB88 8005CB88 1000A2AF */  sw         $v0, 0x10($sp)
    /* 4CB8C 8005CB8C FF004232 */  andi       $v0, $s2, 0xFF
    /* 4CB90 8005CB90 21380000 */  addu       $a3, $zero, $zero
    /* 4CB94 8005CB94 1400A2AF */  sw         $v0, 0x14($sp)
    /* 4CB98 8005CB98 B113010C */  jal        CreateTypeItem__FiiUciiUcUc
    /* 4CB9C 8005CB9C 1800A0AF */   sw        $zero, 0x18($sp)
    /* 4CBA0 8005CBA0 1280023C */  lui        $v0, %hi(myplr)
    /* 4CBA4 8005CBA4 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4CBA8 8005CBA8 00000000 */  nop
    /* 4CBAC 8005CBAC 04006216 */  bne        $s3, $v0, .L8005CBC0
    /* 4CBB0 8005CBB0 21200000 */   addu      $a0, $zero, $zero
    /* 4CBB4 8005CBB4 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4CBB8 8005CBB8 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 4CBBC 8005CBBC FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L8005CBC0:
    /* 4CBC0 8005CBC0 3000BF8F */  lw         $ra, 0x30($sp)
    /* 4CBC4 8005CBC4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 4CBC8 8005CBC8 2800B28F */  lw         $s2, 0x28($sp)
    /* 4CBCC 8005CBCC 2400B18F */  lw         $s1, 0x24($sp)
    /* 4CBD0 8005CBD0 2000B08F */  lw         $s0, 0x20($sp)
    /* 4CBD4 8005CBD4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 4CBD8 8005CBD8 0800E003 */  jr         $ra
    /* 4CBDC 8005CBDC 00000000 */   nop
endlabel OperateBookCase__FiiUc
