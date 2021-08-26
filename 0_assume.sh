#!/bin/sh

echo "Assume ID:\c"
read assumeID

echo "Assume Role:\c"
read assumeRole

echo "MFA Token:\c"
read mfaToken


assume-role $assumeID  $assumeRole $mfaToken > .session


