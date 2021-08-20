/* Interface IRPSUser */

pragma ton-solidity >= 0.32.0;

import "../libraries/RPSBase.sol";

interface IRPSUser {

  function continueSubscribe( uint64 sub_id,
                              RPSBase.Service service,
                              address token_wallet ) external;
  function callbackSubscribe( uint64 sub_id,
                              RPSBase.Status) external;
}
