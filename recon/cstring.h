#ifndef DIABPSX_CSTRING_H
#define DIABPSX_CSTRING_H
/* libc (PsyQ LIBC) string functions used by the game. */
#ifdef __cplusplus
extern "C" {
#endif
typedef unsigned int size_t;
char *strcpy(char *dst, const char *src);
char *strcat(char *dst, const char *src);
size_t strlen(const char *s);
#ifdef __cplusplus
}
#endif
#endif
