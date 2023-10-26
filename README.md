# pointr-case

Q1)

a) I implement it in the project in DiceRoller class with using Date().timeIntervalSince1970

<img width="431" alt="DiceRoller class" src="https://github.com/rcanbaba/pointr-case/assets/32519328/7731f786-2ca2-4ed1-9929-11441f31252c">

b) I implement it in the project in DiceRollerTest class with using totalRolls value which is a large number of roll times.
let totalRolls = 500000 // value for test count

Frequency Test: Ensures that each number between 1 to 6 approximately appears similar times. The distribution should be nearly uniform.
Bounds Test: Ensures that the number must be (1,2,3,4,5,6).
Repeatability Test: Ensures the result is different or ensure that the function isn't deterministic under identical conditions. Each number must not repeat too much.

<img width="354" alt="DiceRollerTest methods" src="https://github.com/rcanbaba/pointr-case/assets/32519328/7d517cbc-9674-46e7-bc6b-03c12c377a7a">

Also i write all test methods on the project, used logger to log informations,

<img width="300" alt="App screenshot wit logs" src="https://github.com/rcanbaba/pointr-case/assets/32519328/34495007-f3b1-4129-b6c3-258e00794ade">




Q2)

Safety and Predictability: With NSDictionary, once it's set, you know it will never change. This reduces the risk of unexpected side effects or data corruption from changes in different parts of the code.

Performance: Immutable objects can often be optimized better than mutable ones since they don't need to handle potential changes.

Memory Management: Immutable objects can be more memory-efficient since they don't need to reserve extra space for potential changes.

One can't be simply dropped without breaking a lot of existing code or violating the principle of immutability. The introduction of Swift and its focus on value types (like Dictionary) makes this distinction clearer, but for Objective-C compatibility and historical reasons, both types must be exist.

Q3) 

It does not work on negative values also without floating point it is not possible some integer values to calculete sqrt roots if it is not perfect square numbers (like 1,4,9 etc.) the method below finds the nearest integer.


function integerSqrt(x):

    if x < 0:
        return "Error" // negative value
    else if x == 0 or x == 1:
        return x
    start = 1
    end = x
    while start <= end:
        mid = (start + end) / 2 // integer division
        squared = mid * mid
        if squared == x:
            return mid
        else if squared < x:
            start = mid + 1
        else:
            end = mid - 1

    return start - 1


