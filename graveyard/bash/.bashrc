#!/usr/bin/env bash

PS1='[\u@\h \w]\$ '

export PATH="$HOME/.local/share/fnm:/usr/local/go/bin:$PATH"
eval "$(fnm env --use-on-cd)"

nu
