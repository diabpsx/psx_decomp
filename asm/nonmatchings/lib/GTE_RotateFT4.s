.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching GTE_RotateFT4, 0x144

glabel GTE_RotateFT4
    /* 20 80010020 0B80083C */  lui        $t0, %hi(costab)
    /* 24 80010024 000D0825 */  addiu      $t0, $t0, %lo(costab)
    /* 28 80010028 FF0FE730 */  andi       $a3, $a3, 0xFFF
    /* 2C 8001002C 40380700 */  sll        $a3, $a3, 1
    /* 30 80010030 2148E800 */  addu       $t1, $a3, $t0
    /* 34 80010034 00002995 */  lhu        $t1, 0x0($t1)
    /* 38 80010038 0018E720 */  addi       $a3, $a3, 0x1800 /* handwritten instruction */
    /* 3C 8001003C FF1FE730 */  andi       $a3, $a3, 0x1FFF
    /* 40 80010040 2150E800 */  addu       $t2, $a3, $t0
    /* 44 80010044 00004A95 */  lhu        $t2, 0x0($t2)
    /* 48 80010048 00000000 */  nop
    /* 4C 8001004C 23580A00 */  negu       $t3, $t2
    /* 50 80010050 005C0B00 */  sll        $t3, $t3, 16
    /* 54 80010054 25586901 */  or         $t3, $t3, $t1
    /* 58 80010058 0000CB48 */  ctc2       $t3, $0 /* handwritten instruction */
    /* 5C 8001005C 00540A00 */  sll        $t2, $t2, 16
    /* 60 80010060 0008CA48 */  ctc2       $t2, $1 /* handwritten instruction */
    /* 64 80010064 0010C948 */  ctc2       $t1, $2 /* handwritten instruction */
    /* 68 80010068 0018C048 */  ctc2       $zero, $3 /* handwritten instruction */
    /* 6C 8001006C 00100B24 */  addiu      $t3, $zero, 0x1000
    /* 70 80010070 0020CB48 */  ctc2       $t3, $4 /* handwritten instruction */
    /* 74 80010074 003C0600 */  sll        $a3, $a2, 16
    /* 78 80010078 FFFF193C */  lui        $t9, (0xFFFF0000 >> 16)
    /* 7C 8001007C 08008D8C */  lw         $t5, 0x8($a0)
    /* 80 80010080 FFFF1834 */  ori        $t8, $zero, 0xFFFF
    /* 84 80010084 2360A701 */  subu       $t4, $t5, $a3
    /* 88 80010088 2368A501 */  subu       $t5, $t5, $a1
    /* 8C 8001008C 2468B801 */  and        $t5, $t5, $t8
    /* 90 80010090 24609901 */  and        $t4, $t4, $t9
    /* 94 80010094 2540AC01 */  or         $t0, $t5, $t4
    /* 98 80010098 10008D8C */  lw         $t5, 0x10($a0)
    /* 9C 8001009C 0028C548 */  ctc2       $a1, $5 /* handwritten instruction */
    /* A0 800100A0 2360A701 */  subu       $t4, $t5, $a3
    /* A4 800100A4 2368A501 */  subu       $t5, $t5, $a1
    /* A8 800100A8 2468B801 */  and        $t5, $t5, $t8
    /* AC 800100AC 24609901 */  and        $t4, $t4, $t9
    /* B0 800100B0 2548AC01 */  or         $t1, $t5, $t4
    /* B4 800100B4 18008D8C */  lw         $t5, 0x18($a0)
    /* B8 800100B8 0030C648 */  ctc2       $a2, $6 /* handwritten instruction */
    /* BC 800100BC 2360A701 */  subu       $t4, $t5, $a3
    /* C0 800100C0 2368A501 */  subu       $t5, $t5, $a1
    /* C4 800100C4 2468B801 */  and        $t5, $t5, $t8
    /* C8 800100C8 24609901 */  and        $t4, $t4, $t9
    /* CC 800100CC 2550AC01 */  or         $t2, $t5, $t4
    /* D0 800100D0 20008D8C */  lw         $t5, 0x20($a0)
    /* D4 800100D4 00388048 */  mtc2       $zero, $7 /* handwritten instruction */
    /* D8 800100D8 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
    /* DC 800100DC 00088048 */  mtc2       $zero, $1 /* handwritten instruction */
    /* E0 800100E0 2360A701 */  subu       $t4, $t5, $a3
    /* E4 800100E4 2368A501 */  subu       $t5, $t5, $a1
    /* E8 800100E8 2468B801 */  and        $t5, $t5, $t8
    /* EC 800100EC 24609901 */  and        $t4, $t4, $t9
    /* F0 800100F0 2558AC01 */  or         $t3, $t5, $t4
    /* F4 800100F4 1200484A */  mvmva      1, 0, 0, 0, 0
    /* F8 800100F8 00108948 */  mtc2       $t1, $2 /* handwritten instruction */
    /* FC 800100FC 00188048 */  mtc2       $zero, $3 /* handwritten instruction */
    /* 100 80010100 00C80E48 */  mfc2       $t6, $25 /* handwritten instruction */
    /* 104 80010104 00D00F48 */  mfc2       $t7, $26 /* handwritten instruction */
    /* 108 80010108 08008EA4 */  sh         $t6, 0x8($a0)
    /* 10C 8001010C 0A008FA4 */  sh         $t7, 0xA($a0)
    /* 110 80010110 1280484A */  mvmva      1, 0, 1, 0, 0
    /* 114 80010114 00208A48 */  mtc2       $t2, $4 /* handwritten instruction */
    /* 118 80010118 00288048 */  mtc2       $zero, $5 /* handwritten instruction */
    /* 11C 8001011C 00C80E48 */  mfc2       $t6, $25 /* handwritten instruction */
    /* 120 80010120 00D00F48 */  mfc2       $t7, $26 /* handwritten instruction */
    /* 124 80010124 10008EA4 */  sh         $t6, 0x10($a0)
    /* 128 80010128 12008FA4 */  sh         $t7, 0x12($a0)
    /* 12C 8001012C 1200494A */  mvmva      1, 0, 2, 0, 0
    /* 130 80010130 00008B48 */  mtc2       $t3, $0 /* handwritten instruction */
    /* 134 80010134 00088048 */  mtc2       $zero, $1 /* handwritten instruction */
    /* 138 80010138 00C80E48 */  mfc2       $t6, $25 /* handwritten instruction */
    /* 13C 8001013C 00D00F48 */  mfc2       $t7, $26 /* handwritten instruction */
    /* 140 80010140 18008EA4 */  sh         $t6, 0x18($a0)
    /* 144 80010144 1A008FA4 */  sh         $t7, 0x1A($a0)
    /* 148 80010148 1200484A */  mvmva      1, 0, 0, 0, 0
    /* 14C 8001014C 00C80E48 */  mfc2       $t6, $25 /* handwritten instruction */
    /* 150 80010150 00D00F48 */  mfc2       $t7, $26 /* handwritten instruction */
    /* 154 80010154 20008EA4 */  sh         $t6, 0x20($a0)
    /* 158 80010158 22008FA4 */  sh         $t7, 0x22($a0)
    /* 15C 8001015C 0800E003 */  jr         $ra
    /* 160 80010160 00000000 */   nop
endlabel GTE_RotateFT4
