if !(type brew > /dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install openssl
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

if !(type rustc > /dev/null 2>&1); then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh < 1
    source $HOME/.cargo/env
fi


if !(type ansible > /dev/null 2>&1); then
    python3 -m pip install --user ansible
    # TODO: 
    export $HOME/Library/Python/3.8/bin
fi