### Setup Ethereum Development Env (MAC OS X)

1) Install `Xcode` from App Store
![app store xcode](https://user-images.githubusercontent.com/35029364/36673421-da6b7390-1b56-11e8-95ad-4e55ecc73d54.png)

2) Install `Xcode Command Line Tools`
```
xcode-select --install
```

3) install `homebrew`
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew --version
```

4) install latest ethereum and geth
```
brew update
brew tap ethereum/ethereum
brew install ethereum
brew upgrade ethereum
```

5) Install [Ganache](https://github.com/trufflesuite/ganache/releases)
Install version 1.01

6) Install `node` and `npm`
[remove npm](https://docs.npmjs.com/misc/removing-npm)
```
brew install node
```

7) Install [Truffle 4](https://truffleframework.com)
```
npm uninstall -g truffle
npm install -g truffle@4.0.4
truffle version
```
[Fix npm permission](https://docs.npmjs.com/getting-started/fixing-npm-permissions)

8) Install [Atom](https://atom.io/)
Atom solidity support
```
apm install language-ethereum
```


