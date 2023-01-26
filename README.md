define-opaque
=============

This is an attempt to write a macro in R5RS Scheme that
defines opaque data structures.  It is based on the third
example given in Information Hiding in Scheme][].

It is not intended to be suitable for production use.  It
is, however, intended to properly hide the details of the
created data structure, by preventing access to it by any
means other than via the defined operations.

The macro is defined in
**[`src/define-opaque.scm`](src/define-opaque.scm)**.

The idea is that you'd just copy it into your project and
`(load "define-opaque.scm")` where you need it.  For usage,
see the demo files also in [the `src` directory](src/).

This is an early version of the macro, and its name in
the source code is intended to indicate this fact.
If at some point it becomes more usable, I will update
its name.

[Information Hiding in Scheme]: https://github.com/cpressey/Information-Hiding-in-Scheme
