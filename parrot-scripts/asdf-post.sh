#so!/bin/bash

echo "Running ASDF post installations"

echo "Installing rust for ASDF"
asdf plugin add rust https://github.com/asdf-community/asdf-rust.git
asdf install rust latest
asdf global rust latest

echo "Installing nodejs for ASDF"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

echo "Installing golang for ASDF"
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang latest
asdf global golang latest

echo "Installing pnpm for ASDF"
asdf plugin-add pnpm
asdf install pnpm latest
asdf global pnpm latest

echo "Installing java for ASDF"
asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf install java latest:adoptopenjdk
asdf global java latest:adoptopenjdk

echo "Installing solidity for ASDF"
asdf plugin add solidity https://github.com/diegodorado/asdf-solidity.git
asdf install solidity latest
asdf global solidity latest

echo "Installing c# for ASDF"
asdf plugin add dotnet
#asdf install dotnet 8.0.301 # to adjust in the future
#asdf global dotnet 8.0.301
# Dotnet not available on asdf for some reason, to try again in the future
#wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
#sudo dpkg -i packages-microsoft-prod.deb
#rm packages-microsoft-prod.deb
#sudo apt update && sudo apt install dotnet-sdk-9.0 aspnetcore-runtime-9.0
