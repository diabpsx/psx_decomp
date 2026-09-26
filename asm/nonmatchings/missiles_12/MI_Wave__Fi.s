.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Wave__Fi, 0xA4

glabel MI_Wave__Fi
    /* EA08 80148600 60FFBD27 */  addiu      $sp, $sp, -0xA0
    /* EA0C 80148604 7800B0AF */  sw         $s0, 0x78($sp)
    /* EA10 80148608 21808000 */  addu       $s0, $a0, $zero
    /* EA14 8014860C 80101000 */  sll        $v0, $s0, 2
    /* EA18 80148610 21105000 */  addu       $v0, $v0, $s0
    /* EA1C 80148614 80100200 */  sll        $v0, $v0, 2
    /* EA20 80148618 23105000 */  subu       $v0, $v0, $s0
    /* EA24 8014861C 8400B3AF */  sw         $s3, 0x84($sp)
    /* EA28 80148620 80980200 */  sll        $s3, $v0, 2
    /* EA2C 80148624 9C00BFAF */  sw         $ra, 0x9C($sp)
    /* EA30 80148628 9800BEAF */  sw         $fp, 0x98($sp)
    /* EA34 8014862C 9400B7AF */  sw         $s7, 0x94($sp)
    /* EA38 80148630 9000B6AF */  sw         $s6, 0x90($sp)
    /* EA3C 80148634 8C00B5AF */  sw         $s5, 0x8C($sp)
    /* EA40 80148638 8800B4AF */  sw         $s4, 0x88($sp)
    /* EA44 8014863C 8000B2AF */  sw         $s2, 0x80($sp)
    /* EA48 80148640 7C00B1AF */  sw         $s1, 0x7C($sp)
    /* EA4C 80148644 3800A0AF */  sw         $zero, 0x38($sp)
    /* EA50 80148648 4000A0AF */  sw         $zero, 0x40($sp)
    /* EA54 8014864C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* EA58 80148650 21083300 */  addu       $at, $at, $s3
    /* EA5C 80148654 762C2684 */  lh         $a2, %lo(missile + 0x1E)($at)
    /* EA60 80148658 1080013C */  lui        $at, %hi(missile + 0x20)
    /* EA64 8014865C 21083300 */  addu       $at, $at, $s3
    /* EA68 80148660 782C2784 */  lh         $a3, %lo(missile + 0x20)($at)
    /* EA6C 80148664 1080013C */  lui        $at, %hi(missile + 0x31)
    /* EA70 80148668 21083300 */  addu       $at, $at, $s3
    /* EA74 8014866C 892C3E80 */  lb         $fp, %lo(missile + 0x31)($at)
    /* EA78 80148670 1080013C */  lui        $at, %hi(missile + 0x32)
    /* EA7C 80148674 21083300 */  addu       $at, $at, $s3
    /* EA80 80148678 8A2C2880 */  lb         $t0, %lo(missile + 0x32)($at)
    /* EA84 8014867C 00000000 */  nop
    /* EA88 80148680 4800A8AF */  sw         $t0, 0x48($sp)
    /* EA8C 80148684 4800A58F */  lw         $a1, 0x48($sp)
    /* EA90 80148688 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* EA94 8014868C 21083300 */  addu       $at, $at, $s3
    /* EA98 80148690 862C3684 */  lh         $s6, %lo(missile + 0x2E)($at)
    /* EA9C 80148694 8AF6000C */  jal        GetDirection__Fiiii
    /* EAA0 80148698 2120C003 */   addu      $a0, $fp, $zero
    /* EAA4 8014869C 80480200 */  sll        $t1, $v0, 2
    /* EAA8 801486A0 1080083C */  lui        $t0, (0x80100000 >> 16)
endlabel MI_Wave__Fi
