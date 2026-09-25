.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitAllItemsUseable__Fv, 0x38

glabel InitAllItemsUseable__Fv
    /* 2E214 8003E214 21180000 */  addu       $v1, $zero, $zero
    /* 2E218 8003E218 21200000 */  addu       $a0, $zero, $zero
  .L8003E21C:
    /* 2E21C 8003E21C 1180013C */  lui        $at, %hi(AllItemsList + 0x1A)
    /* 2E220 8003E220 21082400 */  addu       $at, $at, $a0
    /* 2E224 8003E224 BE132290 */  lbu        $v0, %lo(AllItemsList + 0x1A)($at)
    /* 2E228 8003E228 0D80013C */  lui        $at, %hi(AllItemsUseable)
    /* 2E22C 8003E22C 21082300 */  addu       $at, $at, $v1
    /* 2E230 8003E230 401B22A0 */  sb         $v0, %lo(AllItemsUseable)($at)
    /* 2E234 8003E234 01006324 */  addiu      $v1, $v1, 0x1
    /* 2E238 8003E238 9D006228 */  slti       $v0, $v1, 0x9D
    /* 2E23C 8003E23C F7FF4014 */  bnez       $v0, .L8003E21C
    /* 2E240 8003E240 20008424 */   addiu     $a0, $a0, 0x20
    /* 2E244 8003E244 0800E003 */  jr         $ra
    /* 2E248 8003E248 00000000 */   nop
endlabel InitAllItemsUseable__Fv
