{-|
Module      : Crypto.Lol.Applications.Examples.KHPRF
Description : Example using KeyHomomorphicPRF.
Copyright   : (c) Chris Peikert, 2018
                  Bogdan Manga,  2018
License     : GPL-3
Maintainer  : bmanga@umich.edu
Stability   : experimental
Portability : POSIX

Example using KeyHomomorphicPRF.
-}

{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Crypto.Lol.Applications.Examples.KHPRF (khprfMain) where

import Crypto.Lol
import Crypto.Lol.Applications.KeyHomomorphicPRF
import Crypto.Lol.Types

type SimpleTop = 'Intern ('Intern 'Leaf 'Leaf) 'Leaf
type N = 16
type Q = 256
type P = 2
type Rq = ZqBasic Q Int64
type Rp = ZqBasic P Int64
type Gad = BaseBGad 2

khprfMain :: IO ()
khprfMain = do
  key    <- genKey
  params :: PRFParams N Gad Rq <- genParams
  let t = singFBT :: SFBT SimpleTop
  let result :: [Matrix Rp] = run t params $
                              sequence $ prfAmortized t key <$> values
  print result
