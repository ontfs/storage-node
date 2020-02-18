# OntFs server  cli 使用说明
OntFs server cli是OntFs server的命令行客户端，用于启动和管理OntFs 存储节点。

## 1、启动和管理OntFs server
OntFs server cli 有很多启动参数，用于配置和管理节点行为。使用./ontfs -help 可以查看OntFs server cli节点支持的所有启动参数。

### 1.1 启动参数
以下是OntFs server cli 支持的命令行参数。

#### 1.1.1 OntFs server系统参数
--loglevel

loglevel 参数用于设置OntFs server输出的日志级别。OntFs server支持从0:Trace 1:Debug 2:Info 3:Warn 4:Error 5:Fatal 6:MaxLevel 的7级日志，日志等级由低到高，输出的日志量由多到少。默认值是2，即只输出info级及其之上级别的日志。
--rpcaddr

rpcaddr 参数用于设置OntFs server节点访问Ontology节点的rpc服务地址。默认值为http://localhost:20336。
--gasprice

gasprice 参数用于设置用于设定OntFs server调用合约时生成交易的gasprice。当gasprice低于Ontology节点设置的gasprice时，该交易将被丢弃。
--gaslimit

gaslimit 参数用于设置用于设定OntFs server调用合约时生成交易的gaslimit。当gaslimit低于Ontology节点的gaslimit时，该交易将被丢弃。

#### 1.1.2 账户参数
--wallet, -w

wallet 参数用于指定OntFs server节点启动时的钱包文件路径。默认值为"./wallet.dat"。

--password, -p

password 参数用于指定OntFs server节点启动的账户密码。

#### 1.1.3 P2P网络参数
--networkid

networkid 参数用于指定网络ID，OntFs server只能和使用相同networkid的其他OntFs server或OntFs client通信。默认值0。

--listenaddr

listenaddr 参数用于指定OntFs server监听的ip地址与端口号。

#### 1.1.4 FS REPO参数
--reporoot

reporoot 参数用于指定OntFs server的Repo根目录。默认值为“./FS”。

--gcperiod

gcperiod 参数用于指定OntFs server执行垃圾回收删除不再使用的文件的检查周期。默认值为1小时。

--maxstorage

maxstorage 参数用于设置OntFs server节点用于提供存储服务的最大存储空间。默认值为10GB。

#### 1.1.5 RPC服务器参数
--disable-rpc

disable-rpc 参数用于关闭rpc服务器。Ontology节点在启动时会默认启动rpc服务器。

--rpcport

rpcport 参数用指定rpc服务器绑定的端口号。默认值为30336。

## 2、OntFs server节点管理命令
### 2.1 注册存储节点
OntFs server 在Ontology上注册成为提供存储服务的存储节点。
```
./ontfs node register
```

#### 2.1.1 注册存储节点参数
--nodenetaddr

nodenetaddr 参数用于配置OntFs server提供存储服务的网络地址。

--volume

volume 参数用于配置OntFs server为存储服务提供的空间大小。

--servicetime

servicetime 用于配置OntFs server提供存储服务的结束时间。

### 2.2 注销存储节点
OntFs server 在Ontology上注销，不再提供存储服务。
```
./ontfs node unregister
```

### 2.3 查询存储节点
查询在Ontology上注册的存储节点信息。
```
./ontfs node query
```

#### 2.3.1 查询存储节点参数
--nodeaddr

nodeaddr 参数用于指定需要查询的存储节点钱包地址。

### 2.4 更新存储节点
OntFs server 在Ontology上更新已经注册的存储节点信息。
```
./ontfs node update
```

#### 2.4.1 注册存储节点参数
--nodenetaddr

nodenetaddr 参数用于配置OntFs server提供存储服务的网络地址。

--volume

volume 参数用于配置OntFs server为存储服务提供的空间大小。

--servicetime

servicetime 用于配置OntFs server提供存储服务的结束时间。

### 2.5 节点提取利润
OntFs service 提取因提供存储服务所获取的利润。
```
./ontfs node withdraw
```

## 3、OntFS server 存储服务管理命令
### 3.1 开启OntFs 存储服务
开启OntFs server的存储服务功能，允许文件上传，下载，并为所存储的文件定期提交PDP证明。
```
./ontfs service start
```

### 3.2 关闭OntFs存储服务
关闭OntFs server的存储服务功能，禁止文件上传，下载，并停止对所有存储文件的PDP证明。

```
./ontfs service stop
```

### 3.3 查询OntFs存储详情
查询OntFs server的存储详情，包括当前存储的文件总数，占用总空间，所存储文件的起止时间，为文件提交的PDP证明次数等。
```
./ontfs service detail
```
