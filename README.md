define-opaque
=============

This is an attempt to write a macro in R5RS Scheme that
defines opaque data structures.  It is based on the third
example given in [Information Hiding in Scheme][].

It is not intended to be suitable for production use.  It
is, however, intended to properly hide the details of the
created data structure, by preventing access to it by any
means other than via the defined operations.

The macro is defined in
**[`src/define-opaque-0.1.scm`](src/define-opaque-0.1.scm)**.

The idea is that you'd just copy it into your project and
`(load "define-opaque.scm")` where you need it.  For usage,
see the demo files also in [the `src` directory](src/).

### Basic Instructions

The arguments to the `define-opaque` macro are

*   the name of the opaque data structure that will result
    (this name will be visible globally)
*   the name of a function which creates a new instance
    of the data structure
    (this name will be visible only to the operations)
*   a list of names for the data items used internally
    (these names will be visible only to the operations)
*   a list of operations.  Each operation is a 2-element
    list, consisting of its name, and a lambda expression
    giving its implementation.

The opaque data structure that results is a Scheme
function.  When it is called, the first argument
must be the name of an operation; the remainder of the
arguments are passed to

Typically, the opaque data structure that results
is treated as a "protoype", and one defines an operation
called `new` that provides a way to initialize a new
instance of the data structure based on some initialization
parameters.

If the above description is unclear, the example programs
in [the `src` directory](src/) may help illuminate the
usage patterns.

### TODO

- [ ] is more than one private field supported?
- [ ] support supplying initial values for private fields

[Information Hiding in Scheme]: https://github.com/cpressey/Information-Hiding-in-Scheme
