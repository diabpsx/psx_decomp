.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindAction__7CPlayerR12PlayerStruct, 0x84

glabel FindAction__7CPlayerR12PlayerStruct
    /* 863C4 800963C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 863C8 800963C8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 863CC 800963CC 1259020C */  jal        FindActionEnum__7CPlayerR12PlayerStruct
    /* 863D0 800963D0 00000000 */   nop
    /* 863D4 800963D4 FFFF4324 */  addiu      $v1, $v0, -0x1
    /* 863D8 800963D8 0B00622C */  sltiu      $v0, $v1, 0xB
    /* 863DC 800963DC 15004010 */  beqz       $v0, .L80096434
    /* 863E0 800963E0 80100300 */   sll       $v0, $v1, 2
    /* 863E4 800963E4 1180013C */  lui        $at, %hi(jtbl_80110674)
    /* 863E8 800963E8 21082200 */  addu       $at, $at, $v0
    /* 863EC 800963EC 7406228C */  lw         $v0, %lo(jtbl_80110674)($at)
    /* 863F0 800963F0 00000000 */  nop
    /* 863F4 800963F4 08004000 */  jr         $v0
    /* 863F8 800963F8 00000000 */   nop
  jlabel .L800963FC
    /* 863FC 800963FC 0E590208 */  j          .L80096438
    /* 86400 80096400 01000224 */   addiu     $v0, $zero, 0x1
  jlabel .L80096404
    /* 86404 80096404 0E590208 */  j          .L80096438
    /* 86408 80096408 21100000 */   addu      $v0, $zero, $zero
  jlabel .L8009640C
    /* 8640C 8009640C 0E590208 */  j          .L80096438
    /* 86410 80096410 02000224 */   addiu     $v0, $zero, 0x2
  jlabel .L80096414
    /* 86414 80096414 0E590208 */  j          .L80096438
    /* 86418 80096418 03000224 */   addiu     $v0, $zero, 0x3
  jlabel .L8009641C
    /* 8641C 8009641C 0E590208 */  j          .L80096438
    /* 86420 80096420 04000224 */   addiu     $v0, $zero, 0x4
  jlabel .L80096424
    /* 86424 80096424 0E590208 */  j          .L80096438
    /* 86428 80096428 06000224 */   addiu     $v0, $zero, 0x6
  jlabel .L8009642C
    /* 8642C 8009642C 0E590208 */  j          .L80096438
    /* 86430 80096430 05000224 */   addiu     $v0, $zero, 0x5
  .L80096434:
    /* 86434 80096434 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80096438:
    /* 86438 80096438 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8643C 8009643C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 86440 80096440 0800E003 */  jr         $ra
    /* 86444 80096444 00000000 */   nop
endlabel FindAction__7CPlayerR12PlayerStruct
