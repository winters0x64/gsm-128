#! /bin/bash

wget -q http://www.brainyquote.com/link/quotebr.js -O - | \
                                  grep -o -E "\"[A-Z].*\."