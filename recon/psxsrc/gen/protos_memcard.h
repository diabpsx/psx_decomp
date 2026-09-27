/* MEMCARD.CPP prototypes (tools/symhdr.py proto ...) */
void PantsDelay(void);   /* @0x800A67B4 CARDCORE.CPP:1021 */
void card_removed(int card_number);   /* @0x800A5690 CARDCORE.CPP:447 */
int read_card_block(int card_number, int block);   /* @0x800A56C8 CARDCORE.CPP:464 */
int test_hw_event(void);   /* @0x800A5710 CARDCORE.CPP:482 */
void read_card_directory(int card_number);   /* @0x80142998 MEMCARD.CPP:280 */
int test_card_format(int card_number);   /* @0x80142BF4 MEMCARD.CPP:418 */
int read_card_file(int card_number, int file, int id, char *buf);   /* @0x80142E18 MEMCARD.CPP:572 */
int write_card_file(int card_number, int id, char *name, char *title, unsigned char *icon, unsigned short *clut, int size, unsigned char *buf);   /* @0x801430B8 MEMCARD.CPP:757 */
void service_card(int card_number);   /* @0x801434A0 MEMCARD.CPP:945 */
void new_card(int card_number);   /* @0x8014340C MEMCARD.CPP:900 */
unsigned short to_sjis(char asc);   /* @0x80142774 MEMCARD.CPP:167 */
char to_ascii(unsigned short sjis);   /* @0x801427F4 MEMCARD.CPP:200 */
void endian_swap(unsigned char *b, int byts);   /* @0x801426F8 MEMCARD.CPP:137 */
int checksum_data(char *buf, int size);   /* @0x80142CE4 MEMCARD.CPP:503 */
int sjis_to_ascii(unsigned short *sjis, char *asc);   /* @0x80142910 MEMCARD.CPP:251 */
void ascii_to_sjis(unsigned char *asc, unsigned short *sjis);   /* @0x8014287C MEMCARD.CPP:229 */
