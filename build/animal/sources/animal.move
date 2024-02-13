// A simple practice to create a module with constructor and structure 
module animal::animal{
    use sui::object::{Self,UID};
    use sui::tx_context::{Self,TxContext};
    use std::string::{Self,String};
    use sui::transfer;

    struct AnimeObject has key,store {
        id: UID,
        name: String,
        no_of_leg:u8,
        favorite_food: String
    }

    fun new(name1: vector<u8>,no_of_legs:u8,favorite_foods: vector<u8>,ctx: &mut TxContext): AnimeObject {
        AnimeObject{
            id:object::new(ctx),
            name: string::utf8(name1),
            no_of_leg: no_of_legs,
            favorite_food: string::utf8(favorite_foods)
        }
    }

    public entry fun create(red: vector<u8>, green: u8, blue: vector<u8>, ctx: &mut TxContext){
			let color = new(red, green, blue, ctx);
			transfer::public_transfer(color, tx_context::sender(ctx))
		}
}

