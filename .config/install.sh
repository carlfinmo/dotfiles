#!/bin/bash
# vim: sw=4 ts=4 et

install_tmux_and_nvimplug() {
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

install_fish() {
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update
    sudo apt install fish
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
}

install_helm() {
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    sudo apt-get install apt-transport-https --yes
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt-get update
    sudo apt-get install helm
}

init_config() {
    git init --bare $HOME/.cfg
    alias -s config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    config config --local status.showUntrackedFiles no
}


install_pyenv() {
    sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
}

install_poetry() {
    curl -sSL https://install.python-poetry.org | python3 -
}

install_yarn() {
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
}

install_kubernetes() {
    sudo apt-get install -y apt-transport-https ca-certificates curl
    sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
}

install_nodejs() {
    # Using Ubuntu
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
}

case $1 in
	all)
		eval "$(grep -oP "^install_.\w+" $0)"
		;;
	*)
        eval $1
		;;
esac
