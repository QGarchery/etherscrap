# etherscrap

Scrap contract files from Etherscan.

## Usage

Run `<path-to-script>/scrap.sh <address>` (you should have execution rights), where:
- `<path-to-script>` is the path to the `scrap.sh` script
- `<address>` is the address of the contract you want to scrap.

Be wary that this command will create new directories where you call it, placing the contracts inside them.

Notice also that if your contract is a proxy contract, you should probably pass the address of the implementation.
