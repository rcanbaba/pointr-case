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






