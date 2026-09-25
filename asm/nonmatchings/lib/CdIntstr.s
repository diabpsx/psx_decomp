.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdIntstr, 0x34

glabel CdIntstr
    /* ADBC 8001ADBC FF008430 */  andi       $a0, $a0, 0xFF
    /* ADC0 8001ADC0 0700822C */  sltiu      $v0, $a0, 0x7
    /* ADC4 8001ADC4 06004010 */  beqz       $v0, .L8001ADE0
    /* ADC8 8001ADC8 80100400 */   sll       $v0, $a0, 2
    /* ADCC 8001ADCC 0B80013C */  lui        $at, %hi(CD_intstr)
    /* ADD0 8001ADD0 21082200 */  addu       $at, $at, $v0
    /* ADD4 8001ADD4 9C5F228C */  lw         $v0, %lo(CD_intstr)($at)
    /* ADD8 8001ADD8 7A6B0008 */  j          .L8001ADE8
    /* ADDC 8001ADDC 00000000 */   nop
  .L8001ADE0:
    /* ADE0 8001ADE0 1180023C */  lui        $v0, %hi(D_8010E268)
    /* ADE4 8001ADE4 68E24224 */  addiu      $v0, $v0, %lo(D_8010E268)
  .L8001ADE8:
    /* ADE8 8001ADE8 0800E003 */  jr         $ra
    /* ADEC 8001ADEC 00000000 */   nop
endlabel CdIntstr
