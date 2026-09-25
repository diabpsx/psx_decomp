.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_PLRDAMAGE__FPC4TCmdi, 0x114

glabel On_PLRDAMAGE__FPC4TCmdi
    /* 41B78 80051B78 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 41B7C 80051B7C 01008390 */  lbu        $v1, 0x1($a0)
    /* 41B80 80051B80 1280073C */  lui        $a3, %hi(currlevel)
    /* 41B84 80051B84 0CC1E790 */  lbu        $a3, %lo(currlevel)($a3)
    /* 41B88 80051B88 0E80083C */  lui        $t0, %hi(plr)
    /* 41B8C 80051B8C 38A50825 */  addiu      $t0, $t0, %lo(plr)
    /* 41B90 80051B90 1000BFAF */  sw         $ra, 0x10($sp)
    /* 41B94 80051B94 40100300 */  sll        $v0, $v1, 1
    /* 41B98 80051B98 21104300 */  addu       $v0, $v0, $v1
    /* 41B9C 80051B9C 80100200 */  sll        $v0, $v0, 2
    /* 41BA0 80051BA0 21104300 */  addu       $v0, $v0, $v1
    /* 41BA4 80051BA4 00110200 */  sll        $v0, $v0, 4
    /* 41BA8 80051BA8 23104300 */  subu       $v0, $v0, $v1
    /* 41BAC 80051BAC 80100200 */  sll        $v0, $v0, 2
    /* 41BB0 80051BB0 21104300 */  addu       $v0, $v0, $v1
    /* 41BB4 80051BB4 C0100200 */  sll        $v0, $v0, 3
    /* 41BB8 80051BB8 3000E010 */  beqz       $a3, .L80051C7C
    /* 41BBC 80051BBC 21304800 */   addu      $a2, $v0, $t0
    /* 41BC0 80051BC0 FE118393 */  lbu        $v1, %gp_rel(gbBufferMsgs)($gp)
    /* 41BC4 80051BC4 01000224 */  addiu      $v0, $zero, 0x1
    /* 41BC8 80051BC8 2C006210 */  beq        $v1, $v0, .L80051C7C
    /* 41BCC 80051BCC 00000000 */   nop
    /* 41BD0 80051BD0 2400C28C */  lw         $v0, 0x24($a2)
    /* 41BD4 80051BD4 00000000 */  nop
    /* 41BD8 80051BD8 2800E214 */  bne        $a3, $v0, .L80051C7C
    /* 41BDC 80051BDC 0200023C */   lui       $v0, (0x2EE00 >> 16)
    /* 41BE0 80051BE0 0400848C */  lw         $a0, 0x4($a0)
    /* 41BE4 80051BE4 00EE4234 */  ori        $v0, $v0, (0x2EE00 & 0xFFFF)
    /* 41BE8 80051BE8 2B104400 */  sltu       $v0, $v0, $a0
    /* 41BEC 80051BEC 23004014 */  bnez       $v0, .L80051C7C
    /* 41BF0 80051BF0 00000000 */   nop
    /* 41BF4 80051BF4 1C01C38C */  lw         $v1, 0x11C($a2)
    /* 41BF8 80051BF8 00000000 */  nop
    /* 41BFC 80051BFC 83110300 */  sra        $v0, $v1, 6
    /* 41C00 80051C00 1E004018 */  blez       $v0, .L80051C7C
    /* 41C04 80051C04 23106400 */   subu      $v0, $v1, $a0
    /* 41C08 80051C08 1C01C2AC */  sw         $v0, 0x11C($a2)
    /* 41C0C 80051C0C 1401C28C */  lw         $v0, 0x114($a2)
    /* 41C10 80051C10 1C01C38C */  lw         $v1, 0x11C($a2)
    /* 41C14 80051C14 2001C78C */  lw         $a3, 0x120($a2)
    /* 41C18 80051C18 23104400 */  subu       $v0, $v0, $a0
    /* 41C1C 80051C1C 2A18E300 */  slt        $v1, $a3, $v1
    /* 41C20 80051C20 04006010 */  beqz       $v1, .L80051C34
    /* 41C24 80051C24 1401C2AC */   sw        $v0, 0x114($a2)
    /* 41C28 80051C28 1801C28C */  lw         $v0, 0x118($a2)
    /* 41C2C 80051C2C 1C01C7AC */  sw         $a3, 0x11C($a2)
    /* 41C30 80051C30 1401C2AC */  sw         $v0, 0x114($a2)
  .L80051C34:
    /* 41C34 80051C34 40100500 */  sll        $v0, $a1, 1
    /* 41C38 80051C38 21104500 */  addu       $v0, $v0, $a1
    /* 41C3C 80051C3C 80100200 */  sll        $v0, $v0, 2
    /* 41C40 80051C40 21104500 */  addu       $v0, $v0, $a1
    /* 41C44 80051C44 00110200 */  sll        $v0, $v0, 4
    /* 41C48 80051C48 23104500 */  subu       $v0, $v0, $a1
    /* 41C4C 80051C4C 80100200 */  sll        $v0, $v0, 2
    /* 41C50 80051C50 21104500 */  addu       $v0, $v0, $a1
    /* 41C54 80051C54 C0200200 */  sll        $a0, $v0, 3
    /* 41C58 80051C58 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 41C5C 80051C5C 21082400 */  addu       $at, $at, $a0
    /* 41C60 80051C60 54A6228C */  lw         $v0, %lo(plr + 0x11C)($at)
    /* 41C64 80051C64 00000000 */  nop
    /* 41C68 80051C68 83110200 */  sra        $v0, $v0, 6
    /* 41C6C 80051C6C 0300401C */  bgtz       $v0, .L80051C7C
    /* 41C70 80051C70 21208800 */   addu      $a0, $a0, $t0
    /* 41C74 80051C74 1587010C */  jal        StartPlrKill__FP12PlayerStructi
    /* 41C78 80051C78 01000524 */   addiu     $a1, $zero, 0x1
  .L80051C7C:
    /* 41C7C 80051C7C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 41C80 80051C80 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 41C84 80051C84 0800E003 */  jr         $ra
    /* 41C88 80051C88 00000000 */   nop
endlabel On_PLRDAMAGE__FPC4TCmdi
