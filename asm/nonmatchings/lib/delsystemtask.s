.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delsystemtask, 0x68

glabel delsystemtask
    /* 1F8E4 8002F8E4 21180000 */  addu       $v1, $zero, $zero
    /* 1F8E8 8002F8E8 21280000 */  addu       $a1, $zero, $zero
  .L8002F8EC:
    /* 1F8EC 8002F8EC 1380013C */  lui        $at, %hi(D_80134F40)
    /* 1F8F0 8002F8F0 21082500 */  addu       $at, $at, $a1
    /* 1F8F4 8002F8F4 404F228C */  lw         $v0, %lo(D_80134F40)($at)
    /* 1F8F8 8002F8F8 00000000 */  nop
    /* 1F8FC 8002F8FC 06004410 */  beq        $v0, $a0, .L8002F918
    /* 1F900 8002F900 10006228 */   slti      $v0, $v1, 0x10
    /* 1F904 8002F904 01006324 */  addiu      $v1, $v1, 0x1
    /* 1F908 8002F908 10006228 */  slti       $v0, $v1, 0x10
    /* 1F90C 8002F90C F7FF4014 */  bnez       $v0, .L8002F8EC
    /* 1F910 8002F910 1000A524 */   addiu     $a1, $a1, 0x10
    /* 1F914 8002F914 10006228 */  slti       $v0, $v1, 0x10
  .L8002F918:
    /* 1F918 8002F918 0A004010 */  beqz       $v0, .L8002F944
    /* 1F91C 8002F91C 00190300 */   sll       $v1, $v1, 4
    /* 1F920 8002F920 1380013C */  lui        $at, %hi(D_80134F40)
    /* 1F924 8002F924 21082300 */  addu       $at, $at, $v1
    /* 1F928 8002F928 404F228C */  lw         $v0, %lo(D_80134F40)($at)
    /* 1F92C 8002F92C 00000000 */  nop
    /* 1F930 8002F930 04004414 */  bne        $v0, $a0, .L8002F944
    /* 1F934 8002F934 00000000 */   nop
    /* 1F938 8002F938 1380013C */  lui        $at, %hi(D_80134F40)
    /* 1F93C 8002F93C 21082300 */  addu       $at, $at, $v1
    /* 1F940 8002F940 404F20AC */  sw         $zero, %lo(D_80134F40)($at)
  .L8002F944:
    /* 1F944 8002F944 0800E003 */  jr         $ra
    /* 1F948 8002F948 00000000 */   nop
endlabel delsystemtask
