/* Interface IRPSRoot */

pragma ton-solidity >= 0.32.0;

interface IRPSRoot {
  //   constructor( ) 
  function creditBalance( uint256 pubkey ) external ;
  function getBalance( uint256 pubkey ) external view  returns ( uint128 );
  function deployProvider() external returns ( address addr );
  function getProviderCode() external view returns ( TvmCell );
  function getUserCode() external view returns ( TvmCell );
  function deployUser() external returns ( address addr );
}
