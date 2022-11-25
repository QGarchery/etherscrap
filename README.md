# etherscrap

Scrap contract files from Etherscan.

## Usage

Run `./scrap.sh <address>`

where `<address>` is the address of the contract you want to scrap.

Be wary that this command will create new directories where you call it, placing the contracts inside them.

Notice also that if your contract is a proxy contract, you should probably pass the address of the implementation.
