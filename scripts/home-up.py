#!/bin/env python3

from os import path
import modules.helpers as mh

def main():
    script = path.basename(__file__)
    env = script[0:script.find('-')]
    mh.playbook(
        script[1 + len(env):-len('.py')],
        env,
    )

if __name__ == '__main__':
    main()
