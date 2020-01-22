EN | [中文](ontfs_arc.md)

# 1. ONTFS Deployment
===

### 1. Deployment Schematic Diagram

![](./img/ontfs-flow-en.jpeg)


### 2. Parties Involved:

* ONTFS:

Service node that runs the ONTFS **storage service** and has a public network IP, provides the corresponding **command line tools**, **configuration files**, and **database**.

* ONTFS Client:

An application that is run on the ONTFS `SDK`. It can be used to carry out **file upload**, **download** and **deletion**.

* Ontology:

Ontology nodes that deploy the ONTFS **smart contract** and make the `RPC` service publicly available.


# 2. ONTFS System Internal Module Interaction
===
![](./img/internal-module-en.jpeg)


# 3. ONTFS File Operations Interaction
===
### 1. File upload process:

![](./img/fileupload-en.jpeg)

---
### 2. File download process:

![](./img/filedownload-en.jpeg)

---
### 3. Fiel deletion process:

![](./img/filedelete-en.jpeg)
