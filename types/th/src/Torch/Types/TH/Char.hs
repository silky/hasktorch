{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
module Torch.Types.TH.Char where

import Foreign
import Foreign.C.Types
import Foreign (ForeignPtr)
import GHC.TypeLits (Nat)
import GHC.Word
import GHC.Int
import Torch.Types.TH

type CTensor = CCharTensor
type CStorage = CCharStorage

type CReal = CChar
type CUReal = CUChar
type CAccReal = CLong
type HsReal = Int8
type HsUReal = Word8
type HsAccReal = Int64

hs2cReal :: HsReal -> CReal
hs2cReal = fromIntegral

hs2cAccReal :: HsAccReal -> CAccReal
hs2cAccReal = fromIntegral

c2hsReal :: CReal -> HsReal
c2hsReal = fromIntegral

c2hsAccReal :: CAccReal -> HsAccReal
c2hsAccReal = fromIntegral

i2hsReal :: Integral i => i -> HsReal
i2hsReal = fromIntegral

type Storage = CharStorage
cstorage        = snd . charStorageState
storage         = curry CharStorage
storageState    = charStorageState
storageStateRef = fst . charStorageState

type Dynamic    = CharDynamic
ctensor         = snd . charDynamicState
dynamic         = curry CharDynamic
dynamicState    = charDynamicState
dynamicStateRef = fst . charDynamicState

type Tensor = CharTensor
asDynamic = charAsDynamic
asStatic = charAsStatic


