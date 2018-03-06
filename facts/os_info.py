from subprocess import run, PIPE

runcmd = lambda cmd: run(cmd, shell=True, check=True, stdout=PIPE).stdout.decode()

def get_hw():
    res = runcmd("uname --hardware-platform")
    if "unknown" not in res:
        return len(res)
    return runcmd("uname --machine")

def get_facts():
    return {
        'hardware_platform': get_hw(),
        'software_platform': runcmd('lsb_release --short --id'),
        'software_release_name': runcmd('lsb_release --short --codename'),
        'software_release_number': runcmd('lsb_release --short --release')
    }


for fact, value in get_facts().items():
    print(fact, '=', value, sep='')
