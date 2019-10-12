// Dynamic programming is simplifying a complicated problem by breaking it down into simpler sub-problems in a recursive manner.
/*
-> Identify subproblems
-> Learn how to solve subproblems
-> Identify that subproblems are repetitive
-> Identify that subproblems have optimal substructure property
-> Learn to cache/store results of sub problems (memo)
-> Develop a recursive relation to solve the problem
-> Use top-down and bottom-up approach to solve the problem
*/

/*
Problem: Given an integer n, find the minimum number of steps to reach integer 1.
At each step, you can:
Subtract 1,
Divide by 2, if it is divisible by 2
Divide by 3, if it is divisible by 3
*/

//All Dynamic programming problems have a start <state>. You have to reach the goal by transitioning through a number of intermediate states.

/*
Start state -> n
Goal -> 1
Intermediate states -> any integer number between 1 and n
*/

/*
from n you can move to :

n -> n-1

if n % 2 == 0:
   n -> n/2

if n % 3 == 0:
   n -> n/3

example:

from 3 you can move to,
3 -> 3-1 = 2  (2 is repeated)
3 -> 3/3 = 1

from 4 you can move to,
4 -> 4-1 = 3
4 -> 4/2 = 2  (2 is repeated)
*/
// determine moving though which states from start to goal will give you an optimal solution
/*
For n = 4:

approach one: (3 steps)
4 -> 3 -> 2 -> 1

approach two: (2 steps)
4 -> 2 -> 1

approach three: (2 steps)
4 -> 3 -> 1
*/

/*
Repetitive subproblems : You will end up solving the same problem more than once.

for n = 5
example:
5 -> 4 -> 3 -> 1
5 -> 4 -> 2 -> 1
5 -> 4 -> 3 -> 2 -> 1

observe here that 2 -> 1 occurs two times.
also observe that 5 -> 4 occurs three times.

Optimal Substructure : Optimal solutions to subproblems give optimal solution to the entire problem

example:
2 -> 1 is optimal
3 -> 1 is optimal

when I am at 4,
4 -> 3 -> 2 -> 1 and 4 -> 3 -> 1 is possible
but the optimal solution of 4 is 4 -> 3 -> 1. The optimal solution of four comes from optimal solution of three (3 -> 1).

similarly,
4 -> 3 -> 2 -> 1 and 4 -> 2 -> 1 is possible
but the optimal solution of 4 is 4 -> 2 -> 1. The optimal solution of four comes from optimal solution of two (2 -> 1).

now 5,
The optimal solution of 5 depends on optimal solution to 4.
5 -> 4 -> 2 -> 1 and 5 -> 4 -> 3 -> 1 are optimal.
*/
// We will solve the subproblems only once and solve each subproblem optimally.
// Recursive Relation: All dynamic programming problems have recursive relations. Once you define a recursive relation, the solution is merely translating it into code.

/*
For the above problem, let us define minOne as the function that we will use to solve the problem and the cost of moving from one state to another as 1.

if n = 5,
solution to 5 is cost + solution to 4
recursive formulae/relation is
minOne(5) = 1 + minOne(4)

Similarly,
if n = 6,
recursive formulae/relation is
minOne(6) = min(
              1 + minOne(5),
              1 + minOne(3),
              1 + minOne(2) )
*/
// Dynamic programming problems can be solved by a top down approach or a bottom up approach.
// In very large problems, bottom up is beneficial as it does not lead to stack overflow.

// Time Complexity is the number of unique states/subproblems * time taken per state.
// This can be easily cross verified by the for loop we used in the bottom-up approach. We see that we use only one for loop to solve the problem. Hence the time complexity is O(n ) or linear.

// Space Complexity
// We use one array called cache to store the results of n states. Hence the size of the array is n. Therefore the space complexity is O(n).

function minStepsToOne(n) {
  function traverse(current) {
    if (current === 1) {
      return 0;
    }

    // subtract 1
    let option = traverse(current - 1);

    // divide by 3
    if (current % 3 === 0) {
      let divide3 = traverse(current / 3);
      option = Math.min(option, divide3);
    }

    // divide by 2
    if (current % 2 === 0) {
      let divide2 = traverse(current / 2);
      option = Math.min(option, divide2);
    }

    return option + 1;
  }

  return traverse(n);
}

// 1) Create cache
// 2) Check cache
// 3) Write to cache
function minStepsToOneMemo(n) {
  const cache = {};

  function traverse(current) {
    if (current in cache) {
      return cache[current];
    }
    // Base Case
    if (current === 1) {
      return 0;
    }

    // subtract 1
    let option = traverse(current - 1);

    // divide by 3
    if (current % 3 === 0) {
      let divide3 = traverse(current / 3);
      option = Math.min(option, divide3);
    }

    // divide by 2
    if (current % 2 === 0) {
      let divide2 = traverse(current / 2);
      option = Math.min(option, divide2);
    }

    cache[current] = option + 1;
    return option + 1;
  }

  return traverse(n);
}

// Bottom up
function minStepsToOneTab(n) {
  const result = [];

  result[1] = 0;

  for (let i = 2; i <= n; i++) {
    // subtract 1
    let option = result[i - 1];

    // divide by 3
    if (i % 3 === 0) {
      let divide3 = result[i / 3];
      option = Math.min(option, divide3);
    }

    // divide by 2
    if (i % 2 === 0) {
      let divide2 = result[i / 2];
      option = Math.min(option, divide2);
    }

    result[i] = option + 1;
  }

  return result[n];
}

console.time("RECURSION: ");
console.log(minStepsToOne(500));
console.timeEnd("RECURSION: ");

console.time("MEMOIZATION: ");
console.log(minStepsToOneMemo(500));
console.timeEnd("MEMOIZATION: ");

console.time("TABULATION: ");
console.log(minStepsToOneTab(500));
console.timeEnd("TABULATION: ");
