### setup geth nodes on Amazon EC2

#### create a folder on your linux box

```
mkdir -p ~/eth-blockchain/private
```

### init genesis block json file

Copy and paste the following json file and name it as genesis.json to `~/eth-blockchain/private`

```
{
   "config":{
      "chainId":55725,
      "homesteadBlock":1,
      "eip150Block":2,
      "eip150Hash":"0x0000000000000000000000000000000000000000000000000000000000000000",
      "eip155Block":3,
      "eip158Block":3,
      "byzantiumBlock":4,
      "ethash":{

      }
   },
   "nonce":"0x0",
   "timestamp":"0x5b74d041",
   "extraData":"0x0000000000000000000000000000000000000000000000000000000000000000",
   "gasLimit":"0x47b760",
   "difficulty":"0x80000",
   "mixHash":"0x0000000000000000000000000000000000000000000000000000000000000000",
   "coinbase":"0x0000000000000000000000000000000000000000",
   "alloc":{
      "0000000000000000000000000000000000000000":{
         "balance":"0x1"
      },
      "0000000000000000000000000000000000000001":{
         "balance":"0x1"
      },
      "number":"0x0",
      "gasUsed":"0x0",
      "parentHash":"0x0000000000000000000000000000000000000000000000000000000000000000"
   }
}
```

### Geth init to init the blockchain


```
cd ~/eth-blockchain/private
geth --datadir=~/eth-blockchain/private init ~/.puppeth/genesis.json
```

### Create an account

```
cd ~/eth-blockchain/private
geth --datadir=. account new
```

You need to remember the account `hash` and `password`

### Create a password sec file and put your remembered password in

```
cd ~/eth-blockchain/private
vim password.sec
```

### run the following command

--rpcaddr "172.31.28.111" // put your address
--unlock 9e376475d50017fbdf92a444e5dd2de32c6273fb // put generated address hash


```
geth --networkid 2048 --datadir "~/eth-blockchain/private" --nodiscover --rpc --rpcaddr "172.31.28.111" --rpcport "8545" --port "30303" --rpccorsdomain "*" --nat "any" --rpcapi eth,web3,personal,net --unlock 9e376475d50017fbdf92a444e5dd2de32c6273fb --password ~/eth-blockchain/private/password.sec --ipcpath "~/.ethereum/geth.ipc"
```


### Do the same thing for Node2. using the same gensis block json file

### on Node 1 doing this

```
geth attach
miner.start()
admin.nodeInfo.enode //"enode://c667fdf1f6846af74ed14070ef9ffeee33e98ff8ab0dd43f67415868974d8205e0fb7f55f6f37e9e1ebb112adfc0b88755714c7bc83a7ac47d30f8eb53118687@[::]:30303?discport=0"
```

Add this information to Node 2. Change the [::] with the Private Address of Node 1.




### on Node 2 doing this

```
geth attach
admin.addPeer("enode://c667fdf1f6846af74ed14070ef9ffeee33e98ff8ab0dd43f67415868974d8205e0fb7f55f6f37e9e1ebb112adfc0b88755714c7bc83a7ac47d30f8eb53118687@172.31.62.34:30303?discport=0")
```
