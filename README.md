# System of Smart Contracts for Recurring Payments


## Code

The following directory are available:

* `contracts/` contains the main contracts `RPSRoot`, `RPSProvider`
  and `RPSUser`.

* `debot/` contains 2 debots, one for users and one for service providers.

* `report/` contains the PDF of the submission with more details

* `tests/` contains scripts to run the contracts on TONOS-SE


## Tooling

To build the project, you will need to use `ft`, from
https://github.com/OCamlPro/freeton_wallet .

## Architecture

See the PDF file in report/ for a more detailed description.

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


