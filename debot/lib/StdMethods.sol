  bytes m_icon;

  //
  // Standard functions
  //
  
  function onCodeUpgrade() internal override {
    tvm.resetStorage();
  }
  
  function setIcon(bytes icon) public {
    require(msg.pubkey() == tvm.pubkey(), 100);
      tvm.accept();
      m_icon = icon;
  }
  
  /// @notice Returns Metadata about DeBot.
  function getDebotInfo() public functionID(0xDEB)
    override view
    returns(
            string name, string version, string publisher, string caption,
            string author, address support, string hello, string language,
            string dabi, bytes icon
            ) {
    name = debot_name;
    version = format("{}.{}.{}",
                     debot_version_major,
                     debot_version_minor,
                     debot_version_fix);
    publisher = debot_publisher ;
    caption = debot_caption ;
    author = debot_author ;
    support = address.makeAddrStd(0, debot_support);
    hello = debot_hello ;
    language = debot_language ;
    dabi = m_debotAbi.get();
    icon = m_icon;
  }
  
  function getRequiredInterfaces() public view override
    returns (uint256[] interfaces) {
    return [
            Terminal.ID,
            AmountInput.ID,
            ConfirmInput.ID,
              AddressInput.ID,
            Menu.ID ];
  }

  function onErrorRestart(uint32 sdkError, uint32 exitCode) public {
    Terminal.print(0, format("Error: sdkError:{} exitCode:{}", sdkError, exitCode));
    start();
  }
