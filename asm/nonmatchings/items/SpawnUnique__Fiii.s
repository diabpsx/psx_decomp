.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpawnUnique__Fiii, 0x140

glabel SpawnUnique__Fiii
    /* 342B4 800442B4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 342B8 800442B8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 342BC 800442BC 21908000 */  addu       $s2, $a0, $zero
    /* 342C0 800442C0 2120A000 */  addu       $a0, $a1, $zero
    /* 342C4 800442C4 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 342C8 800442C8 2128C000 */  addu       $a1, $a2, $zero
    /* 342CC 800442CC 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 342D0 800442D0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 342D4 800442D4 7F004228 */  slti       $v0, $v0, 0x7F
    /* 342D8 800442D8 3F004010 */  beqz       $v0, .L800443D8
    /* 342DC 800442DC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 342E0 800442E0 0D80013C */  lui        $at, %hi(UniqueItemFlag)
    /* 342E4 800442E4 21083200 */  addu       $at, $at, $s2
    /* 342E8 800442E8 54542290 */  lbu        $v0, %lo(UniqueItemFlag)($at)
    /* 342EC 800442EC 00000000 */  nop
    /* 342F0 800442F0 39004014 */  bnez       $v0, .L800443D8
    /* 342F4 800442F4 00000000 */   nop
    /* 342F8 800442F8 0D80103C */  lui        $s0, %hi(itemavail)
    /* 342FC 800442FC D4531026 */  addiu      $s0, $s0, %lo(itemavail)
    /* 34300 80044300 00001182 */  lb         $s1, 0x0($s0)
    /* 34304 80044304 2902010C */  jal        GetSuperItemSpace__Fiic
    /* 34308 80044308 21302002 */   addu      $a2, $s1, $zero
    /* 3430C 8004430C 7E000326 */  addiu      $v1, $s0, 0x7E
    /* 34310 80044310 80101200 */  sll        $v0, $s2, 2
    /* 34314 80044314 21105200 */  addu       $v0, $v0, $s2
    /* 34318 80044318 80100200 */  sll        $v0, $v0, 2
    /* 3431C 8004431C 21105200 */  addu       $v0, $v0, $s2
    /* 34320 80044320 80100200 */  sll        $v0, $v0, 2
    /* 34324 80044324 0811858F */  lw         $a1, %gp_rel(numitems)($gp)
    /* 34328 80044328 1180043C */  lui        $a0, %hi(AllItemsList + 0x5)
    /* 3432C 8004432C A9138480 */  lb         $a0, %lo(AllItemsList + 0x5)($a0)
    /* 34330 80044330 1180013C */  lui        $at, %hi(UniqueItemList + 0x4)
    /* 34334 80044334 21082200 */  addu       $at, $at, $v0
    /* 34338 80044338 68432280 */  lb         $v0, %lo(UniqueItemList + 0x4)($at)
    /* 3433C 8004433C 23186500 */  subu       $v1, $v1, $a1
    /* 34340 80044340 00006390 */  lbu        $v1, 0x0($v1)
    /* 34344 80044344 00000000 */  nop
    /* 34348 80044348 000003A2 */  sb         $v1, 0x0($s0)
    /* 3434C 8004434C 0D80013C */  lui        $at, %hi(itemactive)
    /* 34350 80044350 21082500 */  addu       $at, $at, $a1
    /* 34354 80044354 545331A0 */  sb         $s1, %lo(itemactive)($at)
    /* 34358 80044358 0A008210 */  beq        $a0, $v0, .L80044384
    /* 3435C 8004435C 21380000 */   addu      $a3, $zero, $zero
    /* 34360 80044360 21204000 */  addu       $a0, $v0, $zero
    /* 34364 80044364 21180000 */  addu       $v1, $zero, $zero
  .L80044368:
    /* 34368 80044368 20006324 */  addiu      $v1, $v1, 0x20
    /* 3436C 8004436C 1180013C */  lui        $at, %hi(AllItemsList + 0x5)
    /* 34370 80044370 21082300 */  addu       $at, $at, $v1
    /* 34374 80044374 A9132280 */  lb         $v0, %lo(AllItemsList + 0x5)($at)
    /* 34378 80044378 00000000 */  nop
    /* 3437C 8004437C FAFF4414 */  bne        $v0, $a0, .L80044368
    /* 34380 80044380 0100E724 */   addiu     $a3, $a3, 0x1
  .L80044384:
    /* 34384 80044384 21202002 */  addu       $a0, $s1, $zero
    /* 34388 80044388 1280063C */  lui        $a2, %hi(currlevel)
    /* 3438C 8004438C 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 34390 80044390 A704010C */  jal        GetItemAttrs__Fiii
    /* 34394 80044394 2128E000 */   addu      $a1, $a3, $zero
    /* 34398 80044398 21202002 */  addu       $a0, $s1, $zero
    /* 3439C 8004439C D50F010C */  jal        GetUniqueItem__Fii
    /* 343A0 800443A0 21284002 */   addu      $a1, $s2, $zero
    /* 343A4 800443A4 4C0D010C */  jal        SetupItem__Fi
    /* 343A8 800443A8 21202002 */   addu      $a0, $s1, $zero
    /* 343AC 800443AC 1280023C */  lui        $v0, %hi(deltaload)
    /* 343B0 800443B0 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 343B4 800443B4 00000000 */  nop
    /* 343B8 800443B8 03004014 */  bnez       $v0, .L800443C8
    /* 343BC 800443BC 21200000 */   addu      $a0, $zero, $zero
    /* 343C0 800443C0 723F010C */  jal        NetSendCmdDItem__FUci
    /* 343C4 800443C4 21282002 */   addu      $a1, $s1, $zero
  .L800443C8:
    /* 343C8 800443C8 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 343CC 800443CC 00000000 */  nop
    /* 343D0 800443D0 01004224 */  addiu      $v0, $v0, 0x1
    /* 343D4 800443D4 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
  .L800443D8:
    /* 343D8 800443D8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 343DC 800443DC 1800B28F */  lw         $s2, 0x18($sp)
    /* 343E0 800443E0 1400B18F */  lw         $s1, 0x14($sp)
    /* 343E4 800443E4 1000B08F */  lw         $s0, 0x10($sp)
    /* 343E8 800443E8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 343EC 800443EC 0800E003 */  jr         $ra
    /* 343F0 800443F0 00000000 */   nop
endlabel SpawnUnique__Fiii
