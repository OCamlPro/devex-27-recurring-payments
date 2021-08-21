pragma ton-solidity >= 0.32.0;

library RPSBase {

  uint64 constant EXN_AUTH_FAILED = 100 ;
  uint128 constant DEPLOY_EMPTY_WALLET_COST = 0.1 ton;


  enum Status {
               Pending,
               Subscribed,
               Stopped,
               ErrorNoSuchService,
               ErrorNotEnoughBalance,
               ErrorServiceNotReady,
               ErrorSubscriptionFinished
  }

  struct Service {
    string name ;
    string description ;
    uint64 period ; // in seconds
    address token_root ;
    // uint128 subscription_cost ;
    uint128 period_cost ;
    // uint8 max_periods ;
  }

}

