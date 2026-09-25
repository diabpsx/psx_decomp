.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlrVit__Fii, 0x6C

glabel SetPlrVit__Fii
    /* 563D4 800663D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 563D8 800663D8 40100400 */  sll        $v0, $a0, 1
    /* 563DC 800663DC 21104400 */  addu       $v0, $v0, $a0
    /* 563E0 800663E0 80100200 */  sll        $v0, $v0, 2
    /* 563E4 800663E4 21104400 */  addu       $v0, $v0, $a0
    /* 563E8 800663E8 00110200 */  sll        $v0, $v0, 4
    /* 563EC 800663EC 23104400 */  subu       $v0, $v0, $a0
    /* 563F0 800663F0 80100200 */  sll        $v0, $v0, 2
    /* 563F4 800663F4 21104400 */  addu       $v0, $v0, $a0
    /* 563F8 800663F8 C0100200 */  sll        $v0, $v0, 3
    /* 563FC 800663FC 0E80033C */  lui        $v1, %hi(plr)
    /* 56400 80066400 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 56404 80066404 21184300 */  addu       $v1, $v0, $v1
    /* 56408 80066408 1000BFAF */  sw         $ra, 0x10($sp)
    /* 5640C 8006640C F6006280 */  lb         $v0, 0xF6($v1)
    /* 56410 80066410 060165A4 */  sh         $a1, 0x106($v1)
    /* 56414 80066414 02004014 */  bnez       $v0, .L80066420
    /* 56418 80066418 80290500 */   sll       $a1, $a1, 6
    /* 5641C 8006641C 40280500 */  sll        $a1, $a1, 1
  .L80066420:
    /* 56420 80066420 140165AC */  sw         $a1, 0x114($v1)
    /* 56424 80066424 180165AC */  sw         $a1, 0x118($v1)
    /* 56428 80066428 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 5642C 8006642C 01000524 */   addiu     $a1, $zero, 0x1
    /* 56430 80066430 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56434 80066434 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56438 80066438 0800E003 */  jr         $ra
    /* 5643C 8006643C 00000000 */   nop
endlabel SetPlrVit__Fii
