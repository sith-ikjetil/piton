#!/bin/bash                                                                 
#: Title       : build-release.sh
#: Date        : 2023-02-05
#: Author      : Kjetil Kristoffer Solberg <post@ikjetil.no>
#: Version     : 1.0
#: Description : Builds piton.
echo "Compiling piton ..."
echo "> using release build <"
 
fpc ./piton.pas
if [[ $? -eq 0 ]]
then
    echo "> piton build ok <"
else
    echo "> piton build error <"
fi

echo "> build process complete <"

