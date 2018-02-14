# Escher-in-Elm Workshop

Welcome to the Escher-in-Elm Workshop!

This workshop is based on the classic 1982 paper "Functional Geometry" by Peter Henderson. The paper shows the functional decomposition and reconstruction of Escher's woodcutting "Square Limit", a beautiful recursive tesselation of interleaving fish. In this workshop, we will follow in Henderson's footsteps as we create an SVG replica of it.

The workshop uses Elm as the implementation language, but it is _not_ an Elm tutorial. If you feel need a proper Elm tutorial before attempting this workshop, take a look at [Awesome Elm](https://github.com/isRuslan/awesome-elm) to find one that suits you.

If all you need is a syntax cheat-sheet, you can take a look here.

The focus in this workshop is on abstraction and composition. We will see that Henderson's simple yet powerful picture combinators allow us to solve our task with ease and elegance. It happens to use Elm because we will be producing an SVG, and the browser is a nice runtime for that.

## Getting started

You should start by cloning this repo, like so: 

```
git clone https://github.com/einarwh/escher-workshop
````

You'll see that we're not starting from scratch. You get a number of `.elm` files containing Elm modules. Most of them we can and will ignore in this workshop. But some of them we'll become familiar with. 

First though, you can start the application by typing `elm-reactor` in your terminal. If you open a browser at `http://localhost:8000/Main.elm` you should see something that looks like this:

<img src="files/letter-f.svg" width="200" height="200">

Which is an SVG rendering of the letter F.

Open `Main.elm` in an editor and try to change this line:

```
box |> createPicture fLetter
```

To this: 

```
box |> createPicture george
```

You should see something like this: 

<img src="files/figure-george.svg" width="200" height="200">

We replaced the letter F with a stickman called George. (George is not my invention, he comes from the SICP lecture on Henderson's paper, you can - and should! - watch it [here](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/3a-henderson-escher-example/).)

At this point, you probably have questions! Here are some answers, that may or may not fit those questions. First, `letterF` and `george` are shapes, mere data. More interestingly, `createPicture` is a function that creates a picture out of a shape. And most interestingly, a picture is also a function (!) - from a bounding box to an SVG rendering. This makes a picture somewhat magical, in that it can produce a bunch of different renderings, based on the box you give it.

Try to mess with the bounding box passed to George and see what happens. He has no choice but to stretch and contract to fit the box! Poor ol' George! Here he is all thin and skewed and weird: 

<img src="files/figure-george-skewed.svg" width="200" height="200">

Let's return to the rendering of the letter F, and try to understand what happens a little bit better. Adding some visual aids for the bounding box should help.

<img src="files/letter-f-arrows.svg" width="199" height="199">

If you open `Box.elm`, you'll see that a box is defined by three vectors: `a`, `b` and `c`. The red arrow is the `a` vector, which points from the origin (0, 0) to the bottom left corner of the box. The orange arrow is the `b` vector, which points from the bottom left corner to the bottom right corner, and spans out the box horizontally. The purple arrow points from the bottom left corner to the top left corner, and spans it out vertically. (What about the top right corner? It is implicitly defined by vectors `b` and `c` - you can get there from the bottom left corner if you follow `b` and then `c` or vice versa.)

Speaking of vectors: you might want to take a look at `Vector.elm` as well. You'll see that our vectors have two dimensions, `x` and `y`. We can add vectors together (by adding up the `x` and `y` dimensions separately), negate a vector (effectively have it pointing the other way) and subtract a vector from another. We can also scale a vector by some factor; a factor of 2 doubles it, a factor of 0.5 makes it half as long. And finally we can calculate the vector's length or magnitude. 

And that's about it for theory. Do you feel ready? You are ready. We should start doing some exercises!

## Exercises

We will start by defining a number of simple picture transformations; functions of type `Picture -> Picture`.

### Exercise 1 : turn

Your task is to define a function `turn`, which rotates a picture 90 degrees counter-clockwise around the center of its bounding box. 

Applied to the letter F, it should produce this:

<img src="files/letter-f-turned.svg" width="200" height="200">

Open the file `Picture.elm`. You'll see that the type signature for the `turn` function has already been written, along with a dummy implementation that does nothing - it just returns the picture you pass it. 

```
turn : Picture -> Picture
turn p = p 
```

The key to solving this task is to exploit the magical self-fitting nature of the picture. We know that when the box changes, the rendering changes also. So to turn the picture, all we need to do is turn the box - the picture has no choice but to follow along! It's poor ol' George all over again. So you should open `Box.elm` and define a function `turnBox` there that handles the box-turning, and then have your `turn` function call `turnBox`.

But how do you turn the box? Well, you'll want the new `a` vector to point to the bottom right corner of the original box. You can create that vector by adding the original `a` vector and the original `b` vector together. The new `b` vector needs to point straight up, just like the original `c` vector. And finally, the new `c` vector should point to the left, in the exact opposite direction as the original `b` vector. 

That's a lot of words for something quite simple. Summarized in terms of vector arithmetic, it looks like this:
```
(a’, b’, c’) = (a + b, c, -b)
```

(Of course, you'll need to substitute the vector addition 
function `add` for `+` and so forth.)

And finally, with box and arrows, it looks like this: 

<img src="files/letter-f-turned-arrows.svg" width="199" height="199">

Have you implemented `turn`? Make sure you remember to call it in `Main.elm`!

You should observe that turning a picture twice rotates it 180 degrees, and turning it four times produces the original picture. And by observe I mean try it out to verify it.

### Exercise 2 : flip

Define a function `flip`, which flips a picture about the center vertical axis of its bounding box. 

Applied to the letter F, it should produce this:

<img src="files/letter-f-flipped.svg" width="200" height="200">

The solution is once again to transform the box before passing it to the picture to produce a rendering. 

Here's how the flipped F looks with box and arrows:

<img src="files/letter-f-flipped-arrows.svg" width="199" height="199">

You should be able to work out the vector arithmetic on your own.

Note that flipping a picture twice (indeed any even number of times) produces the original picture. 

Try experimenting with combinations of flips and turns. 

### Exercise 3 : toss

Define a function `toss`, which resembles tossing a picture light-heartedly into the air! More precisely, it should rotate the picture 45 degrees around top left corner of the bounding box, and also shrink the sides of the bounding box by a factor of √2. 

Here's a visualization which includes both the original and the transformed bounding box:

<img src="files/letter-f-tossed.svg" width="235" height="235">

You don't have to work out the vector arithmetic yourself this time:

```
(a’, b’, c’) = (a + (b + c) / 2, (b + c) / 2, (c − b) / 2)
```

Whee! High up in the air!

### Exercise 4 : above

Now we'll start combining pictures to create more complex, composite pictures.

Define a function `above`, which takes two pictures `p1` and `p2` as parameters. It should produce a new picture which fills the upper half of the bounding box with `p1` and the lower half with `p2`.

Calling `above f (flip f)` should yield the following (with bounding boxes outlined for clarity):

<img src="files/above-f-flip-f-arrows.svg" width="200" height="200">

Define a more general function _aboveRatio_ that takes integers `n` and `m` as parameters, as well as `p1` and `p2` as above. The integers `n` and `m` are weights allocated to `p1` and `p2` respectively. 

Calling `aboveRatio 3 1 f (flip f)` should be interpreted as _allocate 3/4 of the original bounding box to the top picture and 1/4 to the bottom picture_, yielding the following:

<img src="files/aboveRatio-f-flip-f.svg" width="200" height="200">

Now implement `above` in terms of `aboveRatio`.

### Exercise 5 : beside

Define a function `besideRatio`, which is similar to `aboveRatio`. However, rather than placing `p1` on top of `p2`, it should place `p1` to the left of `p2`. 

Calling `besideRatio 3 5 f (flip f)` should be interpreted as _allocate 3/8 of the original bounding box to the left picture and 5/8 to the right picture_, yielding the following:

<img src="files/beside-f-flip-f-arrows-3-5.svg" width="200" height="200">

Define `beside` in terms of `besideRatio`.

What happens if you render `beside f (beside (flip f) (turn f))`? How would go about allocating an equal amount of space for three pictures?

### Exercise 6 : quartet

You might feel at this point that we're progressing slowly, and that "Square Limit" must be miles off. We still haven't seen a single fish. Despair not! We have come further along than you might think. Indeed, we are ready to leave the low-level world of vectors completely behind! Instead, we'll concentrate on using our current simple picture combinators to create more powerful ones. 

Using `above` and `beside`, define a function `quartet` which takes four pictures `nw`, `ne`, `sw`and `se` as inputs and organizes them in a 2x2 grid. The names of the pictures hint at where in the grid they should be put.

See if you can recreate this picture:

<img src="files/quartet-george.svg" width="200" height="200">

One of the most interesting and powerful properties of the combinators in Henderson's paper is that they are _closed under the means of combination_. That means that there is no difference between a "simple" picture (like F and George) and a "composite" picture like the one you just created. They're all just pictures! There are no arbitrary restrictions on what you can do with them. You're free to use a composite picture as a building block to create a more complex composite picture. To get a feel for this, try to create this picture, using the combinators we have defined so far:

<img src="files/quartet-george-pattern.svg" width="200" height="200">

(You might find the picture `blank` - which renders _nothing_ when given a bounding box - useful when creating the pattern.)

### Exercise 7 : nonet

Define a function `nonet` which is like `quartet`, except it creates a picture by organizing nine input pictures in a 3x3 grid. The `aboveRatio` and `besideRatio` functions should be helpful to accomplish this.

Test your function by creating the following image:

<img src="files/nonet-name.svg" width="200" height="200">

You'll find the letters you need defined in `Letter.elm`.

Again, a nonet is just a picture, which can be used to create more complex pictures (including nonets). See if you can create the following picture:

<img src="files/nonet-name-zoom.svg" width="200" height="200">

### Exercise 8 : over

### Exercise 9 : t-tile

### Exercise 10 : u-tile

### Exercise 11 : side

### Exercise 12 : corner

### Exercise 13 : square-limit

