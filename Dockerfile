FROM kalilinux/kali-rolling:arm64

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install kali-linux-arm kali-desktop-core -y

RUN DEBIAN_FRONTEND=noninteractive apt install -y \
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
  kali-tools-reporting

RUN apt-get install -y burpsuite telnet freerdp2-x11 x11-apps golang-go nano iputils-ping openvpn dnsutils chromium virtualenv

RUN git clone https://github.com/jehna/my-terminal-config.git ~/.config
RUN GO111MODULE=on go install github.com/OJ/gobuster/v3@latest

# Install FoxyProxy
RUN mkdir /usr/share/firefox-esr/distribution/extensions
RUN curl -L https://addons.mozilla.org/firefox/downloads/latest/foxyproxy-standard/addon-00000000-latest.xpi > /usr/share/firefox-esr/distribution/extensions/foxyproxy@eric.h.jung.xpi

COPY bash_profile /root/.bash_profile

ENTRYPOINT bash --login $@
