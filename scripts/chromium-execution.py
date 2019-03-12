#!/usr/bin/env python3

import platform
import subprocess

distro_name = platform.linux_distribution()[0]

is_my_distro_mint = ('Mint' in distro_name)

if (is_my_distro_mint):
    subprocess.run("/usr/bin/chromium-browser")
else:
    subprocess.run("/usr/bin/chromium")
