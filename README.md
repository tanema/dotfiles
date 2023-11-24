Tims Dotfiles
=============

Run this command and hope to hell most of the work is done for you

```bash
sh -c "$(-s https://raw.githubusercontent.com/tanema/dotfiles/setup.sh)"
```

The makefile was split up into small steps so that if `make install` does not 
successfully finish then I can run the other step individually. To see more 
info on what actions are availble run `make help`
