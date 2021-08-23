
#define MSGINT(okCallback, errorCallback) \
        { \
          abiVer: 2, \
          extMsg: true, \
          sign: false, \
          pubkey: nopubkey, \
          time: uint64(now), \
          expire: 0, \
          callbackId: tvm.functionId(okCallback), \
          onErrorId: tvm.functionId(errorCallback), \
          } 

#define MSGEXT(pkey,okCallback, errorCallback)  \
        { \
          abiVer: 2, \
          extMsg: true, \
          sign: true, \
          pubkey: pkey, \
          time: uint64(now), \
          expire: 0, \
          callbackId: tvm.functionId(okCallback), \
          onErrorId: tvm.functionId(errorCallback), \
          } 

#define FWD_GAS { value: 0, flag: 64, bounce: true }
#define SEND_ALL_GAS(dest) dest.transfer(0 , false, 64 );
#define MSG_GAS(v) { value: v, flag: 0, bounce: true}

#define PRINTF(fmt,v) Terminal.print(0, format(fmt,v))
#define PRINT(s) Terminal.print(0, s)

#define _F(f) tvm.functionId(f)
#define F_(f) tvm.functionId(f)

#define CODEHASH(cc) 0x%{get-code-hash:contract:tvc:cc}

