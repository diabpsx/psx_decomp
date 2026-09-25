.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddStoreHoldRecharge__FG10ItemStructi, 0x188

glabel AddStoreHoldRecharge__FG10ItemStructi
    /* 5D2B8 8006D2B8 0C00A7AF */  sw         $a3, 0xC($sp)
    /* 5D2BC 8006D2BC 2138A003 */  addu       $a3, $sp, $zero
    /* 5D2C0 8006D2C0 6C00A98F */  lw         $t1, 0x6C($sp)
    /* 5D2C4 8006D2C4 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5D2C8 8006D2C8 6000A827 */  addiu      $t0, $sp, 0x60
    /* 5D2CC 8006D2CC 0000A4AF */  sw         $a0, 0x0($sp)
    /* 5D2D0 8006D2D0 0E80043C */  lui        $a0, %hi(storehold)
    /* 5D2D4 8006D2D4 881D8424 */  addiu      $a0, $a0, %lo(storehold)
    /* 5D2D8 8006D2D8 0400A5AF */  sw         $a1, 0x4($sp)
    /* 5D2DC 8006D2DC 0800A6AF */  sw         $a2, 0x8($sp)
    /* 5D2E0 8006D2E0 C0180200 */  sll        $v1, $v0, 3
    /* 5D2E4 8006D2E4 23186200 */  subu       $v1, $v1, $v0
    /* 5D2E8 8006D2E8 80180300 */  sll        $v1, $v1, 2
    /* 5D2EC 8006D2EC 23186200 */  subu       $v1, $v1, $v0
    /* 5D2F0 8006D2F0 80180300 */  sll        $v1, $v1, 2
    /* 5D2F4 8006D2F4 21306400 */  addu       $a2, $v1, $a0
  .L8006D2F8:
    /* 5D2F8 8006D2F8 0000E28C */  lw         $v0, 0x0($a3)
    /* 5D2FC 8006D2FC 0400E38C */  lw         $v1, 0x4($a3)
    /* 5D300 8006D300 0800E48C */  lw         $a0, 0x8($a3)
    /* 5D304 8006D304 0C00E58C */  lw         $a1, 0xC($a3)
    /* 5D308 8006D308 0000C2AC */  sw         $v0, 0x0($a2)
    /* 5D30C 8006D30C 0400C3AC */  sw         $v1, 0x4($a2)
    /* 5D310 8006D310 0800C4AC */  sw         $a0, 0x8($a2)
    /* 5D314 8006D314 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 5D318 8006D318 1000E724 */  addiu      $a3, $a3, 0x10
    /* 5D31C 8006D31C F6FFE814 */  bne        $a3, $t0, .L8006D2F8
    /* 5D320 8006D320 1000C624 */   addiu     $a2, $a2, 0x10
    /* 5D324 8006D324 0000E28C */  lw         $v0, 0x0($a3)
    /* 5D328 8006D328 0400E38C */  lw         $v1, 0x4($a3)
    /* 5D32C 8006D32C 0800E48C */  lw         $a0, 0x8($a3)
    /* 5D330 8006D330 0000C2AC */  sw         $v0, 0x0($a2)
    /* 5D334 8006D334 0400C3AC */  sw         $v1, 0x4($a2)
    /* 5D338 8006D338 0800C4AC */  sw         $a0, 0x8($a2)
    /* 5D33C 8006D33C 2821868F */  lw         $a2, %gp_rel(D_8011C8A8)($gp)
    /* 5D340 8006D340 00000000 */  nop
    /* 5D344 8006D344 C0280600 */  sll        $a1, $a2, 3
    /* 5D348 8006D348 2328A600 */  subu       $a1, $a1, $a2
    /* 5D34C 8006D34C 80280500 */  sll        $a1, $a1, 2
    /* 5D350 8006D350 2328A600 */  subu       $a1, $a1, $a2
    /* 5D354 8006D354 80280500 */  sll        $a1, $a1, 2
    /* 5D358 8006D358 0E80013C */  lui        $at, %hi(storehold + 0x4B)
    /* 5D35C 8006D35C 21082500 */  addu       $at, $at, $a1
    /* 5D360 8006D360 D31D2490 */  lbu        $a0, %lo(storehold + 0x4B)($at)
    /* 5D364 8006D364 0E80013C */  lui        $at, %hi(storehold + 0x49)
    /* 5D368 8006D368 21082500 */  addu       $at, $at, $a1
    /* 5D36C 8006D36C D11D2290 */  lbu        $v0, %lo(storehold + 0x49)($at)
    /* 5D370 8006D370 00000000 */  nop
    /* 5D374 8006D374 23108200 */  subu       $v0, $a0, $v0
    /* 5D378 8006D378 40180200 */  sll        $v1, $v0, 1
    /* 5D37C 8006D37C 21186200 */  addu       $v1, $v1, $v0
    /* 5D380 8006D380 C0180300 */  sll        $v1, $v1, 3
    /* 5D384 8006D384 21186200 */  addu       $v1, $v1, $v0
    /* 5D388 8006D388 80180300 */  sll        $v1, $v1, 2
    /* 5D38C 8006D38C 1A006400 */  div        $zero, $v1, $a0
    /* 5D390 8006D390 12180000 */  mflo       $v1
    /* 5D394 8006D394 3D00A483 */  lb         $a0, 0x3D($sp)
    /* 5D398 8006D398 00000000 */  nop
    /* 5D39C 8006D39C 40100400 */  sll        $v0, $a0, 1
    /* 5D3A0 8006D3A0 21104400 */  addu       $v0, $v0, $a0
    /* 5D3A4 8006D3A4 80100200 */  sll        $v0, $v0, 2
    /* 5D3A8 8006D3A8 21104400 */  addu       $v0, $v0, $a0
    /* 5D3AC 8006D3AC 80100200 */  sll        $v0, $v0, 2
    /* 5D3B0 8006D3B0 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5D3B4 8006D3B4 21082500 */  addu       $at, $at, $a1
    /* 5D3B8 8006D3B8 9C1D248C */  lw         $a0, %lo(storehold + 0x14)($at)
    /* 5D3BC 8006D3BC 0E80013C */  lui        $at, %hi(spelldata + 0x30)
    /* 5D3C0 8006D3C0 21082200 */  addu       $at, $at, $v0
    /* 5D3C4 8006D3C4 B0DB228C */  lw         $v0, %lo(spelldata + 0x30)($at)
    /* 5D3C8 8006D3C8 00000000 */  nop
    /* 5D3CC 8006D3CC 21208200 */  addu       $a0, $a0, $v0
    /* 5D3D0 8006D3D0 18006400 */  mult       $v1, $a0
    /* 5D3D4 8006D3D4 12180000 */  mflo       $v1
    /* 5D3D8 8006D3D8 EB51023C */  lui        $v0, (0x51EB851F >> 16)
    /* 5D3DC 8006D3DC 1F854234 */  ori        $v0, $v0, (0x51EB851F & 0xFFFF)
    /* 5D3E0 8006D3E0 18006200 */  mult       $v1, $v0
    /* 5D3E4 8006D3E4 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5D3E8 8006D3E8 21082500 */  addu       $at, $at, $a1
    /* 5D3EC 8006D3EC 9C1D24AC */  sw         $a0, %lo(storehold + 0x14)($at)
    /* 5D3F0 8006D3F0 C31F0300 */  sra        $v1, $v1, 31
    /* 5D3F4 8006D3F4 10500000 */  mfhi       $t2
    /* 5D3F8 8006D3F8 43110A00 */  sra        $v0, $t2, 5
    /* 5D3FC 8006D3FC 23104300 */  subu       $v0, $v0, $v1
    /* 5D400 8006D400 43100200 */  sra        $v0, $v0, 1
    /* 5D404 8006D404 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5D408 8006D408 21082500 */  addu       $at, $at, $a1
    /* 5D40C 8006D40C 9C1D22AC */  sw         $v0, %lo(storehold + 0x14)($at)
    /* 5D410 8006D410 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 5D414 8006D414 21082500 */  addu       $at, $at, $a1
    /* 5D418 8006D418 A01D22AC */  sw         $v0, %lo(storehold + 0x18)($at)
    /* 5D41C 8006D41C 0E80013C */  lui        $at, %hi(storehidx)
    /* 5D420 8006D420 21082600 */  addu       $at, $at, $a2
    /* 5D424 8006D424 C83129A0 */  sb         $t1, %lo(storehidx)($at)
    /* 5D428 8006D428 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5D42C 8006D42C 00000000 */  nop
    /* 5D430 8006D430 01004224 */  addiu      $v0, $v0, 0x1
    /* 5D434 8006D434 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5D438 8006D438 0800E003 */  jr         $ra
    /* 5D43C 8006D43C 00000000 */   nop
endlabel AddStoreHoldRecharge__FG10ItemStructi
