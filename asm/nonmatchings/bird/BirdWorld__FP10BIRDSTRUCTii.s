.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BirdWorld__FP10BIRDSTRUCTii, 0x7C

glabel BirdWorld__FP10BIRDSTRUCTii
    /* 9B894 800AB894 0200A104 */  bgez       $a1, .L800AB8A0
    /* 9B898 800AB898 2110A000 */   addu      $v0, $a1, $zero
    /* 9B89C 800AB89C 0700A224 */  addiu      $v0, $a1, 0x7
  .L800AB8A0:
    /* 9B8A0 800AB8A0 C3380200 */  sra        $a3, $v0, 3
    /* 9B8A4 800AB8A4 C0100700 */  sll        $v0, $a3, 3
    /* 9B8A8 800AB8A8 2338A200 */  subu       $a3, $a1, $v0
    /* 9B8AC 800AB8AC 0200C104 */  bgez       $a2, .L800AB8B8
    /* 9B8B0 800AB8B0 2110C000 */   addu      $v0, $a2, $zero
    /* 9B8B4 800AB8B4 0700C224 */  addiu      $v0, $a2, 0x7
  .L800AB8B8:
    /* 9B8B8 800AB8B8 C3180200 */  sra        $v1, $v0, 3
    /* 9B8BC 800AB8BC C0100300 */  sll        $v0, $v1, 3
    /* 9B8C0 800AB8C0 0200A104 */  bgez       $a1, .L800AB8CC
    /* 9B8C4 800AB8C4 2318C200 */   subu      $v1, $a2, $v0
    /* 9B8C8 800AB8C8 21280000 */  addu       $a1, $zero, $zero
  .L800AB8CC:
    /* 9B8CC 800AB8CC 0200C104 */  bgez       $a2, .L800AB8D8
    /* 9B8D0 800AB8D0 C3100500 */   sra       $v0, $a1, 3
    /* 9B8D4 800AB8D4 21300000 */  addu       $a2, $zero, $zero
  .L800AB8D8:
    /* 9B8D8 800AB8D8 080082A0 */  sb         $v0, 0x8($a0)
    /* 9B8DC 800AB8DC C3100600 */  sra        $v0, $a2, 3
    /* 9B8E0 800AB8E0 090082A0 */  sb         $v0, 0x9($a0)
    /* 9B8E4 800AB8E4 2310E300 */  subu       $v0, $a3, $v1
    /* 9B8E8 800AB8E8 80100200 */  sll        $v0, $v0, 2
    /* 9B8EC 800AB8EC 0A0082A0 */  sb         $v0, 0xA($a0)
    /* 9B8F0 800AB8F0 2110E300 */  addu       $v0, $a3, $v1
    /* 9B8F4 800AB8F4 F8FF4224 */  addiu      $v0, $v0, -0x8
    /* 9B8F8 800AB8F8 43100200 */  sra        $v0, $v0, 1
    /* 9B8FC 800AB8FC 80100200 */  sll        $v0, $v0, 2
    /* 9B900 800AB900 040085A4 */  sh         $a1, 0x4($a0)
    /* 9B904 800AB904 060086A4 */  sh         $a2, 0x6($a0)
    /* 9B908 800AB908 0800E003 */  jr         $ra
    /* 9B90C 800AB90C 0B0082A0 */   sb        $v0, 0xB($a0)
endlabel BirdWorld__FP10BIRDSTRUCTii
