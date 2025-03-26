---
title: 流形上的分析 Calculus on Manifold 笔记
layout: posts
date: 2025-03-19
categories:
  - math
  - analysis
  - note
tags:
---

> [!NOTE]
> This work is licensed under a Creative Commons Attribution 4.0 International License. Read [more](https://blog.icey-ai.com/assets/license/by-nc-sa.markdown)<br>
> ![license](https://blog.icey-ai.com/assets/license/by-nc-sa.svg)

> [!WARNING]
> 可能存在大量省略，错误，符号滥用，中英夹杂, Chinglish。还望读者斧正

> [!CAUTION]
> Work in progress...
> 
> Last Update: Mar 2025

> [!IMPORTANT]
> $$f^\sharp$$ for pull back; <br>
> $$f_\sharp$$ for push forward; <br>
> $$\iota_x$$ for interior product; <br>
> Others will mainly follow the notation in Spivak

<br>
<details>
<summary>Contents</summary>
<div markdown=1>

 1. [Fundamental Calculus Thm](#1-fundamental-calculus-thm) 
 2. [Integration on Manifold](#2-integration-on-manifold) <br>
     1. [Independence of Parametrization](#21-independence-of-parametrization)
     2. [Integration of forms](#22-integration-of-forms)<br>
        1. [Vector Field & forms on a Manifold](#221-vector-field-&-forms-on-a-manifold)
        2. [Orientation of a manifold](#222-orientation-of-a-manifold)
     3. [Manifold with Boundry](#23-manifold-with-boundry)<br>
        1. [Review of definitions about Manifold with Boundry](#231-review-of-definitions-about-manifold-with-boundry)
        2. [More with Manifold with Boundry](#232-more-with-manifold-with-boundry)
        3. [Outward Unit Normal for Manifold](#233-outward-unit-normal-for-manifold)
     4. [General Stokes for Manifold](#24-stokes-theorem-on-manifolds--general-stokes-for-manifold)<br>
        1. [Preparations](#241-preparations)
</div>
</details>
<br><br><br>

# 1 Fundamental Calculus Thm.

###### Definition 0
> Let \(\omega\) be a \(k\) form on \([0,1]^k\) with a unique function \(f\) such that \(\omega=f\dd{x^1}\wedge\cdots\wedge \dd{x^n}\). Then, we define
> \[\int_{[0,1]^k}\omega=\int_{[0,1]^k}f\]
> i.e. \[\int_{[0,1]^k}f\dd{x^1}\wedge\cdots\wedge \dd{x^n}=\int_{[0,1]^k}f\;\dd{x^1}\cdots \dd{x^n}\]
> If \(\omega\) is a \(k\)-form on \(A\) and \(c\) is a singular \(k\)-cube on \(A\), we define
> \[\int_c \omega=\int_{[0,1]^k} c^\sharp f\]

In particular, we have
\[\begin{aligned}
\int_{I^k}f\dd{x^1}\wedge\cdots\wedge \dd{x^n} &= \int_{[0,1]^k} I^\sharp (f\dd{x^1}\wedge\cdots\wedge \dd{x^n})\\
&=\int_{[0,1]^k}f\dd{x^1}\cdots \dd{x^n}
\end{aligned}\]
as expected.
For \(k=0\), we also know
\[\int_c \omega=\omega(c(0))\]
as a 0-form is a function and a 0 cube is a map from \(\{0\}\to A\).

Therefore, we may introduce following important thm:

###### Theroem 1(Fundamental Calculus Thm / Stokes)
> Let \(\omega\) be a \(\mathcal{C^1}\ k-1\)-form on an open set \(A\subset \R^n\) and \(c\) be a \(k\) chain in \(A\). Then we have:
> \[\int_{c}\dd\omega=\int_{\partial c}\omega\]

<details>
<summary>Proof of the Thm.</summary>
<div markdown=1>

Suppose \(c=\sum a_ic_i\) where \(c_i\) is singular \(k\) cube. 
Then we have
\[\int_{c}\dd\omega=\sum a_i\int_{c_i}\dd\omega=\sum a_i\int_{I^k}c_i^\sharp \dd\omega=\int_{I^k}\dd(c_i^\sharp\omega)\]
and
\[\int_{\partial c}\omega=\sum a_i\int_{\partial c_i}\omega=\sum a_i\int_{\partial I^k}c_i^\sharp\omega\]
Thus, it is suffice to show 
\[\int_{I^k}\dd\omega=\int_{\partial I^k}\omega\]
for standrad \(k\) cube \(I^k\).
Likewise, we may simplify the \(\omega\) into following type \(k-1\)-form
\[f\dd{x^1}\wedge\cdots\wedge\widehat{dx_i}\wedge\cdots\wedge \dd{x^k}\]
Notice that
\[\begin{aligned}
\int_{\partial I^k}f\dd{x^1}\wedge\cdots\wedge\widehat{dx_i}\wedge\cdots\wedge \dd{x^k}&=\sum_{j=1}^{k}\sum_{\alpha=0}^1{(-1)}^{j+\alpha}\int_{I^k_{(j,\alpha)}}f\dd{x^1}\wedge\cdots\wedge\widehat{dx_i}\wedge\cdots\wedge \dd{x^k}\\
&=\sum_{j=1}^{k}\sum_{\alpha=0}^1{(-1)}^{j+\alpha}\int_{[0,1]^{k-1}}\left(I^k_{(j,\alpha)}\right)^\sharp f\dd{x^1}\wedge\cdots\wedge\widehat{dx_i}\wedge\cdots\wedge dx_k\\
&=\sum_{j=1}^{k}\sum_{\alpha=0}^1{(-1)}^{j+\alpha}\int_{[0,1]^{k-1}}f(x_1,\cdots,\alpha,\cdots,x_k)\dd{x^1}\wedge\cdots\wedge 0\wedge\cdots\wedge dx_k\\
&={(-1)}^{i}\int_{[0,1]^{k-1}}f(x_1,\cdots,0,\cdots,x_k)\;\dd{x^1}\cdots\widehat{dx_i}\cdots \dd{x^k} \\
&\;\;\;\;+ {(-1)}^{i+1}\int_{[0,1]^{k-1}}f(x_1,\cdots,1,\cdots,x_k)\;\dd{x^1}\cdots\widehat{dx_i}\cdots \dd{x^k}
\end{aligned}\]
Also, we may conclude that
\[\begin{aligned}
\int_{I^k}\dd(f\dd{x^1}\wedge\cdots\wedge\widehat{dx_i}\wedge\cdots\wedge \dd{x^k})&=\int_{I^k}\frac{\partial f}{\partial x_i}\wedge dx_i\wedge \dd{x^1}\wedge\cdots\wedge\widehat{dx_i}\wedge\cdots\wedge \dd{x^k}\\
&={(-1)}^{i-1}\int_{[0,1]^k}\frac{\partial f}{\partial x_i} \dd{x^1}\cdots \dd{x^k}\\
&={(-1)}^{i-1}\int_{[0,1]^{k-1}}(f(x_1,\cdots,1,\cdots,x_k)-f(x_1,\cdots,0,\cdots,x_k)) \dd{x^1}\cdots\widehat{dx_i}\cdots \dd{x^k}\quad\text{Using FCT in 1 dim}\\
\end{aligned}\]
Compare these eqs, it is clearly that
\[\int_{c}\dd\omega=\int_{\partial c}\omega\]

**Q.E.D.**

</div>
</details>

---

# 2 Integration on Manifold

> [!NOTE]
> In this section, if we do not specify the differentiability of manifold, then it will be a smooth manifold.

## 2.1 Independence of Parametrization
Talking about Stokes' theorem, what we are really interested in is not Stokes' theorem on \(k\)-cubes or on chains but on *manifolds*, where we are going to be comparing the integral on a manifold to the integral on its boundary.To do that,we are going to have to adapt all our machinery for differential forms to work with manifolds. But first, let's cover an important point about integration over \(k\)-chains.
Let's say \( c \) is a \( C^1 \) singular \( k \)-cube in \( \R^n \), and we want to look at a re-parametrization, i.e. a map
\[
p: [0,1]^k \to [0,1]^k
\]
which is \( C^1 \), one-to-one, onto, and \( \det p'(x) \geq 0 \), i.e. the Jacobian does not reverse orientations. If \( \omega \) is a \( k \)-form then
\[
\int_c \omega = \int_{c \circ p} \omega
\]
You should compare this with the situation with functions: what if we were integrating a function over \( p([0,1]^k) = [0,1]^k \). You'\dd have to say there's a change of variable formula
\[
\int_{[0,1]^k} f \circ p | \det p' | = \int_{p([0,1]^k)} f
\]
This is clearly a very different case, and indeed why differential forms are the "natural" thing to integrate over: the formula for change of variables is "built in" to the definition. Let's see how:

<details>
<summary>Details.</summary>
<div markdown=1>

Following the definition, we know that
\[\int_{c \circ p} \omega=\int_{[0,1]^k}p^\sharp\circ c^\sharp\omega\]
As we know \(c^\sharp\omega=f\dd{x_1}\cdots \dd{x_k}\), we have
\[\begin{aligned}
p^\sharp\circ c^\sharp\omega&=p^\sharp(f\dd{x_1}\cdots \dd{x_k})\\
&=f\circ p\cdot\det J_p\dd{x_1}\cdots \dd{x_k}
\end{aligned}\]
Because \(\det J_p\geq 0\), we may apply change of variable formula here and conclude that
\[\int_{c \circ p} \omega=\int_{[0,1]^k}p^\sharp\circ c^\sharp\omega=\int_{[0,1]^k}f\circ p\cdot\det J_p\dd{x_1}\cdots \dd{x_k}=\int_c \omega\]

**Q.E.D.**

</div>
</details>

## 2.2 Integration of forms
### 2.2.1 Vector Field & forms on a Manifold

###### Definition 1
> A <ins>**vector field**</ins> \(F\) on manifold \(M\) is a funtion \(F:M\to N\) such that
> \[\forall x\in M,\ F(x)\in\TanS{x}{M}\]

Recall the definition of a \(\mathcal{C}^r\) coordinate chart \(\varphi:W\subset\R^k\to M\subset\R^n\) where \(\dim M=k\). The derivative of it induces an isomorphism of vector spaces
\[\varphi_{\sharp(a)}=D\varphi_a:\TanS{a}{\R^k}\to\TanS{\varphi(a)}{M}\]
and there exist an unique vector field \(G\) such that
\[\varphi_{\sharp(a)}(G(a))=F(\varphi(a))\]
We say that \(F\in\mathcal{C}^r\) iff \(G\in\mathcal{C}^r\) for any coordinate charts.
Note that this definition is independence from the choice of coordinate charts.

<details>
<summary>Details.</summary>
<div markdown=1>

##### Existence
Since \(\varphi_{\sharp(a)}: \TanS{a}{\R^k} \to \TanS{\varphi(a)}(M)\) is a linear isomorphism and \(F(\varphi(a)) \in \TanS{\varphi(a)}{M}\), there exists a unique vector \(\xi \in \TanS{a}{\R^k}\) such that
\[
\varphi_{\sharp(a)}(\xi) = F(\varphi(a)).
\]
We define \(G(a) := \xi\). Because \(\varphi_{\sharp(a)}\) is an isomorphism, this choice of \(\xi\) is unique. Thus, we can define a vector field \(G: W \to T(\R^k)\) by repeating this construction at each point \(a \in W\).

##### Uniqueness 
Suppose there exists another vector field \(\tilde{G}\) on \(W\) such that
\[
\varphi_{\sharp(a)}(\tilde{G}(a)) = F(\varphi(a)) \quad \text{for all } a \in W.
\]
Then define \(H(a) := G(a) - \tilde{G}(a)\). We have
\[
\varphi_{\sharp(a)}(H(a)) = \varphi_{\sharp(a)}(G(a) - \tilde{G}(a)) = \varphi_{\sharp(a)}(G(a)) - \varphi_{\sharp(a)}(\tilde{G}(a)) = 0.
\]
Since \(\varphi_{\sharp(a)}\) is injective, it follows that \(H(a) = 0\) for all \(a\), and thus \(G(a) = \tilde{G}(a)\). Therefore, \(G\) is unique.

##### Independence of Coordinate Charts
Let \(\psi: V \to M\) be another coordinate chart such that for some smooth map \(\gamma: W \to V\), we have
\[
\varphi(a) = \psi(\gamma(a)) \quad \text{for all } a \in W.
\]
Let \(H\) be the vector field corresponding to \(F\) in coordinates via \(\psi\), i.e.,
\[
F(\psi(b)) = \psi_{\sharp(b)}(H(b)) \quad \text{for } b \in V.
\]
Then, we compute:
\[
\begin{aligned}
G(a) &= \varphi_{\sharp(a)}^{-1}(F(\varphi(a))) \\
     &= \varphi_{\sharp(a)}^{-1}(F(\psi(\gamma(a)))) \\
     &= \varphi_{\sharp(a)}^{-1}(\psi_{\sharp(\gamma(a))}(H(\gamma(a)))).
\end{aligned}
\]
Since both \(\varphi_{\sharp(a)}^{-1}\) and \(\psi_{\sharp(\gamma(a))}\) are smooth such that they preserve differentiability, it follows that \(G \in \mathcal{C}^r\) if and only if \(H \in \mathcal{C}^r\).<br>

**Q.E.D.**

</div>
</details>

Now, let us consider differential forms on a manifold. 

###### Definition 2
> A <ins>**p-form**</ins> \(\omega\) on manifold \(M\) is a funtion \(\omega\) which assigns \(\omega(x)\in\Omega^k(\TanS{x}{M})\) for every \(x\in M\).

Like vector field, we define \(\omega\) to be \(\mathcal{C}^r\) if \(\varphi^\sharp\omega\) is \(\mathcal{C}^r\) for any coordinate chart \(\varphi\).

<details>
<summary>Details.</summary>
<div markdown=1>

Consider two coordinate charts  
\[
\varphi: W \to M, \quad \psi: V \to M.
\]  
On the overlap of their images, we can write:
\[
\psi = \varphi \circ \varphi^{-1} \circ \psi,
\]
which implies that for a differential form \(\omega\) defined on \(M\), the pullbacks satisfy:
\[
\psi^\sharp \omega = \omega \circ (\varphi \circ \varphi^{-1} \circ \psi) = (\psi \circ \varphi^{-1})^\sharp (\varphi^\sharp \omega).
\]
Since pullbacks along smooth maps preserve differentiability, and \(\psi \circ \varphi^{-1}\) is a smooth transition map between coordinate charts, it follows that \(\psi^\sharp \omega\) and \(\varphi^\sharp \omega\) have the same differentiability class.

**Q.E.D.**

</div>
</details>

Just like the forms on \(\R^n\), we have following proposition:

###### Proposition 1
> 
> *If \( \omega \) is a \( \mathcal{C}^r \) \( p \)-form on \( M \), then there is a unique \( \mathcal{C}^{r-1} \) \( (p+1) \)-form \( \dd\omega \) on \( M \) such that*
> \[\varphi^\sharp(\dd\omega) = \dd(\varphi^\sharp \omega)\]
> for every coordinate chart \( \varphi:W\to M \).

<details>
<summary>Proof of the Prop.</summary>
<div markdown=1>

Let \(\omega\) be a \(p\)-form on \(M\). We wish to define a \((p+1)\)-form \(\dd \omega\) on \(M\) by using local coordinate charts.<br>

##### Local Definition via a Coordinate Chart
   Consider a coordinate chart \(\varphi: W \to M\) such that \(a \in \varphi(W)\). We define
   \[
     (\dd \omega)(a)(\vec{v}) \;:=\;
     \dd \bigl(\varphi^\sharp \omega\bigr)\bigl(\varphi^{-1}(a)\bigr)\bigl(\vec{w}\bigr),
   \]
   where \(\vec{v} = (\vec{v}_1, \dots, \vec{v}_{p+1})\) is an ordered \((p+1)\)-tuple of tangent vectors at \(a\), and
   \[
     \vec{w}_i \;=\; \dd \varphi_x\bigl(\vec{v}_i\bigr)
     \quad\text{with } x = \varphi^{-1}(a).
   \]
   Here, \(\varphi^\sharp \omega\) denotes the pullback of \(\omega\) to \(W \subset \R^k\), and
   \(\dd \bigl(\varphi^\sharp \omega\bigr)\) is the exterior derivative of \(\varphi^\sharp \omega\) in the standard Euclidean space \(\R^k\).<br>

   Clearly, if this procedure is well-defined (i.e., independent of the chosen chart) and yields a unique \((p+1)\)-form on \(M\), then we have defined \(\dd \omega\) correctly in global coordinates.

##### Independence of the Coordinate Chart
   Let \(\dd^\varphi\omega\) denote the \((p+1)\)-form arising from the above construction using the chart \(\varphi\). Suppose we choose another chart \(\psi : V \to M\) with overlapping image, and let \(\dd^\psi\omega\) be the corresponding definition on \(\psi(V)\).  <br>

   Define the transition map
   \[
     h \;:=\; \psi^{-1} \circ \varphi : W \,\to\, V,
   \]
   which is smooth on the overlap of \(\varphi(W)\) and \(\psi(V)\). Then for \(x\) in the overlap, we have
   \[
     \begin{aligned}
       \dd^\psi \omega(x)
       &= \dd \bigl(\psi^\sharp \omega\bigr)\bigl(\psi^{-1}(x)\bigr) \\
       &= \dd \bigl(\psi^\sharp \omega\bigr)\bigl(h\circ \varphi^{-1}(x)\bigr) \\
       &= \dd \Bigl(h^\sharp\bigl(\psi^\sharp \omega\bigr)\Bigr)\!\bigl(\varphi^{-1}(x)\bigr) \\
       &= \dd \Bigl((\psi \circ \psi^{-1} \circ \varphi)^\sharp \omega\Bigr)\!\bigl(\varphi^{-1}(x)\bigr) \\
       &= \dd \bigl(\varphi^\sharp \omega\bigr)\bigl(\varphi^{-1}(x)\bigr)
       \;=\; \dd^\varphi\omega\bigl(x\bigr).
     \end{aligned}
   \]
   Thus, \(\dd^\varphi\omega = \dd^\psi\omega\) on the overlap region. Since every point of \(M\) is contained in at least one coordinate patch, and any two such patches overlap in a region where the definitions agree, it follows that \(\dd^\varphi\omega\) is independent of the chart \(\varphi\). This justifies the notation \(\dd \omega\).

##### Uniqueness of the \((p+1)\)-Form
   Suppose there is another \((p+1)\)-form \(\eta\) on \(M\) such that for every coordinate chart \(\varphi\),
   \[
     \varphi^\sharp(\eta) \;=\; \dd \bigl(\varphi^\sharp\omega\bigr).
   \]
   Then, for each \(\varphi\),
   \[
     \varphi^\sharp(\eta \,-\, \dd \omega)
     \;=\; \varphi^\sharp(\eta) \;-\; \dd \bigl(\varphi^\sharp \omega\bigr)
     \;=\; 0.
   \]
   If the pullback of \(\eta - \dd \omega\) is zero in every coordinate system, it means \(\eta - \dd \omega\) vanishes on each coordinate patch. Hence, by the sheaf property (or the elementary fact that if a form vanishes in each coordinate system, it must vanish globally),  
   \[
     \eta \;-\; \dd \omega \;=\; 0
     \quad\text{on } M.
   \]
   Consequently, \(\eta = \dd \omega\). This shows that our construction yields a unique \((p+1)\)-form on \(M\).<br>

**Q.E.D.**

</div>
</details>

### 2.2.2 Orientation of a manifold

It is often necessary for us to choose an orientation \(\mu_x\) for each tangent space \(\TanS{x}{M}\) of a manifold \(M\).
Thus, we may define the orientation of manifold based on this.

###### Definition 3
> An orientation of a manifold is given by a <ins>**consistent**</ins> choices of orientations \(\mu_x\) on each tangent space \(\TanS{x}{M}\), i.e. for every coordinate chart \(\varphi:W\to\R^n\) and for any \(a,b\in W\), the relation 
> \[[\varphi_{\sharp(a)}(e_{1,a}),\cdots,\varphi_{\sharp(a)}(e_{n,a})]=\mu_{\varphi(a)}\]
> holds if and only if
> \[[\varphi_{\sharp(b)}(e_{1,b}),\cdots,\varphi_{\sharp(b)}(e_{n,b})]=\mu_{\varphi(b)}\]

> [!NOTE]
> If $$W$$ is not connected, the definition is wrong as no manifold would be orientable. Here is one [example](https://math.stackexchange.com/questions/3628865/mistake-in-spivaks-definition-of-a-consistent-orientation-on-a-manifold).
> Hence, $$W$$ in this definition, we just let them be as much connected as we want.

Based on this, were going to call a given coordinate chart either orientation preserving or orientation reversing.

###### Definition 4
> A coordinate chart \( \varphi : W \to \R^k \) is <ins>**orientation preserving**</ins> if
> \[[\varphi_{\sharp{a}}(e_{1,a}), \ldots, \varphi_{\sharp{a}}(e_{k,a})] = \mu_{\varphi(a)} \]
> for one point \( a \) , and hence for every point \( a\in W\). 
> If \( \varphi : W \to \R^k \) is <ins>**orientation reversing**</ins> (i.e. *not* orientation preserving) and \( T : \R^k \to \R^k \) is a linear transformation with \( \det T < 0 \), then \( \varphi \circ T \) is orientation preserving.

<details>
<summary>why?</summary>
<div markdown=1>

##### Orientation in \(\R^k\)
   Recall that an orientation \(\mu_{\varphi(a)}\) at a point \(\varphi(a)\in\R^k\) can be identified with an ordered orthonormal basis \([v_1, \dots, v_k]\).  In particular, there exists a unique volume form \(\omega\) up to scalar such that:

   1. \(\omega(v_1, \dots, v_k) = 1\) whenever \([v_1, \dots, v_k]\) is the positively oriented orthonormal basis corresponding to \(\mu_{\varphi(a)}\).  
   2. \(\omega(L\,\vec{v}) = \det(L)\,\omega(\vec{v})\) for every linear transformation \(L\) and every \(k\)-tuple of vectors \(\vec{v} = (v_1, \dots, v_k)\).

##### Determinant and Orientation
   From this setup, for a coordinate chart \(\varphi: W \to \R^k\) and standard basis \(e_1, \dots, e_k\) in \(\R^k\), we have:
   \[
     \bigl[\varphi_{\sharp{a}}(e_{1,a}), \ldots, \varphi_{\sharp{a}}(e_{k,a})\bigr]
     \;=\;
     \omega\bigl(\varphi_{\sharp{a}}(e_{1,a}), \dots, \varphi_{\sharp{a}}(e_{k,a})\bigr).
   \]
   By the defining property of \(\omega\),
   \[
     \omega\bigl(\varphi_{\sharp{a}}(e_{1,a}), \dots, \varphi_{\sharp{a}}(e_{k,a})\bigr)
     \;=\;
     \det\bigl(D\varphi(a)\bigr)\,\omega\bigl(e_1, \dots, e_k\bigr)
     \;=\;
     \det\bigl(D\varphi(a)\bigr)\,\mu_{\varphi(a)}.
   \]
   Hence, a coordinate chart \(\varphi\) preserves orientation if and only if \(\det(D\varphi(a)) > 0\) for all \(a\).  If \(\det(D\varphi(a)) < 0\) for some \(a\), then \(\varphi\) reverses the orientation at that point.

##### Composition with an Orientation-Reversing Chart
   Finally, suppose \(\varphi\) is an orientation-reversing chart.  Let \(T\) be another smooth map (often a linear transformation in examples).  Then, for \(x\) in the domain of \(T\), we compute the determinant of the composition:
   \[
     \det\bigl(D(\varphi \circ T)(x)\bigr)
     \;=\;
     \det\Bigl(\dd \varphi_{T(x)} \,\circ\, \dd T_x\Bigr)
     \;=\;
     \det\bigl(\dd \varphi_{T(x)}\bigr)\;\cdot\;\det\bigl(T\bigr).
   \]
   In situations where \(\det(\dd \varphi_{T(x)})\) is negative and \(\det(T)\) is also negative , their product can be nonnegative, illustrating how the combined map may preserve, reverse, or degenerate the orientation.<br>

**Q.E.D.**


</div>
</details>

Suppose now \( \varphi, \psi \) are two coordinate systems such that \( \varphi(a) = \psi(b) \) and
\[
[\varphi_{\sharp(a)}(e_{1,a}), \ldots, \varphi_{\sharp(a)}(e_{k,a})] = \mu_x = [\psi_{\sharp(b)}(e_{1,b}), \ldots, \psi_{\sharp(b)}(e_{k,b})]
\]
then \( \det((\varphi^{-1}\circ\psi)'(b)) > 0 \) (at every point in the overlap \( \varphi(W) \cap \psi(V) \)). 
So every orientable manifold can be covered by orientation preserving coordinate charts (i.e. orientation preserving with respect to a consistent choice of orientations). 

We now obtain the following definitions:

###### Definition 5
> A manifold for which orientations \(\mu_x\) can be chosen consistently is called <ins>**orientable**</ins>, and a particular choice of the \(\mu_x\) is called an <ins>**orientation**</ins> \(\mu\) of M. A manifold together with an orientation is called an <ins>**oriented manifold**</ins>. 

There is a famous example of non-orientable manifold, *Mobius strip*. However, in this chapter we still can not prove this rigourously.

## 2.3 Manifold with Boundry
### 2.3.1 Review of definitions about Manifold with Boundry
Recall following definitions about manifold with boundry:

###### Definition 6
> A <ins>**half space**</ins> \(\mathbb{H}^k\subset\R^k\) is given by
> \[\{\vec{x}|\vec{x}_i>0\}\]

###### Definition 7
> A subset \( M \subseteq \R^n \) is a \( k \)-dimensional \( \mathcal{C}^r \) <ins>**manifold-with-boundary**</ins> if for every \( a \in M \), there is an open neighborhood \( U \) of \( a \) in \( \R^n \), an open subset \( V \) of \( \R^n \) and a \( \mathcal{C}^r \) diffeomorphism \( h : U \to V \) such that either
> 
> (1) The usual condition for a manifold,
> \[h(M \cap U) = V \cap (\R^k \times \{0 \in \R^{n-k}\})\]
>
> (2) The manifold looks like a half space around \( a \), i.e.
> \[h(M \cap U) = V \cap (\mathbb{H}^k \times \{0 \in \R^{n-k}\}) = \{ y = (y_1, \ldots, y_n) : y_1, \ldots, y_k \geq 0 \wedge y_{k+1} = \ldots = y_n = 0 \} \]
> 
> holds


<details>
<summary>Well-defined?</summary>
<div markdown=1>
One may ask that if (1) and (2) can be satisfied at a same point \(a\). The answer is no.

Suppose, for the sake of contradiction, that there exists a point \(a\) such that both conditions (1) and (2) are satisfied in neighborhoods of \(a\). Thus, we have:

1. A diffeomorphism \(h_1 : U_1 \to V_1\) satisfying condition (1) on an open neighborhood \(U_1\) of \(a\).  
2. A diffeomorphism \(h_2 : U_2 \to V_2\) satisfying condition (2) on an open neighborhood \(U_2\) of \(a\).

Since \(a \in U_1 \cap U_2\), we may replace \(U_1\) and \(U_2\) with smaller open sets (if necessary) so that
\[
U \;=\; U_1 \,\cap\, U_2
\]
is an open neighborhood of \(a\) on which \(h_1\) and \(h_2\) remain diffeomorphisms. Denote
\[
V_1' \;=\; h_1(U), 
\quad 
V_2' \;=\; h_2(U).
\]
Consider the map
\[
f \;=\; h_2 \circ h_1^{-1} \;:\; V_1' \,\longrightarrow\, V_2'.
\]
Since \(h_1\) and \(h_2\) are diffeomorphisms, \(f\) is itself a \(\mathcal{C}^r\)-diffeomorphism and therefore a homeomorphism onto its image.

As
   - By condition (1), \(V_1'\) locally resembles \(\mathbb{R}^k \times \{0\}^{n-k}\) in a way that is \(\mathcal{C}^r\)-diffeomorphic.  
   - By condition (2), \(V_2'\) locally resembles \(\mathbb{H}^k \times \{0\}^{n-k}\) (where \(\mathbb{H}^k\) is a half-space in \(\mathbb{R}^k\)) in a way that is \(\mathcal{C}^r\)-diffeomorphic.

under \(f\), the set
\[
V_1' \,\cap\, \bigl(\mathbb{R}^k \times \{0\}^{n-k}\bigr)
\]
(an open neighborhood in \(\mathbb{R}^k\)) must map to
\[
V_2' \,\cap\, \bigl(\mathbb{H}^k \times \{0\}^{n-k}\bigr),
\]
which is a set open in \(\mathbb{H}^k\) (in its subspace topology) but not open in the standard topology of \(\mathbb{R}^k\). Since a homeomorphism preserves topological openness, this situation is impossible. The image of an open set in \(\mathbb{R}^k\) under \(f\) would have to remain open in \(\mathbb{R}^k\), contradicting the fact that \(\mathbb{H}^k\) is not open in \(\mathbb{R}^k\).

Thus, our assumption that conditions (1) and (2) both hold at \(a\) leads to a topological contradiction. Therefore, no single point \(a\) in the manifold can satisfy both conditions simultaneously.

**Q.E.D.**
</div>
</details>

Once weve established this result, we can really distinguish these two kinds of points. That means, precisely, that we can make the following definitions

###### Definition 8
> The <ins>**boundary**</ins> of a manifold \(M\), written as \(\partial M\), is the set of points satisify (2) in Definition [**7**](#definition-7)

Notice that under this definition, \(\TanS{x}{\partial M}\) will be a \(k-1\) dim subspace of \(\TanS{x}{M}\) when \(\dim M=k\). Thus there are exactly two unit vectors in \(\TanS{x}{M}\) are perpendicular to

<details>
<summary>why?</summary>
<div markdown=1>
TODO
</div>
</details>

### 2.3.2 More with Manifold with Boundry
As we can see, the definitions for vector fields, forms, and orientations all make sense in this new context. There are furthermore 2 unit vectors in \(\TanS{x}{M}\) perpendicular to \(\TanS{x}{\partial M}\) (pointing in exactly opposite directions).

Let \(\varphi:W\cap\mathbb{H}^k\to\R^n\) be a coordinate chart for \(M\) where \(W\subset\R^k\), and assume
\[\varphi(a)=x\in\partial M\]
Then the exactly one of these unit vectors can be written into
\[\varphi_{\sharp(a)}(v_a)\]
for some \(v_a\in\TanS{a}{\R^k}\) and \(v_a^k\leqslant 0\).

###### Definition 9
>  We define this vector to be the <ins>**outward unit normal**</ins> at \(x\), written as \(n(x)\).

Note that this definition is independent of the coordinate system chosen.

<details>
<summary>check</summary>
<div markdown=1>
1. **Setup and Transition Map**  
   Since \(f\) and \(g\) are diffeomorphisms onto their images in \(M\), define the local transition map
   \[
     \gamma \;=\; g^{-1} \circ f,
   \]
   whose domain is \(f^{-1}\bigl(\mathrm{Im}(g)\bigr)\) and codomain is \(g^{-1}\bigl(\mathrm{Im}(f)\bigr)\). By construction, \(\gamma\) is a \(\mathcal{C}^r\) diffeomorphism between open subsets of \(\mathbb{R}^k\), and
   \[
     \gamma(0) 
     \;=\; 
     g^{-1}\bigl(f(0)\bigr) 
     \;=\; 
     g^{-1}(x) 
     \;=\; 
     0.
   \]

2. **Half‐Space Condition**  
   Both \(f\) and \(g\) are *half‐space charts*, meaning:
   - \(f(\{\,t_k=0\}) \subset \partial M\) and \(f(\{\,t_k>0\}) \subset M \setminus \partial M\).  
   - \(g(\{\,s_k=0\}) \subset \partial M\) and \(g(\{\,s_k>0\}) \subset M \setminus \partial M\).

   Because \(\gamma = g^{-1} \circ f\), it follows that if \((t_1,\dots,t_k)\) lies in \(\{t_k=0\}\), then \(f(t_1,\dots,t_k) \in \partial M\). Consequently,  
   \[
     \gamma\bigl(\{\,t_k=0\}\bigr)
     \;\subset\; 
     \{\,s_k=0\}.
   \]
   Similarly, \(\gamma\) preserves the interior condition \(\{t_k>0\}\mapsto \{s_k>0\}\). Altogether,
   \[
     \gamma\bigl(\{\,t_k\ge 0\}\bigr) 
     \;\subset\; 
     \{\,s_k\ge 0\}.
   \]

3. **Tangent Cones and Their Images**  
   Denote by \(H_0^k \subset \TanS{0}{\R^k}\) the set of all velocity vectors \(\alpha'(0)\) of curves \(\alpha(t)\subset \{t_k\ge 0\}\) with \(\alpha(0)=0\). Equivalently, \(H_0^k\) is the *tangent cone* of the closed half‐space \(\{t_k\ge 0\}\) at the origin. Since
   \[
     \gamma\bigl(\{\,t_k\ge 0\}\bigr)
     \;\subset\; 
     \{\,s_k\ge 0\},
   \]
   any curve \(\alpha\) in \(\{t_k\ge 0\}\) has its image \(\gamma\circ \alpha\) in \(\{s_k\ge 0\}\).  Taking derivatives at \(0\) shows:
   \[
     (\gamma \circ \alpha)'(0) 
     \;=\; 
     D\gamma(0)\cdot \alpha'(0)
     \;\in\; 
     H_0^k,
   \]
   so \(D\gamma(0)(H_0^k) \subset H_0^k\). By applying the same argument to \(\gamma^{-1}\) (which is also a diffeo), we deduce
   \[
     \bigl(D\gamma(0)\bigr)^{-1}(H_0^k) \;\subset\; H_0^k
     \quad\Longrightarrow\quad
     D\gamma(0)(H_0^k) \;=\; H_0^k.
   \]
   Hence \(D\gamma(0)\) is a linear isomorphism from \(H_0^k\) onto itself.

4. **Consistency of the Pushed‐Forward Subspaces**  
   From \(\gamma = g^{-1}\circ f\), we write
   \[
     f_{\sharp}(H_0^k) 
     \;=\; 
     (g\circ \gamma)_{\sharp}(H_0^k) 
     \;=\; 
     g_{\sharp}\bigl(\gamma_{\sharp}(H_0^k)\bigr).
   \]
   But \(\gamma_{\sharp}(H_0^k)\) is exactly \(H_0^k\) again, so
   \[
     f_{\sharp}(H_0^k) 
     \;=\; 
     g_{\sharp}(H_0^k).
   \]
   Thus both charts \(f\) and \(g\) push forward the *same* \(k\)-dimensional cone in \(\TanS{x}{\R^n}\), which reflects the tangent‐plus‐normal decomposition at \(x\).

5. **Uniqueness of the Normal Direction**  
   Within this common \(k\)-dimensional space, the direction of \(\tfrac{\partial}{\partial t_k}\) is precisely the one *normal* to \(\partial M\). Concretely, the subspace spanned by \(\{\tfrac{\partial}{\partial t_1}, \dots, \tfrac{\partial}{\partial t_{k-1}}\}\) projects onto \(\TanS{x}{(\partial M)}\), leaving the line spanned by \(\tfrac{\partial}{\partial t_k}\) as the normal complement. Since both charts determine the *same* pushforward space, they also determine the *same* normal line. By convention, we take the positively oriented side to define the **outward** normal direction.

Therefore, the outward normal vector at \(x\) (up to positive scaling) given by \(f\) agrees with that given by \(g\). This shows that the outward normal on \(\partial M\) is **independent** of the choice of half‐space boundary chart, provided those charts align on the same side of \(\partial M\).

**Q.E.D.**

</div>
</details>

###### Definition 10 
> The <ins>**induced orientation**</ins> of \( \partial M \) is given by, for each \( a \in \partial M \), choosing
> \[v_1, \ldots, v_{k-1} \in (\partial M)_a \]
> such that
> \[[n(a), v_1, \ldots, v_{k-1}] = \mu_a\]
> Note that
> \[[n(a), w_1, \ldots, w_{k-1}] = \mu_a \Longrightarrow [w_1, \ldots, w_{k-1}] = [v_1, \ldots, v_{k-1}]\]
> i.e. the two are the same orientations of \( (\partial M)_a \). Call this orientation \( (\partial \mu)_a \).

We can show that choosing the orientation \( (\partial \mu)_a \) for each \( a \in \partial M \) gives a consistent orientation on \( \partial M \).
That is,

###### Proposition 2 
> If \( M \) is orientable, then \( \partial M \) is orientable and the orientation \( \mu \) of \( M \) determines the orientation \( \partial \mu \) for \( \partial M \).

<details>
<summary>Proof of the Prop.</summary>
<div markdown=1>

Let \(\omega_x\) be the oriented volume form on \(\TanS{x}{M}\) for each \(x \in \partial M\). Denote by \(n(x)\) the outward normal vector at \(x\). We define a \(n-1\)-form \(w_x\) on the tangent space \(\TanS{x}{(\partial M)}\) by
\[
   w_x(v_1,\dots,v_{n-1})
   \;:=\;
   \omega_x\bigl(n(x),v_1,\dots,v_{n-1}\bigr).
\]
Since \(\omega_x\) is a non-degenerate \(n\)-form on \(\TanS{x}{M}\) and \(n(x)\) is linearly independent of \(\TanS{x}{(\partial M)}\), it follows immediately that \(w_x\) is non-degenerate on \(\TanS{x}{(\partial M)}\). Hence \(w_x\) is a valid volume form on \(\TanS{x}{(\partial M)}\), and it defines an orientation at each \(x \in \partial M\).

Consequently, an ordered basis \([v_1,\dots,v_{n-1}]\) of \(\TanS{x}{(\partial M)}\) is positively oriented (i.e., lies in \((\partial \mu)_x\)) if and only if the extended basis \([n(x),v_1,\dots,v_{n-1}]\) is positively oriented in \(T_x M\) (i.e., lies in \(\mu_x\)). Symbolically,
\[
   [v_1,\dots,v_{n-1}]\in (\partial \mu)_x
   \quad\Longleftrightarrow\quad
   [n(x),v_1,\dots,v_{n-1}] \in \mu_x.
\]
Thus, if \(M\) is orientable with orientation \(\mu\), the boundary \(\partial M\) inherits a natural orientation \(\partial \mu\), determined by adjoining the outward normal to oriented bases of \(\partial M\).

**Q.E.D.**

</div>
</details>

###### Remark 1
> If we apply these definitions to \(\mathbb{H}^k\) with the usual orientation, we find that the induced orientation on \(\R^{k-1} = {x|\mathbb{H}^k: x^k = 0}\) is \((-1)^k\) times the usual orientation. 

<details>
<summary>Proof of the Remark.</summary>
<div markdown=1>

We start with the half‐space
\[\mathbb{H}^k = \{(x^1, \dots, x^k)\in\mathbb{R}^k : x^k\ge 0\},\]
with its usual orientation given by the standard volume form
\[\mu = dx^1\wedge dx^2\wedge \cdots\wedge dx^k\]
Its boundary is
\[\partial \mathbb{H}^k = \{(x^1,\dots,x^k)\in\mathbb{R}^k: x^k=0\},\]
which is naturally identified with \(\mathbb{R}^{k-1}\) (with the usual orientation \(dx^1\wedge\cdots\wedge dx^{k-1}\)).

The induced orientation on \(\partial \mathbb{H}^k\) is defined by using the **outward unit normal** to \(\mathbb{H}^k\). Since the interior of \(\mathbb{H}^k\) is \( \{x^k > 0\} \), the outward normal is the vector pointing in the direction where \(x^k\) decreases. In standard coordinates this is
\[n = -e_k = -\frac{\partial}{\partial x^k}\dd{x^k}\]
The induced \((k-1)\)-form is given by contracting the \(k\)-form \(\mu\) with \(n\):
\[\iota_{n}\mu = \iota_{-e_k}(dx^1\wedge\cdots\wedge dx^k)\]
Since
\[\iota_{e_k}(dx^1\wedge\cdots\wedge dx^k) = (-1)^{k-1}\,dx^1\wedge\cdots\wedge dx^{k-1}.\]
we now obtain
\[\iota_{-e_k}(dx^1\wedge\cdots\wedge dx^k) = -\iota_{e_k}(dx^1\wedge\cdots\wedge dx^k) = (-1)^k\,dx^1\wedge\cdots\wedge dx^{k-1}\]
This shows that the induced orientation on the boundary is given by the \((k-1)\)-form
\[(-1)^k\,dx^1\wedge\cdots\wedge dx^{k-1}\]
But the “usual orientation” on \(\mathbb{R}^{k-1}\) is \(dx^1\wedge\cdots\wedge dx^{k-1}\). Hence, the induced orientation on \(\partial H^k\) is \((-1)^k\) times the usual orientation. 
This factor \((-1)^k\) comes exactly from the contraction with the outward normal \(-e_k\) and reflects the combinatorial sign arising from removing the \(dx^k\) factor from the volume form.

**Q.E.D.**

</div>
</details>


### 2.3.3 Outward Unit Normal for Manifold
We remark briefly that for an oriented \( (n-1) \)-dimensional manifold \( M \) in \( \R^n \), an analogue of the outward normal can be defined, although \( M \) need not be the boundary of a manifold.

###### Definition 11 
> If \([v_{1,x},\ldots,v_{n-1,x}] = \mu_x\), we choose \(n(x)\) in \(\TanS{x}{\R^n}\) so that \(n(x)\) is a unit vector perpendicular to \(\TanS{x}{M}\) and \([n(x),\;v_{1,x},\ldots,v_{n-1,x}]\) is the usual orientation of \(\TanS{x}{\R^n}\). We still call \(n(x)\) the outward unit normal to \(M\) (determined by \(\mu\)). 

The vectors \(n(x)\) vary continuously on \(M\), as the Gram–Schmidt process is a continuous procedure. Conversely, if a continuous family of unit normal vectors \(n(x)\) is defined on all of \(M\), then we can determine an orientation of \(M\). 

If \( M \) is the boundary of a manifold, however, we can show that the outward normal we derive agrees with Definition [**9**](#definition-9) above.

<details>
<summary>Proof</summary>
<div markdown=1>
TODO
</div>
</details>

Now we may prove why *Mobius strip* is not orientable.

<details>
<summary>Proof</summary>
<div markdown=1>
TODO
</div>
</details>

## 2.4 Stokes Theorem on Manifolds / General Stokes for Manifold
### 2.4.1 Preparations
We now want to prove the general form of Stokes theorem:

###### Theroem 2(General Stokes)
> Let \( M \) be a compact oriented \( k \)-dimensional manifold with boundary (which is at least \( \mathcal{C}^2 \)) and \( \omega \) be a \( (k-1) \)-form on \( M \) (which is at least \( \mathcal{C}^1 \)). Then
> \[\int_M d\omega = \int_{\partial M} \omega\]
> where \( \partial M \) has induced orientation.

The problem is, the integral in this theroem has not yet been defined. So that's what we are going up to be working up first. 

###### Definition 12
>  Consider a singular \(p\) cube \(c:[0,1]^p\to M\) on a manifold \(M\). If \(\omega\) is a \(p\)-form on \(M\) we define
> \[\int_c\omega=\int_{[0,1]^p}c^\sharp\omega\]
> and for \(p\) chains \(c=\sum a_ic_i\), the integral is defined as before, i.e.
> \[\int_c\omega=\sum a_i\int_{c_i}\omega\]

> [!NOTE]
> In the rest part of this section, we will only work with $$k$$ cubes $$c$$ with a stronger condition that there exists an coordinate chart $$\xi:W\to\R^n$$ on $$M$$ such that 
> $$c=\xi|{[0,1]^k}$$<br>
> As a map, we know \(c\) is orientation preserving if and only if \(\xi\) is orientation preserving.

Now we may prove following lemma:

###### Lemma 1
> Let \( M \) be an oriented \( k \)-dimensional manifold (with or without boundary), and let \( c_1, c_2 : [0,1]^k \to M \) be orientation-preserving singular \( k \)-cubes, with the above assumption holding. If \(\omega\) is a \( k \)-form on \( M \) such that \( \omega = 0 \) outside \( c_1([0,1]^k) \cap c_2([0,1]^k) \), then
> \[\int_{c_1} \omega = \int_{c_2} \omega\]

<details>
<summary>Proof of lemma</summary>
<div markdown=1>

Let \(\xi_1, \xi_2\) be the orientation-preserving charts corresponding to \(c_1, c_2\). Thus,
\[
c_1 = \xi_1\big|_{[0,1]^k}, 
\quad
c_2 = \xi_2\big|_{[0,1]^k}.
\]
Since \(\xi_2\) is a local diffeomorphism onto its image, we can write
\[
\xi_2^\sharp \omega 
\;=\; f \,\wedge_{i=1}^k \dd x_i
\]
for some function \(f : \xi_2^{-1}\bigl(\mathrm{supp}(\omega)\bigr)\to \mathbb{R}\). 

##### Step 1: Define the transition map
Set
\[
T \;=\; \xi_2^{-1} \,\circ\, \xi_1 \colon \quad \xi_1^{-1}\bigl(\mathrm{supp}(\omega)\bigr)
\,\longrightarrow\, \xi_2^{-1}\bigl(\mathrm{supp}(\omega)\bigr).
\]
By hypothesis, \(T\) is a local diffeomorphism between open sets in \(\mathbb{R}^k\).  In particular, on \([0,1]^k\subset \mathbb{R}^k\), it restricts to a map whose image remains in \(\xi_2^{-1}\bigl(\mathrm{supp}(\omega)\bigr)\).

##### Step 2: Pull back \(\omega\) via \(\xi_1\)
We compute \(\int_{c_1} \omega\) by expressing it as an integral in coordinates:
\[
\begin{aligned}
\int_{c_1} \omega 
&=\; \int_{[0,1]^k} (c_1)^\sharp \omega 
\;=\; \int_{[0,1]^k} (\xi_1)^\sharp \omega.
\end{aligned}
\]
Since \(\xi_1 = \xi_2 \circ \bigl(\xi_2^{-1}\circ \xi_1\bigr) = \xi_2 \circ T\), this becomes
\[
(\xi_1)^\sharp \omega 
\;=\; \bigl(\xi_2 \circ T\bigr)^\sharp \omega
\;=\; T^\sharp \bigl(\xi_2^\sharp \omega\bigr)
\;=\; T^\sharp \bigl(f \wedge_{i=1}^k \dd x_i\bigr).
\]
Thus,
\[
\int_{[0,1]^k} (\xi_1)^\sharp \omega
\;=\; \int_{[0,1]^k} T^\sharp\bigl(f \wedge_{i=1}^k \dd x_i\bigr).
\]

##### Step 3: Change of variables using \(T\)
Recall that for a smooth map \(T: U \to V \subset \mathbb{R}^k\) and a \(k\)-form \(f \,\dd x_1 \wedge \cdots \wedge \dd x_k\) on \(V\), the pullback is given by
\[
T^\sharp \bigl(f \,\dd x_1 \wedge \cdots \wedge \dd x_k\bigr)
= (f \circ T)\,\det\bigl(\dd T\bigr) \,\dd x_1 \wedge \cdots \wedge \dd x_k.
\]
Since \(\xi_1, \xi_2\) are **orientation-preserving** charts, the Jacobian determinant \(\det\bigl(\dd T\bigl)\) is **positive**, so 
\[
|\det\bigl(\dd T\bigr)| 
= \det\bigl(\dd T\bigr).
\]
Hence,
\[
\int_{[0,1]^k} T^\sharp\bigl(f \wedge_{i=1}^k \dd x_i\bigr)
= \int_{[0,1]^k} (f \circ T)\,\det\bigl(\dd T\bigl)\,\dd x_1 \wedge \cdots \wedge \dd x_k.
\]
By standard change-of-variable arguments in \(\mathbb{R}^k\),
\[
\int_{[0,1]^k} (f \circ T)\,\det\bigl(\dd T\bigl)\,\dd x_1 \wedge \cdots \wedge \dd x_k
\;=\;
\int_{T([0,1]^k)} f \,\dd x_1 \wedge \cdots \wedge \dd x_k.
\]
But \(T([0,1]^k) \subset \xi_2^{-1}\bigl(\mathrm{supp}(\omega)\bigr)\), so continuing,

\[
\int_{T([0,1]^k)} f\,\dd x_1 \wedge \cdots \wedge \dd x_k
= \int_{[0,1]^k} \xi_2^\sharp \omega 
= \int_{c_2} \omega.
\]

Putting everything together, we obtain
\[
\int_{c_1} \omega
= \int_{[0,1]^k} (\xi_1)^\sharp \omega
= \int_{[0,1]^k} T^\sharp\bigl(\xi_2^\sharp\omega\bigr)
= \int_{c_2} \omega.
\]

Because \(\omega\) vanishes outside \(c_1([0,1]^k)\cap c_2([0,1]^k)\), all of the above integrals make sense and indeed coincide.

**Q.E.D**

</div>
</details>

Therefore, we can define the integral on a manifold:

###### Definition 13 
> Let \( M \) be a compact oriented \( k \)-dimensional manifold and let \( \omega \) be a \( k \)-form on \( M \). There are a handful of cases to consider.
> 1. If there is an orientation preserving singular \( k \)-cube \( c \) in \( M \) such that \( \omega = 0 \) outside of \( c([0,1]^k) \), then we will define
> \[\int_M \omega = \int_c \omega.\]
> which is independent of the choice of \(c\) by Lemma [**1**](#lemma-1) as long as \(\omega\) vanishes outside it.
><br>
>2. In general, there is an open cover \( \mathcal{O} \) of \( M \) such that, for every \( U \in \mathcal{O} \), there is an orientation preserving singular \( k \)-cube \( c \) such that \( U \cap M \subset c([0,1]^k) \). Let \( \Phi \) be a partition of unity subordinate to \( \mathcal{O} \) that is \( C^\infty \), or at least, \( C^2 \). Define
> \[\int_M \omega = \sum_{\varphi \in \Phi} \int_M \varphi \omega,\]
> where the sum is finite if \( M \) is compact. In general, this definition holds provided that the sum converges in the sense we have defined before.

Note that these definitions about \( \int_M \omega \) do not depend on the open cover \( \mathcal{O} \) or on partition of unity \( \Phi \).

<details>
<summary>Check</summary>
<div markdown=1>
TODO
</div>
</details>

Suppose \( M \) is a \( k \)-dimensional manifold with boundary, and \( \mu \) is an orientation for \( M \). Let \( \partial M \) be given the induced orientation \( \partial \mu \). Consider an orientation preserving \( k \)-cube \( c \) in \( M \) such that \( c_{(k,0)} \) lies in \( \partial M \) and is the only face having interior points in \( \partial M \). \( c_{(k,0)} \) is orientation preserving if \( k \) is even, otherwise, \( (-1)^k c_{(k,0)} \) is orientation preserving.

<details>
<summary>Proof Sketch</summary>
<div markdown=1>

Suppose we have a \(k\)–cube \(c\) that is mapped into \(M\) and that \(c\) is orientation preserving with respect to the given orientation on \(M\). Only its face
\[c_{(k,0)} = c|_{\{x^k=0\}}\]
lies in \(\partial M\).

- When we pull back the orientation from \(M\) to the cube by \(c\), the standard orientation on \(\mathbb{R}^k\) is given by \(dx^1\wedge\cdots\wedge dx^k\).
- The induced orientation on the boundary (via contraction with the outward normal) is, as computed above in Remark [**1**](#remark-1), \((-1)^k\,dx^1\wedge\cdots\wedge dx^{k-1}\).

Thus, if \(c\) is originally orientation preserving, then the face \(c_{(k,0)}\) inherits the induced orientation that is \((-1)^k\) times the “usual” orientation of a \((k-1)\)–cube.

**Q.E.D**
</div>
</details>

Suppose now \( \omega \) is a \(\mathcal{C}^1\) \( (k-1) \)-form on \( M \) which is zero outside \( c([0,1]^k) \). Then
\[\int_{c_{(k,0)}} \omega = (-1)^k \int_{\partial M} \omega\]
So
\[\int_{\partial c} \omega = \int_{(-1)^k c_{(k,0)}} \omega = (-1)^k \int_{c_{(k,0)}} \omega = \int_{\partial M} \omega\]

<details>
<summary>Check</summary>
<div markdown=1>

Suppose \(\omega\) is a \(k\)-form on \(M\) such that \(\omega\) vanishes outside the image of a singular \(k\)-cube \(c:[0,1]^k \to M\). By continuity, \(\omega\) also vanishes on the interior boundary faces of \([0,1]^k\), except possibly the face on which \(c\) meets \(\partial M\). Concretely, if we write  
\[
\partial c
\;=\;
\sum_{i=1}^k \sum_{\alpha \in \{0,1\}} (-1)^{i+\alpha}\, c(i,\alpha),
\]
then \(\omega\) vanishes on all faces \(c(i,\alpha)\) except the one that intersects \(\partial M\), which we label \(c(k,0)\) without loss of generality. Hence,
\[
\int_{\partial c} \omega
\;=\;
\sum_{i=1}^k \sum_{\alpha \in \{0,1\}}
(-1)^{i+\alpha}\,
\int_{c(i,\alpha)} \omega
\;=\;
(-1)^k \int_{c(k,0)} \omega.
\]

Moreover, by the choice of orientation on \(M\) and how \(c\) meets \(\partial M\), the integral of \(\omega\) over \(c(k,0)\) relates to the integral of \(\omega\) on \(\partial M\). Specifically,
\[
\int_{c(k,0)} \omega
\;=\;
(-1)^k \int_{\partial M} \omega
\quad\Longrightarrow\quad
(-1)^k \int_{c(k,0)} \omega
\;=\;
\int_{\partial M} \omega.
\]
Combining the two equations, we obtain:
\[
\int_{\partial c} \omega
\;=\;
(-1)^k \int_{c(k,0)} \omega
\;=\;
\int_{\partial M} \omega.
\]

Thus, under these conditions (namely, that \(\omega\) vanishes outside \(c([0,1]^k)\) and so also on all boundary faces of the cube not meeting \(\partial M\)), we conclude
\[
\int_{\partial c} \omega
\;=\;
\int_{\partial M} \omega.
\]

**Q.E.D**
</div>
</details>

### 2.4.2 Proof of general Stokes

With all these preparetions, we now finally can prove the [*General Stokes thm*](#theroem-2general-stokes).

<details>
<summary>The Proof</summary>
<div markdown=1>

##### Step 1. The Case of an Interior \(k\)-Cube

1. **Setup.**  
   Suppose first there exists an orientation‐preserving map (singular \(k\)-cube)
   \[
     c : [0,1]^k \,\longrightarrow\, M
   \]
   whose image is **entirely in the interior** of \(M\) (so it does not meet \(\partial M\)). Assume also \(\omega\) vanishes outside \(c([0,1]^k)\).  

2. **Fundamental Theorem of Calculus / Stokes in the Cube.**  
   By the standard form of the Stokes Theorem in \(\mathbb{R}^k\) ([“Fundamental Theorem of Calculus”](#theroem-1fundamental-calculus-thm--stokes)), we have
   \[
     \int_c \mathrm{d}\omega 
     \;=\; 
     \int_{[0,1]^k} c^\sharp (\mathrm{d}\omega)
     \;=\;
     \int_{[0,1]^k} \mathrm{d}\bigl(c^\sharp \omega\bigr) 
     \;=\;
     \int_{\partial [0,1]^k} c^\sharp \omega 
     \;=\;
     \int_{\partial c} \omega.
   \]
   But \(\omega\) is zero outside \(c([0,1]^k)\), so  
   \[
     \int_M \mathrm{d}\omega 
     \;=\;
     \int_c \mathrm{d}\omega
     \;=\;
     \int_{\partial c} \omega
     \;=\;
     0
   \]
   because \(\partial c\) also lies in the interior of \(M\), hence \(\omega\) vanishes there.  
   Similarly, since \(\partial M\) does not intersect \(c([0,1]^k)\),
   \[
     \int_{\partial M} \omega 
     \;=\;
     0.
   \]
   Thus, in this special case,
   \[
     \int_M \mathrm{d}\omega 
     \;=\;
     \int_{\partial M} \omega
     \;=\;
     0.
   \]

---

##### Step 2. The Case of a \(k\)-Cube Meeting the Boundary in Exactly One Face

1. **Setup.**  
   Next, suppose there is an orientation‐preserving map
   \[
     c : [0,1]^k \,\longrightarrow\, M
   \]
   such that:
   - \(c\bigl([0,1]^k\bigr)\) intersects \(\partial M\) **only** along the face corresponding (for example) to \(\{t_k=0\}\subset [0,1]^k\).  
   - \(\omega\) vanishes outside \(c([0,1]^k)\).

2. **Boundary Calculation.**  
   Again using Stokes on the cube,
   \[
     \int_{\partial c} \omega 
     \;=\;
     \int_{\partial [0,1]^k} c^\sharp \omega
     \;=\;
     \int_{[0,1]^k} \mathrm{d}\bigl(c^\sharp \omega\bigr) 
     \;=\;
     \int_{[0,1]^k} c^\sharp \mathrm{d}\omega
     \;=\;
     \int_c \mathrm{d}\omega.
   \]
   However, unlike in the first case, \(\partial c\) now has exactly one face on \(\partial M\). By earlier arguments,  
   \[
     \int_{\partial M}\omega 
     \;=\;
     \int_{\partial c} \omega
     \quad\text{since all other faces of } c \text{ are in the interior, where } \omega \equiv 0.
   \]
   Consequently,  
   \[
     \int_{\partial M} \omega
     \;=\;
     \int_{\partial c} \omega
     \;=\;
     \int_c \mathrm{d}\omega
     \;=\;
     \int_{M} \mathrm{d}\omega.
   \]

Therefore, in this second scenario,
\[
\int_M \mathrm{d}\omega
\;=\;
\int_{\partial M} \omega.
\]

---

##### Step 3. The General Case via a Partition of Unity

In the general situation, \(\omega\) need not vanish outside a single \(k\)-cube. We solve this by covering \(M\) with local patches of these two special types, then summing.

1. **Open Cover and Partition of Unity.**  
   Let \(\mathcal{O} = \{U_\alpha\}_{\alpha}\) be an open cover of \(M\) such that, on each \(U_\alpha\), either 
   - We can embed the relevant portion of \(\omega\) into an interior‐type cube (case 1), or  
   - We have a cube meeting \(\partial M\) in exactly one face (case 2).  

   Let \(\{\varphi_\alpha\}_{\alpha}\) be a **partition of unity** subordinate to \(\mathcal{O}\). By definition,
   \[
     \sum_\alpha \varphi_\alpha(x) 
     \;=\;
     1
     \quad\text{for all } x \in M,
     \quad
     \mathrm{and}
     \quad
     \mathrm{supp}(\varphi_\alpha) \,\subset\, U_\alpha.
   \]

2. **Reducing \(\mathrm{d}\omega\) to Sums of Special Cases.**  
   Write
   \[
     \omega
     \;=\;
     \sum_\alpha \varphi_\alpha \,\omega
   \]
   because \(\sum_\alpha \varphi_\alpha = 1\). Observe that each form \(\varphi_\alpha\,\omega\) now has support contained in \(U_\alpha\), so it is of **type 1** or **type 2** in that local coordinate patch.

3. **Key Observation: \(\sum_\alpha \mathrm{d}\varphi_\alpha = \mathrm{d}1 = 0\).**  
   From the properties of the partition of unity, we get
   \[
     \sum_\alpha (\mathrm{d}\varphi_\alpha) 
     \;=\;
     \mathrm{d}\left(\sum_\alpha \varphi_\alpha\right)
     \;=\;
     \mathrm{d}(1) 
     \;=\;
     0.
   \]
   Hence
   \[
     \sum_\alpha \int_M (\mathrm{d}\varphi_\alpha) \wedge \omega 
     \;=\;
     \int_M 
     \sum_\alpha (\mathrm{d}\varphi_\alpha \wedge \omega) 
     \;=\;
     \int_M \mathrm{d}\left(\sum_\alpha \varphi_\alpha\right) \wedge \omega
     \;=\;
     \int_M \mathrm{d}(1)\wedge \omega
     \;=\;
     0.
   \]

4. **Putting it All Together.**  
   We evaluate \(\int_M \mathrm{d}\omega\) by expressing \(\omega\) through the partition:
   \[
     \int_M \mathrm{d}\omega
     \;=\;
     \int_M \mathrm{d}\bigl(\sum_\alpha \varphi_\alpha\,\omega\bigr)
     \;=\;
     \sum_\alpha \int_M \mathrm{d}\bigl(\varphi_\alpha\,\omega\bigr).
   \]
   But
   \[
     \mathrm{d}\bigl(\varphi_\alpha\,\omega\bigr)
     \;=\;
     (\mathrm{d}\varphi_\alpha)\wedge \omega + \varphi_\alpha\, \mathrm{d}\omega.
   \]
   Therefore,
   \[
     \sum_\alpha \int_M \mathrm{d}\bigl(\varphi_\alpha\,\omega\bigr)
     \;=\;
     \sum_\alpha \int_M \Bigl(\varphi_\alpha\, \mathrm{d}\omega + (\mathrm{d}\varphi_\alpha)\wedge \omega\Bigr).
   \]
   We can separate the sums:
   \[
     \sum_\alpha \int_M \varphi_\alpha\, \mathrm{d}\omega
     \;+\;
     \sum_\alpha \int_M (\mathrm{d}\varphi_\alpha)\wedge \omega.
   \]
   The second sum is zero (by the key observation above). Hence,
   \[
     \int_M \mathrm{d}\omega
     \;=\;
     \sum_\alpha \int_M \varphi_\alpha\,\mathrm{d}\omega.
   \]
   On each \(U_\alpha\), by either case 1 or case 2, \(\int_M \varphi_\alpha\,\mathrm{d}\omega\) equals \(\int_{\partial M} \varphi_\alpha\, \omega\). Summing over \(\alpha\) gives
   \[
     \int_M \mathrm{d}\omega
     \;=\;
     \sum_\alpha \int_{\partial M} \varphi_\alpha\,\omega
     \;=\;
     \int_{\partial M}
     \Bigl(\sum_\alpha \varphi_\alpha\Bigr) \omega
     \;=\;
     \int_{\partial M} \omega.
   \]
   (Here, we used \(\sum_\alpha \varphi_\alpha = 1\) again.)

Because \(M\) is second countable (hence admits locally finite covers) and we only have finitely many \(\varphi_\alpha\neq 0\) on compact subsets, the sums and integrals are well-defined.

Thus, **in every case**, we conclude:
\[
\boxed{ 
  \int_M \mathrm{d}\omega
  \;=\;
  \int_{\partial M} \omega.
}
\]

**Q.E.D.**
</div>
</details>