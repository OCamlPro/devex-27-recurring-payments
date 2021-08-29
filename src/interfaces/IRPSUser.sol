/* Interface IRPSUser */

pragma ton-solidity >= 0.32.0;

import "../libraries/RPSBase.sol";

interface IRPSUser {

  struct UserSubscription {
    uint64 sub_uid ;
    address provider ;
    uint32 serv_id ;
    uint8 periods ;
    address callback ;
    RPSBase.Service service ;
    RPSBase.Status status ;
    uint64 sub_pid ;
    uint64 sub_date ;
  }

  function continueSubscribe( uint64 sub_id,
                              RPSBase.Service service,
                              address token_wallet ) external;
  function callbackSubscribe( uint64 sub_id,
                              RPSBase.Status) external;

  function getSubscriptions() external view returns
    ( mapping ( uint64 => UserSubscription ) subscriptions ) ;

  function Subscribe( address provider,
                      uint32 serv_id,
                      uint8 periods,
                      address callback ) external ;

  function stopSubscribe( uint64 sub_uid ) external view ;
  function pauseSubscribe( uint64 sub_uid ) external view ;
  function unpauseSubscribe( uint64 sub_uid ) external view ;
      
}
