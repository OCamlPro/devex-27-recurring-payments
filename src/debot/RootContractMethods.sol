  optional(uint256) nopubkey;

  address g_root ;
  address g_multisig ;
  uint256 g_pubkey ;

  function start() public override {
    _askRootContractAddress() ;
  }

  function init( address root, address multisig ) public
  {
    g_root = root ;
    g_multisig = multisig ;
    _onMultisigAddress();
  }

  function _askRootContractAddress() internal {
    AddressInput.get(F_(onRootContractAddress),
                     "Which Root Contract do you want to work with?");
  }

  function onRootContractAddress(address value) public {
    g_root = value;
    _askMultisigAddress();
  }

  function _askMultisigAddress() internal
  {
    AddressInput.get(F_(onMultisigAddress),
                     "Which Multisig Contract do you want to work with?");
  }

  function onMultisigAddress(address value) public {
    g_multisig = value;
    _onMultisigAddress ();
  }

  function _onMultisigAddress() internal
  {
    _checkRootContractStatus();
  }

  function _checkRootContractStatus() internal {
    PRINT("Getting Root contract status");
    Sdk.getAccountType(F_( checkRootContractStatus ), g_root);
  }

  function checkRootContractStatus(int8 acc_type) public {
    PRINTF("Root contract status: {}", acc_type);
    if (!Utility._checkActiveStatus(acc_type, "Contract")) {
      PRINT("Error: root contract is not ready");
      _askRootContractAddress ();
    } else {
      PRINT("Getting Root contract code hash");
      Sdk.getAccountCodeHash( F_(checkRootContractHash), g_root);
    }
  }

  function checkRootContractHash(uint256 code_hash) public {
    // compare with the expected code_hash
    PRINTF("Root contract code_hash: {:x}", code_hash);
    uint256 reference_hash = CODEHASH(RPSRoot);
    PRINTF("     expected code_hash: {:x}", reference_hash);
    if ( code_hash != reference_hash ) {
      PRINT("Error: invalid Root contract code_hash");
      _askRootContractAddress();
    } else {
      PRINT("Root contract code_hash confirmed");
      _onHasRootContract();
    }
  }

  function _onHasRootContract() internal
  {
    PRINTF("Getting my pubkey from Multisig {}", g_multisig);
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
