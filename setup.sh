#!/bin/bash
set -e

while getopts "pno" opt; do
  case "$opt" in
  p)
    SKIP_PY=1
    ;;
  o)
    OVERRIDE_PY=1
    ;;
  n)
    SKIP_NODE=1
    ;;
  esac
done

cd ~/.nvim_settings

echo "Installing plug"

curl -fLo ~/.nvim_settings/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim/

if [ -n "$SKIP_PY" ]; then
  echo "Skipping Python setup"
else
  echo "Setting up Python environments"
  # Just some required python stuff
  pyenv install -s 2.7.17
  pyenv install -s 3.8.0

  if [ -n "$OVERRIDE_PY" ]; then
    if [[ $(pyenv virtualenvs) =~ "nvim_settings_py2" ]]; then
      pyenv virtualenv-delete -f nvim_settings_py2
    fi
    if [[ $(pyenv virtualenvs) =~ "nvim_settings_py3" ]]; then
      pyenv virtualenv-delete -f nvim_settings_py3
    fi
  fi

  {
    pyenv virtualenv 2.7.17 nvim_settings_py2
  } || {
    echo "If it already exists, setting -o will override the creation or -p will skip all python setup (may cause problems if it hasn't already been configured)"
    exit 1
  }
  {
    pyenv virtualenv 3.8.0 nvim_settings_py3
  } || {
    echo "If it already exists, setting -o will override the creation or -p will skip all python setup (may cause problems if it hasn't already been configured)"
    exit 1
  }

fi

# gross workaround to get virtualenv working
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv activate nvim_settings_py2
if [ -z "$SKIP_PY" ]; then
  pip install neovim
  pip install pynvim
fi
PYTHON_2_PATH=$(pyenv which python)

pyenv activate nvim_settings_py3
if [ -z "$SKIP_PY" ]; then
  pip install neovim
  pip install pynvim
fi
PYTHON_3_PATH=$(pyenv which python)

if [ -n "$SKIP_NODE" ]; then
  echo "Skipping Node setup"
else
  echo "Setting up Node"
  # If yarn exists, assume we want to use it.
  #  otherwise use npm
  {
    yarn global add neovim
  } || {
    ERR=$?
    if [ $ERR -eq 127 ]; then
      npm install -g neovim
    else
      exit $ERR
    fi
  }
fi

echo "Generating Vim Scripts"

cat > ./vimscripts/generated.vim <<EOF
" Autogenerated file from setup.sh

let g:python_host_prog = '$PYTHON_2_PATH'
let g:python3_host_prog = '$PYTHON_3_PATH'
EOF

touch ~/.config/nvim/my_config.vim 

cat > ~/.config/nvim/init.vim <<EOF 
set runtimepath+=~/.nvim_settings

source ~/.nvim_settings/init.vim
source ~/.config/nvim/my_config.vim
EOF

echo Done
