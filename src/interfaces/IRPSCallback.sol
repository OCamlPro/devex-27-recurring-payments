/* Interface IRPSUser */

pragma ton-solidity >= 0.32.0;

import "../libraries/RPSBase.sol";

interface IRPSCallback {
  
  function subscribeStatus( address user,
                            address provider,
                            uint32 service,
                            uint8 periods,
                            RPSBase.Status status
                            ) external ;
}
