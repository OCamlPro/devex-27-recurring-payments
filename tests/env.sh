
function cmd()
{
    echo
    echo  COMMAND $*
    echo
    $* || exit 2
}

function cmdk()
{
    echo
    echo  COMMAND $*
    echo
    $*
}

FT="ft --echo"

export DEPLOYER=user0
export PROVIDER=user1
export TESTUSER=user1

# export DEPLOYER=fabrice
# export PROVIDER=fabrice
export ROOT_CREDIT=3
