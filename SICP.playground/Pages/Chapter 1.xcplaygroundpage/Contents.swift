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

func square(x: Double) -> Double {
    return x * x
}

square(21)
square(2 + 5)
square(square(3))

func sumOfSquares(x: Double, y: Double) -> Double {
    return square(x) + square(y)
}

sumOfSquares(3, y: 4)

func sicpAbs<T: SignedNumberType>(x: T) -> T {
    guard x < 0 else { return x }
    return -x
}

sicpAbs(1)
sicpAbs(0)
sicpAbs(-1)

//: Individual functions
do  {
    func sqrtIter(guess: Double, _ x: Double) -> Double {
        guard !goodEnough(guess, x) else { return guess }
        return sqrtIter(improve(guess, x), x)
    }

    func improve(guess: Double, _ x: Double) -> Double {
        return average(guess, x/guess)
    }

    func average(x: Double, _ y: Double) -> Double {
        return (x + y) / 2
    }

    func goodEnough(guess: Double, _ x: Double) -> Bool {
        return sicpAbs(square(guess) - x) < 0.001
    }

    func sqrt(x: Double) -> Double {
        return sqrtIter(1.0, x)
    }

    sqrt(9)
}

//: Nested functions
do  {
    func sqrt(x: Double) -> Double {
        func sqrtIter(guess: Double, _ x: Double) -> Double {
            guard !goodEnough(guess, x) else { return guess }
            return sqrtIter(improve(guess, x), x)
        }
        
        func improve(guess: Double, _ x: Double) -> Double {
            return average(guess, x/guess)
        }
        
        func average(x: Double, _ y: Double) -> Double {
            return (x + y) / 2
        }
        
        func goodEnough(guess: Double, _ x: Double) -> Bool {
            return sicpAbs(square(guess) - x) < 0.001
        }
        
        return sqrtIter(1.0, x)
    }
    
    sqrt(9)
}

//: Lexically scoped functions
do  {
    func sqrt(x: Double) -> Double {
        func sqrtIter(guess: Double) -> Double {
            guard !goodEnough(guess) else { return guess }
            return sqrtIter(improve(guess))
        }
        
        func improve(guess: Double) -> Double {
            return average(guess, x/guess)
        }
        
        func average(x: Double, _ y: Double) -> Double {
            return (x + y) / 2
        }
        
        func goodEnough(guess: Double) -> Bool {
            return sicpAbs(square(guess) - x) < 0.001
        }
        
        return sqrtIter(1.0)
    }
    
    sqrt(9)
}

//: Recursive factorial
do {
    func factorial(n: Int) -> Int {
        guard n != 1 else { return 1 }
        return n * factorial(n - 1)
    }
    
    factorial(1)
    factorial(2)
    factorial(3)
}

//: Iterative factorial
do {
    func factorial(n: Int) -> Int {
        func iter(product: Int, _ counter: Int) -> Int {
            guard counter <= n else { return product }
            return iter(counter * product, counter + 1)
        }
        return iter(1, 1)
    }
    
    factorial(1)
    factorial(2)
    factorial(3)
}

//: Recursive fibonacci
do {
    func fib(n: Int) -> Int {
        switch n {
        case 0: return 0
        case 1: return 1
        default:
            return fib(n - 1) + fib(n - 2)
        }
    }
    
    fib(0)
    fib(1)
    fib(2)
    fib(3)
    fib(4)
    fib(5)
}

//: Iterative fibonacci
do {
    func fib(n: Int) -> Int {
        func iter(a: Int, _ b: Int, _ count: Int) -> Int {
            guard count != 0 else { return b }
            return iter(a + b, a, count - 1)
        }
        return iter(1, 0, n)
    }
    
    fib(0)
    fib(1)
    fib(2)
    fib(3)
    fib(4)
    fib(5)
}

//: Counting change
do {
    func countChange(amount: Int) -> Int {
        return cc(amount, 5)
    }
    
    func cc(amount: Int, _ kindsOfCoins: Int) -> Int {
        if amount == 0 { return 1 }
        if amount < 0 || kindsOfCoins == 0 { return 0 }
        return cc(amount, kindsOfCoins - 1) + cc(amount - firstDenomination(kindsOfCoins), kindsOfCoins)
    }
    
    func firstDenomination(kindsOfCoins: Int) -> Int {
        switch kindsOfCoins {
        case 1: return 1
        case 2: return 5
        case 3: return 10
        case 4: return 25
        case 5: return 50
        default: fatalError("Invalid kind of coin!")
        }
    }
    
    // Commented out because this is slooooow
//    countChange(100)
    
}

//: Recursive Exponentiation
do {
    func expt(b: Double, n: Int) -> Double {
        if n == 0 { return 1 }
        return b * expt(b, n: n - 1)
    }
    
    expt(2, n: 2)
    expt(2, n: 4)
}

//: Iterative Exponentiation
do {
    func expt(b: Double, n: Int) -> Double {
        func iter(b: Double, _ counter: Int, _ product: Double) -> Double {
            if counter == 0 { return product }
            return iter(b, counter - 1, b * product)
        }
        return iter(b, n, 1)
    }
    
    expt(2, n: 2)
    expt(2, n: 4)
}

//: Logarithmic Exponentiation
func remainder(x: Int, _ y: Int) -> Int { return x % y }
func even(n: Int) -> Bool { return remainder(n, 2) == 0 }
do {
    func fastExpt(b: Double, n: Int) -> Double {
        func even(n: Int) -> Bool { return (n % 2) == 0 }
        if n == 0 { return 1 }
        if even(n) { return square(fastExpt(b, n: n / 2)) }
        return b * fastExpt(b, n: n - 1)
    }
    
    fastExpt(2, n: 2)
    fastExpt(2, n: 4)
}


//: [Next](@next)
