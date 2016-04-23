//: [Previous](@previous)

/*:
 # Chapter 1
 
 # 1.1 The Elements of Programming
 
 * primitive expressions
 * means of combination
 * means of abstraction
 
 */

486

137 + 349

1000 - 334

5 * 99

10 / 5

2.7 + 10

let size = 2
size
5 * size

let pi = 3.14159
let radius:Double = 10
pi * radius * radius
let circumference = 2 * pi * radius
circumference

func square<T: _IntegerArithmeticType>(x: T) -> T {
    return x * x
}

square(21)
square(2 + 5)
square(square(3))

func sumOfSquares<T: _IntegerArithmeticType>(x: T, y: T) -> T {
    return square(x) + square(y)
}

sumOfSquares(3, y: 4)

func sicpAbs<T: SignedNumberType>(x: T) -> T {
    switch x {
    case _ where x < 0 : return -x
    default: return x
    }
}

sicpAbs(1)
sicpAbs(0)
sicpAbs(-1)

//: [Next](@next)
