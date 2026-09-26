.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoHeal__Fi, 0x9C

glabel M_DoHeal__Fi
    /* 14668 8014E260 40100400 */  sll        $v0, $a0, 1
    /* 1466C 8014E264 21104400 */  addu       $v0, $v0, $a0
    /* 14670 8014E268 80100200 */  sll        $v0, $v0, 2
    /* 14674 8014E26C 21104400 */  addu       $v0, $v0, $a0
    /* 14678 8014E270 C0100200 */  sll        $v0, $v0, 3
    /* 1467C 8014E274 1080043C */  lui        $a0, %hi(monster)
    /* 14680 8014E278 94538424 */  addiu      $a0, $a0, %lo(monster)
    /* 14684 8014E27C 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14688 8014E280 21082200 */  addu       $at, $at, $v0
    /* 1468C 8014E284 C0532394 */  lhu        $v1, %lo(monster + 0x2C)($at)
    /* 14690 8014E288 00000000 */  nop
    /* 14694 8014E28C 08006330 */  andi       $v1, $v1, 0x8
    /* 14698 8014E290 18006014 */  bnez       $v1, .L8014E2F4
    /* 1469C 8014E294 21204400 */   addu      $a0, $v0, $a0
    /* 146A0 8014E298 41008380 */  lb         $v1, 0x41($a0)
    /* 146A4 8014E29C 01000224 */  addiu      $v0, $zero, 0x1
    /* 146A8 8014E2A0 14006214 */  bne        $v1, $v0, .L8014E2F4
    /* 146AC 8014E2A4 00000000 */   nop
    /* 146B0 8014E2A8 2C008294 */  lhu        $v0, 0x2C($a0)
    /* 146B4 8014E2AC 18008384 */  lh         $v1, 0x18($a0)
    /* 146B8 8014E2B0 FDFF4230 */  andi       $v0, $v0, 0xFFFD
    /* 146BC 8014E2B4 04004234 */  ori        $v0, $v0, 0x4
    /* 146C0 8014E2B8 2C0082A4 */  sh         $v0, 0x2C($a0)
    /* 146C4 8014E2BC 1000828C */  lw         $v0, 0x10($a0)
    /* 146C8 8014E2C0 1400858C */  lw         $a1, 0x14($a0)
    /* 146CC 8014E2C4 21184300 */  addu       $v1, $v0, $v1
    /* 146D0 8014E2C8 2A106500 */  slt        $v0, $v1, $a1
    /* 146D4 8014E2CC 03004010 */  beqz       $v0, .L8014E2DC
    /* 146D8 8014E2D0 00000000 */   nop
    /* 146DC 8014E2D4 BD380508 */  j          .L8014E2F4
    /* 146E0 8014E2D8 100083AC */   sw        $v1, 0x10($a0)
  .L8014E2DC:
    /* 146E4 8014E2DC 2C008294 */  lhu        $v0, 0x2C($a0)
    /* 146E8 8014E2E0 07000324 */  addiu      $v1, $zero, 0x7
    /* 146EC 8014E2E4 100085AC */  sw         $a1, 0x10($a0)
    /* 146F0 8014E2E8 330083A0 */  sb         $v1, 0x33($a0)
    /* 146F4 8014E2EC FBFF4230 */  andi       $v0, $v0, 0xFFFB
    /* 146F8 8014E2F0 2C0082A4 */  sh         $v0, 0x2C($a0)
  .L8014E2F4:
    /* 146FC 8014E2F4 0800E003 */  jr         $ra
    /* 14700 8014E2F8 21100000 */   addu      $v0, $zero, $zero
endlabel M_DoHeal__Fi
