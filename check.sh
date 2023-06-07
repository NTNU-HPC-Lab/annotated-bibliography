#!/bin/bash

RC=0

for tag in $(grep -oP "^@.+{(\K[[:alnum:]\-]+)" ./references.bib)
do
    [ -f "./annotations/${tag}.tex" ] || {
        echo "Missing annotation for ${tag}";
        RC=1;
    }

    [ -f "./abstracts/${tag}.tex" ] || {
        echo "Missing abstract for ${tag}";
        RC=1;
    }
done

exit $RC
