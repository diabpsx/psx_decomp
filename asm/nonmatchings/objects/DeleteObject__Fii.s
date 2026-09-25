.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeleteObject__Fii, 0xA4

glabel DeleteObject__Fii
    /* 4374C 8005374C 2130A000 */  addu       $a2, $a1, $zero
    /* 43750 80053750 40100400 */  sll        $v0, $a0, 1
    /* 43754 80053754 21104400 */  addu       $v0, $v0, $a0
    /* 43758 80053758 80100200 */  sll        $v0, $v0, 2
    /* 4375C 8005375C 23104400 */  subu       $v0, $v0, $a0
    /* 43760 80053760 80100200 */  sll        $v0, $v0, 2
    /* 43764 80053764 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 43768 80053768 21082200 */  addu       $at, $at, $v0
    /* 4376C 8005376C 6C8C2380 */  lb         $v1, %lo(object + 0x20)($at)
    /* 43770 80053770 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 43774 80053774 21082200 */  addu       $at, $at, $v0
    /* 43778 80053778 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4377C 8005377C C0180300 */  sll        $v1, $v1, 3
    /* 43780 80053780 C0100500 */  sll        $v0, $a1, 3
    /* 43784 80053784 23104500 */  subu       $v0, $v0, $a1
    /* 43788 80053788 C0110200 */  sll        $v0, $v0, 7
    /* 4378C 8005378C 21186200 */  addu       $v1, $v1, $v0
    /* 43790 80053790 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 43794 80053794 21082300 */  addu       $at, $at, $v1
    /* 43798 80053798 2B7A20A0 */  sb         $zero, %lo(dung_map + 0x3)($at)
    /* 4379C 8005379C 4C12838F */  lw         $v1, %gp_rel(numobjects)($gp)
    /* 437A0 800537A0 0E80023C */  lui        $v0, %hi(D_800DA31F)
    /* 437A4 800537A4 1FA34224 */  addiu      $v0, $v0, %lo(D_800DA31F)
    /* 437A8 800537A8 23104300 */  subu       $v0, $v0, $v1
    /* 437AC 800537AC 000044A0 */  sb         $a0, 0x0($v0)
    /* 437B0 800537B0 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 437B4 800537B4 00000000 */  nop
    /* 437B8 800537B8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 437BC 800537BC 4C1282AF */  sw         $v0, %gp_rel(numobjects)($gp)
    /* 437C0 800537C0 09004018 */  blez       $v0, .L800537E8
    /* 437C4 800537C4 00000000 */   nop
    /* 437C8 800537C8 0700C210 */  beq        $a2, $v0, .L800537E8
    /* 437CC 800537CC 00000000 */   nop
    /* 437D0 800537D0 0E80013C */  lui        $at, %hi(objectactive)
    /* 437D4 800537D4 21082200 */  addu       $at, $at, $v0
    /* 437D8 800537D8 20A22290 */  lbu        $v0, %lo(objectactive)($at)
    /* 437DC 800537DC 0E80013C */  lui        $at, %hi(objectactive)
    /* 437E0 800537E0 21082600 */  addu       $at, $at, $a2
    /* 437E4 800537E4 20A222A0 */  sb         $v0, %lo(objectactive)($at)
  .L800537E8:
    /* 437E8 800537E8 0800E003 */  jr         $ra
    /* 437EC 800537EC 00000000 */   nop
endlabel DeleteObject__Fii
