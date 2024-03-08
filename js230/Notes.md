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

The `preventDefault()` method stops the event from performing its default action.

### Asynchronous techniques

**Callbacks**

Callbacks are functions passed as arguments to another function. Callbacks are a way to deal with asynchronous code, meaning code can start at one point and finish at another without stopping the execution flow of the program.

Nesting callbacks makes code hard to read, maintain and debug. Functions should be named and separated into smaller reusable pieces to help with these issues.

**Promises**

These are objects representing asynchronous operations that will happen at some point and produce a value.

Promises have three states:
* Pending - initial, not yet completed
* Fulfilled - completed successfully, has a resulting value
* Rejected - operation failed, has an error

Promises are created using the Promise constructor which takes a function called the executor. The executor runs automatically when the promise is created. It has two arguments `resolve` and `reject`.

`.then()` method is called when a promise has been fulfilled. A function can be passed as a callback for the result.

`.catch()` method catches the error if a promise is rejected. A function can also be passed to it.

`finally()` method runs after the promise is settled, regardless of the outcome. Typically used for cleanup actions.

Promise API methods:
* Promise.all() - used for running operations in parallel and waiting for them all to complete. It takes an array of promises and returns a single promise containing the resolve values of each promise (in order).
* Promise.race() - It takes an array of promises and returns the value of the resolved promise that settles first (fulfilled or rejected).
* Promise.allSettled() - It takes an array of promises adn returns an array of objects describing the outcome of each promise.
* Promise.any() - It takes an array of promises and returns the value of the first promise that resolves. If all promises are rejected, the returned promise is rejected with an AggregateError.

**Async/Await**

`async` is added to functions, telling them to return a promise whether you explicitly return a promise or not. The return value is wrapped in a promise.

`await` is used inside async functions to pause code on that line until the promise fulfills, before returning the resulting value.

# Lesson 3

AJAX (Asynchronous JavaScript And XML) requests are when a browser doesnt perform a full page load. Certain parts of data are fetched to update parts of a page.

With AJAX all of the HTTP methods are available for use. HTML `<form>` tag only allows GET and POST. It also gives us better control over the headers and data format of our requests.

`XMLHttpRequest` methods:
* open(method, url) - open a connection to url using method, example open(GET, google.com).
* send(data) - send the request, optionally sending along data.
* setRequestHeader(header, value) set HTTP header to value.
* abort() - cancel active request.
* getResponseHeader(header) - Return the response value of header.

Properties:
* timeout, writeable, default 0, max time a request can take to complete in ms.
* readyState, not writeable, what sate the request is in
* responseText, not writeable, default null, raw text of response body.