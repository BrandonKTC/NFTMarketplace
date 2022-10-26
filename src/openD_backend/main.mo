import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import Cycles "mo:base/ExperimentalCycles";
import NFTActorClass "../nft/nft";

actor OpenD {
    public shared (msg) func mint(imgData : [Nat8], name : Text) : async Principal {
        let owner : Principal = msg.caller;

        Debug.print(debug_show (Cycles.balance()));
        Cycles.add(200_000_000_000); // when deploy to ensure creation of NFT
        Debug.print(debug_show (Cycles.balance()));
        let newNFT = await NFTActorClass.NFT(name, owner, imgData);

        let newNFTPrincipal = await newNFT.getCanisterId();
        return newNFTPrincipal;
    };
};
