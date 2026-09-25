.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ItemMinStats__FPC12PlayerStructPC10ItemStruct, 0x4C

glabel ItemMinStats__FPC12PlayerStructPC10ItemStruct
    /* 2F6DC 8003F6DC FC008284 */  lh         $v0, 0xFC($a0)
    /* 2F6E0 8003F6E0 6400A390 */  lbu        $v1, 0x64($a1)
    /* 2F6E4 8003F6E4 00000000 */  nop
    /* 2F6E8 8003F6E8 2A104300 */  slt        $v0, $v0, $v1
    /* 2F6EC 8003F6EC 0C004014 */  bnez       $v0, .L8003F720
    /* 2F6F0 8003F6F0 21100000 */   addu      $v0, $zero, $zero
    /* 2F6F4 8003F6F4 F8008284 */  lh         $v0, 0xF8($a0)
    /* 2F6F8 8003F6F8 6100A390 */  lbu        $v1, 0x61($a1)
    /* 2F6FC 8003F6FC 00000000 */  nop
    /* 2F700 8003F700 2A104300 */  slt        $v0, $v0, $v1
    /* 2F704 8003F704 06004014 */  bnez       $v0, .L8003F720
    /* 2F708 8003F708 21100000 */   addu      $v0, $zero, $zero
    /* 2F70C 8003F70C 00018284 */  lh         $v0, 0x100($a0)
    /* 2F710 8003F710 6200A390 */  lbu        $v1, 0x62($a1)
    /* 2F714 8003F714 00000000 */  nop
    /* 2F718 8003F718 2A104300 */  slt        $v0, $v0, $v1
    /* 2F71C 8003F71C 01004238 */  xori       $v0, $v0, 0x1
  .L8003F720:
    /* 2F720 8003F720 0800E003 */  jr         $ra
    /* 2F724 8003F724 00000000 */   nop
endlabel ItemMinStats__FPC12PlayerStructPC10ItemStruct
