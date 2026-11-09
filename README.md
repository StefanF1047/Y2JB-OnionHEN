<br>

<div align="center">
  <h3>PS5 Y2JB OnionHEN Autoloader</h3>
  <p>
    Automatically loads the kernel exploit and a modified variant of OnionHEN
  </p>
</div>

<br>

<div align="center">
  <h3>Built with</h3>

  <img src="https://github.com/itsPLK/ps5-y2jb-autoloader/blob/main/src/icon0.png?raw=true" alt="Logo" width="80" height="80">
  <img src="https://github.com/StefanF1047/OnionHEN/blob/main/assets/logo.png?raw=true" alt="Logo" width="80" height="80">
</div>

<br>

<div align="center">
  <h3>Included Projects</h3>
  
  <a href="https://github.com/Gezine/Y2JB">Original Y2JB</a> <br>
  <a href="https://github.com/notmaj0r/Y2JB/releases">Updated & faster Y2JB</a> <br>
  <a href="https://github.com/aydencharles/onionHEN">Original OnionHEN</a> <br>
  <a href="https://github.com/StefanF1047/OnionHEN">Updated OnionHEN</a> <br>
  <a href="https://github.com/lamine5656/HyperHEN-Y2JB/blob/main/tools/y2jb_bundle.py">download0.bat Generator</a> 
</div>

<br>

<h3> 📦 Installation </h2>

> **Prerequisites:** Python 3 and `makefs` with UFS2 support. If `./ufs2_download0.sh` fails with `Can't stat` or a free‑inodes error, see [Installing makefs](#-installing-makefs) below.

<h3> 1 · Extract the release </h3>

```bash
unzip Y2JB-OnionHEN.zip && cd Y2JB-OnionHEN
```

<h3> 2 · Patch the bundle </h3>

Embed your payload into the Y2JB splash‑screen bundle:

```bash
python3 y2jb_bundle.py --download0 download0 --elf OnionHEN.elf --out build/download0
```

> 💡 **Any payload works.** Replace `OnionHEN.elf` with your own `.elf` — the script rewires the loader automatically, no code changes needed.

<h3> 3 · Build the UFS2 image </h3>

```bash
chmod +x ufs2_download0.sh
./ufs2_download0.sh
```

Produces a single `download0.dat` (~321 MiB) ready to deploy.

<h3> 4 · Deploy to your console </h3>

Upload `download0.dat` via FTP to the path matching your console's region:

| Region | Destination |
| :----: | :---------- |
| 🇺🇸 USA | `/user/download/PPSA01650/` |
| 🇪🇺 Europe | `/user/download/PPSA01651/` |
| 🇯🇵 Japan | `/user/download/PPSA01652/` |

Once the file is in place, launch the YouTube app — the payload boots automatically.

<br>


### 🛠 Installing makefs

`makefs` is not packaged by most distributions, so it must be built from source. The commands below install the toolchain first, then compile and install `makefs` with UFS2 support.

#### Arch / CachyOS / Manjaro / Artix

```bash
sudo pacman -S --needed base-devel git util-linux
git clone https://github.com/kusumi/makefs.git
cd makefs
make
sudo make install
```

#### Debian / Devuan / Ubuntu / Linux Mint / Pop!_OS

```bash
sudo apt update
sudo apt install -y build-essential git uuid-dev
git clone https://github.com/kusumi/makefs.git
cd makefs
make
sudo make install
```

#### Fedora / RHEL / CentOS Stream / Rocky / AlmaLinux

```bash
sudo dnf install -y gcc make git libuuid-devel
git clone https://github.com/kusumi/makefs.git
cd makefs
make
sudo make install
```

#### openSUSE Tumbleweed / Leap

```bash
sudo zypper install -y gcc make git libuuid-devel
git clone https://github.com/kusumi/makefs.git
cd makefs
make
sudo make install
```

#### Verify the installation

```bash
makefs --version
```

You should see output mentioning `ffs` / `ufs` support. If not, re-run `make` inside the `makefs` source tree and check for build errors before `make install`.