.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching EnableQuestItemsPleeeeeeeeeeeeeeeeeez__Fv, 0x48

glabel EnableQuestItemsPleeeeeeeeeeeeeeeeeez__Fv
    /* 754D0 800854D0 06000324 */  addiu      $v1, $zero, 0x6
  .L800854D4:
    /* 754D4 800854D4 0D80013C */  lui        $at, %hi(itemavail + 0x7A)
    /* 754D8 800854D8 21082300 */  addu       $at, $at, $v1
    /* 754DC 800854DC 4E5420A0 */  sb         $zero, %lo(itemavail + 0x7A)($at)
    /* 754E0 800854E0 01006324 */  addiu      $v1, $v1, 0x1
    /* 754E4 800854E4 16006228 */  slti       $v0, $v1, 0x16
    /* 754E8 800854E8 FAFF4014 */  bnez       $v0, .L800854D4
    /* 754EC 800854EC 00000000 */   nop
    /* 754F0 800854F0 0D80013C */  lui        $at, %hi(UniqueItemFlag + 0x1B)
    /* 754F4 800854F4 6F5420A0 */  sb         $zero, %lo(UniqueItemFlag + 0x1B)($at)
    /* 754F8 800854F8 0D80013C */  lui        $at, %hi(UniqueItemFlag + 0x16)
    /* 754FC 800854FC 6A5420A0 */  sb         $zero, %lo(UniqueItemFlag + 0x16)($at)
    /* 75500 80085500 0D80013C */  lui        $at, %hi(UniqueItemFlag + 0x19)
    /* 75504 80085504 6D5420A0 */  sb         $zero, %lo(UniqueItemFlag + 0x19)($at)
    /* 75508 80085508 0D80013C */  lui        $at, %hi(UniqueItemFlag + 0x1A)
    /* 7550C 8008550C 6E5420A0 */  sb         $zero, %lo(UniqueItemFlag + 0x1A)($at)
    /* 75510 80085510 0800E003 */  jr         $ra
    /* 75514 80085514 00000000 */   nop
endlabel EnableQuestItemsPleeeeeeeeeeeeeeeeeez__Fv
