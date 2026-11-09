# sudo pacman -S --needed base-devel git util-linux
# git clone https://github.com/kusumi/makefs.git
# cd makefs
# make
# sudo make install

makefs -t ffs -o version=2 -b 32768 -f 4096 \
       -s 336789504 \
       download0.dat build/download0