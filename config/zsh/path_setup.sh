# This file is entirely devoted to setting up my $PATH variable to ensure a clean
# and properly ordered $PATH in every environment without having to touch /etc/paths
# which requires sudo. It also ensure that if anything has touched my /etc/paths
# it will no get touched anyways.
export PATH=""                                         # reset so my path to empty.
export PATH=$PATH:/opt/homebrew/bin:/opt/homebrew/sbin # use homebrew over any system command
export PATH=$PATH:$HOME/.local/bin                     # custom local system commands if I make them.
export PATH=$PATH:$GOPATH/bin                          # golang tools
export PATH=$PATH:$RBENV_ROOT/shims                    # rbenv shims
export PATH=$PATH:$HOME/.cargo/bin                     # rust tools
export PATH=$PATH:/usr/local/bin:/usr/local/sbin       # local takes precedence over /usr
export PATH=$PATH:/usr/bin:/usr/sbin                   # usr takes precedence over /
export PATH=$PATH:/bin:/sbin                           # root tools
