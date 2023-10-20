
#!/bin/zsh
if [ "which brew" == "" ]; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install golang

env CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -ldflags "-s -w" -o ./rmmagent-macos-amd64
env CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -ldflags "-s -w" -o ./rmmagent-macos-arm64
chmod +x ./rmmagent-macos-amd64
chmod +x ./rmmagent-macos-arm64

echo "Done! Make sure to read the installation instructions: https://github.com/kylefmohr/MacOSRMM-Script/tree/test-ci#installation-instructions"
