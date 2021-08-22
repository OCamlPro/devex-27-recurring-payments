pragma ton-solidity >= 0.32.0;

library RPSBase {

  uint8 constant EXN_AUTH_FAILED = 100 ;
  uint8 constant EXN_NOT_ENOUGH_GAS = 101 ;
  uint8 constant EXN_NOT_INITIALIZED = 102 ;
  

  enum Status {
               Pending,
               Subscribed,
               Paused,
               Stopped,
               Unpaused,
               ErrorNoSuchService,
               ErrorNotEnoughBalance,
               ErrorServiceNotReady,
               ErrorSubscriptionFinished,
               ErrorNotPaused,
               ErrorAlreadyPaused
  }

  struct Service {
    string name ;
    string description ;
    uint64 period ; // in seconds
    address token_root ;
    uint128 period_cost ;
    // uint128 subscription_cost ;
    // uint8 max_periods ;
  }

}

