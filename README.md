# OurToken

OurToken is an ERC20 token implemented using OpenZeppelin's ERC20 contract. This token is designed to be a simple and secure implementation of the ERC20 standard.

## Features

- **ERC20 Standard**: Implements the ERC20 standard for fungible tokens.
- **Initial Supply**: The initial supply of tokens is minted to the deployer's address upon contract deployment.
- **OpenZeppelin**: Utilizes OpenZeppelin's secure and well-tested ERC20 implementation.

## Contract Details

- **Token Name**: OurToken
- **Token Symbol**: OT
- **Solidity Version**: 0.8.28

## Installation

To get started, clone the repository using

```sh
git clone https://github.com/osangayusuf/OurToken.git
```

To install the necessary dependencies, run:

```sh
make install
```

## Deployment

To deploy the contract, use the DeployOurToken script. Ensure you have the required tools and environment set up for deployment.

## Usage

### Minting

The initial supply of tokens is minted to the deployer's address upon deployment. No additional minting functionality is provided.

### Transfers

Tokens can be transferred between addresses using the standard ERC20 transfer and transferFrom functions.

### Allowances

Allowances can be set using the approve function, allowing a spender to transfer tokens on behalf of the token owner.

### Testing

Unit tests are provided to ensure the functionality of the token contract. The tests cover:

- Initial supply
- Minting restrictions
- Allowances
- Transfers
- TransferFrom functionality
- Edge cases for transfers and allowances
  To run the tests, use the following command:

```sh
forge test
```

## Environment Configuration
To ensure full functionality, create a .env file in the root directory of your project with the following content:

```bash
SEPOLIA_RPC_URL=<your_sepolia_rpc_url>
ZKSYNC_SEPOLIA_RPC_URL=<your_zksync_sepolia_rpc_url>
ACCOUNT=<your_account_address>
SENDER=<your_sender_address>
ETHERSCAN_API_KEY=<your_etherscan_api_key>
PRIVATE_KEY=<your_private_key>
```

Replace the placeholders with your actual values. This configuration is necessary for deploying and verifying the contract on different networks.

## Makefile Commands
The Makefile includes various commands to manage the project:

* `make all`: Clean, remove modules, install dependencies, update, and build the project.
* `make clean`: Clean the project.
* `make remove`: Remove git submodules.
* `make install`: Install dependencies.
* `make update`: Update dependencies.
* `make build`: Build the project.
* `make test`: Run tests.
* `make test-zk`: Run zkSync tests.
* `make snapshot`: Create a snapshot.
* `make format`: Format the code.
* `make anvil`: Start an Anvil instance.
* `make deploy`: Deploy the contract locally.
* `make deploy-sepolia`: Deploy the contract to Sepolia.
* `make deploy-zk`: Deploy the contract to zkSync locally.
* `make deploy-zk-sepolia`: Deploy the contract to zkSync Sepolia.
* `make verify`: Verify the contract on Etherscan.

## License
This project is licensed under the MIT License.
