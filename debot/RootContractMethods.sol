  optional(uint256) nopubkey;

  address g_root ;
  address g_multisig ;
  uint256 g_pubkey ;

function setRoot( address root ) public {
  ACCEPT_TVM_PUBKEY();
  g_root = root ;
}

  function start() public override {
    _askMultisigAddress() ;
  }

  function init( address multisig ) public
  {
    g_multisig = multisig ;
    PRINTCC(afterInit, "Entered init");
  }

   function afterInit() public 
   {
    _onMultisigAddress();
  }

  function _askMultisigAddress() internal
  {
    ASK_ADDRESS(onMultisigAddress,
                     "Which Multisig Contract do you want to work with?");
  }

  function onMultisigAddress(address value) public {
    g_multisig = value;
    _onMultisigAddress ();
  }

  function _onMultisigAddress() internal 
  {
    PRINTFCC(onMultisigAddressCC,
             "Getting my pubkey from Multisig {}", g_multisig);
  }

  function onMultisigAddressCC() public view
  {
    IMultisig( g_multisig ).getCustodians
      MSGINT(onHasCustodians,onErrorRestart) ();
  }

  function onHasCustodians( CustodianInfo[] custodians ) public
  {
    if( custodians.length != 1 ){
      PRINT("Error: multisig has more than one custodian");
      _askMultisigAddress();
    } else {
      g_pubkey = custodians[0].pubkey;
      PRINTF("Working with pubkey: 0x{:x}", g_pubkey);
      _onHasPubkey();
    }
  }
