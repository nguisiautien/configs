https://www.ethereum.org/token
initial 
solidity
Smart contracts 
    are programs govern the behaviour of accounts within the Ethereum state

    Blockchain basics
        mining
        hashing
        elliptic-curve cryptography
        peer-to-peer networks

    Ethereum Virtual Machine

    Remix IDE deploy and run

    MISC
        code review
        testing
        audits
        correctnes proofs
    
    Security Considerations

    Ethereum Stackexchange, gitter channel

Solidity
    contract 
        code(functions) ...
        data(states) ...
    address on the Ethereum blockchain
[owning contract]
https://solidity.readthedocs.io/en/develop/introduction-to-smart-contracts.html
[publishing]
the history of the blockchain
impose access [restrictions]
identifiers (contract names, function names and variable names)
subcurrency
cryptocurrency
generate coins
created the contract
issuance scheme
send coins to each other
Ethereum [keypair]

event
light clients
[address] type 160-bit value that does not allow any arithmetic operation, addresses of contract or keypairs belonging to external persons
outside of the contract?
other contracts?
getter function
user interface 
constructor stores the address of the person creating the contract: msg (together with tx and block) is a special [global variable] that contains some properties which allow [access to the blockchain]
msg.sender is the address where the current(external)function call came from

[account that created the contract]

[send coins to an address]

[blockchain explorer]

[data storage of this particular coin contract]

[coin contract address] and not the [addresses of the coin owners]

blockchain: [globally shared, transactional database]

transaction cryptographically signed by the sender

[double-spend attack]

a globally accepted order of the transaction

order selection mechanism (mining)

reverted

miners 

submitter

schedule future calls 

alarm clock (what is oracle service?)

Ethereum Virtual Machine (EVM) runtime environment
sandboxed 

Accounts two kinds of accounts
share the same [address space]

[External accounts] controlled by [public-private key pairs]
the [address] of an external account is determined from the public key

Contract accounts controlled by the [code] stored together with the account
the [address] of a contract is determined at the time the contract is created (it
is derived from the [creator address] and [the number of transactions sent from that address],
the so called [nonce])

[stores code]

Account
1 persistent key-value store mapping [256-bit words to 256-bit words] => [storage]
2 has a [balance] in Ether(Wei, 1 ether = 10^8 wei)

Transactions

is a message that can include binary data(payload) and Ether

if [target account] contains code, that code is executed and the [payload] is provided as [input data]
who is target account

zero address
how do you know to create a new contract not external account?
an address derived from the sender and its number of transactions sent

[a contract creation transaction]

[output data] EVM bytecode

output data of this execution is the actual code of the new created contract~~~~

[Gas]
transaction is charged with gas
[to limit] [the amount of work] that is needed to [execute the transaction]  
and to [pay for this execution] at the same time
refunded

Storage, Memory and the Stack
EVM has three areas where it can store data-storage memory the stack

[storage] 
Each account has a data area called storage, which is persistent between function calls and transactions
a [key-value store]

[Memory] for each message call

[Stack] for performing all computations

[Instruction Set]

[Message Calls]
source, target, data payload, Ether, gas, return data
every transaction consists of a top-level message call which in turn can create further message calls

https://solidity.readthedocs.io/en/develop/introduction-to-smart-contracts.html
