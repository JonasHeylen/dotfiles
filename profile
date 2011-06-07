# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# MySQL on OS X
if [ -d "/usr/local/mysql/bin" ] ; then
    PATH="/usr/local/mysql/bin:$PATH"
fi

# Scala
if [ -d "/Applications/typesafe-stack" ]; then
	SCALA_HOME="/Applications/typesafe-stack"
    AKKA_HOME="$SCALA_HOME"
	PATH="$SCALA_HOME/bin:$PATH"
fi

# Haskell / Cabal (OS X)
if [ -d "$HOME/Library/Haskell/bin" ]; then
    export PATH="$HOME/Library/Haskell/bin:$PATH"
fi

