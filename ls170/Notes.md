# The Internet

The **internet** is a network of networks.

A **network** is when two devices are connected so that they can exchange data and communicate.

A **local area network (LAN)** is when multiple devices are connected together by a network bridging device (hub or switch). They are connected to this device with cables, forming the network. Local means the scope of communication is limited to the connected devices.

**Wireless LAN (WLAN)** is when devices connect to that network bridging device wirelessly.

**Routers** are devices that route network traffic to other networks, allowing different networks to communicate with each other. The internet can be imagined as many networks with routers directing traffic.

# Protocols

**Protocols** are a system of rules that oversee the exchange/transmission of data. They allow different kinds of devices running different kinds of software to communicate with each other.

IP, SMTP, TCP, HTTP, Ethernet, FTP, DNS, UDP, TLS are some common networking protocols.

Two main reasons there are so many different protocols:

* To address different ways a network communicates.
* To address similar ways a network communicates but differently in specific use-cases.

# A Layered System

Protocol groups work within layers of an overall communication system.

**Data encapsulation** is the hiding of data from one layer by encapsulating it within a Protocol Data Unit (PDU) of the layer below.

**Protocol Data Units** is a chunk of data transferred over a network. PDU's can have different names for different protocols. For example the Link/Data link layer refers to a PDU as a *frame*, the Internet/Network layer refers to a PDU as a *packet*, and at the Transport layer it is known as a *segment* or *datagram*.

The basic concept is the same regardless of what the PDU is called. It consists of a header and data payload, sometimes a trailer or footer.

The purpose of a *header* (and *trailer* if included) is to provide metadata about the PDU specific to the protocol being used. For example Internet Protocol (IP) packet (PDU) header would include source and destination IP addresses that are used to route the packet correctly.

*Data payload* is the data being transferred over the network and is the key to how encapsulation is used. The PDU from one layer is set as the data payload for the layer below. This approach creates separation meaning layers dont need to know how other layers are implemented in order to interact. This allows us to use different protocols for different layers.

# The Physical Network

The physical network consists of things like devices, cables, and wires. The limitations of these things determine the physical characteristics of a network and impact how protocols function.

**Bits and Signals**

The OSI model defines the bottommost layer (layer 1) as a physical layer and the function of this layer is to transfer bits (binary data). Bits are converted into signals, specifically electrical, light or radio, in order to be transported.

**Characteristics of a Physical Network**

**Latency** is a measure of how long it takes for data to get from one point to another in a network.

**Bandwidth** is the amount of data that can be sent in a certain amount of time (usually 1 second).

Latency delay is the difference in time between the starting point and the ending point.

Different types of delay determine overall latency of a connection:

* *Propagation delay* is the amount of time it takes for a message to travel from point A to point B and is calculated as the ratio between speed and distance.
* *Transmission delay* is the amount of time it takes data to navigate all the interconnected network devices like switches and routers.
* *Processing delay* is the amount of time it takes for data to be processed at different points throughout the system.
* *Queuing delay* is the amount of time it takes data to be processed at a network device when there is more data than the device can handle.

Total latency between two points is the sum of the above delays in milliseconds.

*Last mile latency* describes how most of the delays in a system occur toward the end points.

*Round-trip time (RTT)* is a latency calculation describing the total time for a signal to be sent added to the time it takes for a response to be received.

*Network Hops* are different points along the path that a piece of data takes. This points are called nodes and they process the data and send it along the path to the next node.

**Bandwidth** of a connection is the amount of the lowest point in the overall connection. A bandwidth bottleneck is when bandwidth changes from high to low. Low bandwidth can be an issue when dealing with large amounts of data.

# The Link/Data Link Layer

In the OSI model, *Data Link Layer* is the second layer. Its between the first layer (Physical) and third layer (Network). In the Iternet Protocol Suite, the link layer is the first layer. In both protocols we can think of this layer as being between the physical layers below, and logical layers above.

The **Ethernet Protocol** is the most commonly used protocol at this layer. Ethernet cables are used to connect different devices like computers and routers to a network.

**Ethernet Frames**

Ethernet frames are the Protocol Data Unit of the Ethernet Protocol. This is the lowest layer where encapsulation takes place. Data is encapsulated in the payload of the frame and hidden from the next layer up which is the Internet/Network layer. The frame adds structure to the bits received from the physical layer and determines which bits are the data payload and which bits will be used for transporting the frame (metadata).

Below are the different parts that make up the structure of a frame:

**Preamble (7 bytes long) and Start of Frame Delimiter (SFD/SOF, 1 byte long)** is a synchronization measure sent just prior to the frame which notifies the receiving device to expect frame data before then identifying the start point of that data.

**Source and Destination MAC address (6 bytes each)**. The source address is the address of the device which created the frame. The destination MAC address is the address of the device that will be receiving the data.

**Length (2 bytes)** indicates the data payload's size.

**DSAP, SSAP, Control (1 byte each)** DSAP and SSAP identify the protocol used for the data payload. Control specifies the frames communication mode which helps with flow control.

**Data Payload (42-1497 bytes)** contains data for the entire PDU from the next layer up.

**Frame Check Sequence (FCS 4 bytes)** This is a checksum the device that created the frame generates and is compared on the receiving end. If the checksum doesn't match, the frame is dropped and the data is not retransmitted.

Ethernet specifies an *interframe gap (IFG)* which is a pause between each transmitted frame which allows the receiver time to prepare to receive the next. The length of the pause varies. IFG also contributes to the overall latency.

The main frame elements to remember are the data payload (which is used to encapsulate data for the layer above) and the MAC address (which is used to direct the frame between devices). These 2 fields exist across all ethernet standards.

**MAC addresses** are linked to every physical  network-enabled device and usually doesnt change.

A switch keeps a table of connected devices and their MAC addresses and directs frames to the correct device.

# The Internet/Network Layer

The network layer is the third layer in the OSI model (between the data link and transport layers). The network layer is the second layer in the Internet Protocol Suite (between link layer and transport layer.) Its main purpose is to facilitate communications between hosts on different networks.

Internet Protocol (IP) is the most widely used protocol at this layer with the main features being routing capability by addressing IPs and packets that hold encapsulated data.

A *packet* is the Protocol Data Unit (PDU) within the IP protocol. Data payload (from the previous layer) and a Header make up a packet.

Parts of the header include:
* **Version** indicates the IP version (IPv4/IPv6)
* **ID, Flags, Fragment Offset** related to fragmentation which is when a packet is too large to be sent as a single packet. Its broken up into multiple packets and then reassembled.
* **Time To Live (TTL)** the maximum number of hops a packet can take before being dropped.
* **Protocol** indicates the data payload's protocol.
* **Checksum** packets are dropped if the generated checksum is not equal on the receiving end.
* **Source Address** 32-bit IP address of the packet source
* **Destination Address** 32-bit IP address of the packet receiver.

**IP Addresses**

IP addresses are not tied to specific devices. When a device is assigned an IP address, it must be within a range of address available to that network. The range is defined by a network hierarchy which is when a network is split into subnetworks. IPv4 addresses are four sections of 8 bits making up a total length of 32 bits with each section being a range of numbers 0-255.

Routers on a network store a local routing table which matches the destination IP address of a packet with the list of addresses in the routing table.

**sub-netting** is the splitting of a network into parts.

# The Transport Layer

**multiplexing** is when multiple signals are sent over a single channel. **demultiplexing** is when multiple signals are received over a single channel. **Network ports** make this possible.

A **port** identifies a specific process that a host is running.

IP address and port number is what allows applications on different machines to communicate with each other. This end-point of communication is called a socket which is a combination of an IP address and port number.

**Sockets** can refer to UNIX socket which is when processes runnin gon the same machine communicate with each other. It can also refer to internet sockets which is when networked processes, usually on different machines, communicate with each other.

*pipelining* is when more than one message can be sent to the receiver at a time without waiting for acknowledgements to send the next (non-pipelined).

In a connectionless system we could have one socket object defined by the IP address of the host machine and the port assigned to a particular process running on that machine. That object could call a listen() method which would allow it to wait for incoming messages directed to that particular IP/port pair. Such messages could potentially come from any source, at any time, and in any order, but that isn't a concern in a connectionless system -- it would simply process any incoming messages as they arrived and send any responses as necessary.

A connection-oriented system would work differently. You could have a socket object defined by the host IP and process port, just as in the connectionless system, also using a listen() method to wait for incoming messages; the difference in implementation would be in what happens when a message arrives. At this point we could instantiate a new socket object; this new socket object wouldn't just be defined by the local IP and port number, but also by the IP and port of the process/host which sent the message. This new socket object would then listen specifically for messages where all four pieces of information matched (source port, source IP, destination port, destination IP). The combination of these four pieces of information is commonly referred to as a four-tuple.

# Transmission Control Protocol (TCP)

TCP is a protocol that is able to recover lost or damaged data. It provides reliability at the cost of performance (latency). It is a connection-oriented protocol meaning a connection must be established before data can be sent.

*Segments* are the PDU's of TCP and uses headers and payload to encapsulate data from the layer above.

*Flow control* prevents the sender from sending too much data at once so that the receiver doesnt get overwhelmed. Extra data is stored in a buffer.

*Network congestion* is when more data is being transmitted than the network can handle (based on its capacity). That excess data is lost in transit. Congestion avoidance is a mechanism used by TCP to determine how congested the network is based on data loss.

# User Datagram Protocol (UDP)

*Datagram* is the Protocol Data Unit (PDU) of UDP. UDP sacrifices reliability for simplicity which provides speed and flexibility.

UDP is a conectionless protocol meaning no connection has to be established before transmitting data.

# The Application Layer

Application is the top most layer and is a set of protocols that provide communication services to applications. Applications interact mostly with the application layer. The application focuses on the structure of the data and relies on lower layers to get data where it needs to go.

# HTTP and the Web

The world wide web is a service accessible through the internet. It is a vast system of resources navigated by URLs (Uniform Resource Locator). HTTP is the primary way that applications interact with those resources.

Uniform Resource Identifier (URI) is a string of characters that identify resources.

**Hypertext Transfer Protocol (HTTP)** is the set of rules that provide structure to the way resources are transferred between applications on the web.

**Domain Name System (DNS)** is a database that contains domain names and their corresponding IP addresses. DNS databases are stored on multiple DNS servers.

When you type in a website name, the browser sends HTTP request to the DNS server for the IP address associated with that name (unless its already cached). The request then goes to the server with that IP address and a response is sent back and displayed as a web page.

Web browsers are applications that issue HTTP requests and process the response to display websites.

Servers are devices whose job is to receive requests and send back responses.

HTTP is a **stateless** protocol meaning that each pair of request and response are independent of the previous one. This means the server doesnt have to hold on to any kind of "state" between requests which means the system doesnt have to do any kind of cleanup. Its up to web developers to make an application appear "stateful".

# Uniform Resource Locator (URL)

A URL is the address of a website.

Components of a URL: http://www.example.com:88/home?item=book

* **http (the scheme)** tells the web client how to access the resource (which protocol should be used).
* **www.example.com (the host)** tells the web client where the resource is located.
* **:88 (the port)** port number specified if you want to use something other than the default.
* **/home (the path)** optional part of the URL that shows what resource is being requested.
* **?item=book (the query string)** made up of *query parameters* and used to send data to the server, also optional.

**Query Strings/Parameters**

http://www.example.com?search=ruby&results=10

* **?** reserved character, marks the start of the query string.
* **search=ruby** parameter name/value pair.
* **&** reserved character, used when adding more parameters to the query string.
* **results=10** parameter name/value pair.

Query strings are passed in through the URL, only used in HTTP GET requests (which is what is happening when you type a URL into the browser address bar).

They have a maximum length. Dont pass sensitive information to the server using query strings since they are visible in the URL.

**URL Encoding**

URLs only accept certain characters in the 128-character ASCII set. Reserved characters must be encoded using UTF-8 codes.

GET requests retreive a resource. We send GET requests when trying to access websites. If the response is in HTML, the browser will automatically GET request other referenced resources.

POST requests are when you want to send data to a server. This is typically done when submitting forms and protects sensitive information instead of sending that information in an exposed URL during a GET request.

**Re-Read POST REQUESTS SECTION, MAKE NOTES FOR HEADERS, MESSAGE BODY**

# Processing Responses

**Status code** is a 3 digit status number the server sends back after receiving a request.

Common status codes:
* 200, Text: OK. request was successful
* 302 (AKA a redirect) Text: Found. requested resources has changed, typically redirects to another URL defined in the *Location* response header.
* 404, Text: Not found. request was not found.
* 500, Text: Internal Server Error. server encountered some kind of generic error.

**Response headers** contain more information about the resource the server sent back. Some common response headers:

* Content-encoding (type of encoding used on the data)
* Server (name of the server)
* Location (notification for new resource location)
* Content-type (type of data the resource contains)

# Stateful Web Applications

**Sessions**

A session identifier is when a client appends a token to a request to the server. This token allows the server to identify the client.

This simulates a stateful experience by retrieving the session data based on the session id (token) and then recreating the state of the application and then sending it back to the client.

**Cookies**

HTTP cookies or just cookies are small files stored in the web browser and contain session information. It is sent from the server (by the set-cookie response header) and stored in the client during a request/response. The session data is stored on the server and compared with the client's cookie so that it remembers the state of the application. The cookie is sent to the server every time a request is made and is used to identify the client.

Session data is generated and stored on the server side.

**Asynchronous JavaScript and XML(AJAX)** allows browsers to issue requests and process the responses without refreshing the page. The responses are processed by a callback function.

A callback is a piece of logic that is passed to a function that is executed after a certain event takes place (pressing a key for example).

# Security

**HTTPS** encrypts every request/response before it is transported on the network as a security measure. Messages are sent through a cryptographic protocol called TLS for encryption which exchanges security keys with the remote server before data encryption happens.

**Same-origin policy** allows unrestricted interaction between resources that originated from the same location (combination of scheme host and port). Certain interactions of resources origination from different locations are restricted. Plays an important part in web application security.

**Cross-origin resource sharing (CORS)** allows normally restricted interactions to take place by adding new HTTP headers.

**Session Hijacking** is when an attacker gets ahold of a session id (cookie) allowing them to access the web application using the same session.

Countermeasures:

* Resetting sessions. Authentication systems make old session ids invalid and create a new one when a successful login happens.
* Session expiration time. Limits the amount of time of a potential attack.
* Use HTTPS to minimize the chance of the session id falling into an attackers hands.

**Cross-Site Scripting (XSS)** is when a user inputs HTML or Javascript which could then be injected into the page contents and be executed by the browser. For example an attacker could JS to get the session id of any site visitor.

These types of attacks can be prevented by not allowing certain inputs or disallowing HTML/JS or by *escaping* user input data which means replacing certain HTML characters with a combination of ASCII characters which will stop the characters from being read as HTML.

# Servers

When talking about the HTTP protocol we know requests are sent and received from a server. There are 3 main pieces of the server-side infrastructure:

* **Web server** that responds to requests for static assets like files and images.
* **Application server** handles application logic and more complicated requests.
* **Data Store** is like a database that works with the application server to retrieve or create data. Data stores are persistant meaning the data doesnt go away after each cycle, it persists through the stateless request/response cycles.

**HTTP over TCP/IP**

HTTP structures the messages that are exchanged between applications while TCP/IP is ensuring that request/response cycles are completed. (between client and server).

# Transport Layer Security (TLS) Protocol

TLS provides three security services that are typically used together:

* **Encryption** which encodes messages so that it can be read only by those authorized to decode them.
* **Authentication** which verifies the identify of a party during message exchange.
* **Integrity** which detects if a message has been tampered with.

**TLS Encryption**

TLS makes an encrypted connection through a process called the TLS Handshake.

**Symetric Key Encryption** is a system that relies on only the sender and the receiver having access to the key.

**Asymmetric key encryption** aka public key encryption uses a pair of non-identical keys consisting of public/private. The public key is used to encrypt and the private key to decrypt. Messages encrypted with the public key can only be decrypted by the associated private key. This encryption only works in one direction.

**TLS Handshake** takes place after the TCP Handshake.
A *ClientHello* message is sent after the TCP *ACK*. When the server receives the *ClientHello* message, it sends a *ServerHello* back which contains protocol/cipher information and its certificate which contains the public key, and a *ServerHelloDone* marker that tells the client to proceed. The client will then start the key exchange process, enabling the client and server to each secure a copy of the symmetric encryption key, allowing secure communication.

TLS complexity adds to latency.

Datagram Transport Layer Security (DTLS) is a protocol used when UDP is used at the transport layer.

# TLS Authentication

Certificate Authorities (CAs) ensure that certificates have been verified as trusthworthy. It does this by digitally signing the certificate and verifying the identity of the party requesting the certificate, the way this is accomplished varies based on the CA.

# TLS Integrity

The Message Authentication Code (MAC) is a field in the TLS PDU that adds a layer of security by checking that the message hasnt been tampered with. It does this through the use of a hashing algorithm.