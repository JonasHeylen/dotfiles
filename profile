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
    PATH="$HOME/Library/Haskell/bin:$PATH"
fi

# Gradle
if [ -d "/Applications/gradle-1.2/bin" ]; then
    PATH="/Applications/gradle-1.2/bin:${PATH}"
fi

# Developer tools
if [ -d "/Applications/Xcode.app/Contents/Developer/usr/bin" ]; then
    PATH="/Applications/Xcode.app/Contents/Developer/usr/bin:${PATH}"
fi

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
if [ -d "/Library/Frameworks/Python.framework/Versions/2.7/bin" ]; then
    PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Dropbox/Projects
    export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
    export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/2.7/bin/python
    export VIRTUALENV_PYTHON=/Library/Frameworks/Python.framework/Versions/2.7/bin/python
    source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

export PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


