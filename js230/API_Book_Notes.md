# Basics

### Defining API

API (Application Programing Interface) is a way for computer systems to interact with each other. They provide functionality for use by another program. Web APIs allow system interaction over HTTP through URLs.

URL represents the location of a resource and how it can be accessed. Scheme, hostname, path, query string are parts that make up a URL.

API `provider` provides an API for other systems to use and an API `consumer` is the system that uses an API to accomplish tasks.

### What APIs can do

* Sharing data between different systems.
* Enable developers to build applications on top of other established systems, allowing them to focus more on their objectives instead of trying to establish these systems themselves.

### Accessibility

Pubic APIs are intended to be consumed outside of the organization that provides them.

Private APIs are only used internally by the organization that creates them.

Terms of an APIs usage is set by the API provider in the form of Terms and Conditions.

### Media Types

Media types (aka content types) are the format of a response body. They are represented in an HTTP response by the Content-Type header.

Data serialization formats are formats that work well for representing media hierarchically, meaning a form which is more easily/efficiently stored or transferred.

### REST and CRUD

REST (representational state transfer) describes a set of conventions for building APIs. Representational is not the resource itself, but how a representation of it is transferred. State transfer refers to how HTTP is a stateless protocol and that the request contains everything the server needs to know in order to process the request.

CRUD describes the four actions that can be taken on resources (create, read, update, delete).

A RESTful design is one in which actions can be accomplished using CRUD operations on resources.