#!/bin/sh


tar cfvz env.tar


rsync -avz -e "ssh" build auxsend.org:/home/public/d/env
