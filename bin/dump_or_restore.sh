#!/bin/bash

if [[ ! -e /tmp/fdump ]] ; then
  ratpoison -c "fdump" >/tmp/fdump
  ratpoison -c "echo Window layout saved"
else
  ratpoison -c "frestore $(cat /tmp/fdump)"
  rm -rf /tmp/fdump
  ratpoison -c "echo Window layout restored"
fi


