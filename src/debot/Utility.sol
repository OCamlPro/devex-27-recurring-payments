
import "lib/Terminal.sol";

abstract contract Utility {

  function tonsToStr(uint128 nanotons) internal pure returns (string) {
    (uint64 dec, uint64 float) = _tokens(nanotons);
    string floatStr = format("{}", float);
    while (floatStr.byteLength() < 9) {
      floatStr = "0" + floatStr;
    }
    return format("{}.{}", dec, floatStr);
  }

  function _tokens(uint128 nanotokens) internal pure
    returns (uint64, uint64) {
    uint64 decimal = uint64(nanotokens / 1e9);
    uint64 float = uint64(nanotokens - (decimal * 1e9));
    return (decimal, float);
  }
  
  function _checkActiveStatus(int8 acc_type, string obj)
    internal returns (bool) {
    if (acc_type == -1)  {
      Terminal.print(0, obj + " is inactive");
      return false;
    }
    if (acc_type == 0) {
      Terminal.print(0, obj + " is uninitialized");
      return false;
    }
    if (acc_type == 2) {
      Terminal.print(0, obj + " is frozen");
      return false;
    }
    return true;
  }

}


// A copy of structure from multisig contract
struct Transaction {
    // Transaction Id.
    uint64 id;
    // Transaction confirmations from custodians.
    uint32 confirmationsMask;
    // Number of required confirmations.
    uint8 signsRequired;
    // Number of confirmations already received.
    uint8 signsReceived;
    // Public key of custodian queued transaction.
    uint256 creator;
    // Index of custodian.
    uint8 index;
    // Destination address of gram transfer.
    address  dest;
    // Amount of nanograms to transfer.
    uint128 value;
    // Flags for sending internal message (see SENDRAWMSG in TVM spec).
    uint16 sendFlags;
    // Payload used as body of outbound internal message.
    TvmCell payload;
    // Bounce flag for header of outbound internal message.
    bool bounce;
}


struct CustodianInfo {
    uint8 index;
    uint256 pubkey;
}

interface IMultisig {
    function submitTransaction(
        address  dest,
        uint128 value,
        bool bounce,
        bool allBalance,
        TvmCell payload)
    external returns (uint64 transId);

    function sendTransaction(address dest, uint128 value,
                             bool bounce, uint8 flags, TvmCell payload  )
      external;

    function confirmTransaction(uint64 transactionId) external;

    function getCustodians() external returns (CustodianInfo[] custodians);
    function getTransactions() external returns (Transaction[] transactions);
}
