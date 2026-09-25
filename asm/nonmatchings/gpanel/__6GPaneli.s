.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6GPaneli, 0x64

glabel __6GPaneli
    /* 87610 80097610 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 87614 80097614 1400B1AF */  sw         $s1, 0x14($sp)
    /* 87618 80097618 21888000 */  addu       $s1, $a0, $zero
    /* 8761C 8009761C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 87620 80097620 2180A000 */  addu       $s0, $a1, $zero
    /* 87624 80097624 1800BFAF */  sw         $ra, 0x18($sp)
    /* 87628 80097628 044F020C */  jal        GM_UseTexData__Fi
    /* 8762C 8009762C 21200000 */   addu      $a0, $zero, $zero
    /* 87630 80097630 140022AE */  sw         $v0, 0x14($s1)
    /* 87634 80097634 01000226 */  addiu      $v0, $s0, 0x1
    /* 87638 80097638 000022AE */  sw         $v0, 0x0($s1)
    /* 8763C 8009763C 17000226 */  addiu      $v0, $s0, 0x17
    /* 87640 80097640 0F001026 */  addiu      $s0, $s0, 0xF
    /* 87644 80097644 040022AE */  sw         $v0, 0x4($s1)
    /* 87648 80097648 5262020C */  jal        GetMaxOtPos__7CBlocks_80098948
    /* 8764C 8009764C 080030AE */   sw        $s0, 0x8($s1)
    /* 87650 80097650 FEFF4324 */  addiu      $v1, $v0, -0x2
    /* 87654 80097654 21102002 */  addu       $v0, $s1, $zero
    /* 87658 80097658 180043AC */  sw         $v1, 0x18($v0)
    /* 8765C 8009765C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 87660 80097660 1400B18F */  lw         $s1, 0x14($sp)
    /* 87664 80097664 1000B08F */  lw         $s0, 0x10($sp)
    /* 87668 80097668 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8766C 8009766C 0800E003 */  jr         $ra
    /* 87670 80097670 00000000 */   nop
endlabel __6GPaneli
