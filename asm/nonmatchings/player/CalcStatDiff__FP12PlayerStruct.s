.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcStatDiff__FP12PlayerStruct, 0x68

glabel CalcStatDiff__FP12PlayerStruct
    /* 50498 80060498 F6008680 */  lb         $a2, 0xF6($a0)
    /* 5049C 8006049C FA008784 */  lh         $a3, 0xFA($a0)
    /* 504A0 800604A0 FE008584 */  lh         $a1, 0xFE($a0)
    /* 504A4 800604A4 00310600 */  sll        $a2, $a2, 4
    /* 504A8 800604A8 0E80013C */  lui        $at, %hi(MaxStats)
    /* 504AC 800604AC 21082600 */  addu       $at, $at, $a2
    /* 504B0 800604B0 38A4238C */  lw         $v1, %lo(MaxStats)($at)
    /* 504B4 800604B4 0E80013C */  lui        $at, %hi(MaxStats + 0x4)
    /* 504B8 800604B8 21082600 */  addu       $at, $at, $a2
    /* 504BC 800604BC 3CA4228C */  lw         $v0, %lo(MaxStats + 0x4)($at)
    /* 504C0 800604C0 23186700 */  subu       $v1, $v1, $a3
    /* 504C4 800604C4 23104500 */  subu       $v0, $v0, $a1
    /* 504C8 800604C8 21186200 */  addu       $v1, $v1, $v0
    /* 504CC 800604CC 02018784 */  lh         $a3, 0x102($a0)
    /* 504D0 800604D0 0E80013C */  lui        $at, %hi(MaxStats + 0x8)
    /* 504D4 800604D4 21082600 */  addu       $at, $at, $a2
    /* 504D8 800604D8 40A4258C */  lw         $a1, %lo(MaxStats + 0x8)($at)
    /* 504DC 800604DC 06018484 */  lh         $a0, 0x106($a0)
    /* 504E0 800604E0 0E80013C */  lui        $at, %hi(MaxStats + 0xC)
    /* 504E4 800604E4 21082600 */  addu       $at, $at, $a2
    /* 504E8 800604E8 44A4228C */  lw         $v0, %lo(MaxStats + 0xC)($at)
    /* 504EC 800604EC 2328A700 */  subu       $a1, $a1, $a3
    /* 504F0 800604F0 21186500 */  addu       $v1, $v1, $a1
    /* 504F4 800604F4 23104400 */  subu       $v0, $v0, $a0
    /* 504F8 800604F8 0800E003 */  jr         $ra
    /* 504FC 800604FC 21106200 */   addu      $v0, $v1, $v0
endlabel CalcStatDiff__FP12PlayerStruct
