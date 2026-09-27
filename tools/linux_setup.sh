#!/bin/sh
# linux_setup.sh — build the Linux gate lane (verify_asm + symlane) under $TC (default /home/user/tc).
# Needs network access to github.com + ftp.gnu.org, plus gcc/make/go/perl and apt for cpp-mips-linux-gnu.
#   sh tools/linux_setup.sh && . $TC/env.sh
# Pieces:
#   * PsyQ 4.0 CC1PSX/CC1PLPSX/ASPSX/PSYLINK (the decomp.me psyq4.0 bundle), run through wibo
#   * mipsel-none-elf as/objdump built from binutils 2.42 — must be the bare-metal *-elf target:
#     mips-linux-gnu-as pads .text to 16 bytes, which fails the last function of every TU on a trailing nop
#   * the host mips-linux-gnu-cpp as the preprocessor
#   * psx_mnd_sym's sym_dump as DUMPSYM, post-processed to PsyQ DUMPSYM spelling
set -e
TC=${TC:-/home/user/tc}
mkdir -p "$TC/bin" "$TC/mips/bin"
cd "$TC"

command -v mips-linux-gnu-cpp >/dev/null || apt-get install -y cpp-mips-linux-gnu

[ -x wibo ] || { curl -sSL -o wibo https://github.com/decompals/wibo/releases/download/1.2.0/wibo-x86_64; chmod +x wibo; }

if [ ! -f psyq4.0/CC1PLPSX.EXE ]; then
    curl -sSL -o psyq4.0.tar.gz https://github.com/mkst/esa/releases/download/psyq-binaries/psyq4.0.tar.gz
    mkdir -p psyq4.0 && tar xzf psyq4.0.tar.gz --strip-components=1 -C psyq4.0
fi
for x in CC1PSX CC1PLPSX ASPSX PSYLINK; do
    printf '#!/bin/sh\nexec %s/wibo %s/psyq4.0/%s.EXE "$@"\n' "$TC" "$TC" "$x" > "bin/$x"; chmod +x "bin/$x"
done

if [ ! -x mips/bin/mipsel-none-elf-as ]; then
    curl -sSL -o binutils.tar.xz https://ftp.gnu.org/gnu/binutils/binutils-2.42.tar.xz
    tar xf binutils.tar.xz && mkdir -p bu-build && cd bu-build
    ../binutils-2.42/configure --target=mipsel-none-elf --disable-nls --disable-werror --disable-gdb --disable-sim --disable-gprofng >/dev/null
    make -j"$(nproc)" MAKEINFO=true all-gas all-binutils >/dev/null
    cp gas/as-new "$TC/mips/bin/mipsel-none-elf-as"; cp binutils/objdump "$TC/mips/bin/mipsel-none-elf-objdump"
    cd "$TC"
fi

if [ ! -x bin/sym_dump ]; then
    [ -d psx_mnd_sym ] || git clone -q --depth 1 https://github.com/mefistotelis/psx_mnd_sym
    (cd psx_mnd_sym/cmd/sym_dump && go build -o "$TC/bin/sym_dump" .)
fi
# PsyQ DUMPSYM spelling: no underscores in the 8c/8e/90/92 record names; base type 0 prints BOOL
# (C++ bool) except on EOS/LABEL records.
cat > bin/dumpsym <<EOF
#!/bin/sh
$TC/bin/sym_dump "\$@" | perl -pe 's/ Function_start\$/ Function start/; s/ Function_end / Function end /; s/ Block_start / Block start /; s/ Block_end / Block end /; s/(class (?!EOS |LABEL )\\w+ type (?:[A-Z]+ )*)NULL( size)/\$1BOOL\$2/'
EOF
chmod +x bin/dumpsym

cat > env.sh <<EOF
export DIAB_CC1=$TC/bin/CC1PSX DIAB_CC1PL=$TC/bin/CC1PLPSX
export DIAB_CPP=$(command -v mips-linux-gnu-cpp) DIAB_AS=$TC/mips/bin/mipsel-none-elf-as DIAB_OBJDUMP=$TC/mips/bin/mipsel-none-elf-objdump
export DIAB_ASPSX=$TC/bin/ASPSX DIAB_PSYLINK=$TC/bin/PSYLINK DIAB_DUMPSYM=$TC/bin/dumpsym
EOF
echo "ok: . $TC/env.sh"
