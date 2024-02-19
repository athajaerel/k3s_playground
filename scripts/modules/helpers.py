from os import environ
from os.path import dirname, realpath
#, exists
from sys import argv, stdin, stdout, stderr
import ansible_runner

def env_with_default(name, default):
    if name in environ:
        return environ[name]
    return default

def env_hosts(env, default):
    return env_with_default(f'{env.upper()}_HOSTS', default)

def env_playbook(scriptdir, action):
    return env_with_default('PLAYBOOK', realpath(f'{scriptdir}/{action}.yml'))

def env_inventory(scriptdir, env):
    return env_with_default('ANSIBLE_INVENTORY', realpath(f'{scriptdir}/../site/{env}'))

def playbook(action, env, hosts='all'):
    DIR_SCRIPT = dirname(realpath(argv[0]))
    ANSIBLE_INVENTORY = env_inventory(DIR_SCRIPT, env)
    ANSIBLE_HOSTS = env_hosts(env, hosts)
    ANSIBLE_PLAYBOOK = env_playbook(DIR_SCRIPT, action)
    print(f'Hosts limit: {ANSIBLE_HOSTS}')
    print(f'Inv: {ANSIBLE_INVENTORY}')
    print(f'Playbook: {ANSIBLE_PLAYBOOK}')
    args = []
    args.append(f'--limit={ANSIBLE_HOSTS}')
    args.append(f'--inventory={ANSIBLE_INVENTORY}')
    args.append(f'-e')
    args.append(f'ansible_python_interpreter=auto_silent')
    args += argv[1:]
    args.append(f'{ANSIBLE_PLAYBOOK}')
    # print(f'Running with args: {args}')
    ansible_runner.run_command('/usr/bin/ansible-playbook', cmdline_args=args, input_fd=stdin, output_fd=stdout, error_fd=stderr)
