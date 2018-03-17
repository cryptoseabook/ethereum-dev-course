### Setup Ethereum Development Env (Debian-based Linux)

1) Install [Atom](https://atom.io)
```
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install atom
```

2) Install latest ethereum and geth
```
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum
```

3) Install [node](https://nodejs.org/en/)
```
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```

4) Install [Ganache](http://truffleframework.com/ganache/)

5) Install [Truffle 4](https://truffleframework.com)
```
npm uninstall -g truffle
npm install -g truffle@4.0.4
truffle version
```

6) Install [Atom](https://atom.io/)
Atom solidity support
```
sudo apm install language-ethereum
```
