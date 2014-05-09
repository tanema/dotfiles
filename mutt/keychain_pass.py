#!/usr/bin/python
import re, subprocess
def get_keychain_pass(account=None, server=None):
    params = {
        'account': account,
        'server': server,
    }
    command = "security find-internet-password -g -a %(account)s -s %(server)s 2>&1 | perl -e 'if (<STDIN> =~ m/password: \"(.*)\"$/ ) { print $1; }'" % params
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    return output
