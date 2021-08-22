  address g_root ;
  
  function _askRootContractAddress() internal {
    AddressInput.get(tvm.functionId(onRootContractAddress),
                     "Which Root Contract do you want to work with?");
  }

  function onRootContractAddress(address value) public {
    Sdk.getAccountType(tvm.functionId(checkRootContractStatus), value);
    g_root = value;
  }
  
  function checkRootContractStatus(int8 acc_type) public {
    if (!Utility._checkActiveStatus(acc_type, "Contract")) {
      _askRootContractAddress ();
    } else {
      Sdk.getAccountCodeHash(tvm.functionId(checkRootContractHash), g_root);
    }
  }

  function checkRootContractHash(uint256 code_hash) public {
    // compare with the expected code_hash
    if ( code_hash != 0x%{get-code-hash:contract:tvc:RPSRoot} ) {
      _askRootContractAddress();
    } else {
      _mainMenu();
    }
  }

  function start() public override {
    _askRootContractAddress() ;
  }
