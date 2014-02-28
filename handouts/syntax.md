## Syntax for Free

---

### Hello World

```haskell
main = print "Hello, world!"
```

---

### Primitives

```haskell
-- This is a comment
True -- Bool
False -- Bool
1 -- Num
1.0 -- Fractional
'a' -- Char
"a" -- String, a.k.a., [Char]
[1, 2] -- [Num]
(1, 'a') -- (Num, Char)
('a', 1, True) -- (Char, Num, Bool)
('a', 1, [1, 2, 3]) -- (Char, Num, [Num])
```

---

### Define a Function

```haskell
-- optionally, annotate with type
factorial :: Int -> Int
factorial n = fold (*) 1 [1..n]
```

---

### Call a Function

```haskell
factorial 4
=> 24
```

---

### Compose Functions

```haskell
-- compute -|x**2| for all x in [1, 1000]
map (negate . (**2) . abs) [1..1000]
```

---

### Lists

```haskell
[1, 2, 3] -- basic list
[1..1000] -- list from 1 to 1000 by 1
[1, 3.. 1000] -- list from 1 to 999 by 2

-- list comprehension: x squared such that x is in [1, 1000], is odd,
-- and is greater than 11
[x^2 | x <- [1..1000], odd x, x > 11]

['a', 'b', 'c'] == "abc" -- Strings are lists of characters
=> Bool
```

---

### Define a Data Type

```haskell
data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
```

---

### Define a Type Alias

```haskell
type Name = String
```

---

\newpage

### Pattern Match

```haskell
next :: Weekday -> Weekday
next Monday = Tuesday
next Tuesday = Wednesday

--- or

next :: Weekday -> Weekday
next day = case day of
    Monday -> Tuesday
    Tuesday -> Wednesday
    
--- also
myFirst :: ([a], (a, a, a)) -> (a, a)
myFirst (x:_:_, (y, _, _)) = (x, y)

myFirst ([1, 2, 3], (1, 2, 3)) -- (1, 1)
```

---

### Upgrade Your Data Types

```haskell
-- automatically derive (compiler implements for you), parsing,
-- printing, and equality of your new data type
data Weekday = Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday deriving (Read, Show, Eq)
  --       ^^ this
```

---

### Importing Modules
```haskell
import Data.List -- imports everything in Data.List
import Data.List (sort, cycle) -- import only sort, cycle)
import qualified Data.List as DL -- import w/ prefix, e.g., DL.sort
```

---

### Make Your Own Type: Part 2 - Record-Style

```haskell
data Person = {
  firstName :: String,
  lastName :: String,
  age :: Int
} deriving (Show, Eq)

Person "Banana" "Being" 26
=> Person {firstName = "Banana", lastName = "Being", age = 26}
firstName $ Person "Banana" "Being" 26
=> "Banana"
```
