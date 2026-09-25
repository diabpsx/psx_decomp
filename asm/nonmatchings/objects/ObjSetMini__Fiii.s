.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ObjSetMini__Fiii, 0xE8

glabel ObjSetMini__Fiii
    /* 458C4 800558C4 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 458C8 800558C8 3800B4AF */  sw         $s4, 0x38($sp)
    /* 458CC 800558CC 40A00400 */  sll        $s4, $a0, 1
    /* 458D0 800558D0 4000B6AF */  sw         $s6, 0x40($sp)
    /* 458D4 800558D4 10009626 */  addiu      $s6, $s4, 0x10
    /* 458D8 800558D8 2120C002 */  addu       $a0, $s6, $zero
    /* 458DC 800558DC 3000B2AF */  sw         $s2, 0x30($sp)
    /* 458E0 800558E0 40900500 */  sll        $s2, $a1, 1
    /* 458E4 800558E4 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 458E8 800558E8 10005526 */  addiu      $s5, $s2, 0x10
    /* 458EC 800558EC 2128A002 */  addu       $a1, $s5, $zero
    /* 458F0 800558F0 C0100600 */  sll        $v0, $a2, 3
    /* 458F4 800558F4 4400BFAF */  sw         $ra, 0x44($sp)
    /* 458F8 800558F8 3400B3AF */  sw         $s3, 0x34($sp)
    /* 458FC 800558FC 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 45900 80055900 2800B0AF */  sw         $s0, 0x28($sp)
    /* 45904 80055904 0D80013C */  lui        $at, %hi(DebugMonsters + 0x20)
    /* 45908 80055908 21082200 */  addu       $at, $at, $v0
    /* 4590C 8005590C A4EC2684 */  lh         $a2, %lo(DebugMonsters + 0x20)($at)
    /* 45910 80055910 0D80013C */  lui        $at, %hi(DebugMonsters + 0x22)
    /* 45914 80055914 21082200 */  addu       $at, $at, $v0
    /* 45918 80055918 A6EC3084 */  lh         $s0, %lo(DebugMonsters + 0x22)($at)
    /* 4591C 8005591C 0D80013C */  lui        $at, %hi(DebugMonsters + 0x24)
    /* 45920 80055920 21082200 */  addu       $at, $at, $v0
    /* 45924 80055924 A8EC3184 */  lh         $s1, %lo(DebugMonsters + 0x24)($at)
    /* 45928 80055928 0D80013C */  lui        $at, %hi(DebugMonsters + 0x26)
    /* 4592C 8005592C 21082200 */  addu       $at, $at, $v0
    /* 45930 80055930 AAEC3384 */  lh         $s3, %lo(DebugMonsters + 0x26)($at)
    /* 45934 80055934 0100C624 */  addiu      $a2, $a2, 0x1
    /* 45938 80055938 01001026 */  addiu      $s0, $s0, 0x1
    /* 4593C 8005593C 01003126 */  addiu      $s1, $s1, 0x1
    /* 45940 80055940 D555010C */  jal        ObjSetMicro__Fiii
    /* 45944 80055944 01007326 */   addiu     $s3, $s3, 0x1
    /* 45948 80055948 11009426 */  addiu      $s4, $s4, 0x11
    /* 4594C 8005594C 21208002 */  addu       $a0, $s4, $zero
    /* 45950 80055950 2128A002 */  addu       $a1, $s5, $zero
    /* 45954 80055954 D555010C */  jal        ObjSetMicro__Fiii
    /* 45958 80055958 21300002 */   addu      $a2, $s0, $zero
    /* 4595C 8005595C 2120C002 */  addu       $a0, $s6, $zero
    /* 45960 80055960 11005226 */  addiu      $s2, $s2, 0x11
    /* 45964 80055964 21284002 */  addu       $a1, $s2, $zero
    /* 45968 80055968 D555010C */  jal        ObjSetMicro__Fiii
    /* 4596C 8005596C 21302002 */   addu      $a2, $s1, $zero
    /* 45970 80055970 21208002 */  addu       $a0, $s4, $zero
    /* 45974 80055974 21284002 */  addu       $a1, $s2, $zero
    /* 45978 80055978 D555010C */  jal        ObjSetMicro__Fiii
    /* 4597C 8005597C 21306002 */   addu      $a2, $s3, $zero
    /* 45980 80055980 4400BF8F */  lw         $ra, 0x44($sp)
    /* 45984 80055984 4000B68F */  lw         $s6, 0x40($sp)
    /* 45988 80055988 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 4598C 8005598C 3800B48F */  lw         $s4, 0x38($sp)
    /* 45990 80055990 3400B38F */  lw         $s3, 0x34($sp)
    /* 45994 80055994 3000B28F */  lw         $s2, 0x30($sp)
    /* 45998 80055998 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 4599C 8005599C 2800B08F */  lw         $s0, 0x28($sp)
    /* 459A0 800559A0 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 459A4 800559A4 0800E003 */  jr         $ra
    /* 459A8 800559A8 00000000 */   nop
endlabel ObjSetMini__Fiii
