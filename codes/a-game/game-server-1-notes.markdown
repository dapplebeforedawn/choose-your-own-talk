# Notes:

 - The server listen loop receives data from the clients
 - Clients aways transmit the same set of data: 
    - ship config 
    - ship movement requests
    - window size
    - callback address
 - Everytime a client packet is recived:
    - The top stack item is cloned
    - The clone is updated
    - The clone is pushed on to the top of the stack

  This might seem wasteful.  Maybe it is, it's also *really smart* (I'll explain later)

