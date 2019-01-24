#!/usr/bin/env python3

import platform
import subprocess

distro_name = platform.linux_distribution()[0]

isAMintDistro = ('Mint' in distro_name)

if (isAMintDistro):
    subprocess.run("/usr/bin/chromium-browser")
else:
    subprocess.run("/usr/bin/chromium")
