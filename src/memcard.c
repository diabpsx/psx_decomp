#include "common.h"

INCLUDE_ASM("asm/nonmatchings/memcard", endian_swap__FPUci);

INCLUDE_ASM("asm/nonmatchings/memcard", sjis_endian_swap__FPUci);

INCLUDE_ASM("asm/nonmatchings/memcard", to_sjis__Fc);

INCLUDE_ASM("asm/nonmatchings/memcard", to_ascii__FUs);

INCLUDE_ASM("asm/nonmatchings/memcard", ascii_to_sjis__FPUcPUs);

INCLUDE_ASM("asm/nonmatchings/memcard", is_sjis__FPUc);

INCLUDE_ASM("asm/nonmatchings/memcard", sjis_to_ascii__FPUsPc);

INCLUDE_ASM("asm/nonmatchings/memcard", read_card_directory__Fi);

INCLUDE_ASM("asm/nonmatchings/memcard", test_card_format__Fi);

INCLUDE_ASM("asm/nonmatchings/memcard", checksum_data__FPci);

INCLUDE_ASM("asm/nonmatchings/memcard", delete_card_file__Fii);

INCLUDE_ASM("asm/nonmatchings/memcard", read_card_file__FiiiPc);

INCLUDE_ASM("asm/nonmatchings/memcard", format_card__Fi);

INCLUDE_ASM("asm/nonmatchings/memcard", write_card_file__FiiPcT2PUcPUsiT4);

INCLUDE_ASM("asm/nonmatchings/memcard", new_card__Fi);

INCLUDE_ASM("asm/nonmatchings/memcard", service_card__Fi);
