EN | [中文](README.md)

# Ontology File Service (ONTFS)

### Introduction

ONTFS is a distributed storage infrastructure based on the Ontology blockchain platform. It focuses on solving issues such as high volume data storage, data security and privacy, and controlled distribution and sharing. It provides a set of data access solutions that are low-cost, safe and reliable, rapidly deployable, and controllable to a great degree. This grants user complete control over their data and its sharing.

### Features

- A user employs the storage services by depositing `ONG` in the smart contract. Each node periodically submits a proof of data integrity, and obtains compensation from the contract by deducting small amounts of `ONG` from the deposit each time a file is downloaded.
- Validation nodes periodically submit the proof of storage to the smart contracts and it is recorded on the blockchain. **This helps prevent single point of failure and malicious actions on the part of the party that challenges the validation model.**
- All fee settlements take place on the chain to ensure **transparency, fairness and openness.**

### Characteristics

#### Security Measures:

1. Storage nodes employ `Merkle-DAG` block-based storage to safeguard **data integrity** and make it **tamper-proof**.
2. The **consensus mechanism** and the **verifiable random function** ensure that the **data is not tampered with during storage**.
3. Nodes periodically submit **proof of storage**, all of which **recorded on-chain** after verification. These can be **accessed** and **audited** at any point of time.
4. A **customizable data cloning system** allows for making **multiple back-ups** of data in order to **avoid data loss** due to single point of failure.
5. **Auditable data upload and download records** to facilitate **data confirmation**.

#### Rapid, Low-cost Deployment:

1. Easy configuration, rapid deployment, unrestricted scalability.
2. Low deployment and operation cost, no hardware required.

#### Decentralized Network:

1. The core operates on a `P2P` communication network and allow for files to be uploaded to or downloaded from multiple points at the same time via block transmission, which makes efficient use of bandwidth.
2. Break point continuity for download and upload process.
3. Helps avoid single-point failure, thus making the system more realiable and attack resistant.

#### Protection of Data Privacy:

1. Data is encrypted using a cryptographic module that can be toggled. **Only the data owner has the necessary authority to decrypt it**.
2. Data is stored **divided across blocks**. This prevents storage parties from having access to full data.
3. **Zero-knowledge proof algorithm** helps ensure that no malicious action takes place during the storage process.

#### Cross-platform Development Suite:

1. Client side application development is facilitated by providing a cross-platform client SDK.
2. Storage service provider application development is facilitated by providing a storage server SDK.