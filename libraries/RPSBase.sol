pragma ton-solidity >= 0.32.0;

library RPSBase {

  uint8 constant EXN_AUTH_FAILED = 100 ;
  uint8 constant EXN_NOT_ENOUGH_GAS = 101 ;
  uint8 constant EXN_NOT_INITIALIZED = 102 ;
  uint8 constant EXN_ALREADY_INITIALIZED = 103 ;
  uint8 constant EXN_INVALID_CODEHASH = 104 ;
  

  enum Status {
               Pending,
               Subscribed,
               Paused,
               // the following status are only sent to callbacks, they cannot
               // be the current state 
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

