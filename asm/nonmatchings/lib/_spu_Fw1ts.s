.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_Fw1ts, 0x5C

glabel _spu_Fw1ts
    /* 72B4 800172B4 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 72B8 800172B8 0D000224 */  addiu      $v0, $zero, 0xD
    /* 72BC 800172BC 0400A2AF */  sw         $v0, 0x4($sp)
    /* 72C0 800172C0 BD5C0008 */  j          .L800172F4
    /* 72C4 800172C4 0000A0AF */   sw        $zero, 0x0($sp)
  .L800172C8:
    /* 72C8 800172C8 0400A38F */  lw         $v1, 0x4($sp)
    /* 72CC 800172CC 00000000 */  nop
    /* 72D0 800172D0 40100300 */  sll        $v0, $v1, 1
    /* 72D4 800172D4 21104300 */  addu       $v0, $v0, $v1
    /* 72D8 800172D8 80100200 */  sll        $v0, $v0, 2
    /* 72DC 800172DC 21104300 */  addu       $v0, $v0, $v1
    /* 72E0 800172E0 0400A2AF */  sw         $v0, 0x4($sp)
    /* 72E4 800172E4 0000A28F */  lw         $v0, 0x0($sp)
    /* 72E8 800172E8 00000000 */  nop
    /* 72EC 800172EC 01004224 */  addiu      $v0, $v0, 0x1
    /* 72F0 800172F0 0000A2AF */  sw         $v0, 0x0($sp)
  .L800172F4:
    /* 72F4 800172F4 0000A28F */  lw         $v0, 0x0($sp)
    /* 72F8 800172F8 00000000 */  nop
    /* 72FC 800172FC 3C004228 */  slti       $v0, $v0, 0x3C
    /* 7300 80017300 F1FF4014 */  bnez       $v0, .L800172C8
    /* 7304 80017304 00000000 */   nop
    /* 7308 80017308 0800E003 */  jr         $ra
    /* 730C 8001730C 0800BD27 */   addiu     $sp, $sp, 0x8
endlabel _spu_Fw1ts
    /* 7310 80017310 00000000 */  nop
    /* 7314 80017314 00000000 */  nop
    /* 7318 80017318 00000000 */  nop
