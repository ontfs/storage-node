# ontfs部署和设置文档
## 简介
   本文档详细描述部署部署ontfs的细节。包括：
   1. 链的部署以及ong充值
   2. ontfs server的部署
   3. ontfs client的部署
   4. 测试上传下载
## 链的部署以及ong充值
### 链的部署
   Ontology测试链需要准备七个钱包。启动七个实例。生成钱包的命令如下：

   ```
   ./ontology account add -d
   # 提示需要输入密码，两次重复输入即可
   ```

   这样操作分别生成7个钱包。7个钱包的address以及pubkey对应更新到`config.json`中去。示例配置如下：

   ```
{
  "VBFT": {
    "peers": [
      {
        "initPos": 10000,
        "address": "ATV1kMRdkm85dnr9Uewwx7Z1WctTtSZHsF",
        "peerPubkey": "027ee085d2d5e6106195e015cbb6ff0a605a4b10baa8971b701eefaea43e2afa2b",
        "index": 1
      },
      {
        "initPos": 20000,
        "address": "AYszGfEYKeSCYmM3XTpW1Ezxzi3yqETSoH",
        "peerPubkey": "02cfbb0ea5f8ed602abb538e0af5b6ecc35cd8dc17fab54f6362e65e52061147bb",
        "index": 2
      },
      {
        "initPos": 30000,
        "address": "AKzGbT3nPLiJCMP6qt236yggY5PR8ogQcu",
        "peerPubkey": "0360b020067bdfd54f3c2d3a71cc26576641e3cc57e1872831ee9562cb58bf0780",
        "index": 3
      },
      {
        "initPos": 40000,
        "address": "AGqidaCADFbRyoZ1ZSkVbLCk5RihZBmAhJ",
        "peerPubkey": "03433eac294e5c458b87bed0a69724f3c79f8a4580abab3eaa6f6f2138685c0761",
        "index": 4
      },
      {
        "initPos": 30000,
        "address": "ANjrPGNhtJDL6ghEfQXq2ZKBzFgw8pP4Fz",
        "peerPubkey": "037e42a5ab4dfeb276ddcdacb03ba48ed2b0c703628f37bad30653c7a674da202a",
        "index": 5
      },
      {
        "initPos": 20000,
        "address": "AQvtbSyACZgoiqnPkfr2XEXTcRsniUPTkj",
        "peerPubkey": "039cdf2ea6aa82974f182f31703838b892bcad3b3192311b8c22983398eed1198b",
        "index": 6
      },
      {
        "initPos": 10000,
        "address": "ATLgbtASPMqjvLpz1kaU6tk36CsURVMiz9",
        "peerPubkey": "03da99c40d2c5f028f13413153cd151f59d70923da3f57e6c108c9986c1b6e93a1",
        "index": 7
      }
    ],
    "vrf_proof": "c57741f934042cb8d8b087b44b161db56fc3ffd4ffb675d36cd09f83935be853d8729f3f5298d12d6fd28d45dde515a4b9d7f67682d182ba5118abf451ff1988",
    "vrf_value": "1c9810aa9822e511d5804a9c4db9dd08497c31087b0daafa34d768a3253441fa20515e2f30f81741102af0ca3cefc4818fef16adb825fbaa8cad78647f3afb590e",
    "min_init_stake": 10000,
    "admin_ont_id": "did:ont:ATV1kMRdkm85dnr9Uewwx7Z1WctTtSZHsF",
    "max_block_change_view": 3000,
    "peer_handshake_timeout": 10,
    "hash_msg_delay": 10000,
    "block_msg_delay": 10000,
    "l": 112,
    "k": 7,
    "c": 2,
    "n": 7
  },
  "ConsensusType": "vbft",
  "SeedList": [
    127.0.0.1:20338",
    127.0.0.1:21338",
    127.0.0.1:22338",
    127.0.0.1:23338",
    127.0.0.1:24338",
    127.0.0.1:25338",
    127.0.0.1:26338"
  ]
}
   ```

   `config.json`中的SeedList需要改成对应的启动位置的内网IP。

   启动命令：

   ```
   ./ontology --disable-tx-pool-pre-exec --config=config.json --reserved-file=./peers.rsv --reserved-only --wallet wallet.dat --enable-consensus --max-tx-in-block 1000  --networkid 7 --gasprice 0 --rest
   ```

   `networkid` 0代表主要 1代表测试网，只要选择跟他们不同即可。这里我们选择7
   每台这样启动后检测对应的终端输出看是否有error log 以及高度是否在增长。预期是没有错误日志以及高度正常增加。
### ong充值
   上传文件需要一定的ong消耗，所以需要给server冲一点ong，示例代码如下：

   ```
package main

import (
    "log"

    "github.com/ontio/ontology-crypto/keypair"
    ontsdk "github.com/ontio/ontology-go-sdk"
    "github.com/ontio/ontology/common"
    "github.com/ontio/ontology/core/types"
)

type simpleWrapper struct {
    sdk     *ontsdk.OntologySdk
    genAddr common.Address
}

func NewWrapper(remote string) *simpleWrapper {
    sdk := ontsdk.NewOntologySdk()
    sdk.NewRpcClient().SetAddress(remote)

    return &simpleWrapper{
        sdk: sdk,
    }
}

func (w *simpleWrapper) GetAccount(wf, passwd string) (*ontsdk.Account, error) {
    wall, err := w.sdk.OpenWallet(wf)
    if err != nil {
        return nil, err
    }

    return wall.GetDefaultAccount([]byte(passwd))
}

func (w *simpleWrapper) GenMultiSignAddress(pubkeys []keypair.PublicKey) (common.Address, error) {
    addr, err := types.AddressFromMultiPubKeys(pubkeys, 5)
    if err != nil {
        return common.Address{}, err
    }
    // func side effect
    w.genAddr = addr
    return addr, nil
}

func (w *simpleWrapper) Transfer(to common.Address, amount uint64) error {
    addr, err := common.AddressFromHexString("0100000000000000000000000000000000000000")
    if err != nil {
        return err
    }
    _, err = w.sdk.Native.Ong.NewTransferFromTransaction(0, 20000, w.genAddr, addr, to, amount)
    return err
}

func main() {
    wp := NewWrapper("http://1.2.3.4:20336") // your chain address
    // 1. get the list of 7 wallet file
    walletsFile := []string{"wallet1.dat", "wallet2.dat" /*, ...*/}
    // 2. get account
    account := make([]*ontsdk.Account, 0, len(walletsFile))
    for _, w := range walletsFile {
        cur, err := wp.GetAccount(w, "wallet_passwd")
        if err != nil {
            log.Fatal("err")
        }
        account = append(account, cur)
    }
    // 3. gen multi sign address
    pubs := make([]keypair.PublicKey, 0, len(account))
    for _, a := range account {
        pubs = append(pubs, a.PublicKey)
    }
    _, err := wp.GenMultiSignAddress(pubs)
    if err != nil {
        log.Fatal(err)
    }
    // 4. transfer ong
    targetAddress, err := common.AddressFromBase58("target address base 58 string") // change to the ontfs server wallet address
    if err != nil {
        log.Fatal(err)
    }
    wp.Transfer(targetAddress, 5000*1e9)
}
   ```

   需要改的地方已经作了说明。请注意代码注释。
## ontfs server的部署
### 启动ontfs server
    同样需要钱包，以同样的方式生成即可。

    ```
    ./ontfs  --listenaddr="172.1.2.3:1990"  --wallet ./wallet.dat --password xxxx --rpcaddr http://chainaddr:20336  --networkid 7 --maxstorage 450G --loglevel 1 --rpcport 1989 --mappingaddr "eip:1990" --pdpcircuit "./circuit"
    ```


    1. listenaddr: 本地监听地址，一般是网卡上看到的地址，公有云场景就是vpc地址
    2. rpcaddr: 指向链的rpc地址
    3. mappingaddr: 公有云场景的eip地址
    4. circuit: pdp证明文件 [这里](https://pan.baidu.com/s/1n44MtD2qzKdBtrK4ku99ig)下载， 提取码：ucsz
### 注册

   ```
   ./ontfs node register --nodenetaddr="107.150.112.175:1990" --volume=450G --servicetime="2029-12-15 12:00:00" --rpcport=1989
   ```

   这里注册的地址是选择的是eip地址

### 检查

        ```
./ontfs node query --nodeaddr=ANFKBU1YuAF5AyAiAryAqYD7pwjUiRTA7Z --rpcport=1989
{
   "Pledge": 471859200,
   "Profit": 167936,
   "Volume": "450 GB",
   "RestVol": "450 GB",
   "ServiceTime": "2029-12-15 12:00:00 +0800 CST",
   "MinPdpInterval": "4h0m0s",
   "NodeAddr": "ANFKBU1YuAF5AyAiAryAqYD7pwjUiRTA7Z",
   "NodeNetAddr": "107.150.112.175:1990"
}
        ```

## onfs client的启动
   同样需要钱包，请以同样方式启动。
### 启动client
    ontfs-client 同级目录下需要`config.json` `sdk_config.json` ,分别如下：

    config.json

    ```
    {
        "DBPath": "./Sdk/DB",
        "FsRepoRoot": "./Sdk/OntFs",
        "FsFileRoot": "./Sdk/Download",
        "RpcPort": 21336,
        "LogLevel": 1,
        "DisableStdLog": false
    }
    ```

    sdk_config:

    ```
    {
        "DBPath": "./Sdk/DB",
        "FsRepoRoot": "./Sdk/OntFs",
        "FsFileRoot": "./Sdk/Download",
        "RpcPort": 21336,
        "LogLevel": 1,
        "DisableStdLog": false
    }
    ```



    启动client命令：

    ```
    ./ontfs-client
    ```

### 启动service

```
./ontfs-client service start
```

## 上传下载检测
### 上传

```
./ontfs-client file upload --filePath "./testfile" --desc "testfile" --timeExpired "2020-12-14 10:20:00" --copyNum 1 --storeType 1 --encrypt=true --encryptPwd "xxxx"
```

    1. copyNum: 上传文件在后端的副本数，和ontfs server的数量相关
    2. storeType: 0 空间租户模式 1 文件模式
    上传成功终端会给出文件hash，样例输出如下：

    ```
    {
   "Tx": "9e14f0d54971a103ea1c20e0cc0d7984377432a55e0bc106bc54687e6d895393",
   "FileHash": "SeNKL3bbFxiDixRuxTzVxuotYSuiWsit4cwZTR4ES39aHLRm",
   "Url": "ontfs://SeNKL3bbFxiDixRuxTzVxuotYSuiWsit4cwZTR4ES39aHLRm\u0026name=rongyi2\u0026owner=ATx6HhYReaZPLpd6q48KrodP511ZQ2MzKs\u0026size=6\u0026blocknum=1"
}

    ```

### 下载

```
./ontfs-client file download --fileHash=SeNKCjaenP7nGsQ453v6JsU5M9piMd5CYSDbKuMVjcYVkubG  --maxPeerCnt=2 --decryptPwd="xxxx" --inorder=true --outFilePath ./dl
```

    下载成功会将文件下载到制定地方，这里是 `ontfs-client` 所在目录的`dl` 文件。可以通过计算sha1sum比对文件是否一致。
