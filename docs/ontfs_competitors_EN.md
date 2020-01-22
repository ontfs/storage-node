# ONTFS Market Competition

Here we list other popular storage services and projects. We also draw comparison in terms of some of the features that they offer.

| Storage Project | Consensus Mechanism | Storage Proof Algorithm |                        Competition                         |     Nodes      |                              Volume                               |
| :-------------: | :-----------------: | :---------------------: | :--------------------------------------------------------: | :------------: | :---------------------------------------------------------------: |
|      ONTFS      |        VBFT         |  Zero-knowledge Proof   | None, Integrates VRF, Periodicaly submits proof of storage | No upper limit | No upper limit, storage volume increases as the no. of nodes grow |
|      Storj      |        None         |       Merkle tree       |                      Has competition                       |      20k       |                               30PB+                               |
|     Genero      |         POS         |          SPoR           |                      Has competition                       |      N/A       |                                N/A                                |
|       Sia       |         POW         |           PoR           |                      Has competition                       |       1k       |                               4PB+                                |
|    MaidSAFE     |  Proof of Resource  |  Zero-knowledge Proof   |                      Has competition                       |      N/A       |                                N/A                                |
|    FileCoin     |       POS+POW       |      PoST + PoRep       |                      Has competition                       |      N/A       |                                N/A                                |

# Characteristics of ONTFS

- The **Verifiable Byzantine Fault Tolerance** (VBFT) algorithm is implemented in the **consensus mechanism** used by **ONTFS**, and has the fastest on-chain transaction processing speeds.
- The storage proof uses the zero knowledge proof algorithm. A storage proof that can be generated using zero knowledge proof has not been developed, but the merkle tree can easily be used by storage nodes to replace the original data with file block hash.
- ONTFS has been designed in such a way that there is no challenger in picture. This helps deal with the possibility of challenging parties carrying out malicious actions and a situation being created due to single point failure where the challenging party cannot verify and process the storage proof data.
- ONTFS uses Ontology smart contract to verify storage proof and stores the verification results on the blockchain. All settlements take place based on this data. This ensures that the process is open, fair and transparent.
- ONTFS uses an on-chain registration mechanism. Storage services can be used after registration. The role played by all the storage nodes is essentially the same. The total storage volume of the network increases with the number of nodes in the network.