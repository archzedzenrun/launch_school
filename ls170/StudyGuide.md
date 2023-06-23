# The Internet

The **internet** is a vast network of networks. In between these networks are network devices which direct the flow of network traffic. Protocols are used in order for this system of data transmission to function.

A **network** is when two devices are connected in a way that enables them to communicate or transmit data with each other.

A **local area network (LAN)** is when multiple devices in one location are connected to a central hub or switch such as a router.

A **router** is a network device that routes traffic from one network to another. Routers act as a gateway to give a LAN access to the broader network of networks known as the internet.

## **Protocols**

**Protocols** are a system of rules that oversee the transmission of data and address different aspects of communication. They allow different kinds of devices running different kinds of software to communicate with each other.

Two reasons there are so many protocols: Different aspects of network communication require different sets of rules, and different use-cases for those different aspects.

## **Layers**

The overall system of communication can be broken down into layers.

The OSI model breaks down layers into the functions each layer performs and the TCP/IP model breaks down layers based on the scope of commincation of each layer.

**Encapsulation** is when the internal representation of an object is hidden.

**Protocol Data Unit (PDU)** is a chunk of data that consists of a header and a data payload (sometimes a trailer/footer depending on the protocol). The header/trailer contains metadata associated with the protocol used at that particular layer.

When data is passed through each layer, the entire PDU of that layer is encapsulated within the data payload of the layer below.

The benefit of this system is that it creates separation between protocols at different layers, allowing them to work together but at the same time not be concerned with what other layers are doing.

## **Data moving through layers**

After the **application layer** comes the **transport layer** where the PDU (*Segment* if TCP, *Datagram* if UDP) encapsulates data from the application layer as the data payload and information such as the source and destination port as the header.

The PDU from the transport layer is now sent to the **network layer** where it is further encapsulated as the data payload, with additional headers being added containing information such as the source and destination IP address. This makes up the PDU of the network layer which is a *packet*.

The packet from the network layer is now sent to the **data link layer**, with additonal headers being added containing information such as the source and destination MAC address. This makes up the PDU (Ethernet *frame*) of the data link layer.

The frame is then converted into binary data at the **physical layer** where it travels across the physical medium (cables, fiber optic lines, radio waves) as bits. When the data finally reaches its destination, it moves through the layers from bottom to top (reverse order).

## **Characteristics of the Physical Network**

**Latency** is a measure of how long it takes for data to get from one point to another in a network. Total latency between two points is calculated by the sum of all different types of delays that happen throughout a connection.

**Bandwidth** is the amount of data that can be sent in a certain amount of time (usually 1 second). Bandwidth is determined by the amount of data at the lowest point in the overall connection. A bandwidth bottleneck is a point in the connection where more data is being sent than the available bandwidth allows. Low bandwidth can be an issue when dealing with large amounts of data.

## **MAC Addresses / IP Addresses**

**MAC addresses** are assigned to each networked physical device. A switch (router) has a table containing the MAC addresses of all devices on the network and directs incoming data to the device whose MAC address matches the MAC address in the ethernet frame.

The internet protocol at the network layer determines where data needs to be routed to based on the source and destination IP addresses in the PDU (packet). Unlike MAC addresses, **IP addresses** are not tied to specific devices, but are assigned to devices when they join a network. An IP address acts as a label for a device or server. In the overall network of the internet, each subnetwork has a range of available IP addresses. Sub-netting is when a network is split into smaller parts (subnets). All routers have a routing table which lets them know where to direct data.

IPv4 addresses are 32 bits in length, divided into 4 sections of eight bits each. Each section has a range of numbers 0 through 255.

IPv6 addresses are 128 bits in length, divided into 8 sections of 16 bits each. Each section has a range of numbers 0 through 255.

## **Multiplexing / Sockets / Ports**

A **port** identifies a specific process or application that a host (device) is running.

A combination of IP address and port number is known as a **socket** and is an end-point of communication.

A UNIX socket is a mechanism that allows communication between applications running on the same machine.

Internet sockets such as a TCP/IP sockets are a mechanism that allows communication between networked applications that are usually on different machines.

Sockets can be implemented as socket objects which can create connections between applications.

IP addresses are assigned to a device on a network and ports identify specific applications/processes on those devices. Demultiplexing allows a single channel to direct multiple signals to these different applications. Source and destination ports are part of the PDU at the transport layer.

**multiplexing** is when multiple signals are sent over a single channel. **demultiplexing** is when multiple signals are received over a single channel.

## **DNS**

**Domain Name System (DNS)** is the pairing of domain names with an associated IP address.

A DNS server holds DNS databases which contain domain names and their associated IP address. These databases can be spread out among many different DNS servers.

When you type in a website name, the browser sends HTTP request to the DNS server (unless the IP address is already cached). The DNS server then finds the IP address associated with that domain name and sends a response back to the browser which is then displayed as a web page.

# TCP & UDP

The typically used protocols that provide functionality for the lower layers in our layered system are inherently unreliable. This means that if data is corrupt, it is discarded.

## **Transmission Control Protocol (TCP)**

TCP provides reliable data transfer by being able to recover lost or damaged data. TCP's PDU (Segments) also provide data encapsulation and multiplexing.

## **TCP Advantages**

Certain fields in the header of segments improve reliability such as *checksum* which provides error detection by checking if a generated value on the receiving end is the same as the value on the sender end.

*Sequence number* and *Acknowledgement number* also improve reliability by means of providing in-order data delivery, and handling data loss or duplication.

TCP is a connection-oriented protocol meaning it doesn't start sending data until a connection between applications has been established. TCP establishes this connection with a Three-way Handshake.

**Three-way Handshake** process:

* Sender sends a segment with SYN flag to the receiver.
* Receiver responds by sending a segment with SYN ACK flags back to the sender.
* Sender then sends a segment with ACK flag back to the receiver.

The sender can start sending data as soon as the final ACK segment is sent but the receiver must wait until it receives that ACK segment before it can start sending data back.

**Flow Control** is a mechanism that prevents the sender from overwhelming the receiver by sending too much data at once. This extra data is stored in a buffer which can vary in size based on allocated memory.

A *window field* in the TCP header can let the other side know how much data it is willing to accept, this amount is dynamic meaning it can change during the connection. If the receiver's buffer is getting full, it can set a lower amount  to let the sender know to send less data.

**Congestion Avoidance** prevents the sender or receiver from overwhelming the network. Since TCP re-sends lost data, it can use data loss as a mechanism to avoid network congestion by reducing the size of the transmission window.

## **TCP Disadvantages**

The Three-way Handshake occurs every time a TCP connection is made, which impacts performance by increasing latency.

*Head-of-Line (HOL) blocking* occurs when one message in a sequence of messages can delay the messages that follow. Since TCP provides in-order delivery of data, if one piece of data needs to be re-transimitted, this can slow down the transmission of subsequent data.

## **User Datagram Protocol (UDP)**

UDP is a conectionless protocol meaning no connectin needs to be established in order to start sending data. The PDU of UDP is a datagram. It encapsulates the PDU from the layer above into its payload and adds header information which contains source and destination ports, length in bits of the datagram, and an (optional) checksum.

## **UDP Advantages**

UDP sacrifices reliability for simplicity which provides speed and flexibility.

UDP is a conectionless protocol meaning no connection has to be established before transmitting data which reduces overall latency.

Since UDP doesnt provide in-order data delivery, there is no issue with Head-of-line Blocking at the transport layer.

## **UDP Disadvantages**

UDP is unreliable because it does not provide any means of re-transmitting lost data.

UDP doesnt provide ways of preventing a network from being overwhelmed.

## **TCP / UDP Similarities & Differences**

**Similarities**
* Provides a checksum in the PDU header to provide error detection.
* Both provide multiplexing.

**Differences**
* UDP wont retransmit lost data or provide reliability features like guaranteed message delivery/order.
* UDP doesnt provide means of flow control or congestion avoidance.

# URLs

A URL is the address of a website.

## **URL Components**

http://www.example.com:88/home?item=book

* **http (the scheme)** tells the web client how to access the resource (which protocol should be used).
* **www.example.com (the host)** tells the web client where the resource is located.
* **:88 (the port)** port number specified if you want to use something other than the default.
* **/home (the path)** optional part of the URL that shows what resource is being requested.
* **?item=book (the query string)** made up of *query parameters* and used to send data to the server, also optional.

## **Query Strings**

Used to pass additional data to server when making HTTP requests.

http://www.example.com?search=ruby&results=10

* **?** reserved character, marks the start of the query string.
* **search=ruby** parameter name/value pair.
* **&** reserved character, used when adding more parameters to the query string.
* **results=10** parameter name/value pair.

## **URL Encoding**

URLs can only use certain characters in the 128 character ASCII set. If certain reserved or unsafe characters want to be used in a URL, they have to be encoded to represent the UTF-8 equivalent character by using the % symbol followed by two hexadecimal digits.

For example, a space is represented by UTF-8 code: %20

# Hypertext Transfer Protocol (HTTP) and the Request/Response Cycle

Web communication primarily happens through the use of HTTP which functions as a link between applications and the transfer of hypertext documents (HTML). Web browsers issue HTTP requests and process the response into what appears on your screen. Web browser will also issue additional requests if the HTML in the initial request references other resources.

The **HTTP response cycle** is where a client makes a request to a server and waits for the server to send a response. A server's job is to handle inbound requests and issue responses back.

There are 3 main pieces of the server-side infrastructure:

* **Web server** that responds to requests for static assets like files and images.
* **Application server** handles application logic and more complicated requests.
* **Data Store** is like a database that works with the application server to retrieve or create data. Data stores are persistant meaning the data doesnt go away after each cycle, it persists through the stateless request/response cycles.

The raw data that the server responds with is contained in the **HTTP/message body**.

**Components of making an HTTP request**

Required components:
* Method and path, form what is called the request-line/start-line.
* The version is also included in the request-line as of HTTP 1.0.
* The host is required since HTTP 1.1

Parameters, other headers, and message body are optional components.

**Components of an HTTP response**

Status line with a status code is a required component. Headers and message body are optional components.

**HTTP request methods** tell the server what action to perform on a resource. GET and POST are two common methods.

**GET** requests are used to retrieve information. Most links send GET requests to a server.

**POST** requests are when you want to send data to a server. This protects sensitive information and is typically done when submitting forms or sending large amounts of data, as opposed to exposing that information in the URL during a GET request.

When sending POST requests, the data is sent to the server through the HTTP body.

**HTTP Headers** let the client and server send additional information during the request/response cycle.

**Response Headers** are sent back by the server and contain information about the requested resource.

Common response headers:
* Content-Encoding - Describes the encoding type used on the data.
* Server - The server name.
* Location - Specifies a new resource location.
* Content-Type - Describes the type of data being sent back.

**Status Codes**

When the server receives a request, it sends an *HTTP Status Code* as part of the response. This is a three digit number representing the status of the request.

Common response status codes:
* 200 - OK - Means the request was successful.
* 302 - Found - Requested resource has changed, typically results in a redirect to another URL specified in the *Location* response header.
* 404 - Not found - Requested resource couldn't be found.
* 500 - Internal Server Error - Some kind of server error occurred.

## **State**

HTTP is a **stateless** protocol meaning that each response cycle is independent of the previous one. The server doesnt hold on to any kind of "state" between requests which means the system doesnt have to do any kind of cleanup. Its up to web developers to use techniques that make web applications appear "stateful".

**Sessions**

A **session identifier** is when a client appends a token to a request to the server. This token allows the server to identify the client.

This simulates a stateful experience by retrieving the session data based on the session id (token) and then recreating the state of the application.

This takes a lot of work from the server. The server must check every request for the session identifier, and to check if its valid. Servers also need to handle dealing with expired sessions and how session data is stored. They also need to retrieve data based on the session id and recreate the state of the application and send it back to the client.

Session data is generated and stored on the server side.

**Cookies**

HTTP cookies or just cookies are small session identifier  files stored in the web browser and contain session information. It is sent from the server (by the set-cookie response header) and stored in the client during a request/response. The session data is stored on the server and compared with the client's cookie so that it remembers the state of the application. The cookie is sent to the server every time a request is made and is used to identify the client.

**Asynchronous JavaScript (AJAX)**

AJAX allows browsers to issue requests and process the responses without refreshing the page. The responses are processed by a callback function.

A callback is a piece of logic that is passed to a function that is executed after a certain event takes place (pressing a key for example).

# Security

HTTP sends request/responses as strings, this makes it possible that information like the session id could be used by someone else to pose as your client. This is called **session hijacking**.

Some ways that this can be prevented:
* Resetting sessions. Authentication systems make old session ids invalid and create a new one when a successful login happens.
* Session expiration time. Limits the amount of time of a potential attack.
* Use HTTPS to minimize the chance of the session id falling into an attackers hands.

**Cross-Site Scripting (XSS)** is when a user inputs HTML or Javascript which could then be injected into the page contents and be executed by the browser. For example an attacker could JS to get the session id of any site visitor.

Some ways this can be prevented:
* Not allowing certain inputs such as HTML/JS.
* *Escaping* user input data which means replacing certain HTML characters with a combination of ASCII characters which will stop the characters from being read as HTML.

**Secure HTTP (HTTPS)** encrypts every request/response before it is transported on the network as a security measure. Messages are sent through a cryptographic protocol called TLS for encryption which exchanges security keys with the remote server before data encryption happens.

**Same-origin policy** allows unrestricted interaction between resources that originated from the same location (combination of scheme host and port). Certain interactions of resources origination from different locations are restricted (linking, redirects, form submissions are typically allowed).

# Transport Layer Security (TLS) Protocol

TLS assumes TCP is being used at the Transport Layer.

Encryption, authentication, and integrity are the three main services TLS provides.

## **Encryption**

Encryption encodes a message so that it can be read only by those authorized to decode them.

Symmetric key encryption is when both parties share the same encryption key. The problem is how to give both parties access to that same key.

Asymmetric key encryption uses a public and private *pair* of keys. In this system the pair of keys are different, with the public key being used to encrypt and the private key being used to decrypt. Messages encrypted with the public key can only be decrypted by the paired private key. This type of encryption is intended to only work one-way.

TLS encryption uses a combination of Symmetric Key Encryption and Asymmetric Key Encryption. Encryption of the initial key exchange is performed asymmetrically, and subsequent communications are symmetrically encrypted.

The **TLS Handshake** is the way in which TLS sets up an encrypted connection and takes place after the TCP Handshake. The request and the response need to both be encrypted and is accomplished through a combination of symmetric and asymmetric encryption. The initial symmetric key exchange happens using asymmetric key encryption.

* The TLS Handshake begins with a *ClientHello* message sent right after the TCP *ACK*. The message contains information about TLS versions and a list of Cipher Suites.

* When the server receives the *ClientHello* message, it responds with a message containing:
  * *ServerHello* containing:
    * TLS version
    * Cipher Suite
  * Certificate containing:
    * Public key (for asymmetric encryption)
  * *ServerHelloDone* marker

* When the client receives the *ServerHelloDone* marker, the key exchange process begins and a message is sent back to the server containing:
   * *ClientKeyExchange* which contains:
     * Pre-master secret, encrypted using the public key the server sent.
   * *ChangeCipherSpec* flag
   * *Finished* flag

* The server then sends back a message containing:
  * *ChangeCipherSpec* flag
  * *Finished* flag

The TLS Handshake is a complicated process that has an impact on performance by increasing latency. In more basic terms the TLS Handshake is a process used to agree on which TLS version will be used to secure the connection, agree on algorithms included as part of the cipher suite, and to enable the exchange of symmetric keys that will be used to encrypt messages.


## **Authentication**

Authentication verifies the identify of the server during message exchange. The certificate sent back by the server contains information about the server identity including who the owner is. Certificates are issued by *Certificate Authorities* and work on a chain of trust, leading back to a small group of Root CAs which are highly trusted.

## **Integrity**

TLS also adds functionality to detect if a message has been tampered with. This is implemented through the use of the Message Authentication Code (MAC) field in the TLS PDU. The MAC is generated using a hashing algorithm.