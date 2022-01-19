# Wordle-Breaker

Just a fun time with code.

I have a list of all possible words used.

## Set Up

1. sort the list
2. codify the words into a 2d array (5x25)
   - each row has the frequency of the letter in that position
3. assign each word a value based on the frequency (1) 
4. create an index into the sorted list of words which is sorted by the word frequency (3)

_Since we have a list of words the frequency of doubles or repeats is less important._

- abbey (double)
- colon (repeat)
- sissy (double and repeat)
  
## Solving

Pick the word with the highest value from (4) and work down a decision tree.

> I'm not sure if the pre-work is as important as the following decision tree.
 