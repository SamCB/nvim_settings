#!/bin/bash
set -e

while getopts "so" opt; do
  case "$opt" in
  s)
    SKIP_PY=1
    ;;
  o)
    OVERRIDE_PY=1
    ;;
  esac
done

cd ~/.nvim_settings

curl -fLo ~/.nvim_settings/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim/

if [ -n "$SKIP_PY" ]; then
  echo "Skipping Python Installation"
else
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
    echo "If it already exists, setting -o will override the creation or -s will skip all python setup (may cause problems if it hasn't already been configured)"
    exit 1
  }
  {
    pyenv virtualenv 3.8.0 nvim_settings_py3
  } || {
    echo "If it already exists, setting -o will override the creation or -s will skip all python setup (may cause problems if it hasn't already been configured)"
    exit 1
  }

  # gross workaround to get virtualenv working
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"

  pyenv activate nvim_settings_py2
  pip install neovim
  PYTHON_2_PATH=$(pyenv which python)

  pyenv activate nvim_settings_py3
  pip install neovim
  PYTHON_3_PATH=$(pyenv which python)

fi


cat > ./vimscripts/generated.vim <<EOF
" Autogenerated file from setup.sh

let g:python_host_prog = '$PYTHON_2_PATH'
let g:python3_host_prog = '$PYTHON_3_PATH'
EOF

cat > ~/.config/nvim/init.vim <<EOF 
set runtimepath+=~/.nvim_settings

source ~/.nvim_settings/init.vim
EOF
