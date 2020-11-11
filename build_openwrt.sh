sudo apt install subversion g++ zlib1g-dev build-essential git python python3 libncurses5-dev gawk gettext wget libelf-dev ecj fastjar java-propose-classpath

cd ~/
git clone https://git.openwrt.org/openwrt/openwrt.git
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
