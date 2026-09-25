.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddVision__FiiiUc, 0x74

glabel AddVision__FiiiUc
    /* 3D5A8 8004D5A8 9C11838F */  lw         $v1, %gp_rel(numvision)($gp)
    /* 3D5AC 8004D5AC 00000000 */  nop
    /* 3D5B0 8004D5B0 20006228 */  slti       $v0, $v1, 0x20
    /* 3D5B4 8004D5B4 17004010 */  beqz       $v0, .L8004D614
    /* 3D5B8 8004D5B8 21400000 */   addu      $t0, $zero, $zero
    /* 3D5BC 8004D5BC C0100300 */  sll        $v0, $v1, 3
    /* 3D5C0 8004D5C0 23104300 */  subu       $v0, $v0, $v1
    /* 3D5C4 8004D5C4 40100200 */  sll        $v0, $v0, 1
    /* 3D5C8 8004D5C8 0D80033C */  lui        $v1, %hi(VisionList)
    /* 3D5CC 8004D5CC D0656324 */  addiu      $v1, $v1, %lo(VisionList)
    /* 3D5D0 8004D5D0 21104300 */  addu       $v0, $v0, $v1
    /* 3D5D4 8004D5D4 000044A0 */  sb         $a0, 0x0($v0)
    /* 3D5D8 8004D5D8 010045A0 */  sb         $a1, 0x1($v0)
    /* 3D5DC 8004D5DC A411838F */  lw         $v1, %gp_rel(visionid)($gp)
    /* 3D5E0 8004D5E0 020046A4 */  sh         $a2, 0x2($v0)
    /* 3D5E4 8004D5E4 21406000 */  addu       $t0, $v1, $zero
    /* 3D5E8 8004D5E8 01000325 */  addiu      $v1, $t0, 0x1
    /* 3D5EC 8004D5EC A41183AF */  sw         $v1, %gp_rel(visionid)($gp)
    /* 3D5F0 8004D5F0 040048A0 */  sb         $t0, 0x4($v0)
    /* 3D5F4 8004D5F4 050040A0 */  sb         $zero, 0x5($v0)
    /* 3D5F8 8004D5F8 060040A0 */  sb         $zero, 0x6($v0)
    /* 3D5FC 8004D5FC 0C0047A0 */  sb         $a3, 0xC($v0)
    /* 3D600 8004D600 9C11828F */  lw         $v0, %gp_rel(numvision)($gp)
    /* 3D604 8004D604 01000324 */  addiu      $v1, $zero, 0x1
    /* 3D608 8004D608 A01183A3 */  sb         $v1, %gp_rel(dovision)($gp)
    /* 3D60C 8004D60C 01004224 */  addiu      $v0, $v0, 0x1
    /* 3D610 8004D610 9C1182AF */  sw         $v0, %gp_rel(numvision)($gp)
  .L8004D614:
    /* 3D614 8004D614 0800E003 */  jr         $ra
    /* 3D618 8004D618 21100001 */   addu      $v0, $t0, $zero
endlabel AddVision__FiiiUc
