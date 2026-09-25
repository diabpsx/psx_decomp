.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLong, 0x64

glabel GetLong
    /* 13308 80023308 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1330C 8002330C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 13310 80023310 1000B0AF */  sw         $s0, 0x10($sp)
    /* 13314 80023314 9B8C000C */  jal        SwapByte
    /* 13318 80023318 01000434 */   ori       $a0, $zero, 0x1
    /* 1331C 8002331C 00860200 */  sll        $s0, $v0, 24
    /* 13320 80023320 9B8C000C */  jal        SwapByte
    /* 13324 80023324 02000434 */   ori       $a0, $zero, 0x2
    /* 13328 80023328 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1332C 8002332C 00140200 */  sll        $v0, $v0, 16
    /* 13330 80023330 21800202 */  addu       $s0, $s0, $v0
    /* 13334 80023334 9B8C000C */  jal        SwapByte
    /* 13338 80023338 03000434 */   ori       $a0, $zero, 0x3
    /* 1333C 8002333C FF004230 */  andi       $v0, $v0, 0xFF
    /* 13340 80023340 00120200 */  sll        $v0, $v0, 8
    /* 13344 80023344 21800202 */  addu       $s0, $s0, $v0
    /* 13348 80023348 9B8C000C */  jal        SwapByte
    /* 1334C 8002334C 04000434 */   ori       $a0, $zero, 0x4
    /* 13350 80023350 FF004230 */  andi       $v0, $v0, 0xFF
    /* 13354 80023354 21100202 */  addu       $v0, $s0, $v0
    /* 13358 80023358 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1335C 8002335C 1000B08F */  lw         $s0, 0x10($sp)
    /* 13360 80023360 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13364 80023364 0800E003 */  jr         $ra
    /* 13368 80023368 00000000 */   nop
endlabel GetLong
