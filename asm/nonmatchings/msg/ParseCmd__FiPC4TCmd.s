.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ParseCmd__FiPC4TCmd, 0x420

glabel ParseCmd__FiPC4TCmd
    /* 42468 80052468 21188000 */  addu       $v1, $a0, $zero
    /* 4246C 8005246C 2120A000 */  addu       $a0, $a1, $zero
    /* 42470 80052470 00008290 */  lbu        $v0, 0x0($a0)
    /* 42474 80052474 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42478 80052478 1000BFAF */  sw         $ra, 0x10($sp)
    /* 4247C 8005247C FFFF4524 */  addiu      $a1, $v0, -0x1
    /* 42480 80052480 AC2082A3 */  sb         $v0, %gp_rel(D_8011C82C)($gp)
    /* 42484 80052484 5A00A22C */  sltiu      $v0, $a1, 0x5A
    /* 42488 80052488 F3004010 */  beqz       $v0, .L80052858
    /* 4248C 8005248C 80100500 */   sll       $v0, $a1, 2
    /* 42490 80052490 1180013C */  lui        $at, %hi(jtbl_80116868)
    /* 42494 80052494 21082200 */  addu       $at, $at, $v0
    /* 42498 80052498 6868228C */  lw         $v0, %lo(jtbl_80116868)($at)
    /* 4249C 8005249C 00000000 */  nop
    /* 424A0 800524A0 08004000 */  jr         $v0
    /* 424A4 800524A4 00000000 */   nop
  jlabel .L800524A8
    /* 424A8 800524A8 DD3F010C */  jal        On_WALKXY__FPC4TCmdi
    /* 424AC 800524AC 21286000 */   addu      $a1, $v1, $zero
    /* 424B0 800524B0 1E4A0108 */  j          .L80052878
    /* 424B4 800524B4 00000000 */   nop
  jlabel .L800524B8
    /* 424B8 800524B8 FD3F010C */  jal        On_ADDSTR__FPC4TCmdi
    /* 424BC 800524BC 21286000 */   addu      $a1, $v1, $zero
    /* 424C0 800524C0 1E4A0108 */  j          .L80052878
    /* 424C4 800524C4 00000000 */   nop
  jlabel .L800524C8
    /* 424C8 800524C8 1540010C */  jal        On_ADDDEX__FPC4TCmdi
    /* 424CC 800524CC 21286000 */   addu      $a1, $v1, $zero
    /* 424D0 800524D0 1E4A0108 */  j          .L80052878
    /* 424D4 800524D4 00000000 */   nop
  jlabel .L800524D8
    /* 424D8 800524D8 0940010C */  jal        On_ADDMAG__FPC4TCmdi
    /* 424DC 800524DC 21286000 */   addu      $a1, $v1, $zero
    /* 424E0 800524E0 1E4A0108 */  j          .L80052878
    /* 424E4 800524E4 00000000 */   nop
  jlabel .L800524E8
    /* 424E8 800524E8 2140010C */  jal        On_ADDVIT__FPC4TCmdi
    /* 424EC 800524EC 21286000 */   addu      $a1, $v1, $zero
    /* 424F0 800524F0 1E4A0108 */  j          .L80052878
    /* 424F4 800524F4 00000000 */   nop
  jlabel .L800524F8
    /* 424F8 800524F8 2D40010C */  jal        On_SBSPELL__FPC4TCmdi
    /* 424FC 800524FC 21286000 */   addu      $a1, $v1, $zero
    /* 42500 80052500 1E4A0108 */  j          .L80052878
    /* 42504 80052504 00000000 */   nop
  jlabel .L80052508
    /* 42508 80052508 4A40010C */  jal        On_GOTOGETITEM__FPC4TCmdi
    /* 4250C 8005250C 21286000 */   addu      $a1, $v1, $zero
    /* 42510 80052510 1E4A0108 */  j          .L80052878
    /* 42514 80052514 00000000 */   nop
  jlabel .L80052518
    /* 42518 80052518 6C40010C */  jal        On_REQUESTGITEM__FPC4TCmdi
    /* 4251C 8005251C 21286000 */   addu      $a1, $v1, $zero
    /* 42520 80052520 1E4A0108 */  j          .L80052878
    /* 42524 80052524 00000000 */   nop
  jlabel .L80052528
    /* 42528 80052528 BC40010C */  jal        On_GETITEM__FPC4TCmdi
    /* 4252C 8005252C 21286000 */   addu      $a1, $v1, $zero
    /* 42530 80052530 1E4A0108 */  j          .L80052878
    /* 42534 80052534 00000000 */   nop
  jlabel .L80052538
    /* 42538 80052538 3141010C */  jal        On_GOTOAGETITEM__FPC4TCmdi
    /* 4253C 8005253C 21286000 */   addu      $a1, $v1, $zero
    /* 42540 80052540 1E4A0108 */  j          .L80052878
    /* 42544 80052544 00000000 */   nop
  jlabel .L80052548
    /* 42548 80052548 5341010C */  jal        On_REQUESTAGITEM__FPC4TCmdi
    /* 4254C 8005254C 21286000 */   addu      $a1, $v1, $zero
    /* 42550 80052550 1E4A0108 */  j          .L80052878
    /* 42554 80052554 00000000 */   nop
  jlabel .L80052558
    /* 42558 80052558 A041010C */  jal        On_AGETITEM__FPC4TCmdi
    /* 4255C 8005255C 21286000 */   addu      $a1, $v1, $zero
    /* 42560 80052560 1E4A0108 */  j          .L80052878
    /* 42564 80052564 00000000 */   nop
  jlabel .L80052568
    /* 42568 80052568 1342010C */  jal        On_ITEMEXTRA__FPC4TCmdi
    /* 4256C 8005256C 21286000 */   addu      $a1, $v1, $zero
    /* 42570 80052570 1E4A0108 */  j          .L80052878
    /* 42574 80052574 00000000 */   nop
  jlabel .L80052578
    /* 42578 80052578 2642010C */  jal        On_PUTITEM__FPC4TCmdi
    /* 4257C 8005257C 21286000 */   addu      $a1, $v1, $zero
    /* 42580 80052580 1E4A0108 */  j          .L80052878
    /* 42584 80052584 00000000 */   nop
  jlabel .L80052588
    /* 42588 80052588 5E42010C */  jal        On_SYNCPUTITEM__FPC4TCmdi
    /* 4258C 8005258C 21286000 */   addu      $a1, $v1, $zero
    /* 42590 80052590 1E4A0108 */  j          .L80052878
    /* 42594 80052594 00000000 */   nop
  jlabel .L80052598
    /* 42598 80052598 9F42010C */  jal        On_RESPAWNITEM__FPC4TCmdi
    /* 4259C 8005259C 21286000 */   addu      $a1, $v1, $zero
    /* 425A0 800525A0 1E4A0108 */  j          .L80052878
    /* 425A4 800525A4 00000000 */   nop
  jlabel .L800525A8
    /* 425A8 800525A8 E642010C */  jal        On_SATTACKXY__FPC4TCmdi
    /* 425AC 800525AC 21286000 */   addu      $a1, $v1, $zero
    /* 425B0 800525B0 1E4A0108 */  j          .L80052878
    /* 425B4 800525B4 00000000 */   nop
  jlabel .L800525B8
    /* 425B8 800525B8 0943010C */  jal        On_SPELLXYD__FPC4TCmdi
    /* 425BC 800525BC 21286000 */   addu      $a1, $v1, $zero
    /* 425C0 800525C0 1E4A0108 */  j          .L80052878
    /* 425C4 800525C4 00000000 */   nop
  jlabel .L800525C8
    /* 425C8 800525C8 4343010C */  jal        On_SPELLXY__FPC4TCmdi
    /* 425CC 800525CC 21286000 */   addu      $a1, $v1, $zero
    /* 425D0 800525D0 1E4A0108 */  j          .L80052878
    /* 425D4 800525D4 00000000 */   nop
  jlabel .L800525D8
    /* 425D8 800525D8 7943010C */  jal        On_TSPELLXY__FPC4TCmdi
    /* 425DC 800525DC 21286000 */   addu      $a1, $v1, $zero
    /* 425E0 800525E0 1E4A0108 */  j          .L80052878
    /* 425E4 800525E4 00000000 */   nop
  jlabel .L800525E8
    /* 425E8 800525E8 B043010C */  jal        On_OPOBJXY__FPC4TCmdi
    /* 425EC 800525EC 21286000 */   addu      $a1, $v1, $zero
    /* 425F0 800525F0 1E4A0108 */  j          .L80052878
    /* 425F4 800525F4 00000000 */   nop
  jlabel .L800525F8
    /* 425F8 800525F8 E843010C */  jal        On_DISARMXY__FPC4TCmdi
    /* 425FC 800525FC 21286000 */   addu      $a1, $v1, $zero
    /* 42600 80052600 1E4A0108 */  j          .L80052878
    /* 42604 80052604 00000000 */   nop
  jlabel .L80052608
    /* 42608 80052608 2044010C */  jal        On_OPOBJT__FPC4TCmdi
    /* 4260C 8005260C 21286000 */   addu      $a1, $v1, $zero
    /* 42610 80052610 1E4A0108 */  j          .L80052878
    /* 42614 80052614 00000000 */   nop
  jlabel .L80052618
    /* 42618 80052618 3344010C */  jal        On_ATTACKID__FPC4TCmdi
    /* 4261C 8005261C 21286000 */   addu      $a1, $v1, $zero
    /* 42620 80052620 1E4A0108 */  j          .L80052878
    /* 42624 80052624 00000000 */   nop
  jlabel .L80052628
    /* 42628 80052628 8244010C */  jal        On_SPELLID__FPC4TCmdi
    /* 4262C 8005262C 21286000 */   addu      $a1, $v1, $zero
    /* 42630 80052630 1E4A0108 */  j          .L80052878
    /* 42634 80052634 00000000 */   nop
  jlabel .L80052638
    /* 42638 80052638 B444010C */  jal        On_SPELLPID__FPC4TCmdi
    /* 4263C 8005263C 21286000 */   addu      $a1, $v1, $zero
    /* 42640 80052640 1E4A0108 */  j          .L80052878
    /* 42644 80052644 00000000 */   nop
  jlabel .L80052648
    /* 42648 80052648 E444010C */  jal        On_TSPELLID__FPC4TCmdi
    /* 4264C 8005264C 21286000 */   addu      $a1, $v1, $zero
    /* 42650 80052650 1E4A0108 */  j          .L80052878
    /* 42654 80052654 00000000 */   nop
  jlabel .L80052658
    /* 42658 80052658 1545010C */  jal        On_TSPELLPID__FPC4TCmdi
    /* 4265C 8005265C 21286000 */   addu      $a1, $v1, $zero
    /* 42660 80052660 1E4A0108 */  j          .L80052878
    /* 42664 80052664 00000000 */   nop
  jlabel .L80052668
    /* 42668 80052668 4645010C */  jal        On_KNOCKBACK__FPC4TCmdi
    /* 4266C 8005266C 21286000 */   addu      $a1, $v1, $zero
    /* 42670 80052670 1E4A0108 */  j          .L80052878
    /* 42674 80052674 00000000 */   nop
  jlabel .L80052678
    /* 42678 80052678 7545010C */  jal        On_RESURRECT__FPC4TCmdi
    /* 4267C 8005267C 21286000 */   addu      $a1, $v1, $zero
    /* 42680 80052680 1E4A0108 */  j          .L80052878
    /* 42684 80052684 00000000 */   nop
  jlabel .L80052688
    /* 42688 80052688 8345010C */  jal        On_HEALOTHER__FPC4TCmdi
    /* 4268C 8005268C 21286000 */   addu      $a1, $v1, $zero
    /* 42690 80052690 1E4A0108 */  j          .L80052878
    /* 42694 80052694 00000000 */   nop
  jlabel .L80052698
    /* 42698 80052698 8D45010C */  jal        On_TALKXY__FPC4TCmdi
    /* 4269C 8005269C 21286000 */   addu      $a1, $v1, $zero
    /* 426A0 800526A0 1E4A0108 */  j          .L80052878
    /* 426A4 800526A4 00000000 */   nop
  jlabel .L800526A8
    /* 426A8 800526A8 AF45010C */  jal        On_NEWLVL__FPC4TCmdi
    /* 426AC 800526AC 21286000 */   addu      $a1, $v1, $zero
    /* 426B0 800526B0 1E4A0108 */  j          .L80052878
    /* 426B4 800526B4 00000000 */   nop
  jlabel .L800526B8
    /* 426B8 800526B8 BB45010C */  jal        On_WARP__FPC4TCmdi
    /* 426BC 800526BC 21286000 */   addu      $a1, $v1, $zero
    /* 426C0 800526C0 1E4A0108 */  j          .L80052878
    /* 426C4 800526C4 00000000 */   nop
  jlabel .L800526C8
    /* 426C8 800526C8 0046010C */  jal        On_MONSTDEATH__FPC4TCmdi
    /* 426CC 800526CC 21286000 */   addu      $a1, $v1, $zero
    /* 426D0 800526D0 1E4A0108 */  j          .L80052878
    /* 426D4 800526D4 00000000 */   nop
  jlabel .L800526D8
    /* 426D8 800526D8 2D46010C */  jal        On_KILLGOLEM__FPC4TCmdi
    /* 426DC 800526DC 21286000 */   addu      $a1, $v1, $zero
    /* 426E0 800526E0 1E4A0108 */  j          .L80052878
    /* 426E4 800526E4 00000000 */   nop
  jlabel .L800526E8
    /* 426E8 800526E8 4846010C */  jal        On_AWAKEGOLEM__FPC4TCmdi
    /* 426EC 800526EC 21286000 */   addu      $a1, $v1, $zero
    /* 426F0 800526F0 1E4A0108 */  j          .L80052878
    /* 426F4 800526F4 00000000 */   nop
  jlabel .L800526F8
    /* 426F8 800526F8 9046010C */  jal        On_MONSTDAMAGE__FPC4TCmdi
    /* 426FC 800526FC 21286000 */   addu      $a1, $v1, $zero
    /* 42700 80052700 1E4A0108 */  j          .L80052878
    /* 42704 80052704 00000000 */   nop
  jlabel .L80052708
    /* 42708 80052708 CC46010C */  jal        On_PLRDEAD__FPC4TCmdi
    /* 4270C 8005270C 21286000 */   addu      $a1, $v1, $zero
    /* 42710 80052710 1E4A0108 */  j          .L80052878
    /* 42714 80052714 00000000 */   nop
  jlabel .L80052718
    /* 42718 80052718 DE46010C */  jal        On_PLRDAMAGE__FPC4TCmdi
    /* 4271C 8005271C 21286000 */   addu      $a1, $v1, $zero
    /* 42720 80052720 1E4A0108 */  j          .L80052878
    /* 42724 80052724 00000000 */   nop
  jlabel .L80052728
    /* 42728 80052728 2347010C */  jal        On_OPENDOOR__FPC4TCmdi
    /* 4272C 8005272C 21286000 */   addu      $a1, $v1, $zero
    /* 42730 80052730 1E4A0108 */  j          .L80052878
    /* 42734 80052734 00000000 */   nop
  jlabel .L80052738
    /* 42738 80052738 4247010C */  jal        On_CLOSEDOOR__FPC4TCmdi
    /* 4273C 8005273C 21286000 */   addu      $a1, $v1, $zero
    /* 42740 80052740 1E4A0108 */  j          .L80052878
    /* 42744 80052744 00000000 */   nop
  jlabel .L80052748
    /* 42748 80052748 6147010C */  jal        On_OPERATEOBJ__FPC4TCmdi
    /* 4274C 8005274C 21286000 */   addu      $a1, $v1, $zero
    /* 42750 80052750 1E4A0108 */  j          .L80052878
    /* 42754 80052754 00000000 */   nop
  jlabel .L80052758
    /* 42758 80052758 8047010C */  jal        On_PLROPOBJ__FPC4TCmdi
    /* 4275C 8005275C 21286000 */   addu      $a1, $v1, $zero
    /* 42760 80052760 1E4A0108 */  j          .L80052878
    /* 42764 80052764 00000000 */   nop
  jlabel .L80052768
    /* 42768 80052768 9F47010C */  jal        On_BREAKOBJ__FPC4TCmdi
    /* 4276C 8005276C 21286000 */   addu      $a1, $v1, $zero
    /* 42770 80052770 1E4A0108 */  j          .L80052878
    /* 42774 80052774 00000000 */   nop
  jlabel .L80052778
    /* 42778 80052778 BD47010C */  jal        On_CHANGEPLRITEMS__FPC4TCmdi
    /* 4277C 8005277C 21286000 */   addu      $a1, $v1, $zero
    /* 42780 80052780 1E4A0108 */  j          .L80052878
    /* 42784 80052784 00000000 */   nop
  jlabel .L80052788
    /* 42788 80052788 BF47010C */  jal        On_DELPLRITEMS__FPC4TCmdi
    /* 4278C 8005278C 21286000 */   addu      $a1, $v1, $zero
    /* 42790 80052790 1E4A0108 */  j          .L80052878
    /* 42794 80052794 00000000 */   nop
  jlabel .L80052798
    /* 42798 80052798 C147010C */  jal        On_PLRLEVEL__FPC4TCmdi
    /* 4279C 8005279C 21286000 */   addu      $a1, $v1, $zero
    /* 427A0 800527A0 1E4A0108 */  j          .L80052878
    /* 427A4 800527A4 00000000 */   nop
  jlabel .L800527A8
    /* 427A8 800527A8 C347010C */  jal        On_DROPITEM__FPC4TCmdi
    /* 427AC 800527AC 21286000 */   addu      $a1, $v1, $zero
    /* 427B0 800527B0 1E4A0108 */  j          .L80052878
    /* 427B4 800527B4 00000000 */   nop
  jlabel .L800527B8
    /* 427B8 800527B8 D947010C */  jal        On_PLAYER_JOINLEVEL__FPC4TCmdi
    /* 427BC 800527BC 21286000 */   addu      $a1, $v1, $zero
    /* 427C0 800527C0 1E4A0108 */  j          .L80052878
    /* 427C4 800527C4 00000000 */   nop
  jlabel .L800527C8
    /* 427C8 800527C8 5B48010C */  jal        On_ACTIVATEPORTAL__FPC4TCmdi
    /* 427CC 800527CC 21286000 */   addu      $a1, $v1, $zero
    /* 427D0 800527D0 1E4A0108 */  j          .L80052878
    /* 427D4 800527D4 00000000 */   nop
  jlabel .L800527D8
    /* 427D8 800527D8 6C48010C */  jal        On_DEACTIVATEPORTAL__FPC4TCmdi
    /* 427DC 800527DC 21286000 */   addu      $a1, $v1, $zero
    /* 427E0 800527E0 1E4A0108 */  j          .L80052878
    /* 427E4 800527E4 00000000 */   nop
  jlabel .L800527E8
    /* 427E8 800527E8 8448010C */  jal        On_RETOWN__FPC4TCmdi
    /* 427EC 800527EC 21286000 */   addu      $a1, $v1, $zero
    /* 427F0 800527F0 1E4A0108 */  j          .L80052878
    /* 427F4 800527F4 00000000 */   nop
  jlabel .L800527F8
    /* 427F8 800527F8 9248010C */  jal        On_SETSTR__FPC4TCmdi
    /* 427FC 800527FC 21286000 */   addu      $a1, $v1, $zero
    /* 42800 80052800 1E4A0108 */  j          .L80052878
    /* 42804 80052804 00000000 */   nop
  jlabel .L80052808
    /* 42808 80052808 B248010C */  jal        On_SETMAG__FPC4TCmdi
    /* 4280C 8005280C 21286000 */   addu      $a1, $v1, $zero
    /* 42810 80052810 1E4A0108 */  j          .L80052878
    /* 42814 80052814 00000000 */   nop
  jlabel .L80052818
    /* 42818 80052818 A248010C */  jal        On_SETDEX__FPC4TCmdi
    /* 4281C 8005281C 21286000 */   addu      $a1, $v1, $zero
    /* 42820 80052820 1E4A0108 */  j          .L80052878
    /* 42824 80052824 00000000 */   nop
  jlabel .L80052828
    /* 42828 80052828 C248010C */  jal        On_SETVIT__FPC4TCmdi
    /* 4282C 8005282C 21286000 */   addu      $a1, $v1, $zero
    /* 42830 80052830 1E4A0108 */  j          .L80052878
    /* 42834 80052834 00000000 */   nop
  jlabel .L80052838
    /* 42838 80052838 D248010C */  jal        On_SYNCQUEST__FPC4TCmdi
    /* 4283C 8005283C 21286000 */   addu      $a1, $v1, $zero
    /* 42840 80052840 1E4A0108 */  j          .L80052878
    /* 42844 80052844 00000000 */   nop
  jlabel .L80052848
    /* 42848 80052848 E448010C */  jal        On_ENDSHIELD__FPC4TCmdi
    /* 4284C 8005284C 21286000 */   addu      $a1, $v1, $zero
    /* 42850 80052850 1E4A0108 */  j          .L80052878
    /* 42854 80052854 00000000 */   nop
  jlabel .L80052858
    /* 42858 80052858 1180023C */  lui        $v0, %hi(D_801167E0)
    /* 4285C 8005285C E0674224 */  addiu      $v0, $v0, %lo(D_801167E0)
    /* 42860 80052860 05004010 */  beqz       $v0, .L80052878
    /* 42864 80052864 21200000 */   addu      $a0, $zero, $zero
    /* 42868 80052868 1180053C */  lui        $a1, %hi(D_801167F4)
    /* 4286C 8005286C F467A524 */  addiu      $a1, $a1, %lo(D_801167F4)
    /* 42870 80052870 A583000C */  jal        DBG_Error
    /* 42874 80052874 CE0A0624 */   addiu     $a2, $zero, 0xACE
  .L80052878:
    /* 42878 80052878 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4287C 8005287C 21100000 */  addu       $v0, $zero, $zero
    /* 42880 80052880 0800E003 */  jr         $ra
    /* 42884 80052884 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel ParseCmd__FiPC4TCmd
