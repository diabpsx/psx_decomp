.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_KILLGOLEM__FPC4TCmdi, 0x6C

glabel On_KILLGOLEM__FPC4TCmdi
    /* 418B4 800518B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 418B8 800518B8 21188000 */  addu       $v1, $a0, $zero
    /* 418BC 800518BC 1280023C */  lui        $v0, %hi(myplr)
    /* 418C0 800518C0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 418C4 800518C4 2120A000 */  addu       $a0, $a1, $zero
    /* 418C8 800518C8 11008210 */  beq        $a0, $v0, .L80051910
    /* 418CC 800518CC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 418D0 800518D0 40100400 */  sll        $v0, $a0, 1
    /* 418D4 800518D4 21104400 */  addu       $v0, $v0, $a0
    /* 418D8 800518D8 80100200 */  sll        $v0, $v0, 2
    /* 418DC 800518DC 21104400 */  addu       $v0, $v0, $a0
    /* 418E0 800518E0 00110200 */  sll        $v0, $v0, 4
    /* 418E4 800518E4 23104400 */  subu       $v0, $v0, $a0
    /* 418E8 800518E8 80100200 */  sll        $v0, $v0, 2
    /* 418EC 800518EC 21104400 */  addu       $v0, $v0, $a0
    /* 418F0 800518F0 C0100200 */  sll        $v0, $v0, 3
    /* 418F4 800518F4 01006590 */  lbu        $a1, 0x1($v1)
    /* 418F8 800518F8 02006690 */  lbu        $a2, 0x2($v1)
    /* 418FC 800518FC 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 41900 80051900 21082200 */  addu       $at, $at, $v0
    /* 41904 80051904 5CA52790 */  lbu        $a3, %lo(plr + 0x24)($at)
    /* 41908 80051908 BD3A010C */  jal        delta_kill_monster__FiUcUcUc
    /* 4190C 8005190C 00000000 */   nop
  .L80051910:
    /* 41910 80051910 1000BF8F */  lw         $ra, 0x10($sp)
    /* 41914 80051914 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 41918 80051918 0800E003 */  jr         $ra
    /* 4191C 8005191C 00000000 */   nop
endlabel On_KILLGOLEM__FPC4TCmdi
