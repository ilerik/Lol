{-|
Module      : TestLolCPPMain
Description : Main driver for lol tests with CPP.
Copyright   : (c) Eric Crockett, 2011-2017
                  Chris Peikert, 2011-2017
License     : GPL-3
Maintainer  : ecrockett0@email.com
Stability   : experimental
Portability : POSIX

Main driver for lol tests with CPP.
-}

module TestLolCPPMain where

import Crypto.Lol.Cyclotomic.Tensor.CPP
import Crypto.Lol.Tests
import Data.Proxy
import Test.Framework

{-
main :: IO ()
main = defaultMainWithArgs
  (complexDoubleTests (Proxy::Proxy CT) ++
   doubleTests (Proxy::Proxy CT) ++
   int64Tests (Proxy::Proxy CT) ++
   zqTensorTests (Proxy::Proxy CT)
  )
  ["--maximum-generated-tests=100"]
-}

main :: IO ()
main = defaultMainWithArgs
         [defaultZqTests, zqTensorTests (Proxy::Proxy CT), int64TensorTests (Proxy::Proxy CT)]
         ["--maximum-generated-tests=100"]
