#!/bin/bash
#this creates a unified mailbox from all the available mailboxes

mkdir ~/Mail/INBOX_NEW
mkdir ~/Mail/INBOX_NEW/cur
for i in ~/Mail/*/INBOX/cur/* ; do
  if [ -a $i ]; then
    ln -s $i ~/Mail/INBOX_NEW/cur/$(basename $i)
  fi;
done
mkdir ~/Mail/INBOX_NEW/new
for i in ~/Mail/*/INBOX/new/* ; do
  if [ -a $i ]; then
    ln -s $i ~/Mail/INBOX_NEW/new/$(basename $i)
  fi;
done
mkdir ~/Mail/INBOX_NEW/tmp
for i in ~/Mail/*/INBOX/tmp/* ; do
  if [ -a $i ]; then
    ln -s $i ~/Mail/INBOX_NEW/tmp/$(basename $i)
  fi;
done

mv ~/Mail/INBOX ~/Mail/INBOX_OLD
mv ~/Mail/INBOX_NEW ~/Mail/INBOX
rm -rf ~/Mail/INBOX_OLD

notmuch new
