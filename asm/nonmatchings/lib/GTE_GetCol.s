.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GTE_GetCol, 0x38

glabel GTE_GetCol
    /* 1F0 800101F0 02008104 */  bgez       $a0, .L800101FC
    /* 1F4 800101F4 50008128 */   slti      $at, $a0, 0x50
    /* 1F8 800101F8 21200000 */  addu       $a0, $zero, $zero
  .L800101FC:
    /* 1FC 800101FC 02002014 */  bnez       $at, .L80010208
    /* 200 80010200 00000000 */   nop
    /* 204 80010204 4F000424 */  addiu      $a0, $zero, 0x4F
  .L80010208:
    /* 208 80010208 0200A104 */  bgez       $a1, .L80010214
    /* 20C 8001020C A000A128 */   slti      $at, $a1, 0xA0
    /* 210 80010210 21280000 */  addu       $a1, $zero, $zero
  .L80010214:
    /* 214 80010214 02002014 */  bnez       $at, .L80010220
    /* 218 80010218 00000000 */   nop
    /* 21C 8001021C 9F000524 */  addiu      $a1, $zero, 0x9F
  .L80010220:
    /* 220 80010220 0800E003 */  jr         $ra
    /* 224 80010224 00000000 */   nop
endlabel GTE_GetCol
