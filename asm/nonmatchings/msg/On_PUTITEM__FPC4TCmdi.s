.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_PUTITEM__FPC4TCmdi, 0xE0

glabel On_PUTITEM__FPC4TCmdi
    /* 40898 80050898 1280023C */  lui        $v0, %hi(numitems)
    /* 4089C 8005089C 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 408A0 800508A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 408A4 800508A4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 408A8 800508A8 21888000 */  addu       $s1, $a0, $zero
    /* 408AC 800508AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 408B0 800508B0 2180A000 */  addu       $s0, $a1, $zero
    /* 408B4 800508B4 7A004228 */  slti       $v0, $v0, 0x7A
    /* 408B8 800508B8 05004014 */  bnez       $v0, .L800508D0
    /* 408BC 800508BC 1800BFAF */   sw        $ra, 0x18($sp)
    /* 408C0 800508C0 C6F5000C */  jal        PlaySFX__Fi
    /* 408C4 800508C4 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 408C8 800508C8 58420108 */  j          .L80050960
    /* 408CC 800508CC 00000000 */   nop
  .L800508D0:
    /* 408D0 800508D0 01002592 */  lbu        $a1, 0x1($s1)
    /* 408D4 800508D4 02002692 */  lbu        $a2, 0x2($s1)
    /* 408D8 800508D8 5B7C050C */  jal        func_8015F16C
    /* 408DC 800508DC 21200002 */   addu      $a0, $s0, $zero
    /* 408E0 800508E0 21184000 */  addu       $v1, $v0, $zero
    /* 408E4 800508E4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 408E8 800508E8 1B006210 */  beq        $v1, $v0, .L80050958
    /* 408EC 800508EC C0100300 */   sll       $v0, $v1, 3
    /* 408F0 800508F0 23104300 */  subu       $v0, $v0, $v1
    /* 408F4 800508F4 80100200 */  sll        $v0, $v0, 2
    /* 408F8 800508F8 23104300 */  subu       $v0, $v0, $v1
    /* 408FC 800508FC 80100200 */  sll        $v0, $v0, 2
    /* 40900 80050900 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 40904 80050904 21082200 */  addu       $at, $at, $v0
    /* 40908 80050908 A61D2580 */  lb         $a1, %lo(item + 0x52)($at)
    /* 4090C 8005090C 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 40910 80050910 21082200 */  addu       $at, $at, $v0
    /* 40914 80050914 A71D2680 */  lb         $a2, %lo(item + 0x53)($at)
    /* 40918 80050918 40101000 */  sll        $v0, $s0, 1
    /* 4091C 8005091C 21105000 */  addu       $v0, $v0, $s0
    /* 40920 80050920 80100200 */  sll        $v0, $v0, 2
    /* 40924 80050924 21105000 */  addu       $v0, $v0, $s0
    /* 40928 80050928 00110200 */  sll        $v0, $v0, 4
    /* 4092C 8005092C 23105000 */  subu       $v0, $v0, $s0
    /* 40930 80050930 80100200 */  sll        $v0, $v0, 2
    /* 40934 80050934 21105000 */  addu       $v0, $v0, $s0
    /* 40938 80050938 C0100200 */  sll        $v0, $v0, 3
    /* 4093C 8005093C 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 40940 80050940 21082200 */  addu       $at, $at, $v0
    /* 40944 80050944 5CA52790 */  lbu        $a3, %lo(plr + 0x24)($at)
    /* 40948 80050948 593C010C */  jal        delta_put_item__FPC9TCmdPItemiiUc
    /* 4094C 8005094C 21202002 */   addu      $a0, $s1, $zero
    /* 40950 80050950 DB3F010C */  jal        check_update_plr__Fi
    /* 40954 80050954 21200002 */   addu      $a0, $s0, $zero
  .L80050958:
    /* 40958 80050958 DB3F010C */  jal        check_update_plr__Fi
    /* 4095C 8005095C 21200002 */   addu      $a0, $s0, $zero
  .L80050960:
    /* 40960 80050960 1800BF8F */  lw         $ra, 0x18($sp)
    /* 40964 80050964 1400B18F */  lw         $s1, 0x14($sp)
    /* 40968 80050968 1000B08F */  lw         $s0, 0x10($sp)
    /* 4096C 8005096C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 40970 80050970 0800E003 */  jr         $ra
    /* 40974 80050974 00000000 */   nop
endlabel On_PUTITEM__FPC4TCmdi
