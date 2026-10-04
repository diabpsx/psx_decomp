/* EACPSXZ SAVEGP -- interrupt-context global-pointer swap. */
#define LIBTEXT __attribute__((section(".text.lib")))
register unsigned int eac_gp __asm__("$28");
register unsigned int eac_zero __asm__("$0");
unsigned int saved_gp = 0;

void initgp(void) LIBTEXT;
void savegp_ci(unsigned int *out) LIBTEXT;
void restoregp(unsigned int value) LIBTEXT;

void initgp(void)
{
    saved_gp = eac_gp;
}

void savegp_ci(unsigned int *out)
{
    *out = eac_gp;
    eac_gp = saved_gp;
}

void restoregp(unsigned int value)
{
    eac_gp = eac_zero | value;
}
