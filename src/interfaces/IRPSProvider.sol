/* Interface IRPSProvider */

pragma ton-solidity >= 0.32.0;

interface IRPSProvider {

  function prepareSubscribe( uint64 sub_id,
                             uint32 serv_id
                             ) external;

  function subscribe(
                     address owner,
                     uint256 pubkey,
                     uint64 sub_id,
                     uint32 serv_id,
                     uint8 periods ) external ;
  function stopSubscribe( uint64 sub_uid, uint64 sub_pid ) external;  
}
