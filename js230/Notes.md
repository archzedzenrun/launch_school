# Lesson 1

### The DOM

The DOM (Document Object Model) is an in-memory object, hierarchical structure of nodes that represents an HTML
document and provides the functionality to interact with a web page using JavaScript.

Nodes are connected together in a way that
represents their relationships. 

Missing elements such as `<head>` or `<body>` are automatically added to the DOM tree by the browser.

### Nodes

A node is a single point in the DOM hierarchy.
* All DOM objects are nodes.
* All DOM objects have a type, inherited from Node. Element and Text are the 
two most common types.

2 different types of nodes are:
* Elements that represent HTML tags
* Text nodes that represent text appearing in the document

**Empty nodes** are text nodes that contain nothing but whitespace. All text nodes are the same whether they are empty or contain text content. 

Empty notes are not visually reflected in the browser and 
can appear almost anywhere.

The `document` node is at the top of the node hierarchy and represents the entire 
HTML document.

`querySelector` is a method that searches the entire dom for the given selector. It can take multiple selectors separated by commas in a string `document.querySelector('#div2, #div1')` (this would return whichever it finds first).

`querySelectorAll` is another method that searches for the given selector(s). `document.querySelectorAll('#div2, #'div1')` would return an array-like NodeList containing div1 and div2 in the order that they were found.

We can use them to find nested elements like this: `document.querySelectorAll('.div1 p')` this would return a list of all p elements nested inside elements with div1 as their id.

These methods can be called on any element, not just document.

---

**Node Properties**

All DOM nodes contain cetain properties:
* nodeName - a string representation of the node type in uppercase
* nodeType - a number indicating the node type. common node types:
  * 1 - element
  * 3 - text
  * 8 - comment
  * 9 - document
* nodeValue - the value of a node. elements dont have values (the nodeValue is null). The textual content is the value of a text node.
* textContent - The textual content of ALL nodes inside the element concatenated 
into a single string.

Parent node properties:
* childNodes - returns all child nodes
* firstChild - returns first child node or null
* lastChild - returns last child node or null

Child node properties:
* parentNode - immediate parent of the node
* nextSibling - the next child node of the parent node
* previousSibling - the previous child node of the parent node

Properties to get a list of child elements without text and other nodes:
Parent Elements:
* children - all child elements only
* firstElementChild - children[0] or null
* lastElementChild - children[children.length - 1] or null
* childElementCount - children.length

Child Elements:
* nextElementSibling - parentNode.children[n + 1] or null
* previousElementSibling - parentNode.children[n - 1] or null

---

**Node Type Hierarchy**

Nodes are part of a hierarchy that inherit properties/methods:

* EventTarget - defines and provides event handling behavior.
  * Node - provides behaviors for all node types (traversal, changing node content, etc)

    Node Subtypes:
    * Text - nodes holding text
    * Comment - nodes holding comments
    * Element - HTML tags
      * HTMLElement - provides behaviors for attributes, styling, etc.

        HTMLElement sub types:
        * HTMLAnchorElement - behaviors for `<A>` tags
        * HTMLButtonElement - behaviros for `<button>` tags
        * and so on...

Node types can be checked with `Object.getPrototypeOf(ele)`

---

Nodes can be created with `document.create*` methods or by cloning an existing node hierarchy:
* document.createElement(tagName) - returns a new element node
* document.createTextNode(text) - returns a new text node
* node.cloneNode(deepClone) - returns a copy of node, deepClone is true or false

Nodes can be appended, inserted, or replaced **on the nodes parent** with:
* parent.appendChild(node) - append node to the end of parent.childNodes
* parent.insertBefore(node, targetNode) - insert node into parent.childNodes before targetNode
* parent.replaceChild(node, targetNode) - remove targetNode from parent.childNodes and insert node in its place

Nodes can be inserted before after or within **an element** with:
* element.insertAdjacentElement(position, newElement)
* element.insertAdjacentText(positon, textNode)
Positions are:
* "beforebegin" - before the element
* "afterbegin" - before the first child of element
* "beforeend" - after the last child of element
* "afterend" - after the element

Nodes can be removed with:
* node.remove() - removes node from the DOM
* parent.removeChild(node) - remove node from parent.childNodes

### Element Attributes

Element attributes can be accessed using these methods:
* getAttribute(name) - returns value of attribute (name)
* setAttribute(name, newVal) - set value of attribute (name) to (newVal)
* hasAttribute(name) - check if element has attribute (name)

Some property values can be accessed/changed using the standard operations such as 
`p.id` or `p.id = 5`.

`classList` property references a special array-like object called `DOMTokenList`
that has the methods/properties:
* add(name) - add class name to element
* remove(name) - remove class name from element
* toggle(name) - add class name to element if it doesnt exist, removes if does
* contains(name) - return boolean if element has class name
* length - the number of classes the element belongs to

element nodes have a `style` attribute that references an object called `CSSStyleDeclaration`. The style attribute can be used to alter any CSS property. camelCase is used to access CSS properties whose name contains dashes. Set a property to null to remove its style.

# Lesson 2

### Asynchronous Execution with setTimeout

Sequential code is code that runs each line in sequence. 

Asynchronous code is code that doesnt run continuously or when its first encountered. It may run partly, pause, and continue later after an amount of time.

`setTimeout` function takes a callback function and a time to wait (in milliseconds). The callback function is executed after the timer elapses.

`event` is an object that represents an occurance, containing information on what/where it happened. An `event listener aka event handlers` is the code that the browser runs in response to an event.

`DOMContentLoaded` event is usually used when JS code must have access to the DOM, ensuring that the DOM is fully loaded before it can be manipulated.

Steps to setup an event handler:
* Identify the event
* Identify the element that will receive the event
* Define a function to call when this event occurs
* Register the function as an event listener

---

**The Event Object** is created when an event listener fires and is passed as an argument to the second argument of addEventListener, which is a function. The event object contains information properties about the event such as the `type` of event (the first argument of addEventListener), `currentTarget` which is the element that addEventListener is called on, `target` which is the object that the event occured on, for example, if the event type was 'click', target would reference the object that was clicked.

Event objects have unique properties based on the event type. 

Some mouse event properties are button (which button was pressed), clientX and clientY (horizontal and vertical position of where the event occurred).

Some keyboard events are key (string value of key pressed), shiftKey altKey ctrlKey metaKey (all booleans based on if the key was pressed).

---

`Capturing and Bubbling` are event phases after the initial fire. During the capturing phase, the event object moves from the window object to the document object, then down to the element the event was fired on. Then the bubbling phase happens where the event object takes the same path but in reverse. This means that the event object passes through each element twice (capturing and bubbling) but the event listener only fires in one phase, which by default is during the bubbling phase. An optional third argument can be added to the event listener (true/false) to specify which phase the event listener will fire in. By passing 'true', the event listener will fire during the capturing phase.

The takeaway from this is that events do not start and end on the element that an event was triggered on.

currentTarget is the element that the event listener is attached to, Target is the element that the event occurred on. 'this' references currentTarget within the event handler when using a function expression.

The `stopPropagation()` method stops the event object from continuing on the capturing/bubbling path.

The `preventDefault()` method stops the event object from performing its default action. With regards to nested elements: Using the preventDefault method will also prevent the default actions of any other event along the propagation path.

**Event Delegation** is when one or more elements can fire a single event listener that is attached to a common ancestor further up the DOM tree. This technique simplifies code by reducing repetition which improves performance and is made possible through event propagation (capturing and bubbling).

### Asynchronous techniques

**Callbacks**

Callbacks are functions passed as arguments to another function. Callbacks are a way to deal with asynchronous code, meaning code can start at one point and finish at another without stopping the execution flow of the program.

Nesting callbacks makes code hard to read, maintain and debug. Functions should be named and separated into smaller reusable pieces to help with these issues.

Web APIs push callbacks onto a task queue which then pushes the callback onto the stack if it is empty (which then runs the code in the callback)

**Promises**

These are objects representing asynchronous operations that will happen at some point and produce a value.

Promises have three states:
* Pending - initial, not yet completed
* Fulfilled - completed successfully, has a resulting value
* Rejected - operation failed, has an error

Promises are created using the Promise constructor which takes a function called the executor. The executor runs automatically when the promise is created. It has two arguments `resolve` and `reject`.

`.then()` takes a callback function, the argument passed to 'resolve' in the promise is passed to the callback

`.catch()` takes a callback function, the argument passed to 'reject' in the promise is passed to the callback.

`finally()` method runs after the promise is settled, regardless of the outcome. Typically used for cleanup actions.

the 'then' and 'catch' methods can chain promises together.

Promise API methods:
* Promise.all() - used when you have a set of asynchronous operations that you want to run at the same time. It takes an array of promises and returns one promise containing the resolve values for each promise in the same order that they were provided. If any of the promises in the input array rejects, the returned promise rejects. Note: Non-promise values in the input array are automatically resolved.

* Promise.race() - It takes an array of promises and returns the value of the resolved promise that settles first (fulfilled or rejected).
* Promise.allSettled() - It takes an array of promises adn returns an array of objects describing the outcome of each promise.
* Promise.any() - It takes an array of promises and returns the value of the first promise that resolves. If all promises are rejected, the returned promise is rejected with an AggregateError.

**Async/Await**

`async` is added to functions and wraps the return value in a promise regardless if you explicitly return a promise or not.

`await` is used inside async functions to pause code on that line until the promise fulfills, before returning the resulting value. try/catch blocks are used for error handling.

async/await best practices:
* always use await within async functions
* use try/catch blocks for error handling
* Promise.all() may be more appropriate than using await in a loop for performance reasons
* unnecessary use of await can cause delay/performance issues

# Lesson 3

AJAX (Asynchronous JavaScript And XML) requests are when a browser doesnt perform a full page load. Certain parts of data are fetched to update parts of a page.

With AJAX all of the HTTP methods are available for use. HTML `<form>` tag only allows GET and POST. It also gives us better control over the headers and data format of our requests.

XMLHttpRequest is an API provided by browsers in order to send AJAX requests.

Sending requests through XMLHttpRequest mainly involves the following steps:

* Create a new XMLHttpRequest object.
* Use the open method on the XHR object to specify the method and URL for the request.
* Use the setRequestHeader method on the XHR object to set headers you'd like to send with the request. Most of the headers will be added by the browser automatically.
* Use the send method on the XHR object to trigger the whole action and on POST request we can also pass serialized data as an argument.
* Attach an event handler for the load event to the XHR object to handle the response.
* Attach an event handler for the error event to the XHR object to handle any connection errors. This is not required but it's a good practice.



`XMLHttpRequest` methods:
* open(method, url) - open a connection to url using method, example open(GET, google.com).
* send(data) - send the request, optionally sending along data.
* setRequestHeader(header, value) set HTTP header to value.
* abort() - cancel active request.
* getResponseHeader(header) - Return the response value of header.

`XMLHttpRequest` properties:
* timeout - Maximum time a request can take to complete (in milliseconds)
* readyState - state the request is in
* responseText - Raw text of the response's body.
* response - Parsed content of response, not meaningful in all situations

```js
let request = new XMLHttpRequest(); // Instantiate new XMLHttpRequest object
request.open('GET', '/path');       // Set HTTP method and URL on request
request.send();                     // Send request
```

During an XMLHttpRequest cycle, one event fires when it sends the request and a second fires when the response loading ends.

* loadstart - fires when request is sent
* loadend - last event to fire after response loading done and other events have fired

before loadend another event fires based on the request status:
* load - a complete response loaded
* abort - request interrupted before completion
* error - error occurred
* timeout - response wasnt received before a certain amount of time

Submitting a form using JS:
* serialize the form data

  When encoding URL POST parameters, a Content-Type header of `application/x-www-form-urlencoded` must be included.
```js
let request = new XMLHttpRequest();
request.open('POST', 'https://lsjs230-book-catalog.herokuapp.com/books');

request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

let data = 'title=Effective%20JavaScript&author=David%20Herman';

request.addEventListener('load', () => {
  if (request.status === 201) {
    console.log(`This book was added to the catalog: ${request.responseText}`);
  }
});

request.send(data);
```
Using Formdata:
```js
let form = document.getElementById('form');

form.addEventListener('submit', event => {
  // prevent the browser from submitting the form
  event.preventDefault();

  let data = new FormData(form);

  let request = new XMLHttpRequest();
  request.open(form.method, `https://ls-230-web-store-demo.herokuapp.com/${form.getAttribute('action')}`);

  request.addEventListener('load', () => {
    if (request.status === 201) {
      console.log(`This book was added to the catalog: ${request.responseText}`);
    }
  });

  request.send(data);
});
```
* send request using XMLHttpRequest
* handle response

We can use the responseType property to tell the browser how to handle the response. responseType values are text json, arraybuffer, blob, document.
```js
let request = new XMLHttpRequest();
request.open('GET', 'https://api.github.com/repos/rails/rails');
request.responseType = 'json';

request.addEventListener('load', event => {
  // request.response will be the result of parsing the JSON response body
  // or null if the body couldn't be parsed or another error
  // occurred.

  let data = request.response;
});

request.send();
```

Sending JSON via XHR

* Serialize data into valid JSON
```js
let request = new XMLHttpRequest();
request.open('POST', 'https://lsjs230-book-catalog.herokuapp.com/books');

let data = { title: 'Eloquent JavaScript', author: 'Marijn Haverbeke' };
let json = JSON.stringify(data);

request.send(json);
```

* Send request using XMLHttpRequest with a Content-Type: application/json; charset=utf-8 header

```js
let request = new XMLHttpRequest();
request.open('POST', 'https://lsjs230-book-catalog.herokuapp.com/books');

request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');

let data = { title: 'Eloquent JavaScript', author: 'Marijn Haverbeke' };
let json = JSON.stringify(data);

request.send(json);
```

* Handle response

CORS (Cross-Origin Resource Sharing) is a specification that the browser and server must follow in order to communicate when accessing resources across origins. Applications use custom HTTP requests and response headers in order to let the two systems know enough about each other to complete the request.

The Origin header is checked by the server and determines if the origin of the requester should be allowed to receive the response. The response includes a header Access-Control-Allow-Origin if it does.

# Lesson 4

### jQuery

DOM Ready Callback is a function passed to .ready and executes after the document finishes loading (doesnt wait for the browser to load img tags, may need to use $(window).ready())
```js
$(document).ready(function() {
  // DOM loaded and ready, referenced image on img tags are not ready
});

// DOM ready callback can be shortened to:
$(function() {

})
```

The `.css` method is used to change style attributes `content.css('font-size', '18px');`

Some property setting methods such as .css are referred to as getter and setter methods. omitting the last argument in .css `content.css('font-size')` acts as a getter method for the font-size property.

the width and height methods act as getter and setters 
```js
var width = $content.width();  // 800 (getter)
$content.width(width / 2);     // Sets to 400
console.log($content.width()); // now 400 (getter)
```

most jQuery methods return an objec that allows for chaining method calls together like this:
```js
$content.css('font-size', '18px').css('color', '#b00b00');
```
we can also use an object argument like this:
```js
$content.css({
  'font-size': '18px',
  color: '#b00b00'
});
```