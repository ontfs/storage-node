#!/bin/bash
# 1. mappingaddr is elastic IP in cloud
# 2. chainaddr: ontfs block chain
# 3. circuit: the circuit file
./ontfs  --listenaddr="10.0.0.2:1990"  --wallet ./wallet.dat --password server --rpcaddr http://chainaddr:20336  --networkid 7 --maxstorage 450G --loglevel 1 --rpcport 1989 --mappingaddr "8.8.2.2:1990" --pdpcircuit "./circuit"
