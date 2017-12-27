
Source: http://www.huuii.com/people/juan/1301

I want to use sockets under common lisp, so I am going to create a two simple functions the first one serve-socket and the second client-socket, I am going to use usocket library.

- Load the library: 

`(ql:quickload "usocket")`

- Change to usocket library

`(in-package :usocket)`

- Create the functions:

``` 
 (defun server-socket (port)
  "Listening on a port for a message, and print the received message."
  (usocket:with-socket-listener (socket "127.0.0.1" port)
    (loop
       (usocket:with-connected-socket (connection (usocket:socket-accept socket))
     (format t "~a~%" (read-line (usocket:socket-stream connection)))))))
```

```
 (defun client-socket (port message)
  "Connect to a server and send a message."
  (usocket:with-client-socket (socket stream "127.0.0.1" port)
    (format stream message)
    (force-output stream))) 
```

- Test
 
Call the function

`USOCKET> (server-socket 9090)`

with  netstat -tap linux command we see:
 
`tcp        0      0 localhost:9090          0.0.0.0:*               LISTEN      4103/sbcl `

`The server is ready! `
 

**With other sbcl instance we need to run client socket then:**
 
**Load the library:** 

`(ql:quickload "usocket")`

**Change to usocket library**

`(in-package :usocket)`

**call the function**

`USOCKET> (client-socket 9090 "Hello world !")`
 

**The server has :**

```
USOCKET> (server-socket 9090)
Hello world !
```
