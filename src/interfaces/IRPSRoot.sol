/* Interface IRPSRoot */

pragma ton-solidity >= 0.32.0;

interface IRPSRoot {
  //   constructor( ) 
  function creditBalance( uint256 pubkey ) external ;
  function getBalance( uint256 pubkey ) external view  returns ( uint128 );
  
  function deployProvider() external returns ( address addr );
  function getProviderCode() external view returns ( TvmCell );
  function getProviderAddress( uint256 pubkey, address owner ) external view
    returns ( address );

  function deployUser() external returns ( address addr );
  function getUserCode() external view returns ( TvmCell );
  function getUserAddress( uint256 pubkey, address owner ) external view
    returns ( address );
  
}
