#!/usr/bin/env python2

from __future__ import print_function
import gnomekeyring as gkey

def set_credentials(server, user, pw):
    KEYRING_NAME = "mutt"
    attrs = {"server": server, "user": user}
    keyring = gkey.get_default_keyring_sync()
    gkey.item_create_sync(keyring, gkey.ITEM_NETWORK_PASSWORD,
        KEYRING_NAME, attrs, pw, True)

def get_credentials(server):
    keyring = gkey.get_default_keyring_sync()
    attrs = {"server": server}
    items = gkey.find_items_sync(gkey.ITEM_NETWORK_PASSWORD, attrs)
    return (items[0].attributes["user"], items[0].secret)

def get_username(server):
    return get_credentials(server)[0]
def get_password(server):
    return get_credentials(server)[1]

if __name__ == "__main__":
    import sys
    import os
    import getpass
    if len(sys.argv) not in (2, 3):
        print("Usage: %s <server> [<username>]" \
            % (os.path.basename(sys.argv[0])))
        sys.exit(0)
    if len(sys.argv) == 3:
        server, username = sys.argv[1:]
        password = getpass.getpass("Enter password for user '%s': " % username)
        password_confirmation = getpass.getpass("Confirm password: ")
        if password != password_confirmation:
            print("Error: password confirmation does not match")
            sys.exit(1)
        set_credentials(server, username, password)
    else:
        server = sys.argv[1]
        print('set imap_pass = "%s"' % get_password(server))
