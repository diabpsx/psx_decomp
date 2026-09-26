SECTIONS
{
    HIDDEN(__romPos = 0);
    _gp = 0x8011A780;
    fmv_ROM_START = __romPos;
    fmv_VRAM = ADDR(.fmv);
    .fmv 0x80139BF8 : AT(fmv_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fmv_RODATA_START = .;
        build/asm/data/libpress_rdata.rodata.s.o(.rodata);
        build/src/libpress.c.o(.rodata);
        build/src/fmv.c.o(.rodata);
        build/asm/data/fmv_rodata_8013b910.rodata.s.o(.rodata);
        build/src/fmv_1.c.o(.rodata);
        . = ALIGN(., 16);
        fmv_RODATA_END = .;
        fmv_RODATA_SIZE = ABSOLUTE(fmv_RODATA_END - fmv_RODATA_START);
        fmv_TEXT_START = .;
        build/src/libpress.c.o(.text);
        build/src/fmv.c.o(.text);
        build/src/fmv_1.c.o(.text);
        . = ALIGN(., 16);
        fmv_TEXT_END = .;
        fmv_TEXT_SIZE = ABSOLUTE(fmv_TEXT_END - fmv_TEXT_START);
        fmv_DATA_START = .;
        build/asm/data/fmv_hdr.data.s.o(.data);
        build/asm/data/libpress_data.data.s.o(.data);
        build/asm/data/libpress_rdata.rodata.s.o(.data);
        build/src/libpress.c.o(.data);
        build/src/fmv.c.o(.data);
        build/asm/data/fmv_rodata_8013b910.rodata.s.o(.data);
        build/src/fmv_1.c.o(.data);
        . = ALIGN(., 16);
        fmv_DATA_END = .;
        fmv_DATA_SIZE = ABSOLUTE(fmv_DATA_END - fmv_DATA_START);
        fmv_BSS_START = .;
        build/asm/data/libpress_rdata.rodata.s.o(.bss);
        build/src/libpress.c.o(.bss);
        build/src/fmv.c.o(.bss);
        build/asm/data/fmv_rodata_8013b910.rodata.s.o(.bss);
        build/src/fmv_1.c.o(.bss);
        . = ALIGN(., 16);
        fmv_BSS_END = .;
        fmv_BSS_SIZE = ABSOLUTE(fmv_BSS_END - fmv_BSS_START);
    }
    __romPos += SIZEOF(.fmv);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    fmv_ROM_END = __romPos;
    fmv_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
