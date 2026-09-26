SECTIONS
{
    HIDDEN(__romPos = 0);
    _gp = 0x8011A780;
    frontend_ROM_START = __romPos;
    frontend_VRAM = ADDR(.frontend);
    .frontend 0x80139BF8 : AT(frontend_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        frontend_RODATA_START = .;
        build/asm/data/credits_rodata_8013cb74.rodata.s.o(.rodata);
        build/src/credits_1.c.o(.rodata);
        build/asm/data/memcard_rodata_8013e158.rodata.s.o(.rodata);
        build/src/memcard.c.o(.rodata);
        build/asm/data/memcard_rodata_8013e1f8.rodata.s.o(.rodata);
        build/src/memcard_1.c.o(.rodata);
        build/src/dlg.c.o(.rodata);
        build/asm/data/dlg_rodata_801435f8.rodata.s.o(.rodata);
        build/src/dlg_1.c.o(.rodata);
        build/asm/data/dlg_rodata_8014364c.rodata.s.o(.rodata);
        build/src/dlg_2.c.o(.rodata);
        build/asm/data/dlg_rodata_801436ec.rodata.s.o(.rodata);
        build/src/dlg_3.c.o(.rodata);
        build/asm/data/dlg_rodata_801576f0.rodata.s.o(.rodata);
        build/src/dlg_4.c.o(.rodata);
        build/src/loadsave.c.o(.rodata);
        build/src/presonly.c.o(.rodata);
        build/src/fe.c.o(.rodata);
        build/src/credits.c.o(.rodata);
        . = ALIGN(., 16);
        frontend_RODATA_END = .;
        frontend_RODATA_SIZE = ABSOLUTE(frontend_RODATA_END - frontend_RODATA_START);
        frontend_TEXT_START = .;
        build/src/presonly.c.o(.text);
        build/src/fe.c.o(.text);
        build/src/credits.c.o(.text);
        build/src/credits_1.c.o(.text);
        build/src/memcard.c.o(.text);
        build/src/memcard_1.c.o(.text);
        build/src/dlg.c.o(.text);
        build/src/dlg_1.c.o(.text);
        build/src/dlg_2.c.o(.text);
        build/src/dlg_3.c.o(.text);
        build/src/dlg_4.c.o(.text);
        build/src/loadsave.c.o(.text);
        . = ALIGN(., 16);
        frontend_TEXT_END = .;
        frontend_TEXT_SIZE = ABSOLUTE(frontend_TEXT_END - frontend_TEXT_START);
        frontend_DATA_START = .;
        build/asm/data/frontend_hdr.data.s.o(.data);
        build/src/presonly.c.o(.data);
        build/src/fe.c.o(.data);
        build/src/credits.c.o(.data);
        build/asm/data/credits_rodata_8013cb74.rodata.s.o(.data);
        build/src/credits_1.c.o(.data);
        build/asm/data/memcard_rodata_8013e158.rodata.s.o(.data);
        build/src/memcard.c.o(.data);
        build/asm/data/memcard_rodata_8013e1f8.rodata.s.o(.data);
        build/src/memcard_1.c.o(.data);
        build/src/dlg.c.o(.data);
        build/asm/data/dlg_rodata_801435f8.rodata.s.o(.data);
        build/src/dlg_1.c.o(.data);
        build/asm/data/dlg_rodata_8014364c.rodata.s.o(.data);
        build/src/dlg_2.c.o(.data);
        build/asm/data/dlg_rodata_801436ec.rodata.s.o(.data);
        build/src/dlg_3.c.o(.data);
        build/asm/data/dlg_rodata_801576f0.rodata.s.o(.data);
        build/src/dlg_4.c.o(.data);
        build/src/loadsave.c.o(.data);
        . = ALIGN(., 16);
        frontend_DATA_END = .;
        frontend_DATA_SIZE = ABSOLUTE(frontend_DATA_END - frontend_DATA_START);
        frontend_BSS_START = .;
        build/src/presonly.c.o(.bss);
        build/src/fe.c.o(.bss);
        build/src/credits.c.o(.bss);
        build/asm/data/credits_rodata_8013cb74.rodata.s.o(.bss);
        build/src/credits_1.c.o(.bss);
        build/asm/data/memcard_rodata_8013e158.rodata.s.o(.bss);
        build/src/memcard.c.o(.bss);
        build/asm/data/memcard_rodata_8013e1f8.rodata.s.o(.bss);
        build/src/memcard_1.c.o(.bss);
        build/src/dlg.c.o(.bss);
        build/asm/data/dlg_rodata_801435f8.rodata.s.o(.bss);
        build/src/dlg_1.c.o(.bss);
        build/asm/data/dlg_rodata_8014364c.rodata.s.o(.bss);
        build/src/dlg_2.c.o(.bss);
        build/asm/data/dlg_rodata_801436ec.rodata.s.o(.bss);
        build/src/dlg_3.c.o(.bss);
        build/asm/data/dlg_rodata_801576f0.rodata.s.o(.bss);
        build/src/dlg_4.c.o(.bss);
        build/src/loadsave.c.o(.bss);
        . = ALIGN(., 16);
        frontend_BSS_END = .;
        frontend_BSS_SIZE = ABSOLUTE(frontend_BSS_END - frontend_BSS_START);
    }
    __romPos += SIZEOF(.frontend);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    frontend_ROM_END = __romPos;
    frontend_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
