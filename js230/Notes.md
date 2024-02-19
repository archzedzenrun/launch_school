# Lesson 1

### The DOM

The DOM (Document Object Model) is an in-memory object that represents an HTML
document and provides the functionality to interact with a web page using JavaScript.

The DOM is a hierarchical structure of nodes. Nodes are connected together in a way that
represents their relationships. Browsers automatically insert missing elements such as 
`<head>` or `<body>`.

### Nodes

A node is a single point in the DOM hierarchy.
* All DOM objects are nodes.
* All DOM objects have a type, inherited from Node. Element and Text are the 
two most common types.

2 different types of nodes are:
* Elements that represent HTML tags
* Text nodes that represent text appearing in the document

`Empty nodes` are text nodes that contain nothing but whitespace. Sometimes a distinction
is made between text nodes containing different things but there is no actual 
difference between text nodes. Empty notes are not visually reflected in the browser and 
can appear almost anywhere.

The `document` node is at the top of the node hierarchy and represents the entire 
HTML document.

`querySelector` is a method that searches the entire dom for the given selector 
and returns the first one it finds.

Nodes can be created with `document.create*` methods or by cloning an existing node hierarchy:
* document.createElement(tagName) - returns a new element node
* document.createTextNode(text) - returns a new text node
* node.cloneNode(deepClone) - returns a copy of node

Nodes can be appended, inserted, or replaced on the nodes parent with:
* parent.appendChild(node) - append node to the end of parent.childNodes
* parent.insertBefore(node, targetNode) - insert node into parent.childNodes before targetNode
* parent.replaceChild(node, targetNode) - remove targetNode from parent.childNodes and insert node in its place

Nodes can be removed with:
* node.remove() - removes node from the DOM
* parent.removeChild(node) - remove node from parent.childNodes

**Node Properties**

All DOM nodes contain cetain properties:
* nodeName - a string representation of the node type in uppercase
* nodeType - a number indicating the node type. common node types:
  * 1 - element
  * 3 - text
  * 8 - comment
  * 9 - document
* nodeValue - the value of a node. elements dont have values (the nodeValue is null).  the textual content is the value of a text node.
* textContent - the textual content of all nodes inside the element concatenated 
into a single string.

Node types are also part of a hierarchy that inherit properties/methods from 
other types.

`EventTarget` provides event handling behavior. `Node` provides shared behaviors 
to all nodes. `Text` nodes hold text and `Element` nodes represent HTML tags, these are 
2 of the main subtypes of Node. Most HTML tags are subtypes that inherit from `HTMLElement`.

Node types can be checked with `Object.getPrototypeOf(ele)`

Parent node properties:
* childNodes - returns all child nodes
* firstChild - returns first child node or null
* lastChild - returns last child node or null

Child node properties:
* parentNode - immediate parent of the node
* nextSibling - the next child node of the parent node
* previousSibling - the previousl child node of the parent node

### Element Attributes

Element attributes can be accessed using these methods:
* getAttribute(name) - returns value of attribute (name)
* setAttribute(name, newVal) - set value of attribute (name) to (newVal)
* hasAttribute(name) - check if element has attribute (name)

Some property values can be accessed/changed using the standard operations such as 
`p.id` or `p.id = 5`.

`classList` property references a special array-ilke object called `DOMTokenList`
that has the methods:
* add(name) - add class name to element
* remove(name) - remove class name from element
* toggle(name) - add class name to element if it doesnt exist, removes if does
* contains(name) - return boolean if element has class name
* length - the number of classes the element belongs to

element nodes have a `style` attribute that references an object called `CSSStyleDeclaration`. The style attribute can be used to alter any CSS property. 
camelCase is used to access CSS properties whose name contains dashes. CSS class 
names can be added or removed from any DOM element.

Properties to get a list of child elements without text and other nodes:
Parent Elements:
* children - all child elements only
* firstElementChild - children[0] or null
* lastElementChild - chilldren[children.length - 1] or null
* childElementCount - children.length

Child Elements:
* nextElementSibling - parentNode.children[n + 1] or null
* previousElementSibling - parentNode.children[n - 1] or null

# Lesson 2

### Asynchronous Execution with setTimeout

Sequential code is code that runs each line in sequence. 

Asynchronous code is code that doesnt run continuously or when its first encountered. It may run partly, pause, and continue later after an amount of time.

`setTimeout` function takes a callback function and a time to wait (in milliseconds). The callback function is executed after the timer elapses.

`event` is an object that represents an occurance, containing information on what/where it happened. An `event listener aka event handlers` is the code that the browser runs in response to an event.

`DOMContentLoaded` event is usually used when JS code must have access to the DOM.

Steps to setup an event handler:
* Identify the event
* Identify the element that will receive the event
* Define a function to call when this event occurs
* Register the function as an event listener

`Capturing and Bubbling` are event phases after the initial fire. The event gets dispatched to the window object then to the document object down to the element the event was originally fired on. The first phase (dispatching) reverses from the target element backwards to the window object (bubbling).

This implies that events do not start and end on the target element/element that an event was triggered on.

The `stopPropagation()` method tells the browser to stop bubbling the event up to parent elements.

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