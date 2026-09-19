#import "/typ/templates/legacy-math.typ": *
#import "/typ/templates/blog.typ": *
#import "/typ/templates/article-helpers.typ": *
#show: main.with(
  title: "流形上的分析 Calculus on Manifold 笔记",
  desc: "流形、微分形式与 Stokes 定理的学习笔记。",
  date: "2025-03-19",
  cover: "/assets/images/headers/2025-03-19-Calculus on Manifold.png",
  tags: ("math", "analysis", "note",),
  permalink: "/math/analysis/note/Calculus-on-Manifold/",
  categories: ("math", "analysis", "note",),
  lang: "zh",
)

#callout("note")[
This work is licensed under a Creative Commons Attribution 4.0 International License. Read #link("/about/by-nc-sa")[more]#linebreak() #box(image("/public/assets/license/by-nc-sa.svg", alt: "license"))
]

#callout("warning")[
可能存在大量省略，错误，符号滥用，中英夹杂, Chinglish。还望读者斧正
]

#callout("caution")[
Work in progress… #linebreak() Last Update: Mar 2025
]

#callout("important")[
$f ^(♯ )$ for pull back; #linebreak() $f _(♯ )$ for push forward; #linebreak() $iota _(x )$ for interior product; #linebreak() $lr(lVert dot.c rVert )$ for norm; #linebreak() $hat(dot.c )$ for omitting this item; #linebreak() As in spivak, we use $I ^(k )$ for identity $k$-cube, i.e.~$upright(i d )\(\[0 \,1 \]^(k )\)$ #linebreak()
]

#linebreak() #linebreak() #linebreak()#linebreak()#linebreak()

= 1 Review and Preliminary
<1-review-and-preliminary>
== 1.1 Reviews
<11-reviews>
==== Proposition -1
<proposition--1>
#quote(block: true)[
Let $M$ be a $cal(C )^(1 )$ manifold of dimension $k$. Then for each point $x  in  M$, the tangent space $upright(T )_(x )M$ is a $k$-dimensional vector space.
]

#details("Proof of the Prop.")[
+ #strong[Coordinate Charts and Local Diffeomorphisms.] \ By definition of a $cal(C )^(1 )$ $k$-dimensional manifold, there exists an open set $U  subset  bb(R )^(k )$ and a $cal(C )^(1 )$ #emph[coordinate chart] $phi  colon  U  ->  M$. This map $phi$ is a homeomorphism onto its image, and its inverse $phi ^(- 1 )$ is defined on $phi \(U \)subset  M$.

+ #strong[Differential is an Isomorphism.] \ For each point $p  in  U$, the #emph[differential] (a.k.a. Jacobian matrix) of $phi$ at $p$, denoted $ upright(d )phi \(p \) colon  bb(R )^(k ) thick --> thick  upright(T )_(phi \(p \))M \, $ is a linear map from $bb(R )^(k )$ into the tangent space of $M$ at $phi \(p \)$. Since $phi$ is a $cal(C )^(1 )$ coordinate chart, its differential is a #emph[linear isomorphism] at each point $p$. In other words, $upright(d )phi \(p \)$ is invertible.

+ #strong[Dimension Count.] \ Because $upright(d )phi \(p \)$ is an isomorphism, it maps a $k$-dimensional space $bb(R )^(k )$ #emph[onto] the tangent space $upright(T )_(phi \(p \))M$. Hence \ $ dim  upright(T )_(phi \(p \))M  thick = thick  dim  bb(R )^(k ) thick = thick  k $ Renaming $phi \(p \)$ as $x  in  M$ completes the argument.

Since the point $x$ was arbitrary, this shows that every tangent space $upright(T )_(x )M$ has dimension $k$, which matches the manifold dimension.

#strong[Q.E.D.]

]
#linebreak()

==== Definition -1
<definition--1>
#quote(block: true)[
Let $A  subset  bb(R )^(n )$ and let $Theta$ be an open cover of $A$. \ Then there is a collection $Phi$ of $C ^(oo )$ functions $phi$ defined in an open set containing $A$, with the following properties:

+ #emph[For each] $x  in  A$ #emph[we have] $0  <=  phi \(x \) <=  1$.
+ #emph[For each] $x  in  A$ #emph[there is an open set] $V$ #emph[containing] $x$ #emph[such that all but finitely many] $phi  in  Phi$ #emph[are 0 on] $V$.
+ #emph[For each] $x  in  A$ #emph[we have] \ $ sum _(phi  in  Phi ) phi \(x \) =  1 $ \ #emph[\(by (2), for each] $x$ #emph[this sum is finite in some open set containing] $x$).
+ #emph[For each] $phi  in  Phi$ #emph[there is an open set] $U$ #emph[in] $Theta$ #emph[such that] \ $ phi  =  0  quad  #textmath[outside of some closed set contained in ]; U . $ A collection $Phi$ satisfying (1) to (3) is called a $C ^(oo )$ #underline[#strong[partition of unity]] for $A$. \ If $Phi$ also satisfies (4), it is said to be #underline[#strong[subordinate]] to the cover $Theta$. We will only use continuity of the functions $phi$.
]

In the rest of notes, we will take these things as granted.

== 1.2 Fundamental Calculus Theorem
<12-fundamental-calculus-theorem>
==== Definition 0
<definition-0>
#quote(block: true)[
Let $omega$ be a $k$ form on $\[0 \,1 \]^(k )$ with a unique function $f$ such that $omega = f upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(n )$. Then, we define $ integral _(\[0 \,1 \]^(k ))omega = integral _(\[0 \,1 \]^(k ))f $ i.e.~$ integral _(\[0 \,1 \]^(k ))f upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(n )= integral _(\[0 \,1 \]^(k ))f thick upright(d )x ^(1 )dots.h.c  upright(d )x ^(n ) $ If $omega$ is a $k$-form on $A$ and $c$ is a singular $k$-cube on $A$, we define $ integral _(c ) omega = integral _(\[0 \,1 \]^(k )) c ^(♯ ) f $
]

In particular, we have $ aligned(
integral _(I ^(k ))f upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(n ) &=  integral _(\[0 \,1 \]^(k )) I ^(♯ ) \(f upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(n )\)\ 
&= integral _(\[0 \,1 \]^(k ))f upright(d )x ^(1 )dots.h.c  upright(d )x ^(n )
) $ as expected. For $k = 0$, we also know $ integral _(c ) omega = omega \(c \(0 \)\) $ as a 0-form is a function and a 0 cube is a map from $\{ 0 \} ->  A$.

Therefore, we may introduce following important thm:

==== Theroem 1(Fundamental Calculus Thm / Stokes)
<theroem-1fundamental-calculus-thm--stokes>
#quote(block: true)[
Let $omega$ be a $cal(C ^(1 ))thick  k - 1$-form on an open set $A subset  bb(R )^(n )$ and $c$ be a $k$ chain in $A$. Then we have: $ integral _(c )upright(d )omega = integral _(partial  c )omega $
]

#details("Proof of the Thm.")[
Suppose $c = sum  a _(i )c _(i )$ where $c _(i )$ is singular $k$ cube. Then we have $ integral _(c )upright(d )omega = sum  a _(i )integral _(c _(i ))upright(d )omega = sum  a _(i )integral _(I ^(k ))c _(i )^(♯ ) upright(d )omega = integral _(I ^(k ))upright(d )\(c _(i )^(♯ )omega \) $ and $ integral _(partial  c )omega = sum  a _(i )integral _(partial  c _(i ))omega = sum  a _(i )integral _(partial  I ^(k ))c _(i )^(♯ )omega $ Thus, it is suffice to show $ integral _(I ^(k ))upright(d )omega = integral _(partial  I ^(k ))omega $ for standrad $k$ cube $I ^(k )$. Likewise, we may simplify the $omega$ into following type $k - 1$-form $ f upright(d )x ^(1 )and dots.h.c and hat(upright(d )x _(i ))and dots.h.c and  upright(d )x ^(k ) $ Notice that $ aligned(
integral _(partial  I ^(k ))f upright(d )x ^(1 )and dots.h.c and hat(upright(d )x _(i ))and dots.h.c and  upright(d )x ^(k )&= sum _(j = 1 )^(k )sum _(alpha = 0 )^(1 )\(- 1 \)^(j + alpha )integral _(I ^(k )_(\(j \,alpha \)))f upright(d )x ^(1 )and dots.h.c and hat(upright(d )x _(i ))and dots.h.c and  upright(d )x ^(k )\ 
&= sum _(j = 1 )^(k )sum _(alpha = 0 )^(1 )\(- 1 \)^(j + alpha )integral _(\[0 \,1 \]^(k - 1 ))lr(\( I ^(k )_(\(j \,alpha \))\) )^(♯ ) f upright(d )x ^(1 )and dots.h.c and hat(upright(d )x _(i ))and dots.h.c and  upright(d )x _(k )\ 
&= sum _(j = 1 )^(k )sum _(alpha = 0 )^(1 )\(- 1 \)^(j + alpha )integral _(\[0 \,1 \]^(k - 1 ))f \(x _(1 )\,dots.h.c \,alpha \,dots.h.c \,x _(k )\)upright(d )x ^(1 )and dots.h.c and hat(upright(d )x _(i ))and dots.h.c and  upright(d )x _(k )\ 
&= \(- 1 \)^(i )integral _(\[0 \,1 \]^(k - 1 ))f \(x _(1 )\,dots.h.c \,0 \,dots.h.c \,x _(k )\)thick upright(d )x ^(1 )dots.h.c hat(upright(d )x _(i ))dots.h.c  upright(d )x ^(k ) \ 
&thick thick thick thick +  \(- 1 \)^(i + 1 )integral _(\[0 \,1 \]^(k - 1 ))f \(x _(1 )\,dots.h.c \,1 \,dots.h.c \,x _(k )\)thick upright(d )x ^(1 )dots.h.c hat(upright(d )x _(i ))dots.h.c  upright(d )x ^(k )
) $ Also, we may conclude that $ aligned(
integral _(I ^(k ))upright(d )\(f upright(d )x ^(1 )and dots.h.c and hat(upright(d )x _(i ))and dots.h.c and  upright(d )x ^(k )\)&= integral _(I ^(k ))frac(partial  f ,partial  x _(i ))and  upright(d )x _(i )and  upright(d )x ^(1 )and dots.h.c and hat(upright(d )x _(i ))and dots.h.c and  upright(d )x ^(k )\ 
&= \(- 1 \)^(i - 1 )integral _(\[0 \,1 \]^(k ))frac(partial  f ,partial  x _(i )) upright(d )x ^(1 )dots.h.c  upright(d )x ^(k )\ 
&= \(- 1 \)^(i - 1 )integral _(\[0 \,1 \]^(k - 1 ))\(f \(x _(1 )\,dots.h.c \,1 \,dots.h.c \,x _(k )\)- f \(x _(1 )\,dots.h.c \,0 \,dots.h.c \,x _(k )\)\) upright(d )x ^(1 )dots.h.c hat(upright(d )x _(i ))dots.h.c  upright(d )x ^(k )quad #textmath[Using FCT in 1 dim];\ 
) $ Compare these eqs, it is clearly that $ integral _(c )upright(d )omega = integral _(partial  c )omega $

#strong[Q.E.D.]

]
#linebreak()

#divider()

= 2 Integration on Manifold
<2-integration-on-manifold>
#callout("note")[
In this section, if we do not specify the differentiability of manifold, then it will be a smooth manifold.
]

== 2.1 Independence of Parametrization
<21-independence-of-parametrization>
Talking about Stokes' theorem, what we are really interested in is not Stokes' theorem on $k$-cubes or on chains but on #emph[manifolds], where we are going to be comparing the integral on a manifold to the integral on its boundary.To do that,we are going to have to adapt all our machinery for differential forms to work with manifolds. But first, let's cover an important point about integration over $k$-chains. Let's say $c$ is a $C ^(1 )$ singular $k$-cube in $bb(R )^(n )$, and we want to look at a re-parametrization, i.e.~a map $ p :  \[0 \,1 \]^(k ) ->  \[0 \,1 \]^(k ) $ which is $C ^(1 )$, one-to-one, onto, and $det  p'\(x \) >=  0$, i.e.~the Jacobian does not reverse orientations. If $omega$ is a $k$-form then $ integral _(c ) omega  =  integral _(c  compose  p ) omega $ You should compare this with the situation with functions: what if we were integrating a function over $p \(\[0 \,1 \]^(k )\) =  \[0 \,1 \]^(k )$. You would have to say there's a change of variable formula $ integral _(\[0 \,1 \]^(k )) f  compose  p  |  det  p' |  =  integral _(p \(\[0 \,1 \]^(k )\)) f $ This is clearly a very different case, and indeed why differential forms are the "natural" thing to integrate over: the formula for change of variables is "built in" to the definition. Let's see how:

#details("Details.")[
Following the definition, we know that $ integral _(c  compose  p ) omega = integral _(\[0 \,1 \]^(k ))p ^(♯ )compose  c ^(♯ )omega $ As we know $c ^(♯ )omega = f upright(d )x _(1 )dots.h.c  upright(d )x _(k )$, we have $ aligned(
p ^(♯ )compose  c ^(♯ )omega &= p ^(♯ )\(f upright(d )x _(1 )dots.h.c  upright(d )x _(k )\)\ 
&= f compose  p dot.c det  J _(p )upright(d )x _(1 )dots.h.c  upright(d )x _(k )
) $ Because $det  J _(p )>=  0$, we may apply change of variable formula here and conclude that $ integral _(c  compose  p ) omega = integral _(\[0 \,1 \]^(k ))p ^(♯ )compose  c ^(♯ )omega = integral _(\[0 \,1 \]^(k ))f compose  p dot.c det  J _(p )upright(d )x _(1 )dots.h.c  upright(d )x _(k )= integral _(c ) omega $

#strong[Q.E.D.]

]
#linebreak()

== 2.2 Integration of forms
<22-integration-of-forms>
=== 2.2.1 Vector Field and forms on a Manifold
<221-vector-field-and-forms-on-a-manifold>
==== Definition 1
<definition-1>
#quote(block: true)[
A #underline[#strong[vector field]] $F$ on manifold $M$ is a funtion $F : M ->  N$ such that $ forall  x in  M \,thick  F \(x \)in upright(T )_(x )M $
]

Recall the definition of a $cal(C )^(r )$ coordinate chart $phi : W subset bb(R )^(k )->  M subset bb(R )^(n )$ where $dim  M = k$. The derivative of it induces an isomorphism of vector spaces $ phi _(♯ \(a \))= D phi _(a ): upright(T )_(a )bb(R )^(k )-> upright(T )_(phi \(a \))M $ and there exist an unique vector field $G$ such that $ phi _(♯ \(a \))\(G \(a \)\)= F \(phi \(a \)\) $ We say that $F in cal(C )^(r )$ iff $G in cal(C )^(r )$ for any coordinate charts. Note that this definition is independence from the choice of coordinate charts.

#details("Details.")[
#strong[Existence]

Since $phi _(♯ \(a \)):  upright(T )_(a )bb(R )^(k ) ->  upright(T )_(phi \(a \))\(M \)$ is a linear isomorphism and $F \(phi \(a \)\) in  upright(T )_(phi \(a \))M$, there exists a unique vector $xi  in  upright(T )_(a )bb(R )^(k )$ such that $ phi _(♯ \(a \))\(xi \) =  F \(phi \(a \)\). $ We define $G \(a \) : =  xi$. Because $phi _(♯ \(a \))$ is an isomorphism, this choice of $xi$ is unique. Thus, we can define a vector field $G :  W  ->  T \(bb(R )^(k )\)$ by repeating this construction at each point $a  in  W$.

#strong[Uniqueness]

Suppose there exists another vector field $tilde(G )$ on $W$ such that $ phi _(♯ \(a \))\(tilde(G )\(a \)\) =  F \(phi \(a \)\) quad  #textmath[for all ]; a  in  W . $ Then define $H \(a \) : =  G \(a \) -  tilde(G )\(a \)$. We have $ phi _(♯ \(a \))\(H \(a \)\) =  phi _(♯ \(a \))\(G \(a \) -  tilde(G )\(a \)\) =  phi _(♯ \(a \))\(G \(a \)\) -  phi _(♯ \(a \))\(tilde(G )\(a \)\) =  0 . $ Since $phi _(♯ \(a \))$ is injective, it follows that $H \(a \) =  0$ for all $a$, and thus $G \(a \) =  tilde(G )\(a \)$. Therefore, $G$ is unique.

#strong[Independence of Coordinate Charts]

Let $psi :  V  ->  M$ be another coordinate chart such that for some smooth map $gamma :  W  ->  V$, we have $ phi \(a \) =  psi \(gamma \(a \)\) quad  #textmath[for all ]; a  in  W . $ Let $H$ be the vector field corresponding to $F$ in coordinates via $psi$, i.e., $ F \(psi \(b \)\) =  psi _(♯ \(b \))\(H \(b \)\) quad  #textmath[for ]; b  in  V . $ Then, we compute: $ aligned(
G \(a \) &=  phi _(♯ \(a \))^(- 1 )\(F \(phi \(a \)\)\) \ 
&=  phi _(♯ \(a \))^(- 1 )\(F \(psi \(gamma \(a \)\)\)\) \ 
&=  phi _(♯ \(a \))^(- 1 )\(psi _(♯ \(gamma \(a \)\))\(H \(gamma \(a \)\)\)\). 
) $ Since both $phi _(♯ \(a \))^(- 1 )$ and $psi _(♯ \(gamma \(a \)\))$ are smooth such that they preserve differentiability, it follows that $G  in  cal(C )^(r )$ if and only if $H  in  cal(C )^(r )$.#linebreak()

#strong[Q.E.D.]

]
#linebreak()

Now, let us consider differential forms on a manifold.

==== Definition 2
<definition-2>
#quote(block: true)[
A #underline[#strong[p-form]] $omega$ on manifold $M$ is a funtion $omega$ which assigns $omega \(x \)in Omega ^(k )\(upright(T )_(x )M \)$ for every $x in  M$.
]

Like vector field, we define $omega$ to be $cal(C )^(r )$ if $phi ^(♯ )omega$ is $cal(C )^(r )$ for any coordinate chart $phi$.

#details("Details.")[
Consider two coordinate charts \ $ phi :  W  ->  M \, quad  psi :  V  ->  M . $ \ On the overlap of their images, we can write: $ psi  =  phi  compose  phi ^(- 1 ) compose  psi \, $ which implies that for a differential form $omega$ defined on $M$, the pullbacks satisfy: $ psi ^(♯ ) omega  =  omega  compose  \(phi  compose  phi ^(- 1 ) compose  psi \) =  \(psi  compose  phi ^(- 1 )\)^(♯ ) \(phi ^(♯ ) omega \). $ Since pullbacks along smooth maps preserve differentiability, and $psi  compose  phi ^(- 1 )$ is a smooth transition map between coordinate charts, it follows that $psi ^(♯ ) omega$ and $phi ^(♯ ) omega$ have the same differentiability class.

#strong[Q.E.D.]

]
#linebreak()

Just like the forms on $bb(R )^(n )$, we have following proposition:

==== Proposition 1
<proposition-1>
#quote(block: true)[
#emph[If $omega$ is a $cal(C )^(r )$ $p$-form on $M$, then there is a unique $cal(C )^(r - 1 )$ $\(p + 1 \)$-form $upright(d )omega$ on $M$ such that] $ phi ^(♯ )\(upright(d )omega \) =  upright(d )\(phi ^(♯ ) omega \) $ for every coordinate chart $phi : W ->  M$.
]

#details("Proof of the Prop.")[
Let $omega$ be a $p$-form on $M$. We wish to define a $\(p + 1 \)$-form $upright(d )omega$ on $M$ by using local coordinate charts.#linebreak()

#strong[Local Definition via a Coordinate Chart]

Consider a coordinate chart $phi :  W  ->  M$ such that $a  in  phi \(W \)$. We define $ \(upright(d )omega \)\(a \)\(mitexmathbf(v )\) thick : = thick 
upright(d )big(\()phi ^(♯ ) omega big(\))big(\()phi ^(- 1 )\(a \)big(\))big(\()mitexmathbf(w )big(\))\, $ where $mitexmathbf(v ) =  \(mitexmathbf(v )_(1 )\, dots.h \, mitexmathbf(v )_(p + 1 )\)$ is an ordered $\(p + 1 \)$-tuple of tangent vectors at $a$, and $ mitexmathbf(w )_(i ) thick = thick  upright(d )phi _(x )big(\()mitexmathbf(v )_(i )big(\))
quad #textmath[with ]; x  =  phi ^(- 1 )\(a \). $ Here, $phi ^(♯ ) omega$ denotes the pullback of $omega$ to $W  subset  bb(R )^(k )$, and $upright(d )big(\()phi ^(♯ ) omega big(\))$ is the exterior derivative of $phi ^(♯ ) omega$ in the standard Euclidean space $bb(R )^(k )$.#linebreak()

Clearly, if this procedure is well-defined (i.e., independent of the chosen chart) and yields a unique $\(p + 1 \)$-form on $M$, then we have defined $upright(d )omega$ correctly in global coordinates.

#strong[Independence of the Coordinate Chart]

Let $upright(d )^(phi )omega$ denote the $\(p + 1 \)$-form arising from the above construction using the chart $phi$. Suppose we choose another chart $psi  :  V  ->  M$ with overlapping image, and let $upright(d )^(psi )omega$ be the corresponding definition on $psi \(V \)$. #linebreak()

Define the transition map $ h  thick : = thick  psi ^(- 1 ) compose  phi  :  W  thin -> thin  V \, $ which is smooth on the overlap of $phi \(W \)$ and $psi \(V \)$. Then for $x$ in the overlap, we have $ aligned(
upright(d )^(psi ) omega \(x \)
&=  upright(d )big(\()psi ^(♯ ) omega big(\))big(\()psi ^(- 1 )\(x \)big(\)) \ 
&=  upright(d )big(\()psi ^(♯ ) omega big(\))big(\()h compose  phi ^(- 1 )\(x \)big(\)) \ 
&=  upright(d )Big(\()h ^(♯ )big(\()psi ^(♯ ) omega big(\))Big(\))negthinspace big(\()phi ^(- 1 )\(x \)big(\)) \ 
&=  upright(d )Big(\()\(psi  compose  psi ^(- 1 ) compose  phi \)^(♯ ) omega Big(\))negthinspace big(\()phi ^(- 1 )\(x \)big(\)) \ 
&=  upright(d )big(\()phi ^(♯ ) omega big(\))big(\()phi ^(- 1 )\(x \)big(\))
thick = thick  upright(d )^(phi )omega big(\()x big(\)). 
) $ Thus, $upright(d )^(phi )omega  =  upright(d )^(psi )omega$ on the overlap region. Since every point of $M$ is contained in at least one coordinate patch, and any two such patches overlap in a region where the definitions agree, it follows that $upright(d )^(phi )omega$ is independent of the chart $phi$. This justifies the notation $upright(d )omega$.

#strong[Uniqueness of the $\(p + 1 \)$-Form]

Suppose there is another $\(p + 1 \)$-form $eta$ on $M$ such that for every coordinate chart $phi$, $ phi ^(♯ )\(eta \) thick = thick  upright(d )big(\()phi ^(♯ )omega big(\)). $ Then, for each $phi$, $ phi ^(♯ )\(eta  thin - thin  upright(d )omega \)
thick = thick  phi ^(♯ )\(eta \) thick - thick  upright(d )big(\()phi ^(♯ ) omega big(\))
thick = thick  0 . $ If the pullback of $eta  -  upright(d )omega$ is zero in every coordinate system, it means $eta  -  upright(d )omega$ vanishes on each coordinate patch. Hence, by the sheaf property (or the formary fact that if a form vanishes in each coordinate system, it must vanish globally), \ $ eta  thick - thick  upright(d )omega  thick = thick  0 
quad #textmath[on ]; M . $ Consequently, $eta  =  upright(d )omega$. This shows that our construction yields a unique $\(p + 1 \)$-form on $M$.#linebreak()

#strong[Q.E.D.]

]
#linebreak()

=== 2.2.2 Orientation of a manifold
<222-orientation-of-a-manifold>
It is often necessary for us to choose an orientation $mu _(x )$ for each tangent space $upright(T )_(x )M$ of a manifold $M$. Thus, we may define the orientation of manifold based on this.

==== Definition 3
<definition-3>
#quote(block: true)[
An orientation of a manifold is given by a #underline[#strong[consistent]] choices of orientations $mu _(x )$ on each tangent space $upright(T )_(x )M$, i.e.~for every coordinate chart $phi : W -> bb(R )^(n )$ and for any $a \,b in  W$, the relation $ \[phi _(♯ \(a \))\(e _(1 \,a )\)\,dots.h.c \,phi _(♯ \(a \))\(e _(n \,a )\)\]= mu _(phi \(a \)) $ holds if and only if $ \[phi _(♯ \(b \))\(e _(1 \,b )\)\,dots.h.c \,phi _(♯ \(b \))\(e _(n \,b )\)\]= mu _(phi \(b \)) $
]

#callout("note")[
If $W$ is not connected, the definition is wrong as no manifold would be orientable. Here is one #link("https://math.stackexchange.com/questions/3628865/mistake-in-spivaks-definition-of-a-consistent-orientation-on-a-manifold")[example]. Hence, $W$ in this definition, we just let them be as much connected as we want.
]

Based on this, were going to call a given coordinate chart either orientation preserving or orientation reversing.

==== Definition 4
<definition-4>
#quote(block: true)[
A coordinate chart $phi  :  W  ->  bb(R )^(k )$ is #underline[#strong[orientation preserving]] if $ \[phi _(♯ a )\(e _(1 \,a )\)\, dots.h \, phi _(♯ a )\(e _(k \,a )\)\] =  mu _(phi \(a \)) $ for one point $a$ , and hence for every point $a in  W$. If $phi  :  W  ->  bb(R )^(k )$ is #underline[#strong[orientation reversing]] (i.e.~#emph[not] orientation preserving) and $T  :  bb(R )^(k ) ->  bb(R )^(k )$ is a linear transformation with $det  T  <  0$, then $phi  compose  T$ is orientation preserving.
]

#details("why?")[
#strong[Orientation in $bb(R )^(k )$]

Recall that an orientation $mu _(phi \(a \))$ at a point $phi \(a \)in bb(R )^(k )$ can be identified with an ordered orthonormal basis $\[v _(1 )\, dots.h \, v _(k )\]$. In particular, there exists a unique volume form $omega$ up to scalar such that:

+ $omega \(v _(1 )\, dots.h \, v _(k )\) =  1$ whenever $\[v _(1 )\, dots.h \, v _(k )\]$ is the positively oriented orthonormal basis corresponding to $mu _(phi \(a \))$. \
+ $omega \(L thin mitexmathbf(v )\) =  det \(L \)thin omega \(mitexmathbf(v )\)$ for every linear transformation $L$ and every $k$-tuple of vectors $mitexmathbf(v ) =  \(v _(1 )\, dots.h \, v _(k )\)$.

#strong[Determinant and Orientation]

From this setup, for a coordinate chart $phi :  W  ->  bb(R )^(k )$ and standard basis $e _(1 )\, dots.h \, e _(k )$ in $bb(R )^(k )$, we have: $ big(\[)phi _(♯ a )\(e _(1 \,a )\)\, dots.h \, phi _(♯ a )\(e _(k \,a )\)big(\])
thick = thick 
omega big(\()phi _(♯ a )\(e _(1 \,a )\)\, dots.h \, phi _(♯ a )\(e _(k \,a )\)big(\)). $ By the defining property of $omega$, $ omega big(\()phi _(♯ a )\(e _(1 \,a )\)\, dots.h \, phi _(♯ a )\(e _(k \,a )\)big(\))
thick = thick 
det big(\()D phi \(a \)big(\))thin omega big(\()e _(1 )\, dots.h \, e _(k )big(\))
thick = thick 
det big(\()D phi \(a \)big(\))thin mu _(phi \(a \)). $ Hence, a coordinate chart $phi$ preserves orientation if and only if $det \(D phi \(a \)\) >  0$ for all $a$. If $det \(D phi \(a \)\) <  0$ for some $a$, then $phi$ reverses the orientation at that point.

#strong[Composition with an Orientation-Reversing Chart]

Finally, suppose $phi$ is an orientation-reversing chart. Let $T$ be another smooth map (often a linear transformation in examples). Then, for $x$ in the domain of $T$, we compute the determinant of the composition: $ det big(\()D \(phi  compose  T \)\(x \)big(\))
thick = thick 
det Big(\()upright(d )phi _(T \(x \)) thin compose thin  upright(d )T _(x )Big(\))
thick = thick 
det big(\()upright(d )phi _(T \(x \))big(\))thick dot.c thick det big(\()T big(\)). $ In situations where $det \(upright(d )phi _(T \(x \))\)$ is negative and $det \(T \)$ is also negative , their product can be nonnegative, illustrating how the combined map may preserve, reverse, or degenerate the orientation.#linebreak()

#strong[Q.E.D.]

]
#linebreak()

Suppose now $phi \, psi$ are two coordinate systems such that $phi \(a \) =  psi \(b \)$ and $ \[phi _(♯ \(a \))\(e _(1 \,a )\)\, dots.h \, phi _(♯ \(a \))\(e _(k \,a )\)\] =  mu _(x ) =  \[psi _(♯ \(b \))\(e _(1 \,b )\)\, dots.h \, psi _(♯ \(b \))\(e _(k \,b )\)\] $ then $det \(\(phi ^(- 1 )compose psi \)'\(b \)\) >  0$ (at every point in the overlap $phi \(W \) inter  psi \(V \)$). So every orientable manifold can be covered by orientation preserving coordinate charts (i.e.~orientation preserving with respect to a consistent choice of orientations).

We now obtain the following definitions:

==== Definition 5
<definition-5>
#quote(block: true)[
A manifold for which orientations $mu _(x )$ can be chosen consistently is called #underline[#strong[orientable]], and a particular choice of the $mu _(x )$ is called an #underline[#strong[orientation]] $mu$ of M. A manifold together with an orientation is called an #underline[#strong[oriented manifold]].
]

There is a famous example of non-orientable manifold, #emph[Mobius strip]. However, in this chapter we still can not prove this rigourously.

== 2.3 Manifold with Boundry
<23-manifold-with-boundry>
=== 2.3.1 Review of definitions about Manifold with Boundry
<231-review-of-definitions-about-manifold-with-boundry>
Recall following definitions about manifold with boundry:

==== Definition 6
<definition-6>
#quote(block: true)[
A #underline[#strong[half space]] $bb(H )^(k )subset bb(R )^(k )$ is given by $ \{ mitexmathbf(x )| mitexmathbf(x )_(i )> 0 \} $
]

==== Definition 7
<definition-7>
#quote(block: true)[
A subset $M  subset.eq  bb(R )^(n )$ is a $k$-dimensional $cal(C )^(r )$ #underline[#strong[manifold-with-boundary]] if for every $a  in  M$, there is an open neighborhood $U$ of $a$ in $bb(R )^(n )$, an open subset $V$ of $bb(R )^(n )$ and a $cal(C )^(r )$ diffeomorphism $h  :  U  ->  V$ such that either

#block[
#set enum(numbering: "(1)", start: 1)
+ The usual condition for a manifold, $ h \(M  inter  U \) =  V  inter  \(bb(R )^(k ) times  \{ 0  in  bb(R )^(n - k )\} \) $

+ The manifold looks like a half space around $a$, i.e. $ h \(M  inter  U \) =  V  inter  \(bb(H )^(k ) times  \{ 0  in  bb(R )^(n - k )\} \) =  \{  y  =  \(y _(1 )\, dots.h \, y _(n )\) :  y _(1 )\, dots.h \, y _(k ) >=  0  and  y _(k + 1 ) =  dots.h  =  y _(n ) =  0  \} $
]

holds
]

#details("Well-defined?")[
One may ask that if (1) and (2) can be satisfied at a same point $a$. The answer is no.

Suppose, for the sake of contradiction, that there exists a point $a$ such that both conditions (1) and (2) are satisfied in neighborhoods of $a$. Thus, we have:

+ A diffeomorphism $h _(1 ) :  U _(1 ) ->  V _(1 )$ satisfying condition (1) on an open neighborhood $U _(1 )$ of $a$. \
+ A diffeomorphism $h _(2 ) :  U _(2 ) ->  V _(2 )$ satisfying condition (2) on an open neighborhood $U _(2 )$ of $a$.

Since $a  in  U _(1 ) inter  U _(2 )$, we may replace $U _(1 )$ and $U _(2 )$ with smaller open sets (if necessary) so that $ U  thick = thick  U _(1 ) thin inter thin  U _(2 ) $ is an open neighborhood of $a$ on which $h _(1 )$ and $h _(2 )$ remain diffeomorphisms. Denote $ V _(1 )' thick = thick  h _(1 )\(U \)\, 
quad  
V _(2 )' thick = thick  h _(2 )\(U \). $ Consider the map $ f  thick = thick  h _(2 ) compose  h _(1 )^(- 1 ) thick : thick  V _(1 )' thin --> thin  V _(2 )'. $ Since $h _(1 )$ and $h _(2 )$ are diffeomorphisms, $f$ is itself a $cal(C )^(r )$-diffeomorphism and therefore a homeomorphism onto its image.

As

- By condition (1), $V _(1 )'$ locally resembles $bb(R )^(k ) times  \{ 0 \} ^(n - k )$ in a way that is $cal(C )^(r )$-diffeomorphic. \
- By condition (2), $V _(2 )'$ locally resembles $bb(H )^(k ) times  \{ 0 \} ^(n - k )$ (where $bb(H )^(k )$ is a half-space in $bb(R )^(k )$) in a way that is $cal(C )^(r )$-diffeomorphic.

under $f$, the set $ V _(1 )' thin inter thin  big(\()bb(R )^(k ) times  \{ 0 \} ^(n - k )big(\)) $ (an open neighborhood in $bb(R )^(k )$) must map to $ V _(2 )' thin inter thin  big(\()bb(H )^(k ) times  \{ 0 \} ^(n - k )big(\))\, $ which is a set open in $bb(H )^(k )$ (in its subspace topology) but not open in the standard topology of $bb(R )^(k )$. Since a homeomorphism preserves topological openness, this situation is impossible. The image of an open set in $bb(R )^(k )$ under $f$ would have to remain open in $bb(R )^(k )$, contradicting the fact that $bb(H )^(k )$ is not open in $bb(R )^(k )$.

Thus, our assumption that conditions (1) and (2) both hold at $a$ leads to a topological contradiction. Therefore, no single point $a$ in the manifold can satisfy both conditions simultaneously.

#strong[Q.E.D.]

]
#linebreak()

Once weve established this result, we can really distinguish these two kinds of points. That means, precisely, that we can make the following definitions

==== Definition 8
<definition-8>
#quote(block: true)[
The #underline[#strong[boundary]] of a manifold $M$, written as $partial  M$, is the set of points satisify (2) in #link(<definition-7>)[#strong[Definition 7]]
]

Notice that under this definition, $upright(T )_(x )partial  M$ will be a $k - 1$ dim subspace of $upright(T )_(x )M$ when $dim  M = k$. Thus there are exactly two unit vectors in $upright(T )_(x )M$ are perpendicular to.

=== 2.3.2 More with Manifold with Boundry
<232-more-with-manifold-with-boundry>
As we can see, the definitions for vector fields, forms, and orientations all make sense in this new context. There are furthermore 2 unit vectors in $upright(T )_(x )M$ perpendicular to $upright(T )_(x )partial  M$ (pointing in exactly opposite directions).

Let $phi : W inter bb(H )^(k )-> bb(R )^(n )$ be a coordinate chart for $M$ where $W subset bb(R )^(k )$, and assume $ phi \(a \)= x in partial  M $ Then the exactly one of these unit vectors can be written into $ phi _(♯ \(a \))\(v _(a )\) $ for some $v _(a )in upright(T )_(a )bb(R )^(k )$ and $v _(a )^(k )lt.eq.slant  0$.

==== Definition 9
<definition-9>
#quote(block: true)[
We define this vector to be the #underline[#strong[outward unit normal]] at $x$, written as $n \(x \)$.
]

Note that this definition is independent of the coordinate system chosen.

#details("check")[
#strong[Setup and Transition Map]

Since $f$ and $g$ are diffeomorphisms onto their images in $M$, define the local transition map $ gamma  thick = thick  g ^(- 1 ) compose  f \, $ whose domain is $f ^(- 1 )big(\()upright(I m )\(g \)big(\))$ and codomain is $g ^(- 1 )big(\()upright(I m )\(f \)big(\))$. By construction, $gamma$ is a $cal(C )^(r )$ diffeomorphism between open subsets of $bb(R )^(k )$, and $ gamma \(0 \) 
thick = thick  
g ^(- 1 )big(\()f \(0 \)big(\)) 
thick = thick  
g ^(- 1 )\(x \) 
thick = thick  
0 . $

#strong[Half‐Space Condition]

Both $f$ and $g$ are #emph[half‐space charts], meaning:

- $f \(\{ thin t _(k )= 0 \} \) subset  partial  M$ and $f \(\{ thin t _(k )> 0 \} \) subset  M  without  partial  M$. \
- $g \(\{ thin s _(k )= 0 \} \) subset  partial  M$ and $g \(\{ thin s _(k )> 0 \} \) subset  M  without  partial  M$.

Because $gamma  =  g ^(- 1 ) compose  f$, it follows that if $\(t _(1 )\,dots.h \,t _(k )\)$ lies in $\{ t _(k )= 0 \}$, then $f \(t _(1 )\,dots.h \,t _(k )\) in  partial  M$. Consequently, \ $ gamma big(\()\{ thin t _(k )= 0 \} big(\))
thick subset thick  
\{ thin s _(k )= 0 \} . $ Similarly, $gamma$ preserves the interior condition $\{ t _(k )> 0 \} |->  \{ s _(k )> 0 \}$. Altogether, $ gamma big(\()\{ thin t _(k )>=  0 \} big(\)) 
thick subset thick  
\{ thin s _(k )>=  0 \} . $

#strong[Tangent Cones and Their Images]

Denote by $H _(0 )^(k ) subset  upright(T )_(0 )bb(R )^(k )$ the set of all velocity vectors $alpha'\(0 \)$ of curves $alpha \(t \)subset  \{ t _(k )>=  0 \}$ with $alpha \(0 \)= 0$. Equivalently, $H _(0 )^(k )$ is the #emph[tangent cone] of the closed half‐space $\{ t _(k )>=  0 \}$ at the origin. Since $ gamma big(\()\{ thin t _(k )>=  0 \} big(\))
thick subset thick  
\{ thin s _(k )>=  0 \} \, $ any curve $alpha$ in $\{ t _(k )>=  0 \}$ has its image $gamma compose  alpha$ in $\{ s _(k )>=  0 \}$. Taking derivatives at $0$ shows: $ \(gamma  compose  alpha \)'\(0 \) 
thick = thick  
D gamma \(0 \)dot.c  alpha'\(0 \)
thick in thick  
H _(0 )^(k )\, $ so $D gamma \(0 \)\(H _(0 )^(k )\) subset  H _(0 )^(k )$. By applying the same argument to $gamma ^(- 1 )$ (which is also a diffeo), we deduce $ big(\()D gamma \(0 \)big(\))^(- 1 )\(H _(0 )^(k )\) thick subset thick  H _(0 )^(k )
quad ==> quad 
D gamma \(0 \)\(H _(0 )^(k )\) thick = thick  H _(0 )^(k ). $ Hence $D gamma \(0 \)$ is a linear isomorphism from $H _(0 )^(k )$ onto itself.

#strong[Consistency of the Pushed‐Forward Subspaces]

From $gamma  =  g ^(- 1 )compose  f$, we write $ f _(♯ )\(H _(0 )^(k )\) 
thick = thick  
\(g compose  gamma \)_(♯ )\(H _(0 )^(k )\) 
thick = thick  
g _(♯ )big(\()gamma _(♯ )\(H _(0 )^(k )\)big(\)). $ But $gamma _(♯ )\(H _(0 )^(k )\)$ is exactly $H _(0 )^(k )$ again, so $ f _(♯ )\(H _(0 )^(k )\) 
thick = thick  
g _(♯ )\(H _(0 )^(k )\). $ Thus both charts $f$ and $g$ push forward the #emph[same] $k$-dimensional cone in $upright(T )_(x )bb(R )^(n )$, which reflects the tangent‐plus‐normal decomposition at $x$.

#strong[Uniqueness of the Normal Direction]

Within this common $k$-dimensional space, the direction of $tfrac(partial ,partial  t _(k ))$ is precisely the one #emph[normal] to $partial  M$. Concretely, the subspace spanned by $\{ tfrac(partial ,partial  t _(1 ))\, dots.h \, tfrac(partial ,partial  t _(k - 1 ))\}$ projects onto $upright(T )_(x )\(partial  M \)$, leaving the line spanned by $tfrac(partial ,partial  t _(k ))$ as the normal complement. Since both charts determine the #emph[same] pushforward space, they also determine the #emph[same] normal line. By convention, we take the positively oriented side to define the #strong[outward] normal direction.

Therefore, the outward normal vector at $x$ (up to positive scaling) given by $f$ agrees with that given by $g$. This shows that the outward normal on $partial  M$ is #strong[independent] of the choice of half‐space boundary chart, provided those charts align on the same side of $partial  M$.

#strong[Q.E.D.]

]
#linebreak()

==== Definition 10
<definition-10>
#quote(block: true)[
The #underline[#strong[induced orientation]] of $partial  M$ is given by, for each $a  in  partial  M$, choosing $ v _(1 )\, dots.h \, v _(k - 1 ) in  \(partial  M \)_(a ) $ such that $ \[n \(a \)\, v _(1 )\, dots.h \, v _(k - 1 )\] =  mu _(a ) $ Note that $ \[n \(a \)\, w _(1 )\, dots.h \, w _(k - 1 )\] =  mu _(a ) ==>  \[w _(1 )\, dots.h \, w _(k - 1 )\] =  \[v _(1 )\, dots.h \, v _(k - 1 )\] $ i.e.~the two are the same orientations of $\(partial  M \)_(a )$. Call this orientation $\(partial  mu \)_(a )$.
]

We can show that choosing the orientation $\(partial  mu \)_(a )$ for each $a  in  partial  M$ gives a consistent orientation on $partial  M$. That is,

==== Proposition 2
<proposition-2>
#quote(block: true)[
If $M$ is orientable, then $partial  M$ is orientable and the orientation $mu$ of $M$ determines the orientation $partial  mu$ for $partial  M$.
]

#details("Proof of the Prop.")[
Let $omega _(x )$ be the oriented volume form on $upright(T )_(x )M$ for each $x  in  partial  M$. Denote by $n \(x \)$ the outward normal vector at $x$. We define a $n - 1$-form $w _(x )$ on the tangent space $upright(T )_(x )\(partial  M \)$ by $ w _(x )\(v _(1 )\,dots.h \,v _(n - 1 )\)
thick : = thick 
omega _(x )big(\()n \(x \)\,v _(1 )\,dots.h \,v _(n - 1 )big(\)). $ Since $omega _(x )$ is a non-degenerate $n$-form on $upright(T )_(x )M$ and $n \(x \)$ is linearly independent of $upright(T )_(x )\(partial  M \)$, it follows immediately that $w _(x )$ is non-degenerate on $upright(T )_(x )\(partial  M \)$. Hence $w _(x )$ is a valid volume form on $upright(T )_(x )\(partial  M \)$, and it defines an orientation at each $x  in  partial  M$.

Consequently, an ordered basis $\[v _(1 )\,dots.h \,v _(n - 1 )\]$ of $upright(T )_(x )\(partial  M \)$ is positively oriented (i.e., lies in $\(partial  mu \)_(x )$) if and only if the extended basis $\[n \(x \)\,v _(1 )\,dots.h \,v _(n - 1 )\]$ is positively oriented in $T _(x ) M$ (i.e., lies in $mu _(x )$). Symbolically, $ \[v _(1 )\,dots.h \,v _(n - 1 )\]in  \(partial  mu \)_(x )
quad <==> quad 
\[n \(x \)\,v _(1 )\,dots.h \,v _(n - 1 )\] in  mu _(x ). $ Thus, if $M$ is orientable with orientation $mu$, the boundary $partial  M$ inherits a natural orientation $partial  mu$, determined by adjoining the outward normal to oriented bases of $partial  M$.

#strong[Q.E.D.]

]
#linebreak()

==== Remark 1
<remark-1>
#quote(block: true)[
If we apply these definitions to $bb(H )^(k )$ with the usual orientation, we find that the induced orientation on $bb(R )^(k - 1 ) =  \{ x | bb(H )^(k ):  x ^(k ) =  0 \}$ is $\(- 1 \)^(k )$ times the usual orientation.
]

#details("Proof of the Remark.")[
We start with the half‐space $ bb(H )^(k ) =  \{ \(x ^(1 )\, dots.h \, x ^(k )\)in bb(R )^(k ) :  x ^(k )>=  0 \} \, $ with its usual orientation given by the standard volume form $ mu  =  upright(d )x ^(1 )and  upright(d )x ^(2 )and  dots.h.c and  upright(d )x ^(k ) $ Its boundary is $ partial  bb(H )^(k ) =  \{ \(x ^(1 )\,dots.h \,x ^(k )\)in bb(R )^(k ):  x ^(k )= 0 \} \, $ which is naturally identified with $bb(R )^(k - 1 )$ (with the usual orientation $upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k - 1 )$).

The induced orientation on $partial  bb(H )^(k )$ is defined by using the #strong[outward unit normal] to $bb(H )^(k )$. Since the interior of $bb(H )^(k )$ is $\{ x ^(k ) >  0 \}$, the outward normal is the vector pointing in the direction where $x ^(k )$ decreases. In standard coordinates this is $ n  =  - e _(k ) =  - frac(partial ,partial  x ^(k ))upright(d )x ^(k ) $ The induced $\(k - 1 \)$-form is given by contracting the $k$-form $mu$ with $n$: $ iota _(n )mu  =  iota _(- e _(k ))\(upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k )\) $ Since $ iota _(e _(k ))\(upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k )\) =  \(- 1 \)^(k - 1 )thin upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k - 1 ). $ we now obtain $ iota _(- e _(k ))\(upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k )\) =  - iota _(e _(k ))\(upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k )\) =  \(- 1 \)^(k )thin upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k - 1 ) $ This shows that the induced orientation on the boundary is given by the $\(k - 1 \)$-form $ \(- 1 \)^(k )thin upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k - 1 ) $ But the “usual orientation” on $bb(R )^(k - 1 )$ is $upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k - 1 )$. Hence, the induced orientation on $partial  H ^(k )$ is $\(- 1 \)^(k )$ times the usual orientation. This factor $\(- 1 \)^(k )$ comes exactly from the contraction with the outward normal $- e _(k )$ and reflects the combinatorial sign arising from removing the $upright(d )x ^(k )$ factor from the volume form.

#strong[Q.E.D.]

]
#linebreak()

=== 2.3.3 Outward Unit Normal for Manifold
<233-outward-unit-normal-for-manifold>
We remark briefly that for an oriented $\(n - 1 \)$-dimensional manifold $M$ in $bb(R )^(n )$, an analogue of the outward normal can be defined, although $M$ need not be the boundary of a manifold.

==== Definition 11
<definition-11>
#quote(block: true)[
If $\[v _(1 \,x )\,dots.h \,v _(n - 1 \,x )\] =  mu _(x )$, we choose $n \(x \)$ in $upright(T )_(x )bb(R )^(n )$ so that $n \(x \)$ is a unit vector perpendicular to $upright(T )_(x )M$ and $\[n \(x \)\,thick v _(1 \,x )\,dots.h \,v _(n - 1 \,x )\]$ is the usual orientation of $upright(T )_(x )bb(R )^(n )$. We still call $n \(x \)$ the outward unit normal to $M$ (determined by $mu$).
]

The vectors $n \(x \)$ vary continuously on $M$, as the Gram--Schmidt process is a continuous procedure. Conversely, if a continuous family of unit normal vectors $n \(x \)$ is defined on all of $M$, then we can determine an orientation of $M$.

If $M$ is the boundary of a manifold, however, we can show that the outward normal we derive agrees with #link(<definition-9>)[#strong[Definition 9]] above.

#details("Proof")[
TODO

]
#linebreak()

Now we may prove why #emph[Mobius strip] is not orientable.

#details("Proof")[
+ #strong[Computing the Normal Vector] \ A local normal vector can be obtained by taking the cross product of the partial derivatives $ frac(partial  phi ,partial  theta )\(theta \,t \)
  quad  #textmath[and]; quad 
  frac(partial  phi ,partial  t )\(theta \,t \). $ At the line $t = 0$, these derivatives simplify. Denote $ mitexmathbf(n )\(theta \,0 \)
  thick = thick 
  frac(partial  phi ,partial  theta )\(theta \,0 \)
  thick times thick 
  frac(partial  phi ,partial  t )\(theta \,0 \). $

+ #strong[Values at $theta = 0$ and $theta = 2 pi$] \ By direct (though somewhat tedious) computation, one obtains: $ mitexmathbf(n )\(0 \,0 \)
  thick = thick 
  big(\()0 \,thick 0 \,thick - tfrac(1 ,2 )big(\))\,
  quad 
  mitexmathbf(n )\(2 pi \,0 \)
  thick = thick 
  big(\()0 \,thick 0 \,thick + tfrac(1 ,2 )big(\)). $ Meanwhile, the base points in the strip coincide: $ phi \(0 \,0 \)
  thick = thick 
  phi \(2 pi \,0 \). $ That is, the same physical point on the Möbius strip has #strong[two different normal vectors] if we demand continuity of the normal across this identification.

+ #strong[Contradiction] \ If $M$ were an orientable surface in $bb(R )^(3 )$, one could choose a continuous unit normal vector field $mitexmathbf(n )\(x \)$ at every point $x  in  M$. But the Möbius strip is #strong[nonorientable], so no such globally continuous choice exists. Concretely, the mismatch $mitexmathbf(n )\(0 \,0 \) !=  mitexmathbf(n )\(2 pi \,0 \)$ while $phi \(0 \,0 \)= phi \(2 pi \,0 \)$ contradicts the requirement of continuity for a globally well‐defined normal.

#strong[Q.E.D.]

]
#linebreak()

== 2.4 Stokes Theorem on Manifolds / General Stokes for Manifold
<24-stokes-theorem-on-manifolds--general-stokes-for-manifold>
=== 2.4.1 Preparations
<241-preparations>
We now want to prove the general form of Stokes theorem:

==== Theroem 2(General Stokes)
<theroem-2general-stokes>
#quote(block: true)[
Let $M$ be a compact oriented $k$-dimensional manifold-with-boundary (which is at least $cal(C )^(2 )$) and $omega$ be a $\(k - 1 \)$-form on $M$ (which is at least $cal(C )^(1 )$). Then $ integral _(M ) upright(d )omega  =  integral _(partial  M ) omega $ where $partial  M$ has induced orientation.
]

The problem is, the integral in this theroem has not yet been defined. So that's what we are going up to be working up first.

==== Definition 12
<definition-12>
#quote(block: true)[
Consider a singular $p$ cube $c : \[0 \,1 \]^(p )->  M$ on a manifold $M$. If $omega$ is a $p$-form on $M$ we define $ integral _(c )omega = integral _(\[0 \,1 \]^(p ))c ^(♯ )omega $ and for $p$ chains $c = sum  a _(i )c _(i )$, the integral is defined as before, i.e. $ integral _(c )omega = sum  a _(i )integral _(c _(i ))omega $
]

#callout("note")[
In the rest part of this section, we will only work with $k$ cubes $c$ with a stronger condition that there exists an coordinate chart $xi : W -> bb(R )^(n )$ on $M$ such that $c = xi | _(\[0 \,1 \]^(k ))$#linebreak() As a map, we know $c$ is orientation preserving if and only if $xi$ is orientation preserving.
]

Now we may prove following lemma:

==== Lemma 1
<lemma-1>
#quote(block: true)[
Let $M$ be an oriented $k$-dimensional manifold (with or without boundary), and let $c _(1 )\, c _(2 ) :  \[0 \,1 \]^(k ) ->  M$ be orientation-preserving singular $k$-cubes, with the above assumption holding. If $omega$ is a $k$-form on $M$ such that $omega  =  0$ outside $c _(1 )\(\[0 \,1 \]^(k )\) inter  c _(2 )\(\[0 \,1 \]^(k )\)$, then $ integral _(c _(1 )) omega  =  integral _(c _(2 )) omega $
]

#details("Proof of lemma")[
Let $xi _(1 )\, xi _(2 )$ be the orientation-preserving charts corresponding to $c _(1 )\, c _(2 )$. Thus, $ c _(1 ) =  xi _(1 )big(| )_(\[0 \,1 \]^(k ))\, 
quad 
c _(2 ) =  xi _(2 )big(| )_(\[0 \,1 \]^(k )). $ Since $xi _(2 )$ is a local diffeomorphism onto its image, we can write $ xi _(2 )^(♯ ) omega  
thick = thick  f  thin and _(i = 1 )^(k ) upright(d )x _(i ) $ for some function $f  :  xi _(2 )^(- 1 )big(\()upright(s u p p )\(omega \)big(\))->  bb(R )$.

#strong[Step 1: Define the transition map]

Set $ T  thick = thick  xi _(2 )^(- 1 ) thin compose thin  xi _(1 ) colon  quad  xi _(1 )^(- 1 )big(\()upright(s u p p )\(omega \)big(\))
thin --> thin  xi _(2 )^(- 1 )big(\()upright(s u p p )\(omega \)big(\)). $ By hypothesis, $T$ is a local diffeomorphism between open sets in $bb(R )^(k )$. In particular, on $\[0 \,1 \]^(k )subset  bb(R )^(k )$, it restricts to a map whose image remains in $xi _(2 )^(- 1 )big(\()upright(s u p p )\(omega \)big(\))$.

#strong[Step 2: Pull back $omega$ via $xi _(1 )$]

We compute $integral _(c _(1 )) omega$ by expressing it as an integral in coordinates: $ aligned(
integral _(c _(1 )) omega  
&= thick  integral _(\[0 \,1 \]^(k )) \(c _(1 )\)^(♯ ) omega  
thick = thick  integral _(\[0 \,1 \]^(k )) \(xi _(1 )\)^(♯ ) omega . 
) $ Since $xi _(1 ) =  xi _(2 ) compose  big(\()xi _(2 )^(- 1 )compose  xi _(1 )big(\)) =  xi _(2 ) compose  T$, this becomes $ \(xi _(1 )\)^(♯ ) omega  
thick = thick  big(\()xi _(2 ) compose  T big(\))^(♯ ) omega 
thick = thick  T ^(♯ ) big(\()xi _(2 )^(♯ ) omega big(\))
thick = thick  T ^(♯ ) big(\()f  and _(i = 1 )^(k ) upright(d )x _(i )big(\)). $ Thus, $ integral _(\[0 \,1 \]^(k )) \(xi _(1 )\)^(♯ ) omega 
thick = thick  integral _(\[0 \,1 \]^(k )) T ^(♯ )big(\()f  and _(i = 1 )^(k ) upright(d )x _(i )big(\)). $

#strong[Step 3: Change of variables using $T$]

Recall that for a smooth map $T :  U  ->  V  subset  bb(R )^(k )$ and a $k$-form $f  thin upright(d )x _(1 ) and  dots.h.c  and  upright(d )x _(k )$ on $V$, the pullback is given by $ T ^(♯ ) big(\()f  thin upright(d )x _(1 ) and  dots.h.c  and  upright(d )x _(k )big(\))
=  \(f  compose  T \)thin det big(\()upright(d )T big(\)) thin upright(d )x _(1 ) and  dots.h.c  and  upright(d )x _(k ). $ Hence, $ integral _(\[0 \,1 \]^(k )) T ^(♯ )big(\()f  and _(i = 1 )^(k ) upright(d )x _(i )big(\))
=  integral _(\[0 \,1 \]^(k )) \(f  compose  T \)thin det big(\()upright(d )T big(\))thin upright(d )x _(1 ) and  dots.h.c  and  upright(d )x _(k ). $ By standard change-of-variable arguments in $bb(R )^(k )$, $ integral _(\[0 \,1 \]^(k )) \(f  compose  T \)thin det big(\()upright(d )T big(\))thin upright(d )x _(1 ) and  dots.h.c  and  upright(d )x _(k )
thick = thick 
integral _(T \(\[0 \,1 \]^(k )\)) f  thin upright(d )x _(1 ) and  dots.h.c  and  upright(d )x _(k ). $ But $T \(\[0 \,1 \]^(k )\) subset  xi _(2 )^(- 1 )big(\()upright(s u p p )\(omega \)big(\))$, so continuing,

$ integral _(T \(\[0 \,1 \]^(k )\)) f thin upright(d )x _(1 ) and  dots.h.c  and  upright(d )x _(k )
=  integral _(\[0 \,1 \]^(k )) xi _(2 )^(♯ ) omega  
=  integral _(c _(2 )) omega . $

Putting everything together, we obtain $ integral _(c _(1 )) omega 
=  integral _(\[0 \,1 \]^(k )) \(xi _(1 )\)^(♯ ) omega 
=  integral _(\[0 \,1 \]^(k )) T ^(♯ )big(\()xi _(2 )^(♯ )omega big(\))
=  integral _(c _(2 )) omega . $

Because $omega$ vanishes outside $c _(1 )\(\[0 \,1 \]^(k )\)inter  c _(2 )\(\[0 \,1 \]^(k )\)$, all of the above integrals make sense and indeed coincide.

#strong[Q.E.D]

]
#linebreak()

Therefore, we can define the integral on a manifold:

==== Definition 13
<definition-13>
#quote(block: true)[
Let $M$ be a compact oriented $k$-dimensional manifold and let $omega$ be a $k$-form on $M$. There are a handful of cases to consider.

+ If there is an orientation preserving singular $k$-cube $c$ in $M$ such that $omega  =  0$ outside of $c \(\[0 \,1 \]^(k )\)$, then we will define $ integral _(M ) omega  =  integral _(c ) omega . $ which is independent of the choice of $c$ by #link(<lemma-1>)[#strong[Lemma 1]] as long as $omega$ vanishes outside it. #linebreak()
+ In general, there is an open cover $cal(O )$ of $M$ such that, for every $U  in  cal(O )$, there is an orientation preserving singular $k$-cube $c$ such that $U  inter  M  subset  c \(\[0 \,1 \]^(k )\)$. Let $Phi$ be a partition of unity subordinate to $cal(O )$ that is $C ^(oo )$, or at least, $C ^(2 )$. Define $ integral _(M ) omega  =  sum _(phi  in  Phi ) integral _(M ) phi  omega \, $ where the sum is finite if $M$ is compact. In general, this definition holds provided that the sum converges in the sense we have defined before.
]

Note that these definitions about $integral _(M ) omega$ do not depend on the open cover $cal(O )$ or on partition of unity $Phi$.

#details("Check")[
TODO

]
#linebreak()

Suppose $M$ is a $k$-dimensional manifold-with-boundary, and $mu$ is an orientation for $M$. Let $partial  M$ be given the induced orientation $partial  mu$. Consider an orientation preserving $k$-cube $c$ in $M$ such that $c _(\(k \,0 \))$ lies in $partial  M$ and is the only face having interior points in $partial  M$. $c _(\(k \,0 \))$ is orientation preserving if $k$ is even, otherwise, $\(- 1 \)^(k ) c _(\(k \,0 \))$ is orientation preserving.

#details("Proof Sketch")[
Suppose we have a $k$--cube $c$ that is mapped into $M$ and that $c$ is orientation preserving with respect to the given orientation on $M$. Only its face $ c _(\(k \,0 \)) =  c | _(\{ x ^(k )= 0 \} ) $ lies in $partial  M$.

- When we pull back the orientation from $M$ to the cube by $c$, the standard orientation on $bb(R )^(k )$ is given by $upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k )$.
- The induced orientation on the boundary (via contraction with the outward normal) is, as computed above in #link(<remark-1>)[#strong[Remark 1]], $\(- 1 \)^(k )thin upright(d )x ^(1 )and dots.h.c and  upright(d )x ^(k - 1 )$.

Thus, if $c$ is originally orientation preserving, then the face $c _(\(k \,0 \))$ inherits the induced orientation that is $\(- 1 \)^(k )$ times the “usual” orientation of a $\(k - 1 \)$--cube.

#strong[Q.E.D]

]
#linebreak()

Suppose now $omega$ is a $cal(C )^(1 )$ $\(k - 1 \)$-form on $M$ which is zero outside $c \(\[0 \,1 \]^(k )\)$. Then $ integral _(c _(\(k \,0 \))) omega  =  \(- 1 \)^(k ) integral _(partial  M ) omega $ So $ integral _(partial  c ) omega  =  integral _(\(- 1 \)^(k ) c _(\(k \,0 \))) omega  =  \(- 1 \)^(k ) integral _(c _(\(k \,0 \))) omega  =  integral _(partial  M ) omega $

#details("Check")[
Suppose $omega$ is a $k$-form on $M$ such that $omega$ vanishes outside the image of a singular $k$-cube $c : \[0 \,1 \]^(k ) ->  M$. By continuity, $omega$ also vanishes on the interior boundary faces of $\[0 \,1 \]^(k )$, except possibly the face on which $c$ meets $partial  M$. Concretely, if we write \ $ partial  c 
thick = thick 
sum _(i = 1 )^(k ) sum _(alpha  in  \{ 0 \,1 \} ) \(- 1 \)^(i + alpha )thin  c \(i \,alpha \)\, $ then $omega$ vanishes on all faces $c \(i \,alpha \)$ except the one that intersects $partial  M$, which we label $c \(k \,0 \)$ without loss of generality. Hence, $ integral _(partial  c ) omega 
thick = thick 
sum _(i = 1 )^(k ) sum _(alpha  in  \{ 0 \,1 \} )
\(- 1 \)^(i + alpha )thin 
integral _(c \(i \,alpha \)) omega 
thick = thick 
\(- 1 \)^(k ) integral _(c \(k \,0 \)) omega . $

Moreover, by the choice of orientation on $M$ and how $c$ meets $partial  M$, the integral of $omega$ over $c \(k \,0 \)$ relates to the integral of $omega$ on $partial  M$. Specifically, $ integral _(c \(k \,0 \)) omega 
thick = thick 
\(- 1 \)^(k ) integral _(partial  M ) omega 
quad ==> quad 
\(- 1 \)^(k ) integral _(c \(k \,0 \)) omega 
thick = thick 
integral _(partial  M ) omega . $ Combining the two equations, we obtain: $ integral _(partial  c ) omega 
thick = thick 
\(- 1 \)^(k ) integral _(c \(k \,0 \)) omega 
thick = thick 
integral _(partial  M ) omega . $

Thus, under these conditions (namely, that $omega$ vanishes outside $c \(\[0 \,1 \]^(k )\)$ and so also on all boundary faces of the cube not meeting $partial  M$), we conclude $ integral _(partial  c ) omega 
thick = thick 
integral _(partial  M ) omega . $

#strong[Q.E.D]

]
#linebreak()

=== 2.4.2 Proof of general Stokes
<242-proof-of-general-stokes>
With all these preparetions, we now finally can prove the #link(<theroem-2general-stokes>)[#strong[General Stokes thm]].

#details("The Proof")[
#strong[Step 1. The Case of an Interior $k$-Cube]

+ #strong[Setup.] \ Suppose first there exists an orientation‐preserving map (singular $k$-cube) $ c  :  \[0 \,1 \]^(k ) thin --> thin  M $ whose image is #strong[entirely in the interior] of $M$ (so it does not meet $partial  M$). Assume also $omega$ vanishes outside $c \(\[0 \,1 \]^(k )\)$.

+ #strong[Fundamental Theorem of Calculus / Stokes in the Cube.] \ By the standard form of the Stokes Theorem in $bb(R )^(k )$ (#link(<theroem-1fundamental-calculus-thm--stokes>)[#strong[Fundamental Theorem of Calculus]]), we have $ integral _(c ) upright(d )omega  
  thick = thick  
  integral _(\[0 \,1 \]^(k )) c ^(♯ ) \(upright(d )omega \)
  thick = thick 
  integral _(\[0 \,1 \]^(k )) upright(d )big(\()c ^(♯ ) omega big(\)) 
  thick = thick 
  integral _(partial  \[0 \,1 \]^(k )) c ^(♯ ) omega  
  thick = thick 
  integral _(partial  c ) omega . $ But $omega$ is zero outside $c \(\[0 \,1 \]^(k )\)$, so \ $ integral _(M ) upright(d )omega  
  thick = thick 
  integral _(c ) upright(d )omega 
  thick = thick 
  integral _(partial  c ) omega 
  thick = thick 
  0 $ because $partial  c$ also lies in the interior of $M$, hence $omega$ vanishes there. \ Similarly, since $partial  M$ does not intersect $c \(\[0 \,1 \]^(k )\)$, $ integral _(partial  M ) omega  
  thick = thick 
  0 . $ Thus, in this special case, $ integral _(M ) upright(d )omega  
  thick = thick 
  integral _(partial  M ) omega 
  thick = thick 
  0 . $

#divider()

#strong[Step 2. The Case of a $k$-Cube Meeting the Boundary in Exactly One Face]

+ #strong[Setup.] \ Next, suppose there is an orientation‐preserving map $ c  :  \[0 \,1 \]^(k ) thin --> thin  M $ such that:
  - $c big(\()\[0 \,1 \]^(k )big(\))$ intersects $partial  M$ #strong[only] along the face corresponding (for example) to $\{ t _(k )= 0 \} subset  \[0 \,1 \]^(k )$. \
  - $omega$ vanishes outside $c \(\[0 \,1 \]^(k )\)$.
+ #strong[Boundary Calculation.] \ Again using Stokes on the cube, $ integral _(partial  c ) omega  
  thick = thick 
  integral _(partial  \[0 \,1 \]^(k )) c ^(♯ ) omega 
  thick = thick 
  integral _(\[0 \,1 \]^(k )) upright(d )big(\()c ^(♯ ) omega big(\)) 
  thick = thick 
  integral _(\[0 \,1 \]^(k )) c ^(♯ ) upright(d )omega 
  thick = thick 
  integral _(c ) upright(d )omega . $ However, unlike in the first case, $partial  c$ now has exactly one face on $partial  M$. By earlier arguments, \ $ integral _(partial  M )omega  
  thick = thick 
  integral _(partial  c ) omega 
  quad #textmath[since all other faces of ]; c  #textmath[ are in the interior\, where ]; omega  equiv  0 . $ Consequently, \ $ integral _(partial  M ) omega 
  thick = thick 
  integral _(partial  c ) omega 
  thick = thick 
  integral _(c ) upright(d )omega 
  thick = thick 
  integral _(M ) upright(d )omega . $

Therefore, in this second scenario, $ integral _(M ) upright(d )omega 
thick = thick 
integral _(partial  M ) omega . $

#divider()

#strong[Step 3. The General Case via a Partition of Unity]

In the general situation, $omega$ need not vanish outside a single $k$-cube. We solve this by covering $M$ with local patches of these two special types, then summing.

+ #strong[Open Cover and Partition of Unity.] \ Let $cal(O ) =  \{ U _(alpha )\} _(alpha )$ be an open cover of $M$ such that, on each $U _(alpha )$, either

  - We can embed the relevant portion of $omega$ into an interior‐type cube (case 1), or \
  - We have a cube meeting $partial  M$ in exactly one face (case 2).

  Let $\{ phi _(alpha )\} _(alpha )$ be a #strong[partition of unity] subordinate to $cal(O )$. By definition, $ sum _(alpha ) phi _(alpha )\(x \) 
  thick = thick 
  1 
  quad #textmath[for all ]; x  in  M \,
  quad 
  upright(a n d )
  quad 
  upright(s u p p )\(phi _(alpha )\) thin subset thin  U _(alpha ). $

+ #strong[Reducing $upright(d )omega$ to Sums of Special Cases.] \ Write $ omega 
  thick = thick 
  sum _(alpha ) phi _(alpha ) thin omega $ because $sum _(alpha ) phi _(alpha ) =  1$. Observe that each form $phi _(alpha )thin omega$ now has support contained in $U _(alpha )$, so it is of #strong[type 1] or #strong[type 2] in that local coordinate patch.

+ #strong[Key Observation: $sum _(alpha ) upright(d )phi _(alpha ) =  upright(d )1  =  0$.] \ From the properties of the partition of unity, we get $ sum _(alpha ) \(upright(d )phi _(alpha )\) 
  thick = thick 
  upright(d )lr(\( sum _(alpha ) phi _(alpha )\) )
  thick = thick 
  upright(d )\(1 \) 
  thick = thick 
  0 . $ Hence $ sum _(alpha ) integral _(M ) \(upright(d )phi _(alpha )\) and  omega  
  thick = thick 
  integral _(M ) 
  sum _(alpha ) \(upright(d )phi _(alpha ) and  omega \) 
  thick = thick 
  integral _(M ) upright(d )lr(\( sum _(alpha ) phi _(alpha )\) ) and  omega 
  thick = thick 
  integral _(M ) upright(d )\(1 \)and  omega 
  thick = thick 
  0 . $

+ #strong[Putting it All Together.] \ We evaluate $integral _(M ) upright(d )omega$ by expressing $omega$ through the partition: $ integral _(M ) upright(d )omega 
  thick = thick 
  integral _(M ) upright(d )big(\()sum _(alpha ) phi _(alpha )thin omega big(\))
  thick = thick 
  sum _(alpha ) integral _(M ) upright(d )big(\()phi _(alpha )thin omega big(\)). $ But $ upright(d )big(\()phi _(alpha )thin omega big(\))
  thick = thick 
  \(upright(d )phi _(alpha )\)and  omega  +  phi _(alpha )thin  upright(d )omega . $ Therefore, $ sum _(alpha ) integral _(M ) upright(d )big(\()phi _(alpha )thin omega big(\))
  thick = thick 
  sum _(alpha ) integral _(M ) Big(\()phi _(alpha )thin  upright(d )omega  +  \(upright(d )phi _(alpha )\)and  omega Big(\)). $ We can separate the sums: $ sum _(alpha ) integral _(M ) phi _(alpha )thin  upright(d )omega 
  thick + thick 
  sum _(alpha ) integral _(M ) \(upright(d )phi _(alpha )\)and  omega . $ The second sum is zero (by the key observation above). Hence, $ integral _(M ) upright(d )omega 
  thick = thick 
  sum _(alpha ) integral _(M ) phi _(alpha )thin upright(d )omega . $ On each $U _(alpha )$, by either case 1 or case 2, $integral _(M ) phi _(alpha )thin upright(d )omega$ equals $integral _(partial  M ) phi _(alpha )thin  omega$. Summing over $alpha$ gives $ integral _(M ) upright(d )omega 
  thick = thick 
  sum _(alpha ) integral _(partial  M ) phi _(alpha )thin omega 
  thick = thick 
  integral _(partial  M )
  Big(\()sum _(alpha ) phi _(alpha )Big(\)) omega 
  thick = thick 
  integral _(partial  M ) omega . $ (Here, we used $sum _(alpha ) phi _(alpha ) =  1$ again.)

Because $M$ is second countable (hence admits locally finite covers) and we only have finitely many $phi _(alpha )!=  0$ on compact subsets, the sums and integrals are well-defined.

Thus, #strong[in every case], we conclude: $ boxed( 
integral _(M ) upright(d )omega 
thick = thick 
integral _(partial  M ) omega . 
) $

#strong[Q.E.D.]

]
#linebreak()

=== 2.4.3 Importance
<243-importance>
Stokes' theorem shares three important attributes with many fully evolved major theorems:

+ It is trivial. \
+ It is trivial because the terms appearing in it have been properly defined. \
+ It has significant consequences.

We will conclude this chapter by deducing a classical version of Stokes' Theorem, #emph[Green's Theorem]:

==== Theorm 3 (Green's Theorem)
<theorm-3-greens-theorem>
#quote(block: true)[
Let $M subset bb(R )^(2 )$ be compact $bb(R )^(2 )$ manifold-with-boundary and let $alpha \,beta$ be 2 $cal(C )^(1 )$ function. Then $ integral _(partial  M )alpha upright(d )x + beta upright(d )y = integral.double _(M )\(partial _(x )beta - partial _(y )alpha \)upright(d )x upright(d )y $
]

#details("Proof")[
Let $omega = alpha upright(d )x + beta upright(d )y$. Then we have $ upright(d )omega = - partial _(y )alpha upright(d )x upright(d )y + partial _(x )beta upright(d )x upright(d )y $ Thus, by #link(<theroem-2general-stokes>)[#strong[General Stokes' Thm]], $ integral _(partial  M )alpha upright(d )x + beta upright(d )y = integral _(M )upright(d )omega = integral.double _(M )\(partial _(x )beta - partial _(y )alpha \)upright(d )x upright(d )y $

#strong[Q.E.D.]

]
#linebreak()

== 2.5 Volume Element
<25-volume-element>
=== 2.5.1 Volume of Manifold
<251-volume-of-manifold>
Let $M$ be a $k$-dimensional manifold (or manifold-with-boundary) in $bb(R )^(n )$, with an orientation $mu$. If $x  in  M$, then $mu _(x )$ and the inner product $T _(x )$ we defined previously determine a volume element $omega \(x \) in  Omega ^(k )\(upright(T )_(x )M \)$.

We therefore obtain a nowhere-zero $k$-form $omega$ on $M$, which is called the #strong[volume Element] on $M$ (determined by $mu$) and denoted $upright(d )V$, even though it is not generally the differential of a $\(k  -  1 \)$-form.

==== Definition 14
<definition-14>
#quote(block: true)[
The #strong[volume] of $M$ is defined as $ integral _(M ) upright(d )V $ provided this integral exists, which is certainly the case if $M$ is compact.
]

"Volume" is usually called #strong[length] or #strong[surface area] for one- and two-dimensional manifolds, and $upright(d )V$ is denoted $upright(d )s$ (the element of length) or $upright(d )A$ \[or $upright(d )S$\] (the element of\[surface\] area). We are going to use these for specific versions of Stokes' Theorem. Let's look at some examples:

#details("Example 1.")[
Let $M$ be some $n$-dimensional submanifold of $bb(R )^(n )$ with the standard orientation. Then

$ upright(d )V  =  upright(d )x ^(1 ) and  dots.h  and  upright(d )x ^(n ) $

Hence we have that

$ integral _(M ) upright(d )V  =  integral _(M ) 1 $

giving us that the volume of $M$ agrees with our old definition.

]
#linebreak()

#details("Example 2.")[
TODO

]
#linebreak()

=== 2.5.2 The Volume Element of an Oriented Surface in $bb(R )^(3 )$
<252-the-volume-element-of-an-oriented-surface-in-r3r3r3>
A concrete case of interest to us is the volume element of an oriented surface (two-dimensional manifold) $M subset bb(R )^(3 )$. Let $n \(x \)$ be an outward unit normal at $x in  M$. If $omega in Omega ^(2 )\(upright(T )_(x )M \)$ is defined by $ omega \(v \,w \)= det \[v \,w \,n \(x \)\]= chevron.l  v times  w \,thick  n \(x \)chevron.r $ then $omega \(v \,w \)= 1$ for all orthonormal basis $v \,w$ of $upright(T )_(x )M$ with postive orientation. Thus, as $omega$ prefectly satisfied the requirements of $upright(d )A$, by uniqueness, we have $omega = upright(d )A$. Therefore, if $\[v \,w \]= mu _(x )$, $ upright(d )A \(v \,w \)= chevron.l  v times  w \,thick  n \(x \)chevron.r = lr(lVert v times  w rVert )lr(lVert n \(x \)rVert )= lr(lVert v times  w rVert ) $ If we wish to compute the area of $M$, we may evaluate $integral _(\[0 \,1 \]^(2 ))c ^(♯ )upright(d )A$ for orientation-preserving singular 2-cubes $c$ and get $ aligned(
integral _(\[0 \,1 \]^(2 ))c ^(♯ )upright(d )A &= integral _(\[0 \,1 \]^(2 ))c ^(♯ )upright(d )A \(e _(1 \,a )\,thick e _(2 \,a )\)\ 
&= integral _(\[0 \,1 \]^(2 ))upright(d )A \(D  c \(a \)\(e _(1 )\)\,D  c \(a \)\(e _(2 )\)\)\ 
&= integral _(\[0 \,1 \]^(2 ))upright(d )A big(\()\(D _(1 )c ^(1 )\(a \)\,D _(1 )c ^(2 )\(a \)\,D _(1 )c ^(3 )\(a \)\)\,thick \(D _(2 )c ^(1 )\(a \)\,D _(2 )c ^(2 )\(a \)\,D _(2 )c ^(3 )\(a \)\)big(\))\ 
&= integral _(\[0 \,1 \]^(2 ))lr(lVert \(D _(1 )c ^(1 )\(a \)\,D _(1 )c ^(2 )\(a \)\,D _(1 )c ^(3 )\(a \)\)times \(D _(2 )c ^(1 )\(a \)\,D _(2 )c ^(2 )\(a \)\,D _(2 )c ^(3 )\(a \)\)rVert )\ 
&= integral _(\[0 \,1 \]^(2 ))mitexsqrt(E G - F ^(2 ))
) $ where $E = sum  D _(1 )c ^(i )\(a \)\,thick  F = sum  D _(1 )c ^(i )\(a \)D _(2 )c ^(i )\(a \)$ and $G = sum  D _(2 )c ^(i )\(a \)$. Calculating surface area is clearly a foolhardy enterprise; fortunately one seldom needs to know the area of a surface. Moreover, there is a simple expression for $upright(d )A$ which suffices for theoretical considerations.

==== Proposition 3
<proposition-3>
#quote(block: true)[
Let $M$ be an oriented surface in $bb(R )^(3 )$, i.e.~a 2 dimensional manifold with or without boundary, and $n \(x \) =  \(n ^(1 )\, n ^(2 )\, n ^(3 )\)$ be the outward unit normal at $x  in  M$. Then $ upright(d )A  =  n ^(1 ) thin  upright(d )y  and  upright(d )z  +  n ^(2 ) thin  upright(d )z  and  upright(d )x  +  n ^(3 ) thin  upright(d )x  and  upright(d )y $ Moreover, $ n ^(1 ) upright(d )A  =  upright(d )y  and  upright(d )z \, quad  n ^(2 ) upright(d )A  =  upright(d )z  and  upright(d )x \, quad  n ^(3 ) upright(d )A  =  upright(d )x  and  upright(d )y $
]

#details("Proof of Prop.")[
#strong[Part (1). Expression for $upright(d )A$]

+ #strong[Setup and Determinant Representation.] \ The standard definition of the oriented area form on a surface $M subset bb(R )^(3 )$ uses the cross product: for vectors $v \,w in  T _(x )\(bb(R )^(3 )\)tilde.equiv  bb(R )^(3 )$, $ upright(d )A _(x )\(v \,w \)thick = thick chevron.l  v  times  w \,thick  n \(x \)chevron.r $ Expanding this scalar triple product via the determinant, we get $ upright(d )A _(x )\(v \,w \)thick = thick det pmatrix(
  v ^(1 ) zws , v ^(2 ) zws , v ^(3 ) zws ;
  w ^(1 ) zws , w ^(2 ) zws , w ^(3 ) zws ;
  n ^(1 ) zws , n ^(2 ) zws , n ^(3 )
  )thick = thick n ^(1 )big(\()v ^(2 ) w ^(3 ) -  v ^(3 ) w ^(2 )big(\))thick - thick n ^(2 )big(\()v ^(1 ) w ^(3 ) -  v ^(3 ) w ^(1 )big(\))thick + thick n ^(3 )big(\()v ^(1 ) w ^(2 ) -  v ^(2 ) w ^(1 )big(\)). $

+ #strong[Wedge Product Representation.] \ On the other hand, consider the 2‐form $ n ^(1 ) thin upright(d )y  and  upright(d )z thick + thick n ^(2 ) thin upright(d )z  and  upright(d )x thick + thick n ^(3 ) thin upright(d )x  and  upright(d )y . $ Recall the definition of the wedge product on coordinate differentials, for $v = \(v ^(1 )\,v ^(2 )\,v ^(3 )\)$ and $w = \(w ^(1 )\,w ^(2 )\,w ^(3 )\)$: $ upright(d )y  and  upright(d )z thin \(v \,w \)thick = thick upright(d )y \(v \)thin upright(d )z \(w \)thick - thick upright(d )y \(w \)thin upright(d )z \(v \)thick = thick v ^(2 ) w ^(3 ) thick - thick  v ^(3 ) w ^(2 ). $ Similar formulas hold for $upright(d )z  and  upright(d )x$ and $upright(d )x  and  upright(d )y$. Therefore, $ big(\()n ^(1 )thin upright(d )y  and  upright(d )z +  n ^(2 )thin upright(d )z  and  upright(d )x  +  n ^(3 )thin upright(d )x  and  upright(d )y big(\))\(v \,w \)=  n ^(1 ) \(v ^(2 ) w ^(3 ) -  v ^(3 ) w ^(2 )\)-  n ^(2 ) \(v ^(1 ) w ^(3 ) -  v ^(3 ) w ^(1 )\)+  n ^(3 ) \(v ^(1 ) w ^(2 ) -  v ^(2 ) w ^(1 )\). $

+ #strong[Equality of the Two Expressions.] \ Comparing the two expressions shows that, for each $x in  M$ and $v \,w in  T _(x )\(bb(R )^(3 )\)$, $ upright(d )A _(x )\(v \,w \)thick = thick n ^(1 )thin upright(d )y  and  upright(d )z thick + thick n ^(2 )thin upright(d )z  and  upright(d )x thick + thick n ^(3 )thin upright(d )x  and  upright(d )y quad #textmath[evaluated at ];\(v \,w \). $ Hence the 2‐form $upright(d )A$ on $M$ is given by $ upright(d )A thick = thick n ^(1 ) thin upright(d )y  and  upright(d )z thick + thick n ^(2 ) thin upright(d )z  and  upright(d )x thick + thick n ^(3 ) thin upright(d )x  and  upright(d )y . $

#divider()

#strong[Part (2). Multiplying $upright(d )A$ by $n ^(i )$]

To prove $ n ^(1 )thin upright(d )A  =  upright(d )y  and  upright(d )z \,quad  n ^(2 )thin upright(d )A  =  upright(d )z  and  upright(d )x \,quad  n ^(3 )thin upright(d )A  =  upright(d )x  and  upright(d )y \, $ we note that $v  times  w$ for $v \,w  in  T _(x )\(bb(R )^(3 )\)$ is always a scalar multiple of $n \(x \)$ if $v \,w$ lie in the tangent plane to $M$. Concretely, if $v \,w in  upright(T )_(x )M subset.eq  T _(x )\(bb(R )^(3 )\)$, then $v  times  w$ is normal to $M$, hence proportional to $n \(x \)$.

For any $z in  T _(x )\(bb(R )^(3 )\)$, one has $ chevron.l  z \,n \(x \)chevron.r  thin chevron.l  v times  w \,thin n \(x \)chevron.r thick = thick chevron.l  z \,thick v  times  w chevron.r $ By choosing $z$ to be the coordinate basis vectors $e _(1 )$, we have $ n ^(1 )upright(d )A \(v \,w \)= chevron.l  e _(1 )\,n \(x \)chevron.r  thin chevron.l  v times  w \,thin n \(x \)chevron.r = chevron.l  e _(1 )\,thick v  times  w chevron.r = v ^(2 ) w ^(3 ) thick - thick  v ^(3 ) w ^(2 )= \(upright(d )y  and  upright(d )z \)\(v \,w \) $ Thus, $ n ^(1 )thin upright(d )A  =  upright(d )y  and  upright(d )z $ Likewise, by setting $z$ to be $e _(2 )\, e _(3 )$ in $bb(R )^(3 )$, one may recover the formulas $ n ^(2 )\(upright(d )A \) thick = thick  upright(d )z  and  upright(d )x \,quad  n ^(3 )\(upright(d )A \) thick = thick  upright(d )x  and  upright(d )y . $ Hence, all the stated identities hold.

#strong[Q.E.D.]

]
#linebreak()

#strong[A word of caution:] if $omega  in  Omega ^(2 )\(bb(R )^(3 )_(a )\)$ is defined by $ omega  =  n ^(1 )\(a \) dot.c  d y \(a \) and  d z \(a \) \ 
quad thick thick thick  +  n ^(2 )\(a \) dot.c  d z \(a \) and  upright(d )x \(a \) \ 
quad thick thick thick  +  n ^(3 )\(a \) dot.c  upright(d )x \(a \) and  d y \(a \)\, $ it is #emph[not] true, for example, that $ n ^(1 )\(a \) dot.c  omega  =  d y \(a \) and  d z \(a \). $ The two sides give the same result only when applied to $v \, w  in  upright(T )_(a )M$.

We may generalize this Prop. into following lemma:

==== Lemma 2
<lemma-2>
#quote(block: true)[
Let $M$ be an oriented hypersurface on $bb(R )^(n )$ (with or without boundary) and $mitexmathbf(n )= n \(x \)$ be its outward unit normal. Then $ upright(d )A  =  sum _(i = 1 )^(n ) \(- 1 \)^(i - 1 ) mitexmathbf(n )^(i ) thin  upright(d )x ^(1 ) and  dots.h  and  hat(upright(d )x ^(i )) and  dots.h  and  upright(d )x ^(n ) $ Moreover, $ forall  i \, quad  mitexmathbf(n )^(i ) upright(d )A  =  \(- 1 \)^(i - 1 ) upright(d )x ^(1 ) and  dots.h  and  hat(upright(d )x ^(i )) and  dots.h  and  upright(d )x ^(n ) $
]

#details("Proof")[
#strong[Proof of Eq1.]

#strong[Expression for $upright(d )A$]

Let $beta  =  \{ beta _(1 )\,dots.h \,beta _(n - 1 )\}$ be a positively oriented orthonormal basis in $upright(T )_(x )M$. Write $beta _(j )= \(beta _(j )^(1 )\,dots.h \,beta _(j )^(n )\)in bb(R )^(n )$. By definition, $ Big(\()sum _(i = 1 )^(n )\(- 1 \)^(i - 1 )thin mitexmathbf(n )^(thin i )thin upright(d )x ^(1 ) and  dots.h.c and  hat(upright(d )x ^(i ))and  dots.h.c and  upright(d )x ^(n )Big(\))negthinspace \(beta \)thick = thick sum _(i = 1 )^(n )\(- 1 \)^(i - 1 )thin mitexmathbf(n )^(thin i )thin det \(A _(i )\)\, $ where $A _(i )$ is the $\(n - 1 \)times \(n - 1 \)$ matrix whose $\(j \,k \)$-th entry is $ upright(d )x ^(k )\(beta _(j )\)\,quad  k  thin in thin \{ thin 1 \,dots.h \,i - 1 \,i + 1 \,dots.h \,n \} . $ Equivalently, we can view this sum of determinants as the expanded determinant of the following $n times  n$ matrix (adding the row $mitexmathbf(n )$ to the top and filling the rest with the coordinates of $beta$): $ pmatrix(
mitexmathbf(n )^(thin 1 ) zws , mitexmathbf(n )^(thin 2 ) zws , dots.h.c  zws , mitexmathbf(n )^(thin n )zws ;\[6 p t \]
upright(d )x ^(1 )\(beta _(1 )\) zws , upright(d )x ^(2 )\(beta _(1 )\) zws , dots.h.c  zws , upright(d )x ^(n )\(beta _(1 )\)zws ;\[3 p t \]
dots.v  zws , dots.v  zws , dots.down  zws , dots.v  zws ;\[3 p t \]
upright(d )x ^(1 )\(beta _(n - 1 )\) zws , upright(d )x ^(2 )\(beta _(n - 1 )\) zws , dots.h.c  zws , upright(d )x ^(n )\(beta _(n - 1 )\)
). $ Hence, $ sum _(i = 1 )^(n )\(- 1 \)^(i - 1 )thin mitexmathbf(n )^(thin i )thin det \(A _(i )\)thick = thick det Big(\()thin \[thin mitexmathbf(n )\,beta _(1 )\,dots.h \,beta _(n - 1 )thin \]Big(\))\, $ where $\[mitexmathbf(n )\,beta _(1 )\,dots.h \,beta _(n - 1 )\]$ denotes the $n times  n$ matrix with columns $mitexmathbf(n )\,beta _(1 )\,dots.h \,beta _(n - 1 )$.

#strong[Relation to the Unit Normal]

Since $beta _(1 )\,dots.h \,beta _(n - 1 )$ lie in $upright(T )_(x )M$ and $mitexmathbf(n )= n \(x \)$ is the unit normal, the $n$-tuple $\{ mitexmathbf(n )\,beta _(1 )\,dots.h \,beta _(n - 1 )\}$ forms a positively oriented orthonormal basis for $bb(R )^(n )$. Therefore, $ det big(\()thin mitexmathbf(n )\,beta _(1 )\,dots.h \,beta _(n - 1 )big(\))thick = thick 1 . $ Putting it together, for every positively oriented orthonormal basis $beta subset  upright(T )_(x )M$, $ Big(\()sum _(i = 1 )^(n )\(- 1 \)^(i - 1 )thin mitexmathbf(n )^(thin i )thin upright(d )x ^(1 )and dots.h.c and hat(upright(d )x ^(i ))and dots.h.c and upright(d )x ^(n )Big(\))negthinspace \(beta \)thick = thick 1 thick = thick upright(d )A _(x )\(beta \). $ Since such $beta$ characterize $upright(d )A$ completely, we conclude $ upright(d )A thick = thick sum _(i = 1 )^(n )\(- 1 \)^(i - 1 )thin mitexmathbf(n )^(thin i )  thin upright(d )x ^(1 )and dots.h.c and hat(upright(d )x ^(i ))and dots.h.c and upright(d )x ^(n ). $

#divider()

#strong[Proof of Eq2.]

We want to show $ mitexmathbf(n )^(thin i )thin upright(d )A thick = thick \(- 1 \)^(i - 1 )thin upright(d )x ^(1 )and  dots.h.c and  hat(upright(d )x ^(i ))and  dots.h.c and  upright(d )x ^(n ). $ Equivalently, $ \(mitexmathbf(n )^(thin i )thin upright(d )A \)negthinspace \(beta \)thick = thick \(- 1 \)^(i - 1 )thin big(\()upright(d )x ^(1 )and  dots.h.c and  hat(upright(d )x ^(i ))and  dots.h.c and  upright(d )x ^(n )big(\))negthinspace \(beta \)quad #textmath[for all ];beta subset  upright(T )_(x )M . $

#strong[Orthogonality Condition $sum _(j = 1 )^(n ) mitexmathbf(n )^(thin j )thin upright(d )x ^(j ) =  0$ on $upright(T )_(x )M$]

Since $mitexmathbf(n )$ is orthogonal to every vector $v in  upright(T )_(x )M$, we have $chevron.l  mitexmathbf(n )\,v chevron.r = 0$. But $ chevron.l  mitexmathbf(n )\, v chevron.r = sum _(j = 1 )^(n ) mitexmathbf(n )^(thin j )thin v ^(j ) = sum _(j = 1 )^(n ) mitexmathbf(n )^(thin j )thin upright(d )x ^(j )\(v \)\, $ so $big(\()sum _(j = 1 )^(n ) mitexmathbf(n )^(thin j )thin upright(d )x ^(j )big(\))\(v \) =  0$ for all $v in  upright(T )_(x )M$. Hence, $ sum _(j = 1 )^(n ) mitexmathbf(n )^(thin j )thin upright(d )x ^(j )thick = thick 0 quad #textmath[on ];upright(T )_(x )M . $ We use this identity to simplify expressions involving wedge products.

#strong[Computation]

For all $j  >  i$, we may obtain $ aligned(
mitexmathbf(n )^(i ) mitexmathbf(n )^(j ) upright(d )x ^(1 ) and  dots.h  and  hat(upright(d )x ^(j )) and  dots.h  and  upright(d )x ^(n )&= \(- 1 \)^(i - 1 )mitexmathbf(n )^(j )\(mitexmathbf(n )^(i ) upright(d )x ^(i )\)and.big _(k = 1 \,k !=  i \,j )^(n )upright(d )x ^(k )\ 
&= \(- 1 \)^(i )mitexmathbf(n )^(j )lr(\( sum _(l = 1 \,l !=  i )^(n ) mitexmathbf(n )^(l )upright(d )x ^(l )\) )and.big _(k = 1 \,k !=  i \,j )^(n )upright(d )x ^(k )\ 
&= \(- 1 \)^(i )sum _(l = 1 \,l !=  i )^(n )mitexmathbf(n )^(j )mitexmathbf(n )^(l )upright(d )x ^(l )and lr(\( and.big _(k = 1 \,k !=  i \,j )^(n )upright(d )x ^(k )\) )\ 
&= \(- 1 \)^(i )mitexmathbf(n )^(j )mitexmathbf(n )^(j )upright(d )x ^(j )and lr(\( and.big _(k = 1 \,k !=  i \,j )^(n )upright(d )x ^(k )\) )\ 
&= \(- 1 \)^(i + j - 2 )mitexmathbf(n )^(j )mitexmathbf(n )^(j )lr(\( and.big _(k = 1 \,k !=  i )^(n )upright(d )x ^(k )\) )\ 
) $ Likewise, for all $j  <  i$, $ mitexmathbf(n )^(i ) mitexmathbf(n )^(j ) upright(d )x ^(1 ) and  dots.h  and  hat(upright(d )x ^(j )) and  dots.h  and  upright(d )x ^(n )= \(- 1 \)^(i + j - 2 )mitexmathbf(n )^(j )mitexmathbf(n )^(j )lr(\( and.big _(k = 1 \,k !=  i )^(n )upright(d )x ^(k )\) ) $ and for $i = j$, we just have $mitexmathbf(n )^(i )mitexmathbf(n )^(i )lr(\( and.big _(k = 1 \,k !=  i )^(n )upright(d )x ^(k )\) )$. Hence, $ aligned(
n ^(i )upright(d )A &= n ^(i )sum _(j = 1 )^(n )\(- 1 \)^(j - 1 ) mitexmathbf(n )^(j ) thin  upright(d )x ^(1 ) and  dots.h  and  hat(upright(d )x ^(j )) and  dots.h  and  upright(d )x ^(n )\ 
&= \(- 1 \)^(i - 1 )lr(\( sum _(j = 1 )^(n )mitexmathbf(n )^(j )mitexmathbf(n )^(j )\) )lr(\( and.big _(k = 1 \,k !=  i )^(n )upright(d )x ^(k )\) )\ 
&= \(- 1 \)^(i - 1 ) upright(d )x ^(1 ) and  dots.h  and  hat(upright(d )x ^(i )) and  dots.h  and  upright(d )x ^(n )
) $

#strong[Q.E.D.]

]
#linebreak()

=== 2.5.3 Divergence Theorem / Gauss's theorem
<253-divergence-theorem--gausss-theorem>
==== Theorem 4 (Divergence Theorem / Gauss's theorem)
<theorem-4-divergence-theorem--gausss-theorem>
#quote(block: true)[
Let $M  subset  bb(R )^(n )$ be a compact $n$-dimensional manifold-with-boundary and $mitexmathbf(n )$ the unit outward normal on $partial  M$. Let $F$ be a differentiable vector field on $M$. Then $ integral _(M ) operatorname(d i v ) F  thin  upright(d )V  =  integral _(partial  M ) chevron.l  F \, n  chevron.r  thin  upright(d )A . $ where $operatorname(d i v ) F  =  frac(partial  F ^(1 ),partial  x ^(1 )) +  dots.h.c  +  frac(partial  F _(n ),partial  x ^(n ))$, $upright(d )V$ is the volume form(i.e.~$upright(d )V = and.big upright(d )x ^(i )$) on $bb(R )^(n )$, and $upright(d )A$ is the induced $\(n - 1 \)$-dimensional area form on the boundary.
]

#details("Proof")[
+ #strong[Definition of $omega$.] \ Define the $\(n - 1 \)$-form $omega$ on $bb(R )^(n )$ by $ omega  thick = thick sum _(i = 1 )^(n ) \(- 1 \)^(thin i - 1 )thin F _(i )thin upright(d )x ^(1 )and  dots.h.c  and  hat(upright(d )x ^(i ))and  dots.h.c  and  upright(d )x ^(n ). $ Here, $hat(upright(d )x ^(i ))$ means that the form $upright(d )x ^(i )$ is omitted from the wedge product.

+ #strong[Compute $upright(d )omega$.] \ Recall that the exterior derivative $upright(d )$ distributes over sums and acts on the wedge product by $upright(d )\(f thin alpha \) =  upright(d )f  and  alpha  +  f thin upright(d )alpha$. Since each wedge term involves no further differentials, we get $ upright(d )omega thick = thick upright(d )Big(\()sum _(i = 1 )^(n ) \(- 1 \)^(i - 1 )thin F _(i )thin upright(d )x ^(1 )and  dots.h.c and  hat(upright(d )x ^(i ))and  dots.h.c and  upright(d )x ^(n )Big(\))thick = thick sum _(i = 1 )^(n ) \(- 1 \)^(i - 1 )thin upright(d )F _(i ) thin and upright(d )x ^(1 )and  dots.h.c  and  hat(upright(d )x ^(i )) and  dots.h.c  and  upright(d )x ^(n ). $ Writing $upright(d )F _(i ) =  sum _(j = 1 )^(n ) frac(partial  F _(i ),partial  x ^(j ))thin upright(d )x ^(j )$ and noting that only $upright(d )x ^(i )$ will survive in the wedge product (otherwise the wedge becomes zero by repetition), we simplify to $ upright(d )omega thick = thick sum _(i = 1 )^(n ) \(- 1 \)^(i - 1 )Big(\()sum _(j = 1 )^(n ) frac(partial  F _(i ),partial  x ^(j ))thin upright(d )x ^(j )Big(\))thin and thin \(mitexinline(hat(upright(d )x ^(i ))dots.h \)thick = thick sum _(i = 1 )^(n ) \(- 1 \)^(i - 1 )thin frac(partial  F _(i ),partial  x ^(i ))thin upright(d )x ^(i ) and  \(hat(upright(d )x ^(i ))dots.h \)thick = thick sum _(i = 1 )^(n ) frac(partial  F _(i ),partial  x ^(i ))thin upright(d )x ^(1 )and  dots.h.c  and  upright(d )x ^(n ). ) $ Thus, $ upright(d )omega thick = thick Big(\()sum _(i = 1 )^(n ) frac(partial  F _(i ),partial  x ^(i ))Big(\))thin upright(d )V thick = thick \(operatorname(d i v ) F \)thin upright(d )V . $

+ #strong[Relating $omega$ to $chevron.l  F \,mitexmathbf(n )chevron.r thin upright(d )A$.] \ By #link(<lemma-2>)[#strong[Lemma 2]], we have $ chevron.l  F \,mitexmathbf(n )chevron.r  thin upright(d )A thick = thick sum _(i = 1 )^(n ) F _(i )thin mitexmathbf(n )^(i )thin upright(d )A thick = thick sum _(i = 1 )^(n )\(- 1 \)^(thin i - 1 )thin F _(i )thin upright(d )x ^(1 )and  dots.h.c  and  hat(upright(d )x ^(i ))and  dots.h.c  and  upright(d )x ^(n )thick = thick omega . $ So on the boundary $partial  M$, the $\(n - 1 \)$-form $omega$ coincides with $chevron.l  F \,mitexmathbf(n )chevron.r thin upright(d )A$.

+ #strong[Applying Stokes' Theorem.] \ Since $M$ is an oriented manifold with boundary $partial  M$, the #link(<theroem-2general-stokes>)[#strong[General Stokes Theorem]] tells us $ integral _(M ) upright(d )omega thick = thick integral _(partial  M ) omega . $ Substituting $upright(d )omega  =  \(operatorname(d i v )F \)thin upright(d )V$ and $omega  =  chevron.l  F \,mitexmathbf(n )chevron.r thin upright(d )A$, we get $ integral _(M ) \(operatorname(d i v )F \)thin upright(d )V thick = thick integral _(partial  M ) chevron.l  F \,mitexmathbf(n )chevron.r thin upright(d )A . $ This completes the proof.

#strong[Q.E.D.]

]
#linebreak()

Let's look at some examples:

#details("Example 1.")[
Use the divergence theorem to evaluate \ $ integral _(S ) mitexmathbf(F ) dot.c  upright(d )mitexmathbf(S ) $ where \ $ mitexmathbf(F ) =  \(x y \, - frac(1 ,2 ) y ^(2 )\, z \) $ and the surface consists of the three surfaces:

- Top: $z  =  4  -  3 x ^(2 ) -  3 y ^(2 )$, with $1  <=  z  <=  4$ \
- Sides: $x ^(2 ) +  y ^(2 ) =  1$, with $0  <=  z  <=  1$ \
- Bottom: $z  =  0$

#details("Solution")[
#strong[Step 1. Compute the Divergence of $mitexmathbf(F )$]

Since

- $F ^(1 ) =  x y$ so $frac(partial  F ^(1 ),partial  x ) =  y$.
- $F ^(2 ) =  - frac(1 ,2 ) y ^(2 )$ so $frac(partial  F ^(2 ),partial  y ) =  - y$.
- $F ^(3 ) =  z$ so $frac(partial  F ^(3 ),partial  z ) =  1$.

we have, $ operatorname(d i v ) mitexmathbf(F ) =  y  +  \(- y \) +  1  =  1 . $

#strong[Step 2. The Flux Equals the Volume of $V$]

Since $operatorname(d i v ) mitexmathbf(F ) =  1$, the divergence theorem tells us that $ integral.double _(S ) mitexmathbf(F ) dot.c  upright(d )mitexmathbf(S ) =  integral.triple _(V ) 1 thin  upright(d )V  =  operatorname(V o l )\(V \). $

So our task reduces to finding the volume of $V$.

#strong[Step 3. Describe the Region $V$ and Set Up the Volume Integral]

Examine the three surfaces:

- #strong[Top Surface:] $z  =  4  -  3 \(x ^(2 )+ y ^(2 )\)$ for points where $z  >=  1$. Notice that when $z = 1$, we have $ 1  =  4  -  3 \(x ^(2 )+ y ^(2 )\) quad  ==>  quad  x ^(2 )+ y ^(2 ) =  1 . $ Thus, the paraboloid covers the region above the disk $x ^(2 )+ y ^(2 ) <=  1$ in the $x y$-plane and gives $z$ values from 1 up to 4.

- #strong[Side Surface:] $x ^(2 )+ y ^(2 ) =  1$ for $0  <=  z  <=  1$. This is a vertical wall closing off the bottom part of $V$.

- #strong[Bottom Surface:] $z = 0$ for $x ^(2 )+ y ^(2 ) <=  1$.

Putting these pieces together, the region $V$ is described in cylindrical coordinates by: $ x  =  r cos theta \,quad  y  =  r sin theta \,quad  z = z \, $ with: $ 0  <=  r  <=  1 \,quad  0  <=  theta  <  2 pi \,quad  0  <=  z  <=  4  -  3 r ^(2 ). $ Notice that when $r = 1$, $z$ runs from 0 to $4 - 3 \(1 ^(2 )\)= 1$\; when $r = 0$, $z$ runs from 0 to 4.

The volume element in cylindrical coordinates is $upright(d )V  =  r thin upright(d )z thin upright(d )r thin upright(d )theta$. Therefore, the volume of $V$ is $ operatorname(V o l )\(V \) =  integral _(theta = 0 )^(2 pi ) integral _(r = 0 )^(1 ) integral _(z = 0 )^(4 - 3 r ^(2 )) r thin upright(d )z thin upright(d )r thin upright(d )theta . $

#strong[Step 4. Evaluate the Volume Integral]

+ #strong[Integrate with respect to $z$:] $ integral _(z = 0 )^(4 - 3 r ^(2 )) upright(d )z  =  4 - 3 r ^(2 ). $

+ #strong[Integrate with respect to $r$:] $ integral _(r = 0 )^(1 ) r \(4 - 3 r ^(2 )\)thin upright(d )r . $ Expand the integrand: $ r \(4 - 3 r ^(2 )\) =  4 r  -  3 r ^(3 ). $ Now compute: $ integral _(0 )^(1 ) \(4 r  -  3 r ^(3 )\)thin upright(d )r  =  lr(\[ 2 r ^(2 ) -  frac(3 ,4 )r ^(4 )\] )_(0 )^(1 ) =  2  -  frac(3 ,4 ) =  frac(8 - 3 ,4 ) =  frac(5 ,4 ). $

+ #strong[Integrate with respect to $theta$:] $ integral _(0 )^(2 pi ) upright(d )theta  =  2 pi . $

Thus, the volume is $ operatorname(V o l )\(V \) =  2 pi  dot.c  frac(5 ,4 ) =  frac(5 pi ,2 ). $

#strong[Step 5. Conclude the Flux]

By the divergence theorem, $ integral.double _(S ) mitexmathbf(F ) dot.c  upright(d )mitexmathbf(S ) =  operatorname(V o l )\(V \) =  frac(5 pi ,2 ). $

#strong[Final Answer]

$ boxed(frac(5 pi ,2 )) $

]
#linebreak()

]
#linebreak()

#details("Example 2.")[
Evaluate the flux integral \ $ integral.double _(S ) mitexmathbf(F ) dot.c  mitexmathbf(n ) thin  upright(d )S $ \ where $mitexmathbf(n )$ is the outward normal to $S$, \ which is the part of the surface \ $ z ^(2 ) =  x ^(2 ) +  y ^(2 ) quad  #textmath[with]; quad  1  <=  z  <=  2 \, $ \ and where \ $ mitexmathbf(F ) =  \(3 x \, 5 y  +  e ^(cos  x )\, z  \). $

#details("Solution")[
#strong[Step 1. Compute the Divergence]

We have $ operatorname(d i v )mitexmathbf(F ) =  frac(partial  \(3 x \),partial  x ) +  frac(partial  \(5 y + e ^(cos  x )\),partial  y ) +  frac(partial  \(z \),partial  z ). $ Since $ frac(partial  \(3 x \),partial  x )= 3 \,quad  frac(partial  \(5 y + e ^(cos  x )\),partial  y )= 5 \,quad  frac(partial  \(z \),partial  z )= 1 \, $ it follows that $ operatorname(d i v )mitexmathbf(F ) =  3 + 5 + 1 = 9 . $

#strong[Step 2. Compute the Volume of $V$]

The closed surface $S _(#textmath[closed];)$ encloses the region $ V = \{ \(x \,y \,z \):  1 <=  z <=  2 \,thick  x ^(2 )+ y ^(2 )<=  z ^(2 )\} . $ It is most convenient to use cylindrical coordinates: $ x = r cos theta \,quad  y = r sin theta \,quad  z = z \, $ with the relation $x ^(2 )+ y ^(2 )= r ^(2 )<=  z ^(2 )$ so that $ 0 <=  r <=  z \,quad  1 <=  z <=  2 \,quad  0 <= theta < 2 pi . $ The volume element is $upright(d )V = r thin upright(d )r thin upright(d )theta thin upright(d )z$. Thus, $ operatorname(V o l )\(V \)= integral _(z = 1 )^(2 )integral _(theta = 0 )^(2 pi )integral _(r = 0 )^(z ) r thin upright(d )r thin upright(d )theta thin upright(d )z $ First, integrate in $r$: $ integral _(0 )^(z ) r thin upright(d )r  =  frac(z ^(2 ),2 ). $ Then in $theta$: $ integral _(0 )^(2 pi ) upright(d )theta  =  2 pi . $ So $ operatorname(V o l )\(V \)= integral _(z = 1 )^(2 ) frac(z ^(2 ),2 )dot.c  \(2 pi \)thin upright(d )z  =  pi integral _(z = 1 )^(2 )z ^(2 )thin upright(d )z . $ Compute the $z$--integral: $ integral _(1 )^(2 ) z ^(2 )thin upright(d )z  =  lr( frac(z ^(3 ),3 )|  )_(1 )^(2 ) =  frac(8 - 1 ,3 )= frac(7 ,3 ). $ Thus, $ operatorname(V o l )\(V \)=  pi dot.c frac(7 ,3 )= frac(7 pi ,3 ). $

#strong[Step 3. Apply the Divergence Theorem to the Closed Surface]

By the divergence theorem, $ integral.double _(S _(#textmath[closed];))mitexmathbf(F )dot.c  mitexmathbf(n )thin upright(d )S  =  integral.triple _(V ) \(operatorname(d i v )mitexmathbf(F )\)thin upright(d )V  =  9 dot.c  frac(7 pi ,3 ) =  2 1 pi . $

#strong[Step 4. Compute the Flux Through the Caps]

Now we must “subtract” the flux through the added caps to isolate the flux through the lateral surface $S = S _(#textmath[lat];)$.

#strong[Top Cap ($z = 2$)]

On the top, $z = 2$ and $x ^(2 )+ y ^(2 )<= 4$. The outward unit normal is $mitexmathbf(n )= \(0 \,0 \,1 \)$. Then $ mitexmathbf(F )\(x \,y \,2 \)= \(3 x \,thick 5 y + e ^(cos  x )\,thick 2 \). $ Thus, $ mitexmathbf(F )dot.c  mitexmathbf(n ) =  2 . $ The area of the top disk is $pi \(2 \)^(2 )= 4 pi$. Hence, the flux through the top is: $ Phi _(#textmath[top];) =  2 dot.c  \(4 pi \)= 8 pi . $

#strong[Bottom Cap ($z = 1$)]

On the bottom, $z = 1$ and $x ^(2 )+ y ^(2 )<= 1$. Here the outward unit normal is directed #emph[downward] (since $V$ lies above the bottom cap); that is, $mitexmathbf(n )= \(0 \,0 \,- 1 \)$. At $z = 1$, $ mitexmathbf(F )\(x \,y \,1 \)= \(3 x \,thick 5 y + e ^(cos  x )\,thick 1 \). $ Thus, $ mitexmathbf(F )dot.c  mitexmathbf(n ) =  1 dot.c \(- 1 \)=  - 1 . $ The area of the bottom disk is $pi \(1 \)^(2 )= pi$. So, the flux through the bottom is: $ Phi _(#textmath[bottom];) =  - 1 dot.c  pi  =  - pi . $

#strong[Step 5. Solve for the Lateral Flux]

The total flux through the closed surface is the sum of the fluxes over the three pieces: $ Phi _(#textmath[closed];) =  Phi _(#textmath[lat];) +  Phi _(#textmath[top];) +  Phi _(#textmath[bottom];). $ We computed: $ Phi _(#textmath[closed];) =  2 1 pi \,quad  Phi _(#textmath[top];) =  8 pi \,quad  Phi _(#textmath[bottom];) =  - pi . $ Thus, the flux through the lateral surface is: $ Phi _(#textmath[lat];) =  2 1 pi  -  lr(\( 8 pi  +  \(- pi \)\) )=  2 1 pi  -  \(8 pi  -  pi \) =  2 1 pi  -  7 pi  =  1 4 pi . $

#strong[Final Answer]

The flux through the lateral surface $S$ is $ boxed(1 4 pi . ) $

]
#linebreak()

]
#linebreak()

#details("Example 3. Volume of n-ball")[
Denote the volume of $n$-ball as $V _(n )$ and the surface area as $S _(n )$, i.e. $ V _(n )\(R \)= upright(V o l )\(\{ x _(1 )^(2 )+ dots.h.c + x _(n )^(2 )lt.eq.slant  R ^(2 )| x in bb(R )^(n )\} \) $ $ S _(n - 1 )\(R \)= upright(V o l )\(\{ x _(1 )^(2 )+ dots.h.c + x _(n )^(2 )=  R ^(2 )| x in bb(R )^(n )\} \) $

We will show following 3 properties:

- $V _(n )\(R \)= frac(2 pi  R ^(2 ),n )V _(n - 2 )\(R \)$
- $V _(n )\(R \)= frac(R ,n )S _(n - 1 )\(R \)$
- $S _(n - 1 )\(R \)= frac(upright(d ),upright(d )R )V _(n )\(R \)$

#details("Proof of Eq1.")[
#strong[\1. Splitting $bb(R )^(n ) tilde.equiv  bb(R )^(n - 2 ) times  bb(R )^(2 )$]

Write a vector $mitexmathbf(x )in  bb(R )^(n )$ as $mitexmathbf(x )= \(u \,y \)$, where $ u  thick in thick  bb(R )^(n - 2 )\,quad  y  thick in thick  bb(R )^(2 ). $ Then $|| mitexmathbf(x )|| <=  r$ implies $ lr(lVert u rVert )thick <= thick mitexsqrt(thin r ^(2 ) -  lr(lVert y rVert )^(2 )thin )quad #textmath[and];quad lr(lVert y rVert )thick <= thick r . $ Hence, the volume of $B _(n )\(r \)$ can be written as $ V _(n )\(r \)thick = thick integral _(\{ lr(lVert y rVert )<=  r \} )integral _(\{ lr(lVert u rVert )<=  mitexsqrt(r ^(2 )- lr(lVert y rVert )^(2 ))\} )upright(d )u thin upright(d )y . $ The inner integral, $ integral _(\{ lr(lVert u rVert )<=  mitexsqrt(thin r ^(2 ) -  lr(lVert y rVert )^(2 )thin )\} ) upright(d )u \, $ is precisely the volume of the $thin \(n - 2 \)$-dimensional ball of radius $mitexsqrt(r ^(2 ) -  lr(lVert y rVert )^(2 ))$. By definition of $V _(n - 2 )\(thin dot.c thin \)$, this is $ V _(n - 2 )negthinspace big(\()mitexsqrt(thin r ^(2 ) -  lr(lVert y rVert )^(2 )thin )big(\)). $ Therefore, $ V _(n )\(r \)thick = thick integral _(\{ lr(lVert y rVert )<=  r \} )V _(n - 2 )negthinspace big(\()mitexsqrt(r ^(2 ) -  lr(lVert y rVert )^(2 ))big(\))thin upright(d )y . $

#strong[\2. Using Polar Coordinates in the $y$-Plane]

Next, switch to polar coordinates $\(rho \,theta \)$ in the $bb(R )^(2 )$‐plane for $y$: $ y  =  \(rho cos theta \,thick rho sin theta \)\,quad rho  thick in thick \[0 \,r \]\,quad  theta thick in thick \[0 \,2 pi \]. $ Then $upright(d )y  =  rho thin upright(d )rho thin upright(d )theta$. Substituting into the integral, $ V _(n )\(r \)thick = thick integral _(0 )^(r ) integral _(0 )^(2 pi )V _(n - 2 )negthinspace big(\()mitexsqrt(r ^(2 ) -  rho ^(2 ))big(\))thin rho thick upright(d )theta thin upright(d )rho . $ Since $V _(n - 2 )\(mitexsqrt(r ^(2 )- rho ^(2 ))\)$ does not depend on $theta$, we can factor out the $2 pi$: $ V _(n )\(r \)thick = thick 2 pi  integral _(0 )^(r )V _(n - 2 )negthinspace big(\()mitexsqrt(r ^(2 ) -  rho ^(2 ))big(\))thin rho thin upright(d )rho . $ As $V _(n - 2 )negthinspace big(\()mitexsqrt(r ^(2 ) -  rho ^(2 ))big(\))= big(\()mitexsqrt(r ^(2 ) -  rho ^(2 ))big(\))^(n - 2 )V _(n - 2 )\(1 \)$, one may find out that $ integral _(0 )^(r )V _(n - 2 )negthinspace big(\()mitexsqrt(r ^(2 ) -  rho ^(2 ))big(\))thin rho thin upright(d )rho = - frac(r ^(2 ),n )V _(n - 2 )\(1 \)big(\()r ^(2 ) -  rho ^(2 )big(\))^(frac(n ,2 ))| _(0 )^(r )= frac(r ^(2 ),n )V _(n - 2 )\(r \) $ Putting this back into the expression for $V _(n )\(r \)$ gives $ V _(n )\(r \)thick = thick 2 pi dot.c frac(r ^(2 ),n )dot.c  V _(n - 2 )\(r \) $

Thus, we arrive at the desired recursion: $ boxed( V _(n )\(r \)thick = thick frac(2 pi thin r ^(2 ),n )thin V _(n - 2 )\(r \). ) $

#strong[Q.E.D.]

#strong[Remarks: Explicit Closed‐Form.]

Iterating the recursion leads to the well‐known formula $ V _(n )\(r \)thick = thick frac(pi ^(thin tfrac(n ,2 )),Gamma big(\()tfrac(n ,2 )+ 1 big(\)))thin r ^(n )\, $ where $Gamma \(thin dot.c thin \)$ is the Gamma function.

]
#linebreak()

#details("Proof of Eq2.")[
#strong[Setup]

Let $mitexmathbf(F )\(mitexmathbf(x )\) =  mitexmathbf(x )$ be the vector field on $bb(R )^(n )$. We consider the closed ball $B _(R )subset bb(R )^(n )$ of radius $R$ (centered at the origin) and its boundary $partial  B _(R )$, which is the $\(n - 1 \)$-dimensional sphere of radius $R$.

#strong[Compute $upright(d i v )thick F$.]

Since $mitexmathbf(F ) =  \(x _(1 )\, x _(2 )\, dots.h \, x _(n )\)$, its divergence is $ upright(d i v )thick F thick = thick frac(partial  x _(1 ),partial  x _(1 ))thick + thick frac(partial  x _(2 ),partial  x _(2 ))thick + thick dots.h.c thick + thick frac(partial  x _(n ),partial  x _(n ))thick = thick n . $

#strong[Apply the Divergence Theorem]

The Divergence Theorem (a.k.a. the Gauss--Ostrogradsky Theorem) tells us $ i n t _(B _(R )) \(upright(d i v )thick F \) thin upright(d )V thick = thick integral _(partial  B _(R )) chevron.l  mitexmathbf(F )\, mitexmathbf(n )chevron.r  thin upright(d )A \, $ where $mitexmathbf(n )$ is the outward unit normal on $partial  B _(R )$, and $upright(d )A$ is the $\(n - 1 \)$-dimensional area element on the sphere.

#strong[Left‐Hand Side (Volume Integral)]

Since $upright(d i v )thick F  =  n$, the left side is $ integral _(B _(R )) \(upright(d i v )thick F \) thin upright(d )V thick = thick integral _(B _(R )) n  thin upright(d )V thick = thick n  thin integral _(B _(R )) upright(d )V thick = thick n  thin V _(n )\(R \)\, $ where $V _(n )\(R \)$ is the volume of the $n$-dimensional ball of radius $R$.

#strong[Right‐Hand Side (Surface Integral)]

On the sphere $|| mitexmathbf(x )||  =  R$, the outward normal is $mitexmathbf(n )\(mitexmathbf(x )\) =  frac(mitexmathbf(x ),R )$. Hence, on $partial  B _(R )$, $ chevron.l  mitexmathbf(F )\, mitexmathbf(n )chevron.r thick = thick chevron.l  mitexmathbf(x )\, tfrac(mitexmathbf(x ),R )chevron.r thick = thick frac(1 ,R )thin || mitexmathbf(x )|| ^(2 )thick = thick frac(R ^(2 ),R )thick = thick  R . $ Therefore, $ integral _(partial  B _(R )) chevron.l  mitexmathbf(F )\, mitexmathbf(n )chevron.r  thin upright(d )A thick = thick integral _(partial  B _(R )) R  thin upright(d )A thick = thick R  thin integral _(partial  B _(R )) upright(d )A thick = thick R thin  S _(n - 1 )\(R \)\, $ where $S _(n - 1 )\(R \)$ is the $\(n - 1 \)$-dimensional surface area of the sphere of radius $R$.

#strong[Equating Both Sides]

By the Divergence Theorem: $ mitexunderbrace(integral _(B _(R )) \(upright(d i v )thick F \) thin upright(d )V )_(n thin V _(n )\(R \))thick = thick mitexunderbrace(integral _(partial  B _(R )) chevron.l  mitexmathbf(F )\, mitexmathbf(n )chevron.r  thin upright(d )A )_(R thin S _(n - 1 )\(R \)). $ Hence we conclude $ boxed(thin n  thin V _(n )\(R \) thick = thick  R  thin S _(n - 1 )\(R \). thin ) $

#strong[Q.E.D.]

]
#linebreak()

#details("Proof of Eq3.")[
Left to reader.

]
#linebreak()

]
#linebreak()

=== 2.5.4 Original Stokes' Theorem
<254-original-stokes-theorem>
==== Theorem 5 (Original Stokes' Theorem)
<theorem-5-original-stokes-theorem>
#quote(block: true)[
Let $M  subset  bb(R )^(3 )$ be a compact oriented two-dimensional manifold-with-boundary and $n$ the unit outward normal on $M$ determined by the orientation of $M$. \ Let $partial  M$ have the induced orientation. Let $T$ be the vector field on $partial  M$ with $upright(d )s \(T \) =  1$, and let $F$ be a differentiable vector field in an open set containing $M$. Then $ integral _(M ) chevron.l  \(upright(c u r l )thick F \)\, n  chevron.r  thin  upright(d )A  =  integral _(partial  M ) chevron.l  F \, T  chevron.r  thin  upright(d )s . $
]

Recall that $upright(d )s \(T \)= 1$ means following equivalent statements:

- for $x in partial  M$, we have $\[n \(x \)\,N \(x \)\,T \]$ as a basis of $bb(R )^(3 )$ where $n \(x \)$ is the outward normal at $x$ and $N \(x \)$ is the outward normal of the boundary at the point $x$\;
- for orientation-preserving $cal(C )^(1 )$ parameterization $c$, i.e.~$c$ is injective and its derivative is no-where vanishing, such that $upright(d )s \(c'\(t \)\)= lr(lVert c'\(t \)rVert )$ and $T \(t \)= frac(c'\(t \),lr(lVert c'\(t \)rVert ))$\;
- $T$ is positively oriented unit tangent vector to $partial  M$.

#details("Proof")[
#strong[Associate a Differential 1--Form to $F$:]

Given a differentiable vector field $F = \(F _(1 )\,F _(2 )\,F _(3 )\)$ on an open set in $bb(R )^(3 )$, one can associate the 1--form $ omega  =  F _(1 )upright(d )x  +  F _(2 )upright(d )y  +  F _(3 )upright(d )z . $ Then by #link(<proposition-3>)[#strong[Proposition 3]], its exterior derivative is $ upright(d )omega  =  lr(\( frac(partial  F _(3 ),partial  y ) -  frac(partial  F _(2 ),partial  z )\) )upright(d )y and  upright(d )z  +  lr(\( frac(partial  F _(1 ),partial  z ) -  frac(partial  F _(3 ),partial  x )\) )upright(d )z and  upright(d )x  +  lr(\( frac(partial  F _(2 ),partial  x ) -  frac(partial  F _(1 ),partial  y )\) )upright(d )x and  upright(d )y . $ Notice that the coefficients here are exactly the components of the curl of $F$: $ upright(c u r l )thick F  =  lr(\( frac(partial  F _(3 ),partial  y ) -  frac(partial  F _(2 ),partial  z )\,thin  frac(partial  F _(1 ),partial  z ) -  frac(partial  F _(3 ),partial  x )\,thin  frac(partial  F _(2 ),partial  x ) -  frac(partial  F _(1 ),partial  y )\) ). $

Likewise, for #strong[RHS], we know $ upright(d )s = lr(lVert gamma'\(t \)rVert )upright(d )t $ where $gamma : \[a \,b \]-> partial  M$ is a smooth parametrization of the boundary curve. As $T \(t \)= frac(gamma'\(t \),lr(lVert gamma'\(t \)rVert ))$, the line integral may become $ integral _(partial  M ) chevron.l  F \, T  chevron.r  upright(d )s = integral _(a )^(b ) chevron.l  F \, gamma'\(t \) chevron.r  upright(d )t = integral _(a )^(b )omega \(gamma \(t \)\)upright(d )t = integral _(a )^(b )gamma ^(♯ )omega = integral _(partial  M )omega $

#strong[Apply Stokes' Theorem:]

#link(<theroem-2general-stokes>)[#strong[General Stokes' theorem]] tells us that for a compact oriented two-dimensional manifold $M$ with boundary $partial  M$, $ integral _(M ) upright(d )omega  =  integral _(partial  M ) omega . $ In our situation, the left-hand side becomes $ integral _(M ) upright(d )omega  =  integral _(M ) chevron.l  upright(c u r l )thick F \,thin  n  chevron.r thin  upright(d )A $ where $n$ is the unit normal on $M$ (chosen in accordance with the orientation of $M$) and $upright(d )A$ is the area element on $M$. On the right-hand side, $omega$ restricted to $partial  M$ produces the line integral $ integral _(partial  M ) omega  =  integral _(partial  M ) chevron.l  F \, T  chevron.r upright(d )s \, $ where $T$ is the unit tangent vector along $partial  M$ (chosen so that the orientation of $partial  M$ is the one induced from $M$) and $d s$ is the arc length element.

#strong[Conclusion:]

Combining these observations, we arrive at the desired formula: $ boxed(integral _(M ) chevron.l  upright(c u r l )thick F \,thin  n  chevron.r upright(d )A  =  integral _(partial  M ) chevron.l  F \, T  chevron.r upright(d )s . ) $

#strong[Q.E.D]

]
#linebreak()
