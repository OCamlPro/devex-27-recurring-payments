
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

#define PRINTF(fmt...) Terminal.print(0, format(fmt))
#define PRINT(s) Terminal.print(0, s)

#define _F(f) tvm.functionId(f)
#define F_(f) tvm.functionId(f)

#define CODEHASH(cc) 0x%{get-code-hash:contract:tvc:cc}

#define DEBOT_NAME(name,publisher,caption,author) \
  string constant debot_name = name ; \
  string constant debot_publisher = publisher ; \
  string constant debot_caption = caption ; \
  string constant debot_author = author ; \
  string constant debot_language = "en" 

#define DEBOT_VERSION(major, minor, fix) \
  uint8 constant debot_version_major = major ; \
  uint8 constant debot_version_minor = minor ; \
  uint8 constant debot_version_fix = fix 

#define DEBOT_SUPPORT(addr) \
  uint256 constant debot_support = addr 

#define DEBOT_HELLO(s) \
  string constant debot_hello = s

#define MAP_ITER(map, key, key_type, value, value_type, code)    \
  optional (key_type, value_type) map##_iter = map.min() ;       \
  while( map##_iter.hasValue() ){                                \
    ( key_type key, value_type value ) = map##_iter.get() ;      \
    code                                                         \
    map##_iter = map.next( key );                                \
  } map##_iter

#define QUERY_HEXA_FUNCTION(f,text,pubkey,code)                 \
  function f() internal                                         \
  {                                                             \
    Terminal.input( tvm.functionId(f##Callback), text, false ); \
  }                                                             \
                                                                \
  function f##Callback( string s ) public                       \
  {                                                             \
    if( s.length < 2 || s[0] != '0' || s[1] != 'x' )            \
      s = "0x" + s;                                             \
    (uint256 pubkey, bool res) = stoi(s);                       \
    if( !res ){                                                 \
      PRINT("Invalid format for entry");                        \
      f();                                                      \
      return;                                                   \
    }                                                           \
    code                                                        \
  }

#define QUERY_UINT256_FUNCTION(f,text,pubkey,code)              \
  function f() internal                                         \
  {                                                             \
    Terminal.input( tvm.functionId(f##Callback), text, false ); \
  }                                                             \
                                                                \
  function f##Callback( string s ) public                       \
  {                                                             \
    (uint256 pubkey, bool res) = stoi(s);                       \
    if( !res ){                                                 \
      PRINT("Invalid format for number");                       \
      f();                                                      \
      return;                                                   \
    }                                                           \
    code                                                        \
  }

#define QUERY_STRING_FUNCTION(f,text,s,code)                    \
  function f() internal                                         \
  {                                                             \
    Terminal.input( tvm.functionId(f##Callback), text, false ); \
  }                                                             \
                                                                \
  function f##Callback( string s ) public                       \
  {                                                             \
    code                                                        \
  }

/*
  Menus:
   MENU(
     MENU_ITEM("description1", callback1);
     MENU_ITEM("description2", callback2);
     );
 */

#define MENU(code) \
  MenuItem[] items ; \
  code \
  Menu.select("What is your choice?", "", items)

#define MENU_ITEM(text, f) \
  items.push( MenuItem(text, "", tvm.functionId(f)) )

