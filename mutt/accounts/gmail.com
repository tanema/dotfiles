set from="timanema@gmail.com"
set sendmail = "~/.mutt/bin/mailsender -a gmail.com"
set spoolfile = "+gmail.com/INBOX"
set postponed = "+gmail.com/Drafts"
set mbox      = "+gmail.com/archive"
unmailboxes *
mailboxes + '+/INBOX' \
          + '+gmail.com/INBOX' \
          + '+gmail.com/Sent Messages' \
          + '+gmail.com/[Gmail].Drafts' \
          + '+gmail.com/[Gmail].Starred' \
          + '+gmail.com/[Gmail].Spam' \
          + '+gmail.com/[Gmail].Trash' \
          + '+timanema.com/INBOX' \
          + '+timanema.com/Sent Messages' \
          + '+timanema.com/[Gmail].Drafts' \
          + '+timanema.com/[Gmail].Starred' \
          + '+timanema.com/[Gmail].Spam' \
          + '+timanema.com/[Gmail].Trash'
