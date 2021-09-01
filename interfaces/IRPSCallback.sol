/* Interface IRPSUser */

pragma ton-solidity >= 0.32.0;

import "../libraries/RPSBase.sol";

interface IRPSCallback {
  
  function subscribeStatus( address user,
                            address provider,
                            uint64 sub_id, // either sub_pid or sub_uid
                            uint32 serv_id,
                            uint8 periods,
                            RPSBase.Status status,
                            uint64 sub_date
                            ) external ;
}
