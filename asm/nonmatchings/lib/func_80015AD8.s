.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80015AD8, 0x260

glabel func_80015AD8
    /* 5AD8 80015AD8 0B80023C */  lui        $v0, %hi(D_800B5590)
    /* 5ADC 80015ADC 9055428C */  lw         $v0, %lo(D_800B5590)($v0)
    /* 5AE0 80015AE0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5AE4 80015AE4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 5AE8 80015AE8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 5AEC 80015AEC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5AF0 80015AF0 0000428C */  lw         $v0, 0x0($v0)
    /* 5AF4 80015AF4 0001103C */  lui        $s0, (0x1000000 >> 16)
    /* 5AF8 80015AF8 24105000 */  and        $v0, $v0, $s0
    /* 5AFC 80015AFC 89004014 */  bnez       $v0, .L80015D24
    /* 5B00 80015B00 01000224 */   addiu     $v0, $zero, 0x1
    /* 5B04 80015B04 FE48000C */  jal        SetIntrMask
    /* 5B08 80015B08 21200000 */   addu      $a0, $zero, $zero
    /* 5B0C 80015B0C 0B80043C */  lui        $a0, %hi(_qin)
    /* 5B10 80015B10 A455848C */  lw         $a0, %lo(_qin)($a0)
    /* 5B14 80015B14 0B80033C */  lui        $v1, %hi(_qout)
    /* 5B18 80015B18 A855638C */  lw         $v1, %lo(_qout)($v1)
    /* 5B1C 80015B1C 0B80013C */  lui        $at, %hi(D_800B55B0)
    /* 5B20 80015B20 59008310 */  beq        $a0, $v1, .L80015C88
    /* 5B24 80015B24 B05522AC */   sw        $v0, %lo(D_800B55B0)($at)
    /* 5B28 80015B28 0B80023C */  lui        $v0, %hi(D_800B5590)
    /* 5B2C 80015B2C 9055428C */  lw         $v0, %lo(D_800B5590)($v0)
    /* 5B30 80015B30 00000000 */  nop
    /* 5B34 80015B34 0000428C */  lw         $v0, 0x0($v0)
    /* 5B38 80015B38 00000000 */  nop
    /* 5B3C 80015B3C 24105000 */  and        $v0, $v0, $s0
    /* 5B40 80015B40 51004014 */  bnez       $v0, .L80015C88
    /* 5B44 80015B44 00000000 */   nop
    /* 5B48 80015B48 0004113C */  lui        $s1, (0x4000000 >> 16)
    /* 5B4C 80015B4C 0001103C */  lui        $s0, (0x1000000 >> 16)
  .L80015B50:
    /* 5B50 80015B50 0B80023C */  lui        $v0, %hi(_qout)
    /* 5B54 80015B54 A855428C */  lw         $v0, %lo(_qout)($v0)
    /* 5B58 80015B58 0B80033C */  lui        $v1, %hi(_qin)
    /* 5B5C 80015B5C A455638C */  lw         $v1, %lo(_qin)($v1)
    /* 5B60 80015B60 01004224 */  addiu      $v0, $v0, 0x1
    /* 5B64 80015B64 3F004230 */  andi       $v0, $v0, 0x3F
    /* 5B68 80015B68 08004314 */  bne        $v0, $v1, .L80015B8C
    /* 5B6C 80015B6C 00000000 */   nop
    /* 5B70 80015B70 0B80023C */  lui        $v0, %hi(D_800B54B8)
    /* 5B74 80015B74 B854428C */  lw         $v0, %lo(D_800B54B8)($v0)
    /* 5B78 80015B78 00000000 */  nop
    /* 5B7C 80015B7C 03004014 */  bnez       $v0, .L80015B8C
    /* 5B80 80015B80 02000424 */   addiu     $a0, $zero, 0x2
    /* 5B84 80015B84 B748000C */  jal        DMACallback
    /* 5B88 80015B88 21280000 */   addu      $a1, $zero, $zero
  .L80015B8C:
    /* 5B8C 80015B8C 0B80033C */  lui        $v1, %hi(D_800B5584)
    /* 5B90 80015B90 8455638C */  lw         $v1, %lo(D_800B5584)($v1)
    /* 5B94 80015B94 00000000 */  nop
    /* 5B98 80015B98 0000628C */  lw         $v0, 0x0($v1)
    /* 5B9C 80015B9C 00000000 */  nop
    /* 5BA0 80015BA0 24105100 */  and        $v0, $v0, $s1
    /* 5BA4 80015BA4 06004014 */  bnez       $v0, .L80015BC0
    /* 5BA8 80015BA8 0004043C */   lui       $a0, (0x4000000 >> 16)
  .L80015BAC:
    /* 5BAC 80015BAC 0000628C */  lw         $v0, 0x0($v1)
    /* 5BB0 80015BB0 00000000 */  nop
    /* 5BB4 80015BB4 24104400 */  and        $v0, $v0, $a0
    /* 5BB8 80015BB8 FCFF4010 */  beqz       $v0, .L80015BAC
    /* 5BBC 80015BBC 00000000 */   nop
  .L80015BC0:
    /* 5BC0 80015BC0 0B80053C */  lui        $a1, %hi(_qout)
    /* 5BC4 80015BC4 A855A58C */  lw         $a1, %lo(_qout)($a1)
    /* 5BC8 80015BC8 0B80033C */  lui        $v1, %hi(_qout)
    /* 5BCC 80015BCC A855638C */  lw         $v1, %lo(_qout)($v1)
    /* 5BD0 80015BD0 00000000 */  nop
    /* 5BD4 80015BD4 40100300 */  sll        $v0, $v1, 1
    /* 5BD8 80015BD8 21104300 */  addu       $v0, $v0, $v1
    /* 5BDC 80015BDC 40110200 */  sll        $v0, $v0, 5
    /* 5BE0 80015BE0 40180500 */  sll        $v1, $a1, 1
    /* 5BE4 80015BE4 21186500 */  addu       $v1, $v1, $a1
    /* 5BE8 80015BE8 1480043C */  lui        $a0, %hi(D_801383BC)
    /* 5BEC 80015BEC 21208200 */  addu       $a0, $a0, $v0
    /* 5BF0 80015BF0 BC83848C */  lw         $a0, %lo(D_801383BC)($a0)
    /* 5BF4 80015BF4 0B80053C */  lui        $a1, %hi(_qout)
    /* 5BF8 80015BF8 A855A58C */  lw         $a1, %lo(_qout)($a1)
    /* 5BFC 80015BFC 40190300 */  sll        $v1, $v1, 5
    /* 5C00 80015C00 40100500 */  sll        $v0, $a1, 1
    /* 5C04 80015C04 21104500 */  addu       $v0, $v0, $a1
    /* 5C08 80015C08 40110200 */  sll        $v0, $v0, 5
    /* 5C0C 80015C0C 1480053C */  lui        $a1, %hi(D_801383C0)
    /* 5C10 80015C10 2128A200 */  addu       $a1, $a1, $v0
    /* 5C14 80015C14 C083A58C */  lw         $a1, %lo(D_801383C0)($a1)
    /* 5C18 80015C18 1480023C */  lui        $v0, %hi(_que)
    /* 5C1C 80015C1C 21104300 */  addu       $v0, $v0, $v1
    /* 5C20 80015C20 B883428C */  lw         $v0, %lo(_que)($v0)
    /* 5C24 80015C24 00000000 */  nop
    /* 5C28 80015C28 09F84000 */  jalr       $v0
    /* 5C2C 80015C2C 00000000 */   nop
    /* 5C30 80015C30 0B80023C */  lui        $v0, %hi(_qout)
    /* 5C34 80015C34 A855428C */  lw         $v0, %lo(_qout)($v0)
    /* 5C38 80015C38 00000000 */  nop
    /* 5C3C 80015C3C 01004224 */  addiu      $v0, $v0, 0x1
    /* 5C40 80015C40 3F004230 */  andi       $v0, $v0, 0x3F
    /* 5C44 80015C44 0B80013C */  lui        $at, %hi(_qout)
    /* 5C48 80015C48 A85522AC */  sw         $v0, %lo(_qout)($at)
    /* 5C4C 80015C4C 0B80033C */  lui        $v1, %hi(_qin)
    /* 5C50 80015C50 A455638C */  lw         $v1, %lo(_qin)($v1)
    /* 5C54 80015C54 0B80023C */  lui        $v0, %hi(_qout)
    /* 5C58 80015C58 A855428C */  lw         $v0, %lo(_qout)($v0)
    /* 5C5C 80015C5C 00000000 */  nop
    /* 5C60 80015C60 09006210 */  beq        $v1, $v0, .L80015C88
    /* 5C64 80015C64 00000000 */   nop
    /* 5C68 80015C68 0B80023C */  lui        $v0, %hi(D_800B5590)
    /* 5C6C 80015C6C 9055428C */  lw         $v0, %lo(D_800B5590)($v0)
    /* 5C70 80015C70 00000000 */  nop
    /* 5C74 80015C74 0000428C */  lw         $v0, 0x0($v0)
    /* 5C78 80015C78 00000000 */  nop
    /* 5C7C 80015C7C 24105000 */  and        $v0, $v0, $s0
    /* 5C80 80015C80 B3FF4010 */  beqz       $v0, .L80015B50
    /* 5C84 80015C84 00000000 */   nop
  .L80015C88:
    /* 5C88 80015C88 0B80043C */  lui        $a0, %hi(D_800B55B0)
    /* 5C8C 80015C8C B055848C */  lw         $a0, %lo(D_800B55B0)($a0)
    /* 5C90 80015C90 FE48000C */  jal        SetIntrMask
    /* 5C94 80015C94 00000000 */   nop
    /* 5C98 80015C98 0B80033C */  lui        $v1, %hi(_qin)
    /* 5C9C 80015C9C A455638C */  lw         $v1, %lo(_qin)($v1)
    /* 5CA0 80015CA0 0B80023C */  lui        $v0, %hi(_qout)
    /* 5CA4 80015CA4 A855428C */  lw         $v0, %lo(_qout)($v0)
    /* 5CA8 80015CA8 00000000 */  nop
    /* 5CAC 80015CAC 16006214 */  bne        $v1, $v0, .L80015D08
    /* 5CB0 80015CB0 00000000 */   nop
    /* 5CB4 80015CB4 0B80023C */  lui        $v0, %hi(D_800B5590)
    /* 5CB8 80015CB8 9055428C */  lw         $v0, %lo(D_800B5590)($v0)
    /* 5CBC 80015CBC 00000000 */  nop
    /* 5CC0 80015CC0 0000428C */  lw         $v0, 0x0($v0)
    /* 5CC4 80015CC4 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* 5CC8 80015CC8 24104300 */  and        $v0, $v0, $v1
    /* 5CCC 80015CCC 0E004014 */  bnez       $v0, .L80015D08
    /* 5CD0 80015CD0 00000000 */   nop
    /* 5CD4 80015CD4 0B80033C */  lui        $v1, %hi(D_800B54B4)
    /* 5CD8 80015CD8 B4546324 */  addiu      $v1, $v1, %lo(D_800B54B4)
    /* 5CDC 80015CDC 0000628C */  lw         $v0, 0x0($v1)
    /* 5CE0 80015CE0 00000000 */  nop
    /* 5CE4 80015CE4 08004010 */  beqz       $v0, .L80015D08
    /* 5CE8 80015CE8 00000000 */   nop
    /* 5CEC 80015CEC 0400648C */  lw         $a0, 0x4($v1)
    /* 5CF0 80015CF0 00000000 */  nop
    /* 5CF4 80015CF4 04008010 */  beqz       $a0, .L80015D08
    /* 5CF8 80015CF8 F8FF6224 */   addiu     $v0, $v1, -0x8
    /* 5CFC 80015CFC 080040AC */  sw         $zero, 0x8($v0)
    /* 5D00 80015D00 09F88000 */  jalr       $a0
    /* 5D04 80015D04 00000000 */   nop
  .L80015D08:
    /* 5D08 80015D08 0B80023C */  lui        $v0, %hi(_qin)
    /* 5D0C 80015D0C A455428C */  lw         $v0, %lo(_qin)($v0)
    /* 5D10 80015D10 0B80033C */  lui        $v1, %hi(_qout)
    /* 5D14 80015D14 A855638C */  lw         $v1, %lo(_qout)($v1)
    /* 5D18 80015D18 00000000 */  nop
    /* 5D1C 80015D1C 23104300 */  subu       $v0, $v0, $v1
    /* 5D20 80015D20 3F004230 */  andi       $v0, $v0, 0x3F
  .L80015D24:
    /* 5D24 80015D24 1800BF8F */  lw         $ra, 0x18($sp)
    /* 5D28 80015D28 1400B18F */  lw         $s1, 0x14($sp)
    /* 5D2C 80015D2C 1000B08F */  lw         $s0, 0x10($sp)
    /* 5D30 80015D30 0800E003 */  jr         $ra
    /* 5D34 80015D34 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel func_80015AD8
