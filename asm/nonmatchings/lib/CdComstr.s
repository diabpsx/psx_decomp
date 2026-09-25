.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdComstr, 0x34

glabel CdComstr
    /* AD88 8001AD88 FF008430 */  andi       $a0, $a0, 0xFF
    /* AD8C 8001AD8C 1C00822C */  sltiu      $v0, $a0, 0x1C
    /* AD90 8001AD90 06004010 */  beqz       $v0, .L8001ADAC
    /* AD94 8001AD94 80100400 */   sll       $v0, $a0, 2
    /* AD98 8001AD98 0B80013C */  lui        $at, %hi(CD_comstr)
    /* AD9C 8001AD9C 21082200 */  addu       $at, $at, $v0
    /* ADA0 8001ADA0 1C5F228C */  lw         $v0, %lo(CD_comstr)($at)
    /* ADA4 8001ADA4 6D6B0008 */  j          .L8001ADB4
    /* ADA8 8001ADA8 00000000 */   nop
  .L8001ADAC:
    /* ADAC 8001ADAC 1180023C */  lui        $v0, %hi(D_8010E268)
    /* ADB0 8001ADB0 68E24224 */  addiu      $v0, $v0, %lo(D_8010E268)
  .L8001ADB4:
    /* ADB4 8001ADB4 0800E003 */  jr         $ra
    /* ADB8 8001ADB8 00000000 */   nop
endlabel CdComstr
