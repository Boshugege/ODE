#import "@local/zhaji:0.1.0": *
#show: note

== 引论

#hint[自由落体模型][考虑一个质量为 $m$ 的物体做自由落体运动。取竖直向下为正方向。]

根据牛顿第二定律，物体的运动满足

$ m frac(dif v, dif t) = m g $

由于 $m != 0$，可约去质量 $m$，得到一阶微分方程

$ frac(dif v, dif t) = g. $

对时间 $t$ 积分，得到

$ v(t) = g t + C. $

其中 $C$ 是任意常数。由于 $C$ 可以取任意值，上式包含了这个微分方程的全部解，因此称为#emph[通解]。

仅仅知道微分方程，还不能确定物体的具体运动状态。为了确定通解中的任意常数 $C$，还需要给出额外条件，例如初始时刻的速度 $v(0) = v_0$。这类用来确定具体解的条件称为#emph[定解条件]。

代入定解条件 $v(0) = v_0$，有

$ v_0 = C, $

从而得到满足该定解条件的#emph[特解]

$ v(t) = g t + v_0. $

设 $t$ 时刻物体的高度 $h(t)$

$
  cases(
    (d h)/(d t) = v,
    (d v)/(d t) = g,
  )
  <=>
  frac(d^2 h, d t^2) = g.
$

由上面的结论
$ h(t) = integral v(t) d t = integral ( g t + C) d t = frac(1, 2) g t^2 + C t + D. $

给定定解条件 $h(0) = h_0$，有
$ h_0 = C, $
从而得到满足该定解条件的特解
$ h(t) = frac(1, 2) g t^2 + v_0 t + h_0. $

#hint[有阻力情形][
  假设物体同时受到一个正比于速度且于速度方向相反的阻力

  $F_d = - gamma v$

  模型就变成了

  $ m frac(d v, d t) = m g - gamma v => frac(d v, d t) = g - frac(gamma, m) v $
]

上述方程有个特殊的解 $v(t) = g dot frac(m, gamma)$.解不随时间变化，称为#emph[稳态解]或者定常解（stationary solution）。#emph[容易忽略]

如对于任意时刻，$v(t) != frac(m g, gamma)$，

则
$ frac(d v, g - frac(gamma, m) v) = g - frac(gamma, m) v $
或者
$
  frac(v', v - frac(m g, gamma)) = g - frac(gamma, m) v <=> (ln abs(v - frac(m g, gamma)))' = - frac(gamma, m)
$
积分
$ ln abs(v - frac(m g, gamma)) = - frac(gamma, m) t + C $
综合得到方程的通解
$ v(t) = frac(m g, gamma) + C e^(- frac(gamma, m) t) $
当 t 趋于无穷大时，指数项趋于零，速度趋于稳态解 $v(t) -> frac(m g, gamma)$。

#hint[人口模型][
  人口假设：

  $ frac(dif p, dif t) = r p $
  其中$r$称为*增长率*
  即
  $ln abs(p) = r t + A$
  ，A为任意常数
  也即
  $
    p(t) = pm A e^(r t)
  $
  若某一时刻$t_0$有$p(t_0) = 0$，则有对于任意时刻有$p(t)=0$。
]

#hint[Verhulst 模型][
  设生存空间的最大容量是$M > 0$，净相对增长率依赖于当前的状态，为

  $alpha (1-frac(p, M)), alpha > 0$;

  此时模型变为

  $ frac(d p, d t) = alpha p (1-frac(p, M)) $

  也叫做*logistc模型*。]

首先，$p (t) = M$与$p(t) = 0$ 是该方程的两个#emph[稳态解]，即不随时间变化的解。

若 $p(t) != 0$ 且 $p(t) != M$，则有
$ frac(d p, (M - p) p) = frac(alpha, M) d t $
裂项积分，类似前面的讨论，此方程的通解为

$
  p(t) = cases(M frac(C e^(alpha t), C e^(alpha t) - 1), M)
$

对于更复杂的方程，无法得到显式精确解，如何证明诸如上述结论呢？

上述方程都具有形式 $y' = f(t, y)$，函数$f(t,y)$被称为变化率函数

#def[方向场][
  假若方程的某个解 $y(t)$ 经过 $t-y$ 平面上某一点 $(t_0, y_0)$，则 $y(t)$ 在这一点的斜率为 $f(t_0, y_0)$。在 $(t_0, y_0)$ 处画一个斜率为 $f(t_0, y_0)$ 的小短线。对于 $t-y$ 平面上足够多的点重复这一过程时，我们就描绘出了变化率函数的大致情况，也常称为#emph[方向场]（direction field）。
]

#def[自治方程][
  若变化率函数不依赖于 $t$，此时方程 $y' = g(y)$ 称为自治的。

  若满足 $g(y_*) = 0$，则 $y(t) = y_*$ 一定是上述方程的一个（稳态）解。
]

前面的模型都是建立某个物理量的变化率与物理量本身的关系，比如正比关系。

很多时候，我们需要建立物理量的高阶导数与物理量及其低阶导数之间的关系，此时就得到含有高阶导数的微分方程。

#hint[简谐振子][
  研究系在倔强系数为 $k$ 的弹簧上、质量为 $m$ 的振子偏移平衡位置的位移 $x(t)$。由牛顿第二定律，

  $
    m x^((2)) = - k x
    equiv x^((2)) + frac(k, m) x = 0.
  $
]
  方程的通解（所有解）满足

  $ x(t) = C_1 cos(omega t) + C_2 sin(omega t) $

  $ = A cos(omega t + theta), quad omega = sqrt(frac(k, m)). $

  有两个常数 $C_1, C_2$ 或者 $A, theta$，也就是说我们需要两个定解条件来唯一确定位移。


例如给定

$ x(0) = x_0, quad x'(0) = v_0. $

则

$ x(t) = x_0 cos(omega t) + frac(v_0, omega) sin(omega t) $

$
  = sqrt(x_0^2 + (v_0 / omega)^2) cos(omega t + theta),
  quad tan(theta) = - frac(v_0, omega x_0).
$

#hint[常微分方程组][
  如果要描述一个体系，需要很多物理量，需要建立所有物理量的变化率与物理量本身的关系，那么就得到常微分方程组。
]

#hint[两种群生态模型（Lotka-Volterra 模型）][
  一个生态系统中存在两个不同的种群，$x(t), y(t)$ 分别表示两个种群的数量。

  在捕食者-被捕食者模型中，$x(t)$ 表示被捕食者（比如羊），$y(t)$ 表示捕食者（比如狼），他们满足

  $
    cases(
      x' = a x - b x y,
      y' = -c y + d x y,
    )
  $

  其中 $a, b, c, d$ 均为正常数。
]

#hint[竞争或者共生模型][
  种群之间不存在捕食关系。

  $
    cases(
      x' = alpha x - beta x y,
      y' = gamma y - delta x y,
    )
  $

  其中 $alpha, gamma$ 为正常数，表示种群各自的净相对增长率。

  - 若 $beta, delta$ 为正，表示两种群存在竞争关系；
  - 若 $beta, delta$ 为负，表示两种群存在共生关系。

  根据实际问题，建立更复杂的种群关系，比如考虑外部干涉，或者细分更多的种群。
]

==== 传染病传播模型

#hint[SI 模型][
  研究的系统只存在易感染者（Susceptible）$y(t)$ 和已感染者（Infective）$x(t)$。

  基本假设：

  - 总人数不变，假设为 $n$；
  - 单位时间病人能传染的人数与当时的健康人数成正比，系数为 $k$。

  于是有

  $
    x + y = n;
    quad
    x' = (k y) x
    quad
    =>
    x' = k x (n - x).
  $
]

#hint[SIS 模型][
  已感染者治愈率为$mu$，治愈后还会被再次感染
  $
    x' = k x (n - x) - mu x
  $
]

#hint[SIR 模型][
  已感染者治愈率为$mu$，治愈后不会被再次感染，移除者$r(t)$，假设治愈率为$l$。
  $
    cases(
      x + y + r =n,
      r' = l x,
      x' = k y x - r'
    )
    =>
    cases(
      x' =k x y - l x,
      y' = - k x y,
    )
  $
  初始条件满足
  $x(0)+y(0) = n$
]


== 常微分方程基本概念

#def[常微分方程][
  设 $t$ 为自变量，$y(t)$ 为 $t$ 的函数（因变量），形如

  $ F(t, y(t), y'(t), dots, y^((n))(t)) = 0 $

  的方程称为常微分方程（Ordinary Differential Equation，ODE），其中 $F$ 是一个给定的函数。
]

#def[方程的阶与解][
  - 若出现的因变量的最高阶导数为 $n$ 阶，则称为 $n$ 阶常微分方程；
  - 若函数 $y(t)$ 满足上述方程，则称 $y(t)$ 为方程的解；
  - 若 $F(t, y, y', dots, y^((n)))$ 为线性函数，则称方程为线性常微分方程（linear ODE）。
]

#hint[线性常微分方程的一般形式][
  $ a_n(t) y^((n)) + dots + a_1(t) y' + a_0(t) y + b(t) = 0. $
]

#hint[一阶（自治）非线性常微分方程组][
  $
    cases(
      x' = k x y - l x,
      y' = -k x y,
    )
  $
]

#def[初值问题][
  一般而言，需要给出定解条件，最典型的就是初值条件。

  例如：

  $
    cases(
      x^((2)) + omega^2 x = 0,
      x(0) = 1, x'(0) = 5,
    )
    quad
    cases(
      x' = k x y - l x, x(0) = 50,
      y' = -k x y, y(0) = 100,
    )
  $

  方程与初值条件一起构成初值问题。
]

#hint(style: "amber")[注][
  定解条件不一定只是初始条件。根据实际问题的需要，也可以有其它条件，如两点边值问题。
]
