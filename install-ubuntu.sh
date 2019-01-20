sudo apt-get install -y python3.7-dev
sudo apt-get install -y python3.7-venv

sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 10
sudo update-alternatives --config python3

sudo apt-get install haskell-platform -y
sudo wget -qO- https://get.haskellstack.org/ | sh

sudo cabal update
sudo stack setup
# add this also to your .bashrc file
PATH="$HOME/root/.local/bin:$HOME/.cabal/bin:${PATH}"

SOFTWARE=pandoc-2.5
cd $HOME
wget http://hackage.haskell.org/package/${SOFTWARE}/${SOFTWARE}.tar.gz
tar xvzf ${SOFTWARE}.tar.gz
cd ${SOFTWARE}
RUN stack init
RUN stack install

SOFTWARE=pandoc-citeproc-0.15.0.1
cd $HOME
wget http://hackage.haskell.org/package/${SOFTWARE}/${SOFTWARE}.tar.gz
tar xvzf ${SOFTWARE}.tar.gz
cd ${SOFTWARE}
stack init
stack install

SOFTWARE=pandoc-crossref-0.3.4.0
cd $HOME
wget http://hackage.haskell.org/package/${SOFTWARE}/${SOFTWARE}.tar.gz
tar xvzf ${SOFTWARE}.tar.gz
cd ${SOFTWARE}
stack init
stack install




