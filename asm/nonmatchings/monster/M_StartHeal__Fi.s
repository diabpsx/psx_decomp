.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartHeal__Fi, 0x8C

glabel M_StartHeal__Fi
    /* 12CA4 8014C89C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12CA8 8014C8A0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12CAC 8014C8A4 40800400 */  sll        $s0, $a0, 1
    /* 12CB0 8014C8A8 21800402 */  addu       $s0, $s0, $a0
    /* 12CB4 8014C8AC 80801000 */  sll        $s0, $s0, 2
    /* 12CB8 8014C8B0 21800402 */  addu       $s0, $s0, $a0
    /* 12CBC 8014C8B4 C0801000 */  sll        $s0, $s0, 3
    /* 12CC0 8014C8B8 1080023C */  lui        $v0, %hi(monster)
    /* 12CC4 8014C8BC 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 12CC8 8014C8C0 21800202 */  addu       $s0, $s0, $v0
    /* 12CCC 8014C8C4 05000224 */  addiu      $v0, $zero, 0x5
    /* 12CD0 8014C8C8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 12CD4 8014C8CC 6000038E */  lw         $v1, 0x60($s0)
    /* 12CD8 8014C8D0 05000424 */  addiu      $a0, $zero, 0x5
    /* 12CDC 8014C8D4 5A0002A2 */  sb         $v0, 0x5A($s0)
    /* 12CE0 8014C8D8 2C000296 */  lhu        $v0, 0x2C($s0)
    /* 12CE4 8014C8DC 0E006390 */  lbu        $v1, 0xE($v1)
    /* 12CE8 8014C8E0 02004234 */  ori        $v0, $v0, 0x2
    /* 12CEC 8014C8E4 2C0002A6 */  sh         $v0, 0x2C($s0)
    /* 12CF0 8014C8E8 10000224 */  addiu      $v0, $zero, 0x10
    /* 12CF4 8014C8EC 330002A2 */  sb         $v0, 0x33($s0)
    /* 12CF8 8014C8F0 C9F6000C */  jal        ENG_random__Fl
    /* 12CFC 8014C8F4 410003A2 */   sb        $v1, 0x41($s0)
    /* 12D00 8014C8F8 04004224 */  addiu      $v0, $v0, 0x4
    /* 12D04 8014C8FC 1400038E */  lw         $v1, 0x14($s0)
    /* 12D08 8014C900 00110200 */  sll        $v0, $v0, 4
    /* 12D0C 8014C904 1A006200 */  div        $zero, $v1, $v0
    /* 12D10 8014C908 12180000 */  mflo       $v1
    /* 12D14 8014C90C 00000000 */  nop
    /* 12D18 8014C910 180003A6 */  sh         $v1, 0x18($s0)
    /* 12D1C 8014C914 1400BF8F */  lw         $ra, 0x14($sp)
    /* 12D20 8014C918 1000B08F */  lw         $s0, 0x10($sp)
    /* 12D24 8014C91C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12D28 8014C920 0800E003 */  jr         $ra
    /* 12D2C 8014C924 00000000 */   nop
endlabel M_StartHeal__Fi
