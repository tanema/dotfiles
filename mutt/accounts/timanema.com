set from="me@timanema.com"
set sendmail = "~/.mutt/bin/mailsender -a timanema.com"
set spoolfile = "+timanema.com/INBOX"
set postponed = "+timanema.com/Drafts"
set mbox      = "+timanema.com/archive"
unmailboxes *
mailboxes + '+timanema.com/INBOX' \
          + '+timanema.com/Sent Messages' \
          + '+timanema.com/[Gmail].Drafts' \
          + '+timanema.com/[Gmail].Starred' \
          + '+timanema.com/[Gmail].Spam' \
          + '+timanema.com/[Gmail].Trash'

