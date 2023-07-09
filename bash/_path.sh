export RUNTIME_ROOT=/opt
export GOPATH="$RUNTIME_ROOT/go"
export CARGO_HOME="$RUNTIME_ROOT/cargo"
export PIP_USER_HOME="$RUNTIME_ROOT/pip"
export GEM_HOME="$RUNTIME_ROOT/gem"
export PYTHONUSERBASE="$RUNTIME_ROOT/pip"
export NVM_DIR="$RUNTIME_ROOT/nvm/environments"

export LUA_PATH="$RUNTIME_DIR/luarocks/share/lua/5.1/?.lua;;"
export LUA_CPATH="$RUNTIME_DIR/luarocks/lib/lua/5.1/?.so;;"


export PATH="$PATH:$RUNTIME_ROOT/go/bin:$RUNTIME_ROOT/cargo/bin:$RUNTIME_ROOT/pip/bin:$RUNTIME_ROOT/gem/bin:/opt/ugs/ugsplatform-linux/bin:$RUNTIME_ROOT/npm/bin"
