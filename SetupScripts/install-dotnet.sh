#!/bin/bash
echo Configuring .NET Core 3.1

echo Getting .NET Package...
wget https://download.visualstudio.microsoft.com/download/pr/79f1cf3e-ccc7-4de4-9f4c-1a6e061cb867/68cab78b3f9a5a8ce2f275b983204376/dotnet-sdk-3.1.426-linux-arm64.tar.gz

echo Unpacking...
mkdir -p $HOME/.dotnet
tar zxf dotnet-sdk-3.1*.tar.gz -C $HOME/.dotnet

echo Configuring Current Environment...
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/dotnet
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

echo Configuring Boot Environment...
cd $HOME
echo 'export DOTNET_ROOT=$PWD/.dotnet' > $HOME/dotnet-env.sh
echo 'export PATH=$PATH:$PWD/.dotnet' >> $HOME/dotnet-env.sh
echo export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 >> $HOME/dotnet-env.sh

sudo mv $HOME/dotnet-env.sh /etc/profile.d/dotnet.sh
sudo ln -s $HOME/.dotnet/dotnet /usr/bin/dotnet

rm $HOME/dotnet-sdk-3.1*.tar.gz
dotnet --version