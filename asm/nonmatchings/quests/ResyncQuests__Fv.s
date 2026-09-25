.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ResyncQuests__Fv, 0x4EC

glabel ResyncQuests__Fv
    /* 58330 80068330 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 58334 80068334 3400BFAF */  sw         $ra, 0x34($sp)
    /* 58338 80068338 3000B0AF */  sw         $s0, 0x30($sp)
    /* 5833C 8006833C DC9E010C */  jal        QuestStatus__Fi
    /* 58340 80068340 07000424 */   addiu     $a0, $zero, 0x7
    /* 58344 80068344 FF004230 */  andi       $v0, $v0, 0xFF
    /* 58348 80068348 94004010 */  beqz       $v0, .L8006859C
    /* 5834C 8006834C 01000224 */   addiu     $v0, $zero, 0x1
    /* 58350 80068350 0E80103C */  lui        $s0, %hi(quests + 0x9B)
    /* 58354 80068354 DBDA1026 */  addiu      $s0, $s0, %lo(quests + 0x9B)
    /* 58358 80068358 00000392 */  lbu        $v1, 0x0($s0)
    /* 5835C 8006835C 00000000 */  nop
    /* 58360 80068360 12006214 */  bne        $v1, $v0, .L800683AC
    /* 58364 80068364 02000224 */   addiu     $v0, $zero, 0x2
    /* 58368 80068368 1280063C */  lui        $a2, %hi(setpc_x)
    /* 5836C 8006836C E4C0C68C */  lw         $a2, %lo(setpc_x)($a2)
    /* 58370 80068370 1280023C */  lui        $v0, %hi(setpc_w)
    /* 58374 80068374 ECC0428C */  lw         $v0, %lo(setpc_w)($v0)
    /* 58378 80068378 1280073C */  lui        $a3, %hi(setpc_y)
    /* 5837C 8006837C E8C0E78C */  lw         $a3, %lo(setpc_y)($a3)
    /* 58380 80068380 2130C200 */  addu       $a2, $a2, $v0
    /* 58384 80068384 FEFFC424 */  addiu      $a0, $a2, -0x2
    /* 58388 80068388 1280023C */  lui        $v0, %hi(setpc_h)
    /* 5838C 8006838C F0C0428C */  lw         $v0, %lo(setpc_h)($v0)
    /* 58390 80068390 0100C624 */  addiu      $a2, $a2, 0x1
    /* 58394 80068394 2138E200 */  addu       $a3, $a3, $v0
    /* 58398 80068398 FEFFE524 */  addiu      $a1, $a3, -0x2
    /* 5839C 8006839C 5E5E010C */  jal        ObjChangeMapResync__Fiiii
    /* 583A0 800683A0 0100E724 */   addiu     $a3, $a3, 0x1
    /* 583A4 800683A4 00000392 */  lbu        $v1, 0x0($s0)
    /* 583A8 800683A8 02000224 */  addiu      $v0, $zero, 0x2
  .L800683AC:
    /* 583AC 800683AC 44006214 */  bne        $v1, $v0, .L800684C0
    /* 583B0 800683B0 00000000 */   nop
    /* 583B4 800683B4 1280063C */  lui        $a2, %hi(setpc_x)
    /* 583B8 800683B8 E4C0C68C */  lw         $a2, %lo(setpc_x)($a2)
    /* 583BC 800683BC 1280023C */  lui        $v0, %hi(setpc_w)
    /* 583C0 800683C0 ECC0428C */  lw         $v0, %lo(setpc_w)($v0)
    /* 583C4 800683C4 1280073C */  lui        $a3, %hi(setpc_y)
    /* 583C8 800683C8 E8C0E78C */  lw         $a3, %lo(setpc_y)($a3)
    /* 583CC 800683CC 2130C200 */  addu       $a2, $a2, $v0
    /* 583D0 800683D0 FEFFC424 */  addiu      $a0, $a2, -0x2
    /* 583D4 800683D4 1280023C */  lui        $v0, %hi(setpc_h)
    /* 583D8 800683D8 F0C0428C */  lw         $v0, %lo(setpc_h)($v0)
    /* 583DC 800683DC 0100C624 */  addiu      $a2, $a2, 0x1
    /* 583E0 800683E0 2138E200 */  addu       $a3, $a3, $v0
    /* 583E4 800683E4 FEFFE524 */  addiu      $a1, $a3, -0x2
    /* 583E8 800683E8 5E5E010C */  jal        ObjChangeMapResync__Fiiii
    /* 583EC 800683EC 0100E724 */   addiu     $a3, $a3, 0x1
    /* 583F0 800683F0 1280043C */  lui        $a0, %hi(setpc_x)
    /* 583F4 800683F4 E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 583F8 800683F8 1280023C */  lui        $v0, %hi(setpc_w)
    /* 583FC 800683FC ECC0428C */  lw         $v0, %lo(setpc_w)($v0)
    /* 58400 80068400 1280053C */  lui        $a1, %hi(setpc_y)
    /* 58404 80068404 E8C0A58C */  lw         $a1, %lo(setpc_y)($a1)
    /* 58408 80068408 43100200 */  sra        $v0, $v0, 1
    /* 5840C 8006840C 21308200 */  addu       $a2, $a0, $v0
    /* 58410 80068410 1280023C */  lui        $v0, %hi(setpc_h)
    /* 58414 80068414 F0C0428C */  lw         $v0, %lo(setpc_h)($v0)
    /* 58418 80068418 0200C624 */  addiu      $a2, $a2, 0x2
    /* 5841C 8006841C 43100200 */  sra        $v0, $v0, 1
    /* 58420 80068420 2138A200 */  addu       $a3, $a1, $v0
    /* 58424 80068424 5E5E010C */  jal        ObjChangeMapResync__Fiiii
    /* 58428 80068428 FEFFE724 */   addiu     $a3, $a3, -0x2
    /* 5842C 8006842C 1280023C */  lui        $v0, %hi(numobjects)
    /* 58430 80068430 CCB9428C */  lw         $v0, %lo(numobjects)($v0)
    /* 58434 80068434 00000000 */  nop
    /* 58438 80068438 0C004018 */  blez       $v0, .L8006846C
    /* 5843C 8006843C 21800000 */   addu      $s0, $zero, $zero
  .L80068440:
    /* 58440 80068440 0E80013C */  lui        $at, %hi(objectactive)
    /* 58444 80068444 21083000 */  addu       $at, $at, $s0
    /* 58448 80068448 20A22480 */  lb         $a0, %lo(objectactive)($at)
    /* 5844C 8006844C E27C010C */  jal        SyncObjectAnim__Fi
    /* 58450 80068450 01001026 */   addiu     $s0, $s0, 0x1
    /* 58454 80068454 1280023C */  lui        $v0, %hi(numobjects)
    /* 58458 80068458 CCB9428C */  lw         $v0, %lo(numobjects)($v0)
    /* 5845C 8006845C 00000000 */  nop
    /* 58460 80068460 2A100202 */  slt        $v0, $s0, $v0
    /* 58464 80068464 F6FF4014 */  bnez       $v0, .L80068440
    /* 58468 80068468 00000000 */   nop
  .L8006846C:
    /* 5846C 8006846C 1280103C */  lui        $s0, %hi(TransVal)
    /* 58470 80068470 48C11082 */  lb         $s0, %lo(TransVal)($s0)
    /* 58474 80068474 1280043C */  lui        $a0, %hi(setpc_x)
    /* 58478 80068478 E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 5847C 8006847C 1280053C */  lui        $a1, %hi(setpc_y)
    /* 58480 80068480 E8C0A58C */  lw         $a1, %lo(setpc_y)($a1)
    /* 58484 80068484 09000224 */  addiu      $v0, $zero, 0x9
    /* 58488 80068488 1280013C */  lui        $at, %hi(TransVal)
    /* 5848C 8006848C 48C122A0 */  sb         $v0, %lo(TransVal)($at)
    /* 58490 80068490 1280023C */  lui        $v0, %hi(setpc_w)
    /* 58494 80068494 ECC0428C */  lw         $v0, %lo(setpc_w)($v0)
    /* 58498 80068498 1280073C */  lui        $a3, %hi(setpc_h)
    /* 5849C 8006849C F0C0E78C */  lw         $a3, %lo(setpc_h)($a3)
    /* 584A0 800684A0 43100200 */  sra        $v0, $v0, 1
    /* 584A4 800684A4 21308200 */  addu       $a2, $a0, $v0
    /* 584A8 800684A8 0400C624 */  addiu      $a2, $a2, 0x4
    /* 584AC 800684AC 43380700 */  sra        $a3, $a3, 1
    /* 584B0 800684B0 375E010C */  jal        DRLG_MRectTrans__Fiiii
    /* 584B4 800684B4 2138A700 */   addu      $a3, $a1, $a3
    /* 584B8 800684B8 1280013C */  lui        $at, %hi(TransVal)
    /* 584BC 800684BC 48C130A0 */  sb         $s0, %lo(TransVal)($at)
  .L800684C0:
    /* 584C0 800684C0 0E80033C */  lui        $v1, %hi(quests + 0x9B)
    /* 584C4 800684C4 DBDA6390 */  lbu        $v1, %lo(quests + 0x9B)($v1)
    /* 584C8 800684C8 03000224 */  addiu      $v0, $zero, 0x3
    /* 584CC 800684CC 33006214 */  bne        $v1, $v0, .L8006859C
    /* 584D0 800684D0 00000000 */   nop
    /* 584D4 800684D4 1280043C */  lui        $a0, %hi(setpc_x)
    /* 584D8 800684D8 E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 584DC 800684DC 1280023C */  lui        $v0, %hi(setpc_w)
    /* 584E0 800684E0 ECC0428C */  lw         $v0, %lo(setpc_w)($v0)
    /* 584E4 800684E4 1280053C */  lui        $a1, %hi(setpc_y)
    /* 584E8 800684E8 E8C0A58C */  lw         $a1, %lo(setpc_y)($a1)
    /* 584EC 800684EC 21308200 */  addu       $a2, $a0, $v0
    /* 584F0 800684F0 1280023C */  lui        $v0, %hi(setpc_h)
    /* 584F4 800684F4 F0C0428C */  lw         $v0, %lo(setpc_h)($v0)
    /* 584F8 800684F8 0100C624 */  addiu      $a2, $a2, 0x1
    /* 584FC 800684FC 2138A200 */  addu       $a3, $a1, $v0
    /* 58500 80068500 5E5E010C */  jal        ObjChangeMapResync__Fiiii
    /* 58504 80068504 0100E724 */   addiu     $a3, $a3, 0x1
    /* 58508 80068508 1280023C */  lui        $v0, %hi(numobjects)
    /* 5850C 8006850C CCB9428C */  lw         $v0, %lo(numobjects)($v0)
    /* 58510 80068510 00000000 */  nop
    /* 58514 80068514 0C004018 */  blez       $v0, .L80068548
    /* 58518 80068518 21800000 */   addu      $s0, $zero, $zero
  .L8006851C:
    /* 5851C 8006851C 0E80013C */  lui        $at, %hi(objectactive)
    /* 58520 80068520 21083000 */  addu       $at, $at, $s0
    /* 58524 80068524 20A22480 */  lb         $a0, %lo(objectactive)($at)
    /* 58528 80068528 E27C010C */  jal        SyncObjectAnim__Fi
    /* 5852C 8006852C 01001026 */   addiu     $s0, $s0, 0x1
    /* 58530 80068530 1280023C */  lui        $v0, %hi(numobjects)
    /* 58534 80068534 CCB9428C */  lw         $v0, %lo(numobjects)($v0)
    /* 58538 80068538 00000000 */  nop
    /* 5853C 8006853C 2A100202 */  slt        $v0, $s0, $v0
    /* 58540 80068540 F6FF4014 */  bnez       $v0, .L8006851C
    /* 58544 80068544 00000000 */   nop
  .L80068548:
    /* 58548 80068548 1280103C */  lui        $s0, %hi(TransVal)
    /* 5854C 8006854C 48C11082 */  lb         $s0, %lo(TransVal)($s0)
    /* 58550 80068550 1280043C */  lui        $a0, %hi(setpc_x)
    /* 58554 80068554 E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 58558 80068558 1280053C */  lui        $a1, %hi(setpc_y)
    /* 5855C 8006855C E8C0A58C */  lw         $a1, %lo(setpc_y)($a1)
    /* 58560 80068560 09000224 */  addiu      $v0, $zero, 0x9
    /* 58564 80068564 1280013C */  lui        $at, %hi(TransVal)
    /* 58568 80068568 48C122A0 */  sb         $v0, %lo(TransVal)($at)
    /* 5856C 8006856C 1280023C */  lui        $v0, %hi(setpc_w)
    /* 58570 80068570 ECC0428C */  lw         $v0, %lo(setpc_w)($v0)
    /* 58574 80068574 1280073C */  lui        $a3, %hi(setpc_h)
    /* 58578 80068578 F0C0E78C */  lw         $a3, %lo(setpc_h)($a3)
    /* 5857C 8006857C 43100200 */  sra        $v0, $v0, 1
    /* 58580 80068580 21308200 */  addu       $a2, $a0, $v0
    /* 58584 80068584 0400C624 */  addiu      $a2, $a2, 0x4
    /* 58588 80068588 43380700 */  sra        $a3, $a3, 1
    /* 5858C 8006858C 375E010C */  jal        DRLG_MRectTrans__Fiiii
    /* 58590 80068590 2138A700 */   addu      $a3, $a1, $a3
    /* 58594 80068594 1280013C */  lui        $at, %hi(TransVal)
    /* 58598 80068598 48C130A0 */  sb         $s0, %lo(TransVal)($at)
  .L8006859C:
    /* 5859C 8006859C 1280033C */  lui        $v1, %hi(currlevel)
    /* 585A0 800685A0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 585A4 800685A4 0E80023C */  lui        $v0, %hi(quests + 0x14)
    /* 585A8 800685A8 54DA4290 */  lbu        $v0, %lo(quests + 0x14)($v0)
    /* 585AC 800685AC 00000000 */  nop
    /* 585B0 800685B0 2A006214 */  bne        $v1, $v0, .L8006865C
    /* 585B4 800685B4 01000224 */   addiu     $v0, $zero, 0x1
    /* 585B8 800685B8 0E80033C */  lui        $v1, %hi(quests + 0x16)
    /* 585BC 800685BC 56DA6390 */  lbu        $v1, %lo(quests + 0x16)($v1)
    /* 585C0 800685C0 00000000 */  nop
    /* 585C4 800685C4 11006214 */  bne        $v1, $v0, .L8006860C
    /* 585C8 800685C8 02000224 */   addiu     $v0, $zero, 0x2
    /* 585CC 800685CC 0E80023C */  lui        $v0, %hi(quests + 0x23)
    /* 585D0 800685D0 63DA4290 */  lbu        $v0, %lo(quests + 0x23)($v0)
    /* 585D4 800685D4 00000000 */  nop
    /* 585D8 800685D8 0C004014 */  bnez       $v0, .L8006860C
    /* 585DC 800685DC 02000224 */   addiu     $v0, $zero, 0x2
    /* 585E0 800685E0 13000424 */  addiu      $a0, $zero, 0x13
    /* 585E4 800685E4 21280000 */  addu       $a1, $zero, $zero
    /* 585E8 800685E8 21300000 */  addu       $a2, $zero, $zero
    /* 585EC 800685EC 05000724 */  addiu      $a3, $zero, 0x5
    /* 585F0 800685F0 8214010C */  jal        SpawnQuestItem__Fiiiii
    /* 585F4 800685F4 1000A3AF */   sw        $v1, 0x10($sp)
    /* 585F8 800685F8 01000224 */  addiu      $v0, $zero, 0x1
    /* 585FC 800685FC 0E80013C */  lui        $at, %hi(quests + 0x23)
    /* 58600 80068600 63DA22A0 */  sb         $v0, %lo(quests + 0x23)($at)
    /* 58604 80068604 97A10108 */  j          .L8006865C
    /* 58608 80068608 00000000 */   nop
  .L8006860C:
    /* 5860C 8006860C 13006214 */  bne        $v1, $v0, .L8006865C
    /* 58610 80068610 00000000 */   nop
    /* 58614 80068614 0E80033C */  lui        $v1, %hi(quests + 0x23)
    /* 58618 80068618 63DA6390 */  lbu        $v1, %lo(quests + 0x23)($v1)
    /* 5861C 8006861C 00000000 */  nop
    /* 58620 80068620 0500622C */  sltiu      $v0, $v1, 0x5
    /* 58624 80068624 09004014 */  bnez       $v0, .L8006864C
    /* 58628 80068628 0700622C */   sltiu     $v0, $v1, 0x7
    /* 5862C 8006862C 7B000224 */  addiu      $v0, $zero, 0x7B
    /* 58630 80068630 0D80013C */  lui        $at, %hi(Qtalklist + 0x44)
    /* 58634 80068634 04FC22AC */  sw         $v0, %lo(Qtalklist + 0x44)($at)
    /* 58638 80068638 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5863C 8006863C 0D80013C */  lui        $at, %hi(Qtalklist + 0x184)
    /* 58640 80068640 44FD22AC */  sw         $v0, %lo(Qtalklist + 0x184)($at)
    /* 58644 80068644 97A10108 */  j          .L8006865C
    /* 58648 80068648 00000000 */   nop
  .L8006864C:
    /* 5864C 8006864C 03004014 */  bnez       $v0, .L8006865C
    /* 58650 80068650 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 58654 80068654 0D80013C */  lui        $at, %hi(Qtalklist + 0x44)
    /* 58658 80068658 04FC22AC */  sw         $v0, %lo(Qtalklist + 0x44)($at)
  .L8006865C:
    /* 5865C 8006865C 0E80023C */  lui        $v0, %hi(quests + 0x50)
    /* 58660 80068660 90DA4290 */  lbu        $v0, %lo(quests + 0x50)($v0)
    /* 58664 80068664 1280033C */  lui        $v1, %hi(currlevel)
    /* 58668 80068668 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 5866C 8006866C 01004224 */  addiu      $v0, $v0, 0x1
    /* 58670 80068670 14006214 */  bne        $v1, $v0, .L800686C4
    /* 58674 80068674 02000224 */   addiu     $v0, $zero, 0x2
    /* 58678 80068678 0E80033C */  lui        $v1, %hi(quests + 0x52)
    /* 5867C 8006867C 92DA6390 */  lbu        $v1, %lo(quests + 0x52)($v1)
    /* 58680 80068680 00000000 */  nop
    /* 58684 80068684 0F006214 */  bne        $v1, $v0, .L800686C4
    /* 58688 80068688 00000000 */   nop
    /* 5868C 8006868C 0E80023C */  lui        $v0, %hi(quests + 0x5F)
    /* 58690 80068690 9FDA4290 */  lbu        $v0, %lo(quests + 0x5F)($v0)
    /* 58694 80068694 00000000 */  nop
    /* 58698 80068698 0A004014 */  bnez       $v0, .L800686C4
    /* 5869C 8006869C 0F000424 */   addiu     $a0, $zero, 0xF
    /* 586A0 800686A0 21280000 */  addu       $a1, $zero, $zero
    /* 586A4 800686A4 21300000 */  addu       $a2, $zero, $zero
    /* 586A8 800686A8 05000724 */  addiu      $a3, $zero, 0x5
    /* 586AC 800686AC 01000224 */  addiu      $v0, $zero, 0x1
    /* 586B0 800686B0 0E80013C */  lui        $at, %hi(quests + 0x5F)
    /* 586B4 800686B4 9FDA22A0 */  sb         $v0, %lo(quests + 0x5F)($at)
    /* 586B8 800686B8 01000224 */  addiu      $v0, $zero, 0x1
    /* 586BC 800686BC 8214010C */  jal        SpawnQuestItem__Fiiiii
    /* 586C0 800686C0 1000A2AF */   sw        $v0, 0x10($sp)
  .L800686C4:
    /* 586C4 800686C4 1280023C */  lui        $v0, %hi(setlevel)
    /* 586C8 800686C8 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 586CC 800686CC 00000000 */  nop
    /* 586D0 800686D0 31004010 */  beqz       $v0, .L80068798
    /* 586D4 800686D4 05000224 */   addiu     $v0, $zero, 0x5
    /* 586D8 800686D8 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 586DC 800686DC 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 586E0 800686E0 00000000 */  nop
    /* 586E4 800686E4 2C006214 */  bne        $v1, $v0, .L80068798
    /* 586E8 800686E8 00000000 */   nop
    /* 586EC 800686EC 0E80103C */  lui        $s0, %hi(quests + 0x13B)
    /* 586F0 800686F0 7BDB1026 */  addiu      $s0, $s0, %lo(quests + 0x13B)
    /* 586F4 800686F4 00000292 */  lbu        $v0, 0x0($s0)
    /* 586F8 800686F8 00000000 */  nop
    /* 586FC 800686FC 0400422C */  sltiu      $v0, $v0, 0x4
    /* 58700 80068700 05004014 */  bnez       $v0, .L80068718
    /* 58704 80068704 01000424 */   addiu     $a0, $zero, 0x1
    /* 58708 80068708 0B000524 */  addiu      $a1, $zero, 0xB
    /* 5870C 8006870C 14000624 */  addiu      $a2, $zero, 0x14
    /* 58710 80068710 5E5E010C */  jal        ObjChangeMapResync__Fiiii
    /* 58714 80068714 12000724 */   addiu     $a3, $zero, 0x12
  .L80068718:
    /* 58718 80068718 00000292 */  lbu        $v0, 0x0($s0)
    /* 5871C 8006871C 00000000 */  nop
    /* 58720 80068720 0600422C */  sltiu      $v0, $v0, 0x6
    /* 58724 80068724 05004014 */  bnez       $v0, .L8006873C
    /* 58728 80068728 01000424 */   addiu     $a0, $zero, 0x1
    /* 5872C 8006872C 12000524 */  addiu      $a1, $zero, 0x12
    /* 58730 80068730 14000624 */  addiu      $a2, $zero, 0x14
    /* 58734 80068734 5E5E010C */  jal        ObjChangeMapResync__Fiiii
    /* 58738 80068738 18000724 */   addiu     $a3, $zero, 0x18
  .L8006873C:
    /* 5873C 8006873C 00000292 */  lbu        $v0, 0x0($s0)
    /* 58740 80068740 00000000 */  nop
    /* 58744 80068744 0700422C */  sltiu      $v0, $v0, 0x7
    /* 58748 80068748 03004014 */  bnez       $v0, .L80068758
    /* 5874C 8006874C 00000000 */   nop
    /* 58750 80068750 06D4010C */  jal        InitVPTriggers__Fv
    /* 58754 80068754 00000000 */   nop
  .L80068758:
    /* 58758 80068758 1280023C */  lui        $v0, %hi(numobjects)
    /* 5875C 8006875C CCB9428C */  lw         $v0, %lo(numobjects)($v0)
    /* 58760 80068760 00000000 */  nop
    /* 58764 80068764 0C004018 */  blez       $v0, .L80068798
    /* 58768 80068768 21800000 */   addu      $s0, $zero, $zero
  .L8006876C:
    /* 5876C 8006876C 0E80013C */  lui        $at, %hi(objectactive)
    /* 58770 80068770 21083000 */  addu       $at, $at, $s0
    /* 58774 80068774 20A22480 */  lb         $a0, %lo(objectactive)($at)
    /* 58778 80068778 E27C010C */  jal        SyncObjectAnim__Fi
    /* 5877C 8006877C 01001026 */   addiu     $s0, $s0, 0x1
    /* 58780 80068780 1280023C */  lui        $v0, %hi(numobjects)
    /* 58784 80068784 CCB9428C */  lw         $v0, %lo(numobjects)($v0)
    /* 58788 80068788 00000000 */  nop
    /* 5878C 8006878C 2A100202 */  slt        $v0, $s0, $v0
    /* 58790 80068790 F6FF4014 */  bnez       $v0, .L8006876C
    /* 58794 80068794 00000000 */   nop
  .L80068798:
    /* 58798 80068798 1280033C */  lui        $v1, %hi(currlevel)
    /* 5879C 8006879C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 587A0 800687A0 0E80023C */  lui        $v0, %hi(quests + 0x12C)
    /* 587A4 800687A4 6CDB4290 */  lbu        $v0, %lo(quests + 0x12C)($v0)
    /* 587A8 800687A8 00000000 */  nop
    /* 587AC 800687AC 16006214 */  bne        $v1, $v0, .L80068808
    /* 587B0 800687B0 00000000 */   nop
    /* 587B4 800687B4 1280023C */  lui        $v0, %hi(setlevel)
    /* 587B8 800687B8 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 587BC 800687BC 00000000 */  nop
    /* 587C0 800687C0 11004014 */  bnez       $v0, .L80068808
    /* 587C4 800687C4 01000224 */   addiu     $v0, $zero, 0x1
    /* 587C8 800687C8 0E80033C */  lui        $v1, %hi(quests + 0x13C)
    /* 587CC 800687CC 7CDB6390 */  lbu        $v1, %lo(quests + 0x13C)($v1)
    /* 587D0 800687D0 00000000 */  nop
    /* 587D4 800687D4 03006210 */  beq        $v1, $v0, .L800687E4
    /* 587D8 800687D8 0300622C */   sltiu     $v0, $v1, 0x3
    /* 587DC 800687DC 0A004014 */  bnez       $v0, .L80068808
    /* 587E0 800687E0 00000000 */   nop
  .L800687E4:
    /* 587E4 800687E4 0E80023C */  lui        $v0, %hi(quests + 0x12E)
    /* 587E8 800687E8 6EDB4290 */  lbu        $v0, %lo(quests + 0x12E)($v0)
    /* 587EC 800687EC 00000000 */  nop
    /* 587F0 800687F0 FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 587F4 800687F4 0200422C */  sltiu      $v0, $v0, 0x2
    /* 587F8 800687F8 03004010 */  beqz       $v0, .L80068808
    /* 587FC 800687FC 02000224 */   addiu     $v0, $zero, 0x2
    /* 58800 80068800 0E80013C */  lui        $at, %hi(quests + 0x13C)
    /* 58804 80068804 7CDB22A0 */  sb         $v0, %lo(quests + 0x13C)($at)
  .L80068808:
    /* 58808 80068808 3400BF8F */  lw         $ra, 0x34($sp)
    /* 5880C 8006880C 3000B08F */  lw         $s0, 0x30($sp)
    /* 58810 80068810 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 58814 80068814 0800E003 */  jr         $ra
    /* 58818 80068818 00000000 */   nop
endlabel ResyncQuests__Fv
