#import "/typ/templates/legacy-math.typ": *
#import "/typ/templates/blog.typ": *
#import "/typ/templates/article-helpers.typ": *
#show: main.with(
  title: "Note on Computational Complexity - 1.1 Models of computation-Turing Machines",
  desc: "Notes on Turing machines, running time, and models of computation.",
  date: "2025-03-10",
  tags: ("tcs(A)", "Complexity", "note",),
  permalink: "/tcs(a)/complexity/note/1.1Turing-machines/",
  categories: ("tcs(A)", "Complexity", "note",),
  lang: "en",
)

#callout("note")[
This work is licensed under a Creative Commons Attribution 4.0 International License. Read #link("/about/by-nc-sa")[more]#linebreak() #box(image("/public/assets/license/by-nc-sa.svg", alt: "license"))
]

= Chapter 1. Models of computation
<chapter-1-models-of-computation>
== 1.1 Turing Machines
<11-turing-machines>
=== 1.1.1 Definitions
<111-definitions>
A #strong[Turing Machine] (we will use #strong[TM] in short) is a theoretical computational model introduced by Alan Turing in 1936. It is used to define the limits of what can be computed and serves as a foundation for theoretical computer science.

#divider()

#emph[Definition]: A TM, $M$, is a tuple $\(Gamma \, Q \, delta \)$ which is defined as

- A set $Gamma$ of the symbols that $M$'s tapes can contain. We assume that $Gamma$ contains a designated “blank” symbol, denoted $square.stroked$, a designated “start” symbol, denoted $triangle.stroked.small.r$ and the numbers 0 and 1. We call $Gamma$ the #emph[alphabet] of $M$.
- A set $Q$ of possible states $M$'s register can be in. We assume that $Q$ contains a designated start state, denoted $q _(#textmath[start];)$ and a designated halting state, denoted $q _(#textmath[halt];)$. #emph[Note: the states in this definition refers to the state of the whole machine. Sometimes, we may also use the word configuration to mean the same thing.]
- A function $delta :  Q  times  Gamma ^(k ) ->  Q  times  Gamma ^(k ) times  \{ #textmath[L\, S\, R];\} ^(k )$ describing the rule $M$ uses in performing each step. This function is called the #emph[transition function] of $M$.

#divider()

All tapes except for the input are initialized in their first location to the #emph[start] symbol $triangle.stroked.small.r$ and in all other locations to the #emph[blank] symbol $square.stroked$. The input tape contains initially the start symbol $triangle.stroked.small.r$, a finite non-blank string (\`\`the input''), and the rest of its cells are initialized with the blank symbol $square.stroked$. All heads start at the left ends of the tapes and the machine is in the special starting state $q _(#textmath[start];)$. This is called the #emph[start configuration] of $M$ on input $x$. Each step of the computation is performed by applying the function $delta$ as described above. The special halting state $q _(#textmath[halt];)$ has the property that once the machine is in $q _(#textmath[halt];)$, the transition function $delta$ does not allow it to further modify the tape or change states. Clearly, if the machine enters $q _(#textmath[halt];)$ then it has #emph[halted]. In complexity theory we are typically only interested in machines that halt for every input in a finite number of steps.

For calculation part, if $M$ now is in state $q$ with $A = \(alpha _(i )\)_(i in \[1 \,k \])$ are the current letters be read on $k$ tapes and $delta \(q \,A \)= delta \(q'\,B \, t \)$ where $B = \(beta _(i )\)_(i in \[1 \,k \])$ and $t in \{ #textmath[L\, S\, R];\} ^(k )$, then in next step $M$ will enter a new state $q'$ from $q$ where each word $alpha _(i )$ on the tape is replaced by $beta _(i )$ and the state of the #emph[i]-th head is changed to $z _(i )$, namely to #strong[L]eft, #strong[S]tay or to #strong[R]ight.

Some definitions of a Turing machine add additional details to the tuple, like having a limited input alphatable $Sigma supset.eq Gamma$ or an explicit set of accepting state $A subset.eq  Q$. We will include these details as needed.

For the definition of $Q$, if we allow the Turing machine to do nothing, we do not necessarily need to include an explicit halting state. Instead, we can define the machine to halt if it reaches a state where it does not move its heads, change states or any symbols on the tape. But, it is often convenient to include an explicit halting state $q _(#textmath[halt];)$ (with the convention that the machine will not do anything once it reaches this state), or, for machines that accept or reject their input, explicit accepting and rejecting states $q _(a c c )$ and $q _(r e j )$.

=== 1.1.2 Complexity
<112-complexity>
After having the definition of TM, we now can formalize the notion of running time. As every non-trivial algorithm needs to at leastread its entire input, by “quickly” we mean that the number of basic steps we use is small when considered as a function of the input length.

#divider()

#emph[Definition]:

Let $f  :  \{ 0 \,1 \} ^(\*) ->  \{ 0 \,1 \} ^(\*)$ and let $T  :  bb(N ) ->  bb(N )$ be some functions, and let $M$ be a Turing machine. We say that $M$ #emph[computes] $f$ in $T \(n \)$-#emph[time] if for every $x  in  \{ 0 \,1 \} ^(\*)$, if $M$ is initialized to the start configuration on input $x$, then after at most $T \(| x | \)$ steps it halts with $f \(x \)$ written on its output tape.

We say that $M$ #emph[computes] $f$ if it computes $f$ in $T \(n \)$ time for some function $T  :  bb(N ) ->  bb(N )$.

#divider()

#divider()

#strong[Remark:] As a convention, we require $T \(n \)gt.eq.slant  n$ for $n$ large enough(since we always need time to read the input) and if that computes the function $x -> ⌞ \(T \(n \)\)⌟$ in time $T \(n \)$ (As usual, $⌞ \(T \(n \)\)⌟$ denotes the binary representation of the number $T \(| x | \)$\.), we call it #emph[time-constructable].

#divider()

=== 1.1.3 Robustness
<113-robustness>
Using this Complexity concept, we may prove our TM with $k$ heads and tapes is same as simplest TM(i.e.~has only 1 head and a tape) up to polynomial time transformation on time and space complexity(and this blow up is inevitabe and worst case will be $5 k T ^(2 )\(n \)$).

#divider()

#emph[Proof:]

Left to readers

#divider()

=== 1.1.4 Universal Turing Machine
<114-universal-turing-machine>
