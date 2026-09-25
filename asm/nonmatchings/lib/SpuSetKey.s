.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuSetKey, 0x1BC

glabel SpuSetKey
    /* 8B0C 80018B0C FF00023C */  lui        $v0, (0xFFFFFF >> 16)
    /* 8B10 80018B10 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
    /* 8B14 80018B14 2428A200 */  and        $a1, $a1, $v0
    /* 8B18 80018B18 35008010 */  beqz       $a0, .L80018BF0
    /* 8B1C 80018B1C 02340500 */   srl       $a2, $a1, 16
    /* 8B20 80018B20 01000224 */  addiu      $v0, $zero, 0x1
    /* 8B24 80018B24 66008214 */  bne        $a0, $v0, .L80018CC0
    /* 8B28 80018B28 00000000 */   nop
    /* 8B2C 80018B2C 0B80023C */  lui        $v0, %hi(_spu_env)
    /* 8B30 80018B30 385A428C */  lw         $v0, %lo(_spu_env)($v0)
    /* 8B34 80018B34 00000000 */  nop
    /* 8B38 80018B38 01004230 */  andi       $v0, $v0, 0x1
    /* 8B3C 80018B3C 24004010 */  beqz       $v0, .L80018BD0
    /* 8B40 80018B40 00000000 */   nop
    /* 8B44 80018B44 1380043C */  lui        $a0, %hi(_spu_RQ)
    /* 8B48 80018B48 00528424 */  addiu      $a0, $a0, %lo(_spu_RQ)
    /* 8B4C 80018B4C 000085A4 */  sh         $a1, 0x0($a0)
    /* 8B50 80018B50 020086A4 */  sh         $a2, 0x2($a0)
    /* 8B54 80018B54 0B80023C */  lui        $v0, %hi(_spu_RQmask)
    /* 8B58 80018B58 0456428C */  lw         $v0, %lo(_spu_RQmask)($v0)
    /* 8B5C 80018B5C 00000000 */  nop
    /* 8B60 80018B60 01004234 */  ori        $v0, $v0, 0x1
    /* 8B64 80018B64 0B80013C */  lui        $at, %hi(_spu_RQmask)
    /* 8B68 80018B68 045622AC */  sw         $v0, %lo(_spu_RQmask)($at)
    /* 8B6C 80018B6C 0B80023C */  lui        $v0, %hi(_spu_RQvoice)
    /* 8B70 80018B70 0056428C */  lw         $v0, %lo(_spu_RQvoice)($v0)
    /* 8B74 80018B74 00000000 */  nop
    /* 8B78 80018B78 25104500 */  or         $v0, $v0, $a1
    /* 8B7C 80018B7C 0B80013C */  lui        $at, %hi(_spu_RQvoice)
    /* 8B80 80018B80 005622AC */  sw         $v0, %lo(_spu_RQvoice)($at)
    /* 8B84 80018B84 04008294 */  lhu        $v0, 0x4($a0)
    /* 8B88 80018B88 00000000 */  nop
    /* 8B8C 80018B8C 24104500 */  and        $v0, $v0, $a1
    /* 8B90 80018B90 05004010 */  beqz       $v0, .L80018BA8
    /* 8B94 80018B94 00000000 */   nop
    /* 8B98 80018B98 04008294 */  lhu        $v0, 0x4($a0)
    /* 8B9C 80018B9C 27180500 */  nor        $v1, $zero, $a1
    /* 8BA0 80018BA0 24104300 */  and        $v0, $v0, $v1
    /* 8BA4 80018BA4 040082A4 */  sh         $v0, 0x4($a0)
  .L80018BA8:
    /* 8BA8 80018BA8 06008294 */  lhu        $v0, 0x6($a0)
    /* 8BAC 80018BAC 00000000 */  nop
    /* 8BB0 80018BB0 24104600 */  and        $v0, $v0, $a2
    /* 8BB4 80018BB4 42004010 */  beqz       $v0, .L80018CC0
    /* 8BB8 80018BB8 00000000 */   nop
    /* 8BBC 80018BBC 06008294 */  lhu        $v0, 0x6($a0)
    /* 8BC0 80018BC0 27180600 */  nor        $v1, $zero, $a2
    /* 8BC4 80018BC4 24104300 */  and        $v0, $v0, $v1
    /* 8BC8 80018BC8 30630008 */  j          .L80018CC0
    /* 8BCC 80018BCC 060082A4 */   sh        $v0, 0x6($a0)
  .L80018BD0:
    /* 8BD0 80018BD0 0B80023C */  lui        $v0, %hi(_spu_keystat)
    /* 8BD4 80018BD4 D855428C */  lw         $v0, %lo(_spu_keystat)($v0)
    /* 8BD8 80018BD8 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 8BDC 80018BDC 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 8BE0 80018BE0 25104500 */  or         $v0, $v0, $a1
    /* 8BE4 80018BE4 880165A4 */  sh         $a1, 0x188($v1)
    /* 8BE8 80018BE8 2E630008 */  j          .L80018CB8
    /* 8BEC 80018BEC 8A0166A4 */   sh        $a2, 0x18A($v1)
  .L80018BF0:
    /* 8BF0 80018BF0 0B80023C */  lui        $v0, %hi(_spu_env)
    /* 8BF4 80018BF4 385A428C */  lw         $v0, %lo(_spu_env)($v0)
    /* 8BF8 80018BF8 00000000 */  nop
    /* 8BFC 80018BFC 01004230 */  andi       $v0, $v0, 0x1
    /* 8C00 80018C00 24004010 */  beqz       $v0, .L80018C94
    /* 8C04 80018C04 00000000 */   nop
    /* 8C08 80018C08 1380043C */  lui        $a0, %hi(_spu_RQ)
    /* 8C0C 80018C0C 00528424 */  addiu      $a0, $a0, %lo(_spu_RQ)
    /* 8C10 80018C10 040085A4 */  sh         $a1, 0x4($a0)
    /* 8C14 80018C14 060086A4 */  sh         $a2, 0x6($a0)
    /* 8C18 80018C18 0B80023C */  lui        $v0, %hi(_spu_RQmask)
    /* 8C1C 80018C1C 0456428C */  lw         $v0, %lo(_spu_RQmask)($v0)
    /* 8C20 80018C20 00000000 */  nop
    /* 8C24 80018C24 01004234 */  ori        $v0, $v0, 0x1
    /* 8C28 80018C28 0B80013C */  lui        $at, %hi(_spu_RQmask)
    /* 8C2C 80018C2C 045622AC */  sw         $v0, %lo(_spu_RQmask)($at)
    /* 8C30 80018C30 0B80023C */  lui        $v0, %hi(_spu_RQvoice)
    /* 8C34 80018C34 0056428C */  lw         $v0, %lo(_spu_RQvoice)($v0)
    /* 8C38 80018C38 27180500 */  nor        $v1, $zero, $a1
    /* 8C3C 80018C3C 24104300 */  and        $v0, $v0, $v1
    /* 8C40 80018C40 0B80013C */  lui        $at, %hi(_spu_RQvoice)
    /* 8C44 80018C44 005622AC */  sw         $v0, %lo(_spu_RQvoice)($at)
    /* 8C48 80018C48 00008294 */  lhu        $v0, 0x0($a0)
    /* 8C4C 80018C4C 00000000 */  nop
    /* 8C50 80018C50 24104500 */  and        $v0, $v0, $a1
    /* 8C54 80018C54 05004010 */  beqz       $v0, .L80018C6C
    /* 8C58 80018C58 00000000 */   nop
    /* 8C5C 80018C5C 00008294 */  lhu        $v0, 0x0($a0)
    /* 8C60 80018C60 00000000 */  nop
    /* 8C64 80018C64 24104300 */  and        $v0, $v0, $v1
    /* 8C68 80018C68 000082A4 */  sh         $v0, 0x0($a0)
  .L80018C6C:
    /* 8C6C 80018C6C 02008294 */  lhu        $v0, 0x2($a0)
    /* 8C70 80018C70 00000000 */  nop
    /* 8C74 80018C74 24104600 */  and        $v0, $v0, $a2
    /* 8C78 80018C78 11004010 */  beqz       $v0, .L80018CC0
    /* 8C7C 80018C7C 00000000 */   nop
    /* 8C80 80018C80 02008294 */  lhu        $v0, 0x2($a0)
    /* 8C84 80018C84 27180600 */  nor        $v1, $zero, $a2
    /* 8C88 80018C88 24104300 */  and        $v0, $v0, $v1
    /* 8C8C 80018C8C 30630008 */  j          .L80018CC0
    /* 8C90 80018C90 020082A4 */   sh        $v0, 0x2($a0)
  .L80018C94:
    /* 8C94 80018C94 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 8C98 80018C98 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 8C9C 80018C9C 00000000 */  nop
    /* 8CA0 80018CA0 8C0145A4 */  sh         $a1, 0x18C($v0)
    /* 8CA4 80018CA4 8E0146A4 */  sh         $a2, 0x18E($v0)
    /* 8CA8 80018CA8 0B80023C */  lui        $v0, %hi(_spu_keystat)
    /* 8CAC 80018CAC D855428C */  lw         $v0, %lo(_spu_keystat)($v0)
    /* 8CB0 80018CB0 27180500 */  nor        $v1, $zero, $a1
    /* 8CB4 80018CB4 24104300 */  and        $v0, $v0, $v1
  .L80018CB8:
    /* 8CB8 80018CB8 0B80013C */  lui        $at, %hi(_spu_keystat)
    /* 8CBC 80018CBC D85522AC */  sw         $v0, %lo(_spu_keystat)($at)
  .L80018CC0:
    /* 8CC0 80018CC0 0800E003 */  jr         $ra
    /* 8CC4 80018CC4 00000000 */   nop
endlabel SpuSetKey
    /* 8CC8 80018CC8 00000000 */  nop
