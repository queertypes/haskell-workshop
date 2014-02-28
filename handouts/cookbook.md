# Learn You a Haskell: Profit and Fun with Functions and Types

---

## Now You're Cooking with Haskell!

---

### How Do I Read in a File?

```haskell
main = do
  contents <- readFile "myfile.txt"
  print contents
```

---

### How Do I Read from Standard In?

```haskell
main = do
  contents <- getContents
  print contents
```

---

### How Do I Get Command Line Arguments?

```haskell
import System.Environment

main = do
  args <- getArgs
  print args
```

\newpage

### How do I Compress Data?

```haskell
import System.Environment
import qualified Data.ByteString.Lazy as LB
import qualified Codec.Compression.GZip as GZ

main = do
  path <- fmap head getArgs
  contents <- LB.readFile path
  LB.writeFile (path ++ ".gz") $ GZ.compress contents
```

---

### How Do I Compile My Application?

```bash
$ ls
Main.hs  Module1.hs  Module2.hs
$ cat Main.hs
```

```haskell
module Main where

import Module1
import Module2

main = print "Hi"
```

```bash
$ ghc Main.hs  # Smart compiler
$ ./Main
Hi
```
