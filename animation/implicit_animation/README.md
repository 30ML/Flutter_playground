# Implicit Animation(암시적 애니메이션)

* Implicit Animation은 속성에 새로운 속성을 지정하고 `setState()`와 같은 함수로 **rebuild함으로써 애니메이션을 구현**하는 방식.

### implicit animation은 크게 두 가지로 나뉨

  1. Built-in 된 implicit animation인 **`AnimatedFoo`**

  2. Built-in 된 animation이 없는 widget에 animation을 적용할 때 사용하는 **`TweenAnimationBuilder`**
