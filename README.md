Architecture:

SP: Service Provider
RPS: Recurrent Payment System

Version 1: centralized

In this version, there are 3 contracts:

* The RPSRoot is the central spot, it contains functions to deploy
  other contracts
* The RPSProvider is the contract that manages a set of services for
  a given Service Provider. It contains a set of services that can be
  subscribed to by users, and manages these services. It also contains
  a set of wallets for different TIP-3 tokens. The service provider can
  reclaim payments from time to time.
* The RPSUser is the contract that manages all subscriptions of a given
  user.

A user can subscribe to a service for a given period, sending the
corresponding payment (for the full period) at the subscription time.
The provider of the service can only access the part of the payment
for the already started period.

A user can pause the service, starting at the next period. It can
unpause the service, either for the next period (if not yet paused),
or at the current time (if already paused for that time).

A user can stop the service, starting at the next period. In this
case, it recovers its payment for the periods that have not been
started.

Version 2: distributed

In this version, the SP contract does not directly contains the set of
subscriptions. Instead, a tree is built with all the subscriptions.
Each node in the tree (1) manages 256 subscriptions, and (2) links to
16 children nodes.

When a new subscription is added, it goes down the tree from the root
node, trying to find an empty slot. If a given node cannot manage the
subscription, it sends the subscription to one of its children nodes.

When a subscription is removed, it goes up the tree, from its managing
node to the upper node.

When the SP claims its payments, it broadcasts a message from the root
node to all children nodes.

Each node can be split into 2 contracts: one is a routing contract,
responsible for maintaining the structure of the tree and routing
messages up and down, the other one is a storing contract, responsible
for storing subscriptions.


