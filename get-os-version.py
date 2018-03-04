#!/usr/bin/env python3
import re
sources = ''
with open("/etc/apt/sources.list", 'r') as srcfile:
    sources = srcfile.read()
supported_os_versions = ['stretch', 'jessie', 'xenial']
def get_os_version(sources):
    for line in sources:
        if re.match(r"deb\s+", line):
            if line.split(' ')[2] in supported_os_versions:
                return line.split(' ')[2]
print(
    "OS_RELEASE_VERSION=%s" % (
        get_os_version(
            sources.split('\n')
)   )   )
