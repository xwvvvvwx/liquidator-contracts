export SETH_CHAIN=kovan

set -e

address=$1
amount=$2

function message() {
    echo >&2 
    echo >&2 --------------------------------
    echo >&2 "$@"
    echo >&2 --------------------------------
    echo >&2
}

message OPENING CDP
id=$(dai open | cut -d " " -f 3)

message LOCKING COLLATERAL
dai --cup ${id} lock ${amount}

message TRANSFERING CDP
dai --cup=${id} give ${address}

message STATUS
dai --cup=${id} cup

echo $id
