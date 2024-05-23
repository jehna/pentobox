FROM kalilinux/kali-rolling:arm64

RUN DEBIAN_FRONTEND=noninteractive apt update && \
  # Install Kali
  apt install -y \
  kali-linux-arm kali-desktop-core \
  #
  # Tools which benefit from having access to GPU hardware
  #kali-tools-gpu \
  # Hardware hacking tools
  #kali-tools-hardware \
  # Tools based around Cryptography & Steganography
  kali-tools-crypto-stego \
  # For fuzzing protocols
  kali-tools-fuzzing \
  # 802.11 (Commonly known as “Wi-Fi”)
  #kali-tools-802-11 \
  # For targeting Bluetooth devices
  #kali-tools-bluetooth \
  # Radio-Frequency IDentification tools
  #kali-tools-rfid \
  # Software-Defined Radio tools
  #kali-tools-sdr \
  # Voice over IP tools
  #kali-tools-voip \
  # Any resources which can be executed on a Windows hosts
  kali-tools-windows-resources \
  # Environments for learning and practising on
  #kali-linux-labs \
  # Used for Open Source Intelligence (OSINT) & information gathering
  kali-tools-information-gathering \
  # Vulnerability assessments tools
  kali-tools-vulnerability \
  # Designed doing web applications attacks
  kali-tools-web \
  # Based around any database attacks
  kali-tools-database \
  # Helpful for password cracking attacks – Online & offline
  kali-tools-passwords \
  # All tools based around Wireless protocols – 802.11, Bluetooth, RFID & SDR
  kali-tools-wireless \
  # For reverse engineering binaries
  kali-tools-reverse-engineering \
  # Commonly used for doing exploitation
  kali-tools-exploitation \
  # Aimed for doing social engineering techniques
  kali-tools-social-engineering \
  # Any tools meant for sniffing & spoofing
  kali-tools-sniffing-spoofing \
  # Techniques for post exploitation stage
  kali-tools-post-exploitation \
  # Forensic tools – Live & Offline
  kali-tools-forensics \
  # Reporting tools
  kali-tools-reporting \
  # Own tools
  burpsuite telnet freerdp2-x11 x11-apps golang-go nano iputils-ping openvpn dnsutils chromium virtualenv i3 xserver-xephyr htop ffuf payloadsallthethings python-is-python3 ghidra nitrogen; \
  #
  #
  # Install VSCode
  wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64' -O /tmp/vscode.deb && apt install /tmp/vscode.deb && rm /tmp/vscode.deb; \
  #
  # Install FoxyProxy
  mkdir /usr/share/firefox-esr/distribution/extensions && curl -L https://addons.mozilla.org/firefox/downloads/latest/foxyproxy-standard/addon-00000000-latest.xpi > /usr/share/firefox-esr/distribution/extensions/foxyproxy@eric.h.jung.xpi; \
  #
  # Smuggler
  git clone https://github.com/defparam/smuggler.git /opt/smuggler && ln -s /opt/smuggler/smuggler.py /usr/local/bin/smuggler && chmod o+rw /opt/smuggler/payloads/; \
  #
  # User specific
  adduser --disabled-password --gecos '' jehna; \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers; \
  echo 'jehna ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers; \
  chsh --shell /bin/bash jehna; \
  #
  mkdir -p /opt/homebrew/bin; \
  touch /opt/homebrew/bin/brew; \
  chmod o+x /opt/homebrew/bin/brew; \
  ln -s /usr/share/payloadsallthethings /usr/share/wordlists/payloadsallthethings

USER jehna

RUN rm -r ~/.config && git clone https://github.com/jehna/my-terminal-config.git ~/.config; \
  #
  # Install Gobuster
  GO111MODULE=on go install github.com/OJ/gobuster/v3@latest; \
  #
  # Install git-dumper
  pip install --user git-dumper \
    # Install angr decompiler
    angr;

COPY bash_profile /home/jehna/.bashrc.additions
RUN cat /home/jehna/.bashrc.additions >> /home/jehna/.bashrc

COPY i3.sh /usr/share/bin/i3.sh
COPY nitrogen ~/.config/nitrogen

CMD /usr/share/bin/i3.sh
