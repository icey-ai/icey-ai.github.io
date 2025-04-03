---
title: 流形上的分析 Calculus on Manifold 笔记
# layout: posts
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
> $$\left\lVert{\cdot}\right\rVert$$ for norm; <br>
> $$\widehat{\cdot}$$ for omitting this item; <br>
> As in spivak, we use $$I^k$$ for identity $$k$$-cube, i.e. $$\mathrm{id}([0,1]^k)$$ <br>

<br>
<details>
<summary>Contents</summary>
<div markdown=1>

- [1 Fundamental Calculus Thm.](#1-fundamental-calculus-thm)<br>
      - [Definition 0](#definition-0)<br>
      - [Theroem 1(Fundamental Calculus Thm / Stokes)](#theroem-1fundamental-calculus-thm--stokes)<br>
- [2 Integration on Manifold](#2-integration-on-manifold)
  - [2.1 Independence of Parametrization](#21-independence-of-parametrization)
  - [2.2 Integration of forms](#22-integration-of-forms)
    - [2.2.1 Vector Field and forms on a Manifold](#221-vector-field--forms-on-a-manifold)
      - [Definition 1](#definition-1)
      - [Definition 2](#definition-2)
      - [Proposition 1](#proposition-1)
    - [2.2.2 Orientation of a manifold](#222-orientation-of-a-manifold)
      - [Definition 3](#definition-3)
      - [Definition 4](#definition-4)
      - [Definition 5](#definition-5)
  - [2.3 Manifold with Boundry](#23-manifold-with-boundry)
    - [2.3.1 Review of definitions about Manifold with Boundry](#231-review-of-definitions-about-manifold-with-boundry)
      - [Definition 6](#definition-6)
      - [Definition 7](#definition-7)
      - [Definition 8](#definition-8)
    - [2.3.2 More with Manifold with Boundry](#232-more-with-manifold-with-boundry)
      - [Definition 9](#definition-9)
      - [Definition 10](#definition-10)
      - [Proposition 2](#proposition-2)
      - [Remark 1](#remark-1)
    - [2.3.3 Outward Unit Normal for Manifold](#233-outward-unit-normal-for-manifold)
      - [Definition 11](#definition-11)
  - [2.4 Stokes Theorem on Manifolds / General Stokes for Manifold](#24-stokes-theorem-on-manifolds--general-stokes-for-manifold)
    - [2.4.1 Preparations](#241-preparations)
      - [Theroem 2(General Stokes)](#theroem-2general-stokes)
      - [Definition 12](#definition-12)
      - [Lemma 1](#lemma-1)
      - [Definition 13](#definition-13)
    - [2.4.2 Proof of general Stokes](#242-proof-of-general-stokes)
    - [2.4.3 Importance](#243-importance)
      - [Theorm 3 (Green's Theorem)](#theorm-3-greens-theorem)
  - [2.5 Volume Element](#25-volume-element)
    - [2.5.1 Volume of Manifold](#251-volume-of-manifold)
      - [Definition 14](#definition-14)
    - [2.5.2 The Volume Element of an Oriented Surface in 3 dimension](#252-the-volume-element-of-an-oriented-surface-in-r3)
      - [Proposition 3](#proposition-3)
      - [Lemma 2](#lemma-2)
    - [2.5.3 Divergence Theorem / Gauss's theorem](#253-divergence-theorem--gausss-theorem)
      - [Theorem 4 (Divergence Theorem / Gauss's theorem)](#theorem-4-divergence-theorem--gausss-theorem)
    - [2.5.4 Original Stokes' Theorem](#254-original-stokes-theorem)
      - [Theorem 5 (Original Stokes' Theorem)](#theorem-5-original-stokes-theorem)
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
\[f\dd{x^1}\wedge\cdots\wedge\widehat{\dd x_i}\wedge\cdots\wedge \dd{x^k}\]
Notice that
\[\begin{aligned}
\int_{\partial I^k}f\dd{x^1}\wedge\cdots\wedge\widehat{\dd x_i}\wedge\cdots\wedge \dd{x^k}&=\sum_{j=1}^{k}\sum_{\alpha=0}^1{(-1)}^{j+\alpha}\int_{I^k_{(j,\alpha)}}f\dd{x^1}\wedge\cdots\wedge\widehat{\dd x_i}\wedge\cdots\wedge \dd{x^k}\\
&=\sum_{j=1}^{k}\sum_{\alpha=0}^1{(-1)}^{j+\alpha}\int_{[0,1]^{k-1}}\left(I^k_{(j,\alpha)}\right)^\sharp f\dd{x^1}\wedge\cdots\wedge\widehat{\dd x_i}\wedge\cdots\wedge \dd x_k\\
&=\sum_{j=1}^{k}\sum_{\alpha=0}^1{(-1)}^{j+\alpha}\int_{[0,1]^{k-1}}f(x_1,\cdots,\alpha,\cdots,x_k)\dd{x^1}\wedge\cdots\wedge\widehat{\dd x_i}\wedge\cdots\wedge \dd x_k\\
&={(-1)}^{i}\int_{[0,1]^{k-1}}f(x_1,\cdots,0,\cdots,x_k)\;\dd{x^1}\cdots\widehat{\dd x_i}\cdots \dd{x^k} \\
&\;\;\;\;+ {(-1)}^{i+1}\int_{[0,1]^{k-1}}f(x_1,\cdots,1,\cdots,x_k)\;\dd{x^1}\cdots\widehat{\dd x_i}\cdots \dd{x^k}
\end{aligned}\]
Also, we may conclude that
\[\begin{aligned}
\int_{I^k}\dd(f\dd{x^1}\wedge\cdots\wedge\widehat{\dd x_i}\wedge\cdots\wedge \dd{x^k})&=\int_{I^k}\frac{\partial f}{\partial x_i}\wedge \dd x_i\wedge \dd{x^1}\wedge\cdots\wedge\widehat{\dd x_i}\wedge\cdots\wedge \dd{x^k}\\
&={(-1)}^{i-1}\int_{[0,1]^k}\frac{\partial f}{\partial x_i} \dd{x^1}\cdots \dd{x^k}\\
&={(-1)}^{i-1}\int_{[0,1]^{k-1}}(f(x_1,\cdots,1,\cdots,x_k)-f(x_1,\cdots,0,\cdots,x_k)) \dd{x^1}\cdots\widehat{\dd x_i}\cdots \dd{x^k}\quad\text{Using FCT in 1 dim}\\
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
You should compare this with the situation with functions: what if we were integrating a function over \( p([0,1]^k) = [0,1]^k \). You would have to say there's a change of variable formula
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

**Existence**

Since \(\varphi_{\sharp(a)}: \TanS{a}{\R^k} \to \TanS{\varphi(a)}(M)\) is a linear isomorphism and \(F(\varphi(a)) \in \TanS{\varphi(a)}{M}\), there exists a unique vector \(\xi \in \TanS{a}{\R^k}\) such that
\[
\varphi_{\sharp(a)}(\xi) = F(\varphi(a)).
\]
We define \(G(a) := \xi\). Because \(\varphi_{\sharp(a)}\) is an isomorphism, this choice of \(\xi\) is unique. Thus, we can define a vector field \(G: W \to T(\R^k)\) by repeating this construction at each point \(a \in W\).

**Uniqueness**

Suppose there exists another vector field \(\tilde{G}\) on \(W\) such that
\[
\varphi_{\sharp(a)}(\tilde{G}(a)) = F(\varphi(a)) \quad \text{for all } a \in W.
\]
Then define \(H(a) := G(a) - \tilde{G}(a)\). We have
\[
\varphi_{\sharp(a)}(H(a)) = \varphi_{\sharp(a)}(G(a) - \tilde{G}(a)) = \varphi_{\sharp(a)}(G(a)) - \varphi_{\sharp(a)}(\tilde{G}(a)) = 0.
\]
Since \(\varphi_{\sharp(a)}\) is injective, it follows that \(H(a) = 0\) for all \(a\), and thus \(G(a) = \tilde{G}(a)\). Therefore, \(G\) is unique.

**Independence of Coordinate Charts**

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

**Local Definition via a Coordinate Chart**

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

**Independence of the Coordinate Chart**

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

**Uniqueness of the \((p+1)\)-Form**

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
   If the pullback of \(\eta - \dd \omega\) is zero in every coordinate system, it means \(\eta - \dd \omega\) vanishes on each coordinate patch. Hence, by the sheaf property (or the formary fact that if a form vanishes in each coordinate system, it must vanish globally),  
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

**Orientation in \(\R^k\)**

   Recall that an orientation \(\mu_{\varphi(a)}\) at a point \(\varphi(a)\in\R^k\) can be identified with an ordered orthonormal basis \([v_1, \dots, v_k]\).  In particular, there exists a unique volume form \(\omega\) up to scalar such that:

   1. \(\omega(v_1, \dots, v_k) = 1\) whenever \([v_1, \dots, v_k]\) is the positively oriented orthonormal basis corresponding to \(\mu_{\varphi(a)}\).  
   2. \(\omega(L\,\vec{v}) = \det(L)\,\omega(\vec{v})\) for every linear transformation \(L\) and every \(k\)-tuple of vectors \(\vec{v} = (v_1, \dots, v_k)\).

**Determinant and Orientation**

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

**Composition with an Orientation-Reversing Chart**

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
   - By condition (1), \(V_1'\) locally resembles \(\R^k \times \{0\}^{n-k}\) in a way that is \(\mathcal{C}^r\)-diffeomorphic.  
   - By condition (2), \(V_2'\) locally resembles \(\mathbb{H}^k \times \{0\}^{n-k}\) (where \(\mathbb{H}^k\) is a half-space in \(\R^k\)) in a way that is \(\mathcal{C}^r\)-diffeomorphic.

under \(f\), the set
\[
V_1' \,\cap\, \bigl(\R^k \times \{0\}^{n-k}\bigr)
\]
(an open neighborhood in \(\R^k\)) must map to
\[
V_2' \,\cap\, \bigl(\mathbb{H}^k \times \{0\}^{n-k}\bigr),
\]
which is a set open in \(\mathbb{H}^k\) (in its subspace topology) but not open in the standard topology of \(\R^k\). Since a homeomorphism preserves topological openness, this situation is impossible. The image of an open set in \(\R^k\) under \(f\) would have to remain open in \(\R^k\), contradicting the fact that \(\mathbb{H}^k\) is not open in \(\R^k\).

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
   whose domain is \(f^{-1}\bigl(\mathrm{Im}(g)\bigr)\) and codomain is \(g^{-1}\bigl(\mathrm{Im}(f)\bigr)\). By construction, \(\gamma\) is a \(\mathcal{C}^r\) diffeomorphism between open subsets of \(\R^k\), and
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
\[\mathbb{H}^k = \{(x^1, \dots, x^k)\in\R^k : x^k\ge 0\},\]
with its usual orientation given by the standard volume form
\[\mu = \dd x^1\wedge \dd x^2\wedge \cdots\wedge \dd x^k\]
Its boundary is
\[\partial \mathbb{H}^k = \{(x^1,\dots,x^k)\in\R^k: x^k=0\},\]
which is naturally identified with \(\R^{k-1}\) (with the usual orientation \(\dd x^1\wedge\cdots\wedge \dd x^{k-1}\)).

The induced orientation on \(\partial \mathbb{H}^k\) is defined by using the **outward unit normal** to \(\mathbb{H}^k\). Since the interior of \(\mathbb{H}^k\) is \( \{x^k > 0\} \), the outward normal is the vector pointing in the direction where \(x^k\) decreases. In standard coordinates this is
\[n = -e_k = -\frac{\partial}{\partial x^k}\dd{x^k}\]
The induced \((k-1)\)-form is given by contracting the \(k\)-form \(\mu\) with \(n\):
\[\iota_{n}\mu = \iota_{-e_k}(\dd x^1\wedge\cdots\wedge \dd x^k)\]
Since
\[\iota_{e_k}(\dd x^1\wedge\cdots\wedge \dd x^k) = (-1)^{k-1}\,\dd x^1\wedge\cdots\wedge \dd x^{k-1}.\]
we now obtain
\[\iota_{-e_k}(\dd x^1\wedge\cdots\wedge \dd x^k) = -\iota_{e_k}(\dd x^1\wedge\cdots\wedge \dd x^k) = (-1)^k\,\dd x^1\wedge\cdots\wedge \dd x^{k-1}\]
This shows that the induced orientation on the boundary is given by the \((k-1)\)-form
\[(-1)^k\,\dd x^1\wedge\cdots\wedge \dd x^{k-1}\]
But the “usual orientation” on \(\R^{k-1}\) is \(\dd x^1\wedge\cdots\wedge \dd x^{k-1}\). Hence, the induced orientation on \(\partial H^k\) is \((-1)^k\) times the usual orientation. 
This factor \((-1)^k\) comes exactly from the contraction with the outward normal \(-e_k\) and reflects the combinatorial sign arising from removing the \(\dd x^k\) factor from the volume form.

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
> Let \( M \) be a compact oriented \( k \)-dimensional manifold-with-boundary (which is at least \( \mathcal{C}^2 \)) and \( \omega \) be a \( (k-1) \)-form on \( M \) (which is at least \( \mathcal{C}^1 \)). Then
> \[\int_M \dd \omega = \int_{\partial M} \omega\]
> where \( \partial M \) has induced orientation.

The problem is, the integral in this theroem has not yet been defined. So that's what we are going up to be working up first. 

###### Definition 12
>  Consider a singular \(p\) cube \(c:[0,1]^p\to M\) on a manifold \(M\). If \(\omega\) is a \(p\)-form on \(M\) we define
> \[\int_c\omega=\int_{[0,1]^p}c^\sharp\omega\]
> and for \(p\) chains \(c=\sum a_ic_i\), the integral is defined as before, i.e.
> \[\int_c\omega=\sum a_i\int_{c_i}\omega\]

> [!NOTE]
> In the rest part of this section, we will only work with $$k$$ cubes $$c$$ with a stronger condition that there exists an coordinate chart $$\xi:W\to\R^n$$ on $$M$$ such that 
> $$c=\xi|_{[0,1]^k}$$<br>
> As a map, we know $$c$$ is orientation preserving if and only if $$\xi$$ is orientation preserving.

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
for some function \(f : \xi_2^{-1}\bigl(\mathrm{supp}(\omega)\bigr)\to \R\). 

**Step 1: Define the transition map**

Set
\[
T \;=\; \xi_2^{-1} \,\circ\, \xi_1 \colon \quad \xi_1^{-1}\bigl(\mathrm{supp}(\omega)\bigr)
\,\longrightarrow\, \xi_2^{-1}\bigl(\mathrm{supp}(\omega)\bigr).
\]
By hypothesis, \(T\) is a local diffeomorphism between open sets in \(\R^k\).  In particular, on \([0,1]^k\subset \R^k\), it restricts to a map whose image remains in \(\xi_2^{-1}\bigl(\mathrm{supp}(\omega)\bigr)\).

**Step 2: Pull back \(\omega\) via \(\xi_1\)**

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

**Step 3: Change of variables using \(T\)**

Recall that for a smooth map \(T: U \to V \subset \R^k\) and a \(k\)-form \(f \,\dd x_1 \wedge \cdots \wedge \dd x_k\) on \(V\), the pullback is given by
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
By standard change-of-variable arguments in \(\R^k\),
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

Suppose \( M \) is a \( k \)-dimensional manifold-with-boundary, and \( \mu \) is an orientation for \( M \). Let \( \partial M \) be given the induced orientation \( \partial \mu \). Consider an orientation preserving \( k \)-cube \( c \) in \( M \) such that \( c_{(k,0)} \) lies in \( \partial M \) and is the only face having interior points in \( \partial M \). \( c_{(k,0)} \) is orientation preserving if \( k \) is even, otherwise, \( (-1)^k c_{(k,0)} \) is orientation preserving.

<details>
<summary>Proof Sketch</summary>
<div markdown=1>

Suppose we have a \(k\)–cube \(c\) that is mapped into \(M\) and that \(c\) is orientation preserving with respect to the given orientation on \(M\). Only its face
\[c_{(k,0)} = c|_{\{x^k=0\}}\]
lies in \(\partial M\).

- When we pull back the orientation from \(M\) to the cube by \(c\), the standard orientation on \(\R^k\) is given by \(\dd x^1\wedge\cdots\wedge \dd x^k\).
- The induced orientation on the boundary (via contraction with the outward normal) is, as computed above in Remark [**1**](#remark-1), \((-1)^k\,\dd x^1\wedge\cdots\wedge \dd x^{k-1}\).

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

**Step 1. The Case of an Interior \(k\)-Cube**


1. **Setup.**  
   Suppose first there exists an orientation‐preserving map (singular \(k\)-cube)
   \[
     c : [0,1]^k \,\longrightarrow\, M
   \]
   whose image is **entirely in the interior** of \(M\) (so it does not meet \(\partial M\)). Assume also \(\omega\) vanishes outside \(c([0,1]^k)\).  

2. **Fundamental Theorem of Calculus / Stokes in the Cube.**  
   By the standard form of the Stokes Theorem in \(\R^k\) ([“Fundamental Theorem of Calculus”](#theroem-1fundamental-calculus-thm--stokes)), we have
   \[
     \int_c \dd \omega 
     \;=\; 
     \int_{[0,1]^k} c^\sharp (\dd \omega)
     \;=\;
     \int_{[0,1]^k} \dd \bigl(c^\sharp \omega\bigr) 
     \;=\;
     \int_{\partial [0,1]^k} c^\sharp \omega 
     \;=\;
     \int_{\partial c} \omega.
   \]
   But \(\omega\) is zero outside \(c([0,1]^k)\), so  
   \[
     \int_M \dd \omega 
     \;=\;
     \int_c \dd \omega
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
     \int_M \dd \omega 
     \;=\;
     \int_{\partial M} \omega
     \;=\;
     0.
   \]

---

**Step 2. The Case of a \(k\)-Cube Meeting the Boundary in Exactly One Face**


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
     \int_{[0,1]^k} \dd \bigl(c^\sharp \omega\bigr) 
     \;=\;
     \int_{[0,1]^k} c^\sharp \dd \omega
     \;=\;
     \int_c \dd \omega.
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
     \int_c \dd \omega
     \;=\;
     \int_{M} \dd \omega.
   \]

Therefore, in this second scenario,
\[
\int_M \dd \omega
\;=\;
\int_{\partial M} \omega.
\]

---

**Step 3. The General Case via a Partition of Unity**


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

2. **Reducing \(\dd \omega\) to Sums of Special Cases.**  
   Write
   \[
     \omega
     \;=\;
     \sum_\alpha \varphi_\alpha \,\omega
   \]
   because \(\sum_\alpha \varphi_\alpha = 1\). Observe that each form \(\varphi_\alpha\,\omega\) now has support contained in \(U_\alpha\), so it is of **type 1** or **type 2** in that local coordinate patch.

3. **Key Observation: \(\sum_\alpha \dd \varphi_\alpha = \dd 1 = 0\).**  
   From the properties of the partition of unity, we get
   \[
     \sum_\alpha (\dd \varphi_\alpha) 
     \;=\;
     \dd \left(\sum_\alpha \varphi_\alpha\right)
     \;=\;
     \dd (1) 
     \;=\;
     0.
   \]
   Hence
   \[
     \sum_\alpha \int_M (\dd \varphi_\alpha) \wedge \omega 
     \;=\;
     \int_M 
     \sum_\alpha (\dd \varphi_\alpha \wedge \omega) 
     \;=\;
     \int_M \dd \left(\sum_\alpha \varphi_\alpha\right) \wedge \omega
     \;=\;
     \int_M \dd (1)\wedge \omega
     \;=\;
     0.
   \]

4. **Putting it All Together.**  
   We evaluate \(\int_M \dd \omega\) by expressing \(\omega\) through the partition:
   \[
     \int_M \dd \omega
     \;=\;
     \int_M \dd \bigl(\sum_\alpha \varphi_\alpha\,\omega\bigr)
     \;=\;
     \sum_\alpha \int_M \dd \bigl(\varphi_\alpha\,\omega\bigr).
   \]
   But
   \[
     \dd \bigl(\varphi_\alpha\,\omega\bigr)
     \;=\;
     (\dd \varphi_\alpha)\wedge \omega + \varphi_\alpha\, \dd \omega.
   \]
   Therefore,
   \[
     \sum_\alpha \int_M \dd \bigl(\varphi_\alpha\,\omega\bigr)
     \;=\;
     \sum_\alpha \int_M \Bigl(\varphi_\alpha\, \dd \omega + (\dd \varphi_\alpha)\wedge \omega\Bigr).
   \]
   We can separate the sums:
   \[
     \sum_\alpha \int_M \varphi_\alpha\, \dd \omega
     \;+\;
     \sum_\alpha \int_M (\dd \varphi_\alpha)\wedge \omega.
   \]
   The second sum is zero (by the key observation above). Hence,
   \[
     \int_M \dd \omega
     \;=\;
     \sum_\alpha \int_M \varphi_\alpha\,\dd \omega.
   \]
   On each \(U_\alpha\), by either case 1 or case 2, \(\int_M \varphi_\alpha\,\dd \omega\) equals \(\int_{\partial M} \varphi_\alpha\, \omega\). Summing over \(\alpha\) gives
   \[
     \int_M \dd \omega
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
  \int_M \dd \omega
  \;=\;
  \int_{\partial M} \omega.
}
\]

**Q.E.D.**
</div>
</details>

### 2.4.3 Importance
Stokes’ theorem shares three important attributes with many fully evolved major theorems:
   1. It is trivial.  
   2. It is trivial because the terms appearing in it have been properly defined.  
   3. It has significant consequences.
   
We will conclude this chapter by deducing a classical version of Stokes' Theorem, *Green's Theorem*:

###### Theorm 3 (Green's Theorem)
> Let \(M\subset\R^2\) be compact \(\R^2\) manifold-with-boundary and let \(\alpha,\beta\) be 2 \(\mathcal{C}^1\) function. Then
> \[\int_{\partial M}\alpha\dd{x}+\beta\dd{y}=\iint_M(\partial_x\beta-\partial_y\alpha)\dd{x}\dd{y}\]


<details>
<summary>Proof</summary>
<div markdown=1>

Let \(\omega=\alpha\dd{x}+\beta\dd{y}\). Then we have
\[\dd\omega=-\partial_y\alpha\dd{x}\dd{y}+\partial_x\beta\dd{x}\dd{y}\]
Thus, by *Stokes' Thm*,
\[\int_{\partial M}\alpha\dd{x}+\beta\dd{y}=\int_{M}\dd\omega=\iint_M(\partial_x\beta-\partial_y\alpha)\dd{x}\dd{y}\]

**Q.E.D.**

</div>
</details>

## 2.5 Volume Element
### 2.5.1 Volume of Manifold
Let \( M \) be a \( k \)-dimensional manifold (or manifold-with-boundary) in \( \R^n \), with an orientation \( \mu \). If \( x \in M \), then \( \mu_x \) and the inner product \( T_x \) we defined previously determine a volume element \( \omega(x) \in \Omega^k(\TanS{x}{M}) \). 

We therefore obtain a nowhere-zero \( k \)-form \( \omega \) on \( M \), which is called the **volume Element** on \( M \) (determined by \( \mu \)) and denoted \( \dd V \), even though it is not generally the differential of a \( (k - 1) \)-form. 

###### Definition 14

> The **volume** of \( M \) is defined as 
> \[\int_M \dd V\]
> provided this integral exists, which is certainly the case if \( M \) is compact. 

"Volume" is usually called **length** or **surface area** for one- and two-dimensional manifolds, and \( \dd V \) is denoted \( \dd s \) (the element of length) or \( \dd A \) [or \( \dd S \)] (the element of[surface] area). We are going to use these for specific versions of Stokes' Theorem. Let's look at some examples:

<details>
<summary>Example 1.</summary>
<div markdown=1>
Let \( M \) be some \( n \)-dimensional submanifold of \( \R^n \) with the standard orientation. Then

\[
\dd V = \dd x^1 \wedge \ldots \wedge \dd x^n
\]

Hence we have that

\[
\int_M \dd V = \int_M 1
\]

giving us that the volume of \( M \) agrees with our old definition.

</div>
</details>

<details>
<summary>Example 2.</summary>
<div markdown=1>
TODO
</div>
</details>

### 2.5.2 The Volume Element of an Oriented Surface in \(\R^3\)
A concrete case of interest to us is the volume element of an oriented surface (two-dimensional manifold) \(M\subset\R^3\). Let \(n(x)\) be an outward unit normal at \(x\in M\). If \(\omega\in\Omega^2(\TanS{x}{M})\) is defined by
\[\omega(v,w)=\det[v,w,n(x)]=\langle v\times w,\; n(x)\rangle\]
then \(\omega(v,w)=1\) for all orthonormal basis \(v,w\) of \(\TanS{x}{M}\) with postive orientation. Thus, as \(\omega\) prefectly satisfied the requirements of \(\dd A\), by uniqueness, we have \(\omega=\dd A\).
Therefore, if \([v,w]=\mu_x\),
\[\dd A(v,w)=\langle v\times w,\; n(x)\rangle=\norm{v\times w}\norm{n(x)}=\norm{v\times w}\]
If we wish to compute the area of \(M\), we may evaluate \(\int_{[0,1]^2}c^\sharp\dd A\) for orientation-preserving singular 2-cubes \(c\) and get
\[\begin{aligned}
\int_{[0,1]^2}c^\sharp\dd A&=\int_{[0,1]^2}c^\sharp\dd A(e_{1,a},\;e_{2,a})\\
&=\int_{[0,1]^2}\dd A(D c(a)(e_{1}),D c(a)(e_{2}))\\
&=\int_{[0,1]^2}\dd A\bigl((D_1c^1(a),D_1c^2(a),D_1c^3(a)),\;(D_2c^1(a),D_2c^2(a),D_2c^3(a))\bigr)\\
&=\int_{[0,1]^2}\norm{(D_1c^1(a),D_1c^2(a),D_1c^3(a))\times(D_2c^1(a),D_2c^2(a),D_2c^3(a))}\\
&=\int_{[0,1]^2}\sqrt{EG-F^2}
\end{aligned}\] 
where \(E=\sum D_1c^i(a),\ F=\sum D_1c^i(a)D_2c^i(a)\) and \(G=\sum D_2c^i(a)\). Calculating surface area is clearly a foolhardy enterprise; fortunately one seldom needs to know the area of a surface. 
Moreover, there is a simple expression for \(\dd A\) which suffices for theoretical considerations.

###### Proposition 3


> Let \( M \) be an oriented surface in \( \R^3 \), i.e. a 2 dimensional manifold with or without boundary, and \( n(x) = (n^1, n^2, n^3) \) be the outward unit normal at \( x \in M \). Then
> \[\dd A = n^1 \, \dd y \wedge \dd z + n^2 \, \dd z \wedge \dd x + n^3 \, \dd x \wedge \dd y \]
> Moreover,
> \[n^1 \dd A = \dd y \wedge \dd z, \quad n^2 \dd A = \dd z \wedge \dd x, \quad n^3 \dd A = \dd x \wedge \dd y\]

<details>
<summary>Proof of Prop.</summary>
<div markdown=1>

**Part (1). Expression for \(\dd A\)**


1. **Setup and Determinant Representation.**  
   The standard definition of the oriented area form on a surface \(M\subset\R^3\) uses the cross product: for vectors \(v,w\in T_x(\R^3)\cong \R^3\),
   \[\dd A_x(v,w)\;=\;\langle v \times w,\; n(x)\rangle\]
   Expanding this scalar triple product via the determinant, we get
   \[\dd A_x(v,w)\;=\;\det\begin{pmatrix}
       v^1 & v^2 & v^3 \\
       w^1 & w^2 & w^3 \\
       n^1 & n^2 & n^3
     \end{pmatrix}\;=\;n^1\bigl(v^2 w^3 - v^3 w^2\bigr)\;-\;n^2\bigl(v^1 w^3 - v^3 w^1\bigr)\;+\;n^3\bigl(v^1 w^2 - v^2 w^1\bigr).
   \]

2. **Wedge Product Representation.**  
   On the other hand, consider the 2‐form
   \[n^1 \,\dd y \wedge \dd z\;+\;n^2 \,\dd z \wedge \dd x\;+\;n^3 \,\dd x \wedge \dd y.\]
   Recall the definition of the wedge product on coordinate differentials, for \(v=(v^1,v^2,v^3)\) and \(w=(w^1,w^2,w^3)\):
   \[\dd y \wedge \dd z\,(v,w)\;=\;\dd y(v)\,\dd z(w)\;-\;\dd y(w)\,\dd z(v)\;=\;v^2 w^3 \;-\; v^3 w^2.\]
   Similar formulas hold for \(\dd z \wedge \dd x\) and \(\dd x \wedge \dd y\). Therefore,
   \[\bigl(n^1\,\dd y \wedge \dd z+ n^2\,\dd z \wedge \dd x + n^3\,\dd x \wedge \dd y\bigr)(v,w)= n^1 (v^2 w^3 - v^3 w^2)- n^2 (v^1 w^3 - v^3 w^1)+ n^3 (v^1 w^2 - v^2 w^1).\]

3. **Equality of the Two Expressions.**  
   Comparing the two expressions shows that, for each \(x\in M\) and \(v,w\in T_x(\R^3)\),
   \[\dd A_x(v,w)\;=\;n^1\,\dd y \wedge \dd z\;+\;n^2\,\dd z \wedge \dd x\;+\;n^3\,\dd x \wedge \dd y\quad\text{evaluated at }(v,w).\]
   Hence the 2‐form \(\dd A\) on \(M\) is given by
   \[\dd A\;=\;n^1 \,\dd y \wedge \dd z\;+\;n^2 \,\dd z \wedge \dd x\;+\;n^3 \,\dd x \wedge \dd y.\]

---

**Part (2). Multiplying \(\dd A\) by \(n^i\)**


To prove
\[n^1\,\dd A = \dd y \wedge \dd z,\quad n^2\,\dd A = \dd z \wedge \dd x,\quad n^3\,\dd A = \dd x \wedge \dd y,\]
we note that \(v \times w\) for \(v,w \in T_x(\R^3)\) is always a scalar multiple of \(n(x)\) if \(v,w\) lie in the tangent plane to \(M\). Concretely, if \(v,w\in \TanS{x}{M}\subseteq T_x(\R^3)\), then \(v \times w\) is normal to \(M\), hence proportional to \(n(x)\).

For any \(z\in T_x(\R^3)\), one has
\[\langle z,n(x)\rangle \,\langle v\times w,\,n(x)\rangle\;=\;\langle z,\;v \times w\rangle\]
By choosing \(z\) to be the coordinate basis vectors \(e_1\), we have
\[n^1\dd A(v,w)=\langle e_1,n(x)\rangle \,\langle v\times w,\,n(x)\rangle=\langle e_1,\;v \times w\rangle=v^2 w^3 \;-\; v^3 w^2=(\dd y \wedge \dd z)(v,w)\]
Thus,
\[n^1\,\dd A = \dd y \wedge \dd z\]
Likewise, by setting \(z\) to be \( e_2, e_3\) in \(\R^3\), one may recover the formulas
\[n^2(\dd A) \;=\; \dd z \wedge \dd x,\quad n^3(\dd A) \;=\; \dd x \wedge \dd y.\]
Hence, all the stated identities hold. 

**Q.E.D.**

</div>
</details>

**A word of caution:** if \( \omega \in \Omega^2(\R^3_a) \) is defined by
\[
\omega = n^1(a) \cdot dy(a) \wedge dz(a) \\
\quad\;\;\; + n^2(a) \cdot dz(a) \wedge \dd x(a) \\
\quad\;\;\; + n^3(a) \cdot \dd x(a) \wedge dy(a),
\]
it is *not* true, for example, that
\[
n^1(a) \cdot \omega = dy(a) \wedge dz(a).
\]
The two sides give the same result only when applied to \( v, w \in \TanS{a}{M} \).

We may generalize this Prop. into following lemma:

###### Lemma 2

> Let \( M \) be an oriented hypersurface on \( \R^n \) (with or without boundary) and \( \vec{n}=n(x) \) be its outward unit normal. Then
> \[\dd A = \sum_{i=1}^{n} (-1)^{i-1} \vec{n}^i \, \dd x^1 \wedge \ldots \wedge \widehat{\dd x^i} \wedge \ldots \wedge \dd x^n\]
> Moreover,
> \[\forall i, \quad \vec{n}^i \dd A = (-1)^{i-1} \dd x^1 \wedge \ldots \wedge \widehat{\dd x^i} \wedge \ldots \wedge \dd x^n\]

<details>
<summary>Proof</summary>
<div markdown=1>


**Proof of Eq1.**


**Expression for \(\dd A\)**

Let \(\beta = \{\beta_1,\dots,\beta_{n-1}\}\) be a positively oriented orthonormal basis in \(\TanS{x}{M}\). Write \(\beta_j=(\beta_j^1,\dots,\beta_j^n)\in\R^n\). By definition,
\[\Bigl(\sum_{i=1}^{n}(-1)^{i-1}\,\vec{n}^{\,i}\,\dd x^1 \wedge \cdots\wedge \widehat{\dd x^i}\wedge \cdots\wedge \dd x^n\Bigr)\!(\beta)\;=\;\sum_{i=1}^{n}(-1)^{i-1}\,\vec{n}^{\,i}\,\det(A_i),\]
where \(A_i\) is the \((n-1)\times(n-1)\) matrix whose \((j,k)\)-th entry is
\[\dd x^k(\beta_j),\quad k \,\in\,\{\,1,\dots,i-1,i+1,\dots,n\}.\]
Equivalently, we can view this sum of determinants as the expanded determinant of the following \(n\times n\) matrix (adding the row \(\vec{n}\) to the top and filling the rest with the coordinates of \(\beta\)):
\[\begin{pmatrix}
\vec{n}^{\,1} & \vec{n}^{\,2} & \cdots & \vec{n}^{\,n}\\[6pt]
\dd x^1(\beta_1) & \dd x^2(\beta_1) & \cdots & \dd x^n(\beta_1)\\[3pt]
\vdots & \vdots & \ddots & \vdots \\[3pt]
\dd x^1(\beta_{n-1}) & \dd x^2(\beta_{n-1}) & \cdots & \dd x^n(\beta_{n-1})
\end{pmatrix}.\]
Hence,
\[\sum_{i=1}^{n}(-1)^{i-1}\,\vec{n}^{\,i}\,\det(A_i)\;=\;\det\Bigl(\,[\,\vec{n},\beta_1,\dots,\beta_{n-1}\,]\Bigr),\]
where \([\vec{n},\beta_1,\dots,\beta_{n-1}]\) denotes the \(n\times n\) matrix with columns \(\vec{n},\beta_1,\dots,\beta_{n-1}\).

**Relation to the Unit Normal**

Since \(\beta_1,\dots,\beta_{n-1}\) lie in \(\TanS{x}{M}\) and \(\vec{n}=n(x)\) is the unit normal, the \(n\)-tuple \(\{\vec{n},\beta_1,\dots,\beta_{n-1}\}\) forms a positively oriented orthonormal basis for \(\R^n\). Therefore,
\[\det\bigl(\,\vec{n},\beta_1,\dots,\beta_{n-1}\bigr)\;=\;1.\]
Putting it together, for every positively oriented orthonormal basis \(\beta\subset \TanS{x}{M}\),
\[\Bigl(\sum_{i=1}^{n}(-1)^{i-1}\,\vec{n}^{\,i}\,\dd x^1\wedge\cdots\wedge\widehat{\dd x^i}\wedge\cdots\wedge\dd x^n\Bigr)\!(\beta)\;=\;1\;=\;\dd A_x(\beta).\]
Since such \(\beta\) characterize \(\dd A\) completely, we conclude
\[\dd A\;=\;\sum_{i=1}^{n}(-1)^{i-1}\,\vec{n}^{\,i}  \,\dd x^1\wedge\cdots\wedge\widehat{\dd x^i}\wedge\cdots\wedge\dd x^n.\]

---

**Proof of Eq2.**


We want to show
\[\vec{n}^{\,i}\,\dd A\;=\;(-1)^{i-1}\,\dd x^1\wedge \cdots\wedge \widehat{\dd x^i}\wedge \cdots\wedge \dd x^n.\]
Equivalently,
\[(\vec{n}^{\,i}\,\dd A)\!(\beta)\;=\;(-1)^{i-1}\,\bigl(\dd x^1\wedge \cdots\wedge \widehat{\dd x^i}\wedge \cdots\wedge \dd x^n\bigr)\!(\beta)\quad\text{for all }\beta\subset \TanS{x}{M}.\]

**Orthogonality Condition \(\sum_{j=1}^n \vec{n}^{\,j}\,\dd x^j = 0\) on \(\TanS{x}{M}\)**

Since \(\vec{n}\) is orthogonal to every vector \(v\in \TanS{x}{M}\), we have \(\langle \vec{n},v\rangle=0\). But
\[\langle \vec{n}, v\rangle=\sum_{j=1}^n \vec{n}^{\,j}\,v^j =\sum_{j=1}^n \vec{n}^{\,j}\,\dd x^j(v),\]
so \(\bigl(\sum_{j=1}^n \vec{n}^{\,j}\,\dd x^j\bigr)(v) = 0\) for all \(v\in \TanS{x}{M}\). Hence,
\[\sum_{j=1}^n \vec{n}^{\,j}\,\dd x^j\;=\;0\quad\text{on }\TanS{x}{M}.\]
We use this identity to simplify expressions involving wedge products.

**Computation**

For all \(j > i\), we may obtain
\[\begin{aligned}
\vec{n}^i \vec{n}^j \dd x^1 \wedge \ldots \wedge \widehat{\dd x^j} \wedge \ldots \wedge \dd x^n&=(-1)^{i-1}\vec{n}^j(\vec{n}^i \dd x^i)\bigwedge_{k=1,k\neq i,j}^n\dd x^k\\
&=(-1)^{i}\vec{n}^j\left(\sum_{l=1,l\neq i}^n \vec{n}^l\dd x^l\right)\bigwedge_{k=1,k\neq i,j}^n\dd x^k\\
&=(-1)^{i}\sum_{l=1,l\neq i}^n\vec{n}^j\vec{n}^l\dd x^l\wedge\left(\bigwedge_{k=1,k\neq i,j}^n\dd x^k\right)\\
&=(-1)^{i}\vec{n}^j\vec{n}^j\dd x^j\wedge\left(\bigwedge_{k=1,k\neq i,j}^n\dd x^k\right)\\
&=(-1)^{i+j-2}\vec{n}^j\vec{n}^j\left(\bigwedge_{k=1,k\neq i}^n\dd x^k\right)\\
\end{aligned}\]
Likewise, for all \(j < i\),
\[\vec{n}^i \vec{n}^j \dd x^1 \wedge \ldots \wedge \widehat{\dd x^j} \wedge \ldots \wedge \dd x^n=(-1)^{i+j-2}\vec{n}^j\vec{n}^j\left(\bigwedge_{k=1,k\neq i}^n\dd x^k\right)\]
and for \(i=j\), we just have \(\vec{n}^i\vec{n}^i\left(\bigwedge_{k=1,k\neq i}^n\dd x^k\right)\).
Hence,
\[\begin{aligned}
n^i\dd A&=n^i\sum_{j=1}^{n}(-1)^{j-1} \vec{n}^j \, \dd x^1 \wedge \ldots \wedge \widehat{\dd x^j} \wedge \ldots \wedge \dd x^n\\
&=(-1)^{i-1}\left(\sum_{j=1}^{n}\vec{n}^j\vec{n}^j\right)\left(\bigwedge_{k=1,k\neq i}^n\dd x^k\right)\\
&=(-1)^{i-1} \dd x^1 \wedge \ldots \wedge \widehat{\dd x^i} \wedge \ldots \wedge \dd x^n
\end{aligned}\]

**Q.E.D.**

</div>
</details>

### 2.5.3 Divergence Theorem / Gauss's theorem

###### Theorem 4 (Divergence Theorem / Gauss's theorem)  

> Let \( M \subset \R^n \) be a compact \(n\)-dimensional manifold-with-boundary and \( \vec{n} \) the unit outward normal on \( \partial M \). Let \( F \) be a differentiable vector field on \( M \). Then
> \[\int_M \operatorname{div} F \, \dd V = \int_{\partial M} \langle F, n \rangle \, \dd A.\]
> where \( \operatorname{div} F = \frac{\partial F^1}{\partial x^1} + \cdots + \frac{\partial F_n}{\partial x^n} \), \(\dd V\) is the volume form(i.e. \(\dd V=\bigwedge\dd x^i\)) on \(\R^n\), and \(\dd A\) is the induced \((n-1)\)-dimensional area form on the boundary.

<details>
<summary>Proof</summary>
<div markdown=1>

1. **Definition of \(\omega\).**  
   Define the \((n-1)\)-form \(\omega\) on \(\R^n\) by
   \[\omega \;=\;\sum_{i=1}^n (-1)^{\,i-1}\,F_i\,\dd x^1\wedge \cdots \wedge \widehat{\dd x^i}\wedge \cdots \wedge \dd x^n.\]
   Here, \(\widehat{\dd x^i}\) means that the form \(\dd x^i\) is omitted from the wedge product.

2. **Compute \(\dd \omega\).**  
   Recall that the exterior derivative \(\dd \) distributes over sums and acts on the wedge product by
   \(\dd (f\,\alpha) = \dd f \wedge \alpha + f\,\dd \alpha\). Since each wedge term involves no further differentials, we get
   \[\dd \omega\;=\;\dd \Bigl(\sum_{i=1}^n (-1)^{i-1}\,F_i\,\dd x^1\wedge \cdots\wedge \widehat{\dd x^i}\wedge \cdots\wedge \dd x^n\Bigr)\;=\;\sum_{i=1}^n (-1)^{i-1}\,\dd F_i \,\wedge\dd x^1\wedge \cdots \wedge \widehat{\dd x^i} \wedge \cdots \wedge \dd x^n. \]
   Writing \(\dd F_i = \sum_{j=1}^n \frac{\partial F_i}{\partial x^j}\,\dd x^j\) and noting that only \(\dd x^i\) will survive in the wedge product (otherwise the wedge becomes zero by repetition), we simplify to
   \[\dd \omega\;=\;\sum_{i=1}^n (-1)^{i-1}\Bigl(\sum_{j=1}^n \frac{\partial F_i}{\partial x^j}\,\dd x^j\Bigr)\,\wedge\,(\textstyle\widehat{\dd x^i}\dots)\;=\;\sum_{i=1}^n (-1)^{i-1}\,\frac{\partial F_i}{\partial x^i}\,\dd x^i \wedge (\widehat{\dd x^i}\dots)\;=\;\sum_{i=1}^n \frac{\partial F_i}{\partial x^i}\,\dd x^1\wedge \cdots \wedge \dd x^n.\]
   Thus,
   \[\dd \omega\;=\;\Bigl(\sum_{i=1}^n \frac{\partial F_i}{\partial x^i}\Bigr)\,\dd V\;=\;(\operatorname{div} F)\,\dd V.\]

3. **Relating \(\omega\) to \(\langle F,\mathbf{n}\rangle\,\dd A\).**  
   By [Lemma 2](#lemma-2), we have
   \[\langle F,\mathbf{n}\rangle \,\dd A\;=\;\sum_{i=1}^n F_i\,\mathbf{n}^i\,\dd A\;=\;\sum_{i=1}^n(-1)^{\,i-1}\,F_i\,\dd x^1\wedge \cdots \wedge \widehat{\dd x^i}\wedge \cdots \wedge \dd x^n\;=\;\omega.\]
   So on the boundary \(\partial M\), the \((n-1)\)-form \(\omega\) coincides with \(\langle F,\mathbf{n}\rangle\,\dd A\).

4. **Applying Stokes’ Theorem.**  
   Since \(M\) is an oriented manifold with boundary \(\partial M\), the [*General Stokes Theorem*](#theroem-2general-stokes) tells us
   \[\int_{M} \dd \omega\;=\;\int_{\partial M} \omega.\]
   Substituting \(\dd \omega = (\operatorname{div}F)\,\dd V\) and \(\omega = \langle F,\mathbf{n}\rangle\,\dd A\), we get
   \[\int_{M} (\operatorname{div}F)\,\dd V\;=\;\int_{\partial M} \langle F,\mathbf{n}\rangle\,\dd A.\]
   This completes the proof.

**Q.E.D.**

</div>
</details>

Let's look at some examples:

<details>
<summary>Example 1.</summary>
<div markdown=1>

Use the divergence theorem to evaluate  
\[\int_S \vec{F} \cdot \dd\vec{S}\]
where  
\[\vec{F} = (xy, -\frac{1}{2} y^2, z)\]
and the surface consists of the three surfaces:

- Top: \( z = 4 - 3x^2 - 3y^2 \), with \( 1 \leq z \leq 4 \)  
- Sides: \( x^2 + y^2 = 1 \), with \( 0 \leq z \leq 1 \)  
- Bottom: \( z = 0 \)

<details>
<summary>Solution</summary>
<div markdown=1>

**Step 1. Compute the Divergence of \(\vec{F}\)**


Since
- \(F^1 = xy\) so \(\frac{\partial F^1}{\partial x} = y\).
- \(F^2 = -\frac{1}{2} y^2\) so \(\frac{\partial F^2}{\partial y} = -y\).
- \(F^3 = z\) so \(\frac{\partial F^3}{\partial z} = 1\).

we have,
\[\operatorname{div} \vec{F} = y + (-y) + 1 = 1.\]

**Step 2. The Flux Equals the Volume of \(V\)**


Since \(\operatorname{div} \vec{F} = 1\), the divergence theorem tells us that
\[\iint_S \vec{F} \cdot \dd\vec{S} = \iiint_V 1\, \dd V = \operatorname{Vol}(V).\]

So our task reduces to finding the volume of \(V\).

**Step 3. Describe the Region \(V\) and Set Up the Volume Integral**


Examine the three surfaces:

- **Top Surface:** \(z = 4 - 3(x^2+y^2)\) for points where \(z \ge 1\). Notice that when \(z=1\), we have
  \[1 = 4 - 3(x^2+y^2) \quad \Longrightarrow \quad x^2+y^2 = 1.\]
  Thus, the paraboloid covers the region above the disk \(x^2+y^2 \le 1\) in the \(xy\)-plane and gives \(z\) values from 1 up to 4.

- **Side Surface:** \(x^2+y^2 = 1\) for \(0 \le z \le 1\). This is a vertical wall closing off the bottom part of \(V\).

- **Bottom Surface:** \(z=0\) for \(x^2+y^2 \le 1\).

Putting these pieces together, the region \(V\) is described in cylindrical coordinates by:
\[x = r\cos\theta,\quad y = r\sin\theta,\quad z=z,\]
with:
\[0 \le r \le 1,\quad 0 \le \theta < 2\pi,\quad 0 \le z \le 4 - 3r^2.\]
Notice that when \(r=1\), \(z\) runs from 0 to \(4-3(1^2)=1\); when \(r=0\), \(z\) runs from 0 to 4.

The volume element in cylindrical coordinates is \(\dd V = r\,\dd z\,\dd r\,\dd \theta\). Therefore, the volume of \(V\) is
\[\operatorname{Vol}(V) = \int_{\theta=0}^{2\pi} \int_{r=0}^{1} \int_{z=0}^{4-3r^2} r\,\dd z\,\dd r\,\dd \theta.\]

**Step 4. Evaluate the Volume Integral**


1. **Integrate with respect to \(z\):**
  \[\int_{z=0}^{4-3r^2} \dd z = 4-3r^2.\]

2. **Integrate with respect to \(r\):**
  \[\int_{r=0}^{1} r(4-3r^2)\,\dd r.\]
  Expand the integrand:
  \[r(4-3r^2) = 4r - 3r^3.\]
  Now compute:
  \[\int_{0}^{1} (4r - 3r^3)\,\dd r = \left[2r^2 - \frac{3}{4}r^4\right]_{0}^{1} = 2 - \frac{3}{4} = \frac{8-3}{4} = \frac{5}{4}.\]

3. **Integrate with respect to \(\theta\):**
  \[\int_{0}^{2\pi} \dd\theta = 2\pi.\]

Thus, the volume is
\[\operatorname{Vol}(V) = 2\pi \cdot \frac{5}{4} = \frac{5\pi}{2}.\]

**Step 5. Conclude the Flux**


By the divergence theorem,
\[\iint_S \vec{F} \cdot \dd\vec{S} = \operatorname{Vol}(V) = \frac{5\pi}{2}.\]

**Final Answer**

\[\boxed{\frac{5\pi}{2}}\]

</div>
</details>

</div>
</details>

<details>
<summary>Example 2.</summary>
<div markdown=1>

Evaluate the flux integral  
\[\iint_S \vec{F} \cdot \vec{n} \, \dd S\]  
where \( \vec{n} \) is the outward normal to \( S \),  
which is the part of the surface  
\[z^2 = x^2 + y^2 \quad \text{with} \quad 1 \leq z \leq 2,\]  
and where  
\[\vec{F} = (3x, 5y + e^{\cos x}, z ).\]

<details>
<summary>Solution</summary>
<div markdown=1>

**Step 1. Compute the Divergence**


We have
\[\operatorname{div}\vec{F} = \frac{\partial (3x)}{\partial x} + \frac{\partial (5y+e^{\cos x})}{\partial y} + \frac{\partial (z)}{\partial z}.\]
Since
\[\frac{\partial (3x)}{\partial x}=3,\quad \frac{\partial (5y+e^{\cos x})}{\partial y}=5,\quad \frac{\partial (z)}{\partial z}=1,\]
it follows that
\[\operatorname{div}\vec{F} = 3+5+1=9.\]

**Step 2. Compute the Volume of \(V\)**


The closed surface \(S_{\text{closed}}\) encloses the region
\[V=\{(x,y,z): 1\le z\le 2,\; x^2+y^2\le z^2\}.\]
It is most convenient to use cylindrical coordinates:
\[x=r\cos\theta,\quad y=r\sin\theta,\quad z=z,\]
with the relation \(x^2+y^2=r^2\le z^2\) so that
\[0\le r\le z,\quad 1\le z\le 2,\quad 0\le\theta<2\pi.\]
The volume element is \(\dd V=r\,\dd r\,\dd\theta\,\dd z\). Thus,
\[\operatorname{Vol}(V)=\int_{z=1}^{2}\int_{\theta=0}^{2\pi}\int_{r=0}^{z} r\,\dd r\,\dd\theta\,\dd z\]
First, integrate in \(r\):
\[\int_{0}^{z} r\,\dd r = \frac{z^2}{2}.\]
Then in \(\theta\):
\[\int_{0}^{2\pi} \dd\theta = 2\pi.\]
So
\[\operatorname{Vol}(V)=\int_{z=1}^{2} \frac{z^2}{2}\cdot (2\pi)\,\dd z = \pi\int_{z=1}^{2}z^2\,\dd z.\]
Compute the \(z\)–integral:
\[\int_{1}^{2} z^2\,\dd z = \left.\frac{z^3}{3}\right|_{1}^{2} = \frac{8-1}{3}=\frac{7}{3}.\]
Thus,
\[\operatorname{Vol}(V)= \pi\cdot\frac{7}{3}=\frac{7\pi}{3}.\]

**Step 3. Apply the Divergence Theorem to the Closed Surface**


By the divergence theorem,
\[\iint_{S_{\text{closed}}}\vec{F}\cdot \vec{n}\,\dd S = \iiint_V (\operatorname{div}\vec{F})\,\dd V = 9\cdot \frac{7\pi}{3} = 21\pi.\]

**Step 4. Compute the Flux Through the Caps**


Now we must “subtract” the flux through the added caps to isolate the flux through the lateral surface \(S=S_{\text{lat}}\).

**Top Cap (\(z=2\))**

On the top, \(z=2\) and \(x^2+y^2\le4\). The outward unit normal is \( \vec{n}=(0,0,1)\). Then
\[\vec{F}(x,y,2)=(3x,\;5y+e^{\cos x},\;2).\]
Thus,
\[\vec{F}\cdot \vec{n} = 2.\]
The area of the top disk is \(\pi(2)^2=4\pi\). Hence, the flux through the top is:
\[\Phi_{\text{top}} = 2\cdot (4\pi)=8\pi.\]

**Bottom Cap (\(z=1\))**

On the bottom, \(z=1\) and \(x^2+y^2\le1\). Here the outward unit normal is directed \emph{downward} (since \(V\) lies above the bottom cap); that is, \( \vec{n}=(0,0,-1)\). At \(z=1\),
\[\vec{F}(x,y,1)=(3x,\;5y+e^{\cos x},\;1).\]
Thus,
\[\vec{F}\cdot \vec{n} = 1\cdot(-1)= -1.\]
The area of the bottom disk is \(\pi(1)^2=\pi\). So, the flux through the bottom is:
\[\Phi_{\text{bottom}} = -1\cdot \pi = -\pi.\]

**Step 5. Solve for the Lateral Flux**


The total flux through the closed surface is the sum of the fluxes over the three pieces:
\[\Phi_{\text{closed}} = \Phi_{\text{lat}} + \Phi_{\text{top}} + \Phi_{\text{bottom}}.\]
We computed:
\[\Phi_{\text{closed}} = 21\pi,\quad \Phi_{\text{top}} = 8\pi,\quad \Phi_{\text{bottom}} = -\pi.\]
Thus, the flux through the lateral surface is:
\[\Phi_{\text{lat}} = 21\pi - \left(8\pi + (-\pi)\right)= 21\pi - (8\pi - \pi) = 21\pi - 7\pi = 14\pi.\]

**Final Answer**

The flux through the lateral surface \(S\) is
\[\boxed{14\pi.}\]

</div>
</details>

</div>
</details>

<details>
<summary>Example 3. Volume of n-ball</summary>
<div markdown=1>

Denote the volume of \(n\)-ball as \(V_n\) and the surface area as \(S_n\), i.e.
\[V_n(R)=\mathrm{Vol}(\{x_1^2+\cdots+x_n^2\leqslant R^2|x\in\R^n\})\]
\[S_{n-1}(R)=\mathrm{Vol}(\{x_1^2+\cdots+x_n^2= R^2|x\in\R^n\})\]

We will show following 3 properties:
- \(V_n(R)=\frac{2\pi R^2}{n}V_{n-2}(R)\)
- \(V_n(R)=\frac{R}{n}S_{n-1}(R)\)
- \(S_{n-1}(R)=\frac{\dd}{\dd R}V_n(R)\)

<details>
<summary>Proof of Eq1.</summary>
<div markdown=1>

**1. Splitting \(\R^n \cong \R^{n-2} \times \R^2\)**

Write a vector \(\vec{x}\in \R^n\) as \(\vec{x}=(u,y)\), where
\[u \;\in\; \R^{n-2},\quad y \;\in\; \R^2.\]
Then \(\|\vec{x}\|\le r\) implies
\[\norm{u}\;\le\;\sqrt{\,r^2 - \norm{y}^2\,}\quad\text{and}\quad\norm{y}\;\le\;r.\]
Hence, the volume of \(B_n(r)\) can be written as
\[V_n(r)\;=\;\int_{\{\norm{y}\le r\}}\int_{\{\norm{u}\le \sqrt{r^2-\norm{y}^2}\}}\dd u\,\dd y.\]
The inner integral,
\[\int_{\{\norm{u}\le \sqrt{\,r^2 - \norm{y}^2\,}\}} \dd u,\]
is precisely the volume of the \(\,(n-2)\)-dimensional ball of radius \(\sqrt{r^2 - \norm{y}^2}\). By definition of \(V_{n-2}(\,\cdot\,)\), this is
\[V_{n-2}\!\bigl(\sqrt{\,r^2 - \norm{y}^2\,}\bigr).\]
Therefore,
\[V_n(r)\;=\;\int_{\{\norm{y}\le r\}}V_{n-2}\!\bigl(\sqrt{r^2 - \norm{y}^2}\bigr)\,\dd y.
\]

**2. Using Polar Coordinates in the \(y\)-Plane**

Next, switch to polar coordinates \((\rho,\theta)\) in the \(\R^2\)‐plane for \(y\):
\[y = (\rho\cos\theta,\;\rho\sin\theta),\quad\rho \;\in\;[0,r],\quad \theta\;\in\;[0,2\pi].\]
Then \(\dd y = \rho\,\dd \rho\,\dd \theta\). Substituting into the integral,
\[V_n(r)\;=\;\int_{0}^{r} \int_{0}^{2\pi}V_{n-2}\!\bigl(\sqrt{r^2 - \rho^2}\bigr)\,\rho\;\dd \theta\,\dd \rho.\]
Since \(V_{n-2}(\sqrt{r^2-\rho^2})\) does not depend on \(\theta\), we can factor out the \(2\pi\):
\[V_n(r)\;=\;2\pi \int_{0}^{r}V_{n-2}\!\bigl(\sqrt{r^2 - \rho^2}\bigr)\,\rho\,\dd \rho.\]
As \(V_{n-2}\!\bigl(\sqrt{r^2 - \rho^2}\bigr)=\bigl(\sqrt{r^2 - \rho^2}\bigr)^{n-2}V_{n-2}(1)\), one may find out that
\[\int_{0}^{r}V_{n-2}\!\bigl(\sqrt{r^2 - \rho^2}\bigr)\,\rho\,\dd \rho=-\frac{r^2}{n}V_{n-2}(1)\bigl(r^2 - \rho^2\bigr)^{\frac{n}{2}}|_{0}^{r}=\frac{r^2}{n}V_{n-2}(r)\]
Putting this back into the expression for \(V_n(r)\) gives
\[V_n(r)\;=\;2\pi\cdot\frac{r^2}{n}\cdot V_{n-2}(r)\]

Thus, we arrive at the desired recursion:
\[\boxed{ V_n(r)\;=\;\frac{2\pi\,r^2}{n}\,V_{n-2}(r).}\]

**Q.E.D.**

**Remarks: Explicit Closed‐Form.**  

  Iterating the recursion leads to the well‐known formula
  \[V_n(r)\;=\;\frac{\pi^{\,\tfrac{n}{2}}}{\Gamma\bigl(\tfrac{n}{2}+1\bigr)}\,r^n,\]
  where \(\Gamma(\,\cdot\,)\) is the Gamma function.  
</div>
</details>
<details>

<summary>Proof of Eq2.</summary>
<div markdown=1>

**Setup**  
   
   Let \(\vec{F}(\vec{x}) = \vec{x}\) be the vector field on \(\R^n\). We consider the closed ball \(B_R\subset\R^n\) of radius \(R\) (centered at the origin) and its boundary \(\partial B_R\), which is the \((n-1)\)-dimensional sphere of radius \(R\).

**Compute \(\Div F\).**  

   Since \(\vec{F} = (x_1, x_2, \dots, x_n)\), its divergence is
   \[\Div F\;=\;\frac{\partial x_1}{\partial x_1}\;+\;\frac{\partial x_2}{\partial x_2}\;+\;\cdots\;+\;\frac{\partial x_n}{\partial x_n}\;=\;n.\]

**Apply the Divergence Theorem**  

   The Divergence Theorem (a.k.a. the Gauss–Ostrogradsky Theorem) tells us
   \[int_{B_R} (\Div F) \,\dd V\;=\;\int_{\partial B_R} \langle \vec{F}, \mathbf{n}\rangle \,\dd A,\]
   where \(\mathbf{n}\) is the outward unit normal on \(\partial B_R\), and \(\dd A\) is the \((n-1)\)-dimensional area element on the sphere.

**Left‐Hand Side (Volume Integral)**  

   Since \(\Div F = n\), the left side is
   \[\int_{B_R} (\Div F) \,\dd V\;=\;\int_{B_R} n \,\dd V\;=\;n \,\int_{B_R} \dd V\;=\;n \,V_n(R),\]
   where \(V_n(R)\) is the volume of the \(n\)-dimensional ball of radius \(R\).

**Right‐Hand Side (Surface Integral)**  

   On the sphere \(\|\vec{x}\| = R\), the outward normal is \(\mathbf{n}(\vec{x}) = \frac{\vec{x}}{R}\). Hence, on \(\partial B_R\),
   \[\langle \vec{F}, \mathbf{n}\rangle\;=\;\langle \vec{x}, \tfrac{\vec{x}}{R}\rangle\;=\;\frac{1}{R}\,\|\vec{x}\|^2\;=\;\frac{R^2}{R}\;=\; R.\]
   Therefore,
   \[\int_{\partial B_R} \langle \vec{F}, \mathbf{n}\rangle \,\dd A\;=\;\int_{\partial B_R} R \,\dd A\;=\;R \,\int_{\partial B_R} \dd A\;=\;R\, S_{n-1}(R),\]
   where \(S_{n-1}(R)\) is the \((n-1)\)-dimensional surface area of the sphere of radius \(R\).

**Equating Both Sides**  

   By the Divergence Theorem:
   \[\underbrace{\int_{B_R} (\Div F) \,\dd V}_{n\,V_n(R)}\;=\;\underbrace{\int_{\partial B_R} \langle \vec{F}, \mathbf{n}\rangle \,\dd A}_{R\,S_{n-1}(R)}.\]
   Hence we conclude
   \[\boxed{\,n \,V_n(R) \;=\; R \,S_{n-1}(R).\,}\]

**Q.E.D.**

</div>
</details>


<details>

<summary>Proof of Eq3.</summary>
<div markdown=1>

Left to reader.

</div>
</details>

</div>
</details>


### 2.5.4 Original Stokes' Theorem

###### Theorem 5 (Original Stokes' Theorem)
> Let \( M \subset \R^3 \) be a compact oriented two-dimensional manifold-with-boundary and \( n \) the unit outward normal on \( M \) determined by the orientation of \( M \).  
> Let \( \partial M \) have the induced orientation. Let \( T \) be the vector field on \( \partial M \) with \( \dd s(T) = 1 \), and let \( F \) be a differentiable vector field in an open set containing \( M \). Then
> \[\int_M \langle (\mathrm{curl}\;F), n \rangle \, \dd A = \int_{\partial M} \langle F, T \rangle \, \dd s.\]

Recall that \(\dd s(T)=1\) means following equivalent statements:
- for \(x\in\partial M\), we have \([n(x),N(x),T]\) as a basis of \(\R^3\) where \(n(x)\) is the outward normal at \(x\) and \(N(x)\) is the outward normal of the boundary at the point \(x\);
- for orientation-preserving \(\mathcal{C}^1\) parameterization \(c\), i.e. \(c\) is injective and its derivative is no-where vanishing, such that \(\dd s(c'(t))=\norm{c'(t)}\) and \(T(t)=\frac{c'(t)}{\norm{c'(t)}}\); 
- \(T\) is positively oriented unit tangent vector to \(\partial M\).

<details>

<summary>Proof</summary>
<div markdown=1>

**Associate a Differential 1–Form to \(F\):**

  Given a differentiable vector field \(F=(F_1,F_2,F_3)\) on an open set in \(\R^3\), one can associate the 1–form
  \[\omega = F_1\dd x + F_2\dd y + F_3\dd z.\]
  Then by [**Proposition 3**](#proposition-3), its exterior derivative is
  \[\dd\omega = \left(\frac{\partial F_3}{\partial y} - \frac{\partial F_2}{\partial z}\right)\dd y\wedge \dd z + \left(\frac{\partial F_1}{\partial z} - \frac{\partial F_3}{\partial x}\right)\dd z\wedge \dd x + \left(\frac{\partial F_2}{\partial x} - \frac{\partial F_1}{\partial y}\right)\dd x\wedge \dd y.\]
  Notice that the coefficients here are exactly the components of the curl of \(F\):
  \[\mathrm{curl}\;F = \left(\frac{\partial F_3}{\partial y} - \frac{\partial F_2}{\partial z},\, \frac{\partial F_1}{\partial z} - \frac{\partial F_3}{\partial x},\, \frac{\partial F_2}{\partial x} - \frac{\partial F_1}{\partial y}\right).\]

  Likewise, for **RHS**, we know
  \[\dd s=\norm{\gamma'(t)}\dd t\]
  where \(\gamma:[a,b]\to\partial M\) is a smooth parametrization of the boundary curve.
  As \(T(t)=\frac{\gamma'(t)}{\norm{\gamma'(t)}}\), the line integral may become
  \[\int_{\partial M} \langle F, T \rangle \dd s=\int_{a}^{b} \langle F, \gamma'(t) \rangle \dd t=\int_{a}^{b}\omega(\gamma(t))\dd t=\int_{a}^{b}\gamma^\sharp\omega=\int_{\partial M}\omega\]

**Apply Stokes’ Theorem:**

   [**General Stokes’ theorem**](#theroem-2general-stokes) tells us that for a compact oriented two-dimensional manifold \(M\) with boundary \(\partial M\),
   \[\int_M \dd \omega = \int_{\partial M} \omega.\]
   In our situation, the left-hand side becomes
   \[\int_M \dd \omega = \int_M \langle \mathrm{curl}\;F,\, n \rangle\, \dd A\]
   where \(n\) is the unit normal on \(M\) (chosen in accordance with the orientation of \(M\)) and \(\dd A\) is the area element on \(M\). On the right-hand side, \(\omega\) restricted to \(\partial M\) produces the line integral
   \[\int_{\partial M} \omega = \int_{\partial M} \langle F, T \rangle\dd s, \]
   where \(T\) is the unit tangent vector along \(\partial M\) (chosen so that the orientation of \(\partial M\) is the one induced from \(M\)) and \(ds\) is the arc length element.

**Conclusion:**

   Combining these observations, we arrive at the desired formula:
   \[
   \boxed{\int_M \langle \mathrm{curl}\;F,\, n \rangle\dd A = \int_{\partial M} \langle F, T \rangle\dd s.}
   \]

**Q.E.D**
</div>
</details>
