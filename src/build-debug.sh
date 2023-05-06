#!/bin/bash                                                                 
#: Title       : build-debug.sh
#: Date        : 2023-02-05
#: Author      : Kjetil Kristoffer Solberg <post@ikjetil.no>
#: Version     : 1.0
#: Description : Builds piton.
echo "Compiling piton ..."
echo "> using debug build <"
 
fpc ./piton.pas -g
if [[ $? -eq 0 ]]
then
    echo "> piton build ok <"
else
    echo "> piton build error <"
fi

echo "> build process complete <"

