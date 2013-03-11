initforthe-roundabound
======================

Some CoffeeScript surrounding Bootstrap's Carousel code to make it easier to implement carousels.

Why roundabound?
----------------

http://www.youtube.com/watch?v=2ljFfL-mL70

How to use
----------

Options are set via data-\* attributes. Available options are:

<table>
<tr>
<td>data-interval</td><td>in thousanths of a second</td>
</tr>
<tr>
<td>data-pause</td><td>'hover' will force pause on hover. Anything else will prevent it</td>
</tr>
</table>

Add `initforthe-roundabound` to your application.js

If you need to instantiate further Roundabounds, call `new InitfortheCarousel(selector)` where `selector` can be one of a DOM object, jQuery element, or jQuery selector.

License
-------

MIT
