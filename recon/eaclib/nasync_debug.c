/* EACPSXZ NASYNC debug hooks -- retail release build uses empty routines. */
#define LIBTEXT __attribute__((section(".text.lib")))
void dumpasync(void) LIBTEXT;
void validateasyncblocks(void) LIBTEXT;

void dumpasync(void)
{
}

void validateasyncblocks(void)
{
}
