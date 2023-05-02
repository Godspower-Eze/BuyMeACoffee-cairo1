#[abi]
trait IBuyMeACoffee {

    #[view]
    fn get_balance() -> u128;

    #[external]
    fn contribute(amount: u128, name: felt252, message: felt252);

    #[external]
    fn withdraw();
}

#[contract]
mod BuyMeACoffee {

    use starknet::ContractAddress;
    use starknet::StorageAccess;

    // #[derive(Drop, Copy)]
    struct Memo {
        contract_address: ContractAddress,
        name: felt252,
        message: felt252,
        amount: u128,
        timestamp: u128
    }

    struct Storage {
        contribution_count: u128,
        owner_balance: u128,
        contributions: LegacyMap::<u128, Memo>
    }

    #[view]
    fn get_balance() -> u128 {
        owner_balance::read()
    }
}
