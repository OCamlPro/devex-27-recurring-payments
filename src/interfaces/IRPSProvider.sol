/* Interface IRPSProvider */

pragma ton-solidity >= 0.32.0;

import "../libraries/RPSBase.sol";

interface IRPSProvider {
  
  struct ProviderService {
    uint32 serv_id ;
    RPSBase.Service service ;
  }
  
  struct ProviderSubscription {
    uint64 sub_pid;
    uint64 sub_uid ;
    uint32 serv_id ;
    uint8 periods ;
    address user;
    RPSBase.Status status;
    uint64 sub_date;
  }

  function getServices() external view responsible
    returns ( mapping( uint32 => ProviderService ) services );

  
  function prepareSubscribe( uint64 sub_id,
                             uint32 serv_id
                             ) external view;

  function subscribe(
                     address owner,
                     uint256 pubkey,
                     uint64 sub_id,
                     uint32 serv_id,
                     uint8 periods ) external ;
  
  function stopSubscribe( uint64 sub_uid, uint64 sub_pid ) external;  
  function pauseSubscribe( uint64 sub_uid, uint64 sub_pid ) external;  
  function unpauseSubscribe( uint64 sub_uid, uint64 sub_pid ) external;  
}
