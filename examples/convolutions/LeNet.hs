{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleContexts #-}
{-# OPTIONS_GHC -fplugin GHC.TypeLits.Normalise #-}
module LeNet where

import Data.Function ((&))
import GHC.Generics
import Numeric.Backprop
import Prelude as P
import Data.Singletons.Prelude hiding (type (*), All)

import Torch.Double as Torch
import qualified Torch.Double.NN.Conv2d     as NN
import Lens.Micro.TH

data LeNet = LeNet
  { _conv1 :: !(Conv2d 3  6 5 5)
  , _conv2 :: !(Conv2d 6 16 5 5)
  , _fc1   :: !(Linear  (16*5*5) 120)
  , _fc2   :: !(Linear       120  84)
  , _fc3   :: !(Linear        84  10)
  } deriving (Show, Generic)

makeLenses ''LeNet
instance Backprop LeNet


-------------------------------------------------------------------------------

main :: IO ()
main = do
  net <- newLeNet
  print net

newLeNet :: IO LeNet
newLeNet = LeNet
  <$> newConv2d
  <*> newConv2d
  <*> newLinear
  <*> newLinear
  <*> newLinear

lenet
  :: forall s
  .  Reifies s W
  => Double
  -> BVar s  LeNet                   -- ^ lenet architecture
  -> BVar s (Tensor '[3,32,32])      -- ^ input
  -> BVar s (Tensor '[10])           -- ^ output
lenet lr arch inp
  = lenetLayer lr (arch ^^. conv1) inp
  & lenetLayer lr (arch ^^. conv2)

  & flattenBP

  -- start fully connected network
  & relu . linear (arch ^^. fc1)
  & relu . linear (arch ^^. fc2)
  &        linear (arch ^^. fc3)

{-
-- Optionally, we can remove the explicit type and everything would be fine.
-- Including it is quite a bit of work and requires pulling in the correct Constraints

lenetLayer
  :: forall inp h w ker ow oh s out mow moh

  -- backprop constraint to hold the wengert tape
  .  Reifies s W

  -- leave input, output and square kernel size variable so that we
  -- can reuse the layer...
  => KnownDim3 inp out ker

  -- ...this means we need the constraints for conv2dMM and maxPooling2d
  -- Note that oh and ow are then used as input to the maxPooling2d constraint.
  => SpatialConvolutionC inp h  w ker ker DStep DStep DPad DPad  oh  ow
  => SpatialDilationC       oh ow   2   2     2     2 DPad DPad mow moh 1 1 'True

  -- Start withe parameters
  => Double                            -- ^ learning rate for convolution layer
  -> BVar s (Conv2d inp out ker ker)   -- ^ convolutional layer
  -> BVar s (Tensor '[inp,   h,   w])  -- ^ input
  -> BVar s (Tensor '[out, moh, mow])  -- ^ output
-}
lenetLayer lr conv inp
  = NN.conv2dMM
      (Step2d    :: Step2d 1 1)
      (Padding2d :: Padding2d 0 0)
      lr conv inp
  & relu
  & maxPooling2d
      (Kernel2d  :: Kernel2d 2 2)
      (Step2d    :: Step2d 2 2)
      (Padding2d :: Padding2d 0 0)
      (sing      :: SBool 'True)

{- Here is what each layer's intermediate type would like (unused)

lenetLayer1
  :: Reifies s W
  => Double                         -- ^ learning rate
  -> BVar s (Conv2d 1 6 5 5)        -- ^ convolutional layer
  -> BVar s (Tensor '[1, 32, 32])   -- ^ input
  -> BVar s (Tensor '[6, 14, 14])   -- ^ output
lenetLayer1 = lenetLayer

lenetLayer2
  :: Reifies s W
  => Double                          -- ^ learning rate
  -> BVar s (Conv2d 6 16 5 5)        -- ^ convolutional layer
  -> BVar s (Tensor '[ 6, 14, 14])   -- ^ input
  -> BVar s (Tensor '[16,  5,  5])   -- ^ output
lenetLayer2 = lenetLayer

-}

-------------------------------------------------------------------------------
-- Helper functions which might end up migrating to the -indef codebase:

-- | default step size for Conv2d
type DStep = 1

-- | default padding size for all code
type DPad  = 0

-- Layer initialization: These depend on random functions which are not unified and, thus,
-- it's a little trickier to fold these back into their respective NN modules.

-- | initialize a new linear layer
newLinear :: forall o i . All KnownDim '[i,o] => IO (Linear i o)
newLinear = fmap Linear . newLayerWithBias $ dimVal (dim :: Dim i)

-- | initialize a new conv2d layer
newConv2d :: forall o i kH kW . All KnownDim '[i,o,kH,kW] => IO (Conv2d i o kH kW)
newConv2d = fmap Conv2d . newLayerWithBias $
  dimVal (dim :: Dim i) * dimVal (dim :: Dim kH) * dimVal (dim :: Dim kW)

{- For GPU
newLayerWithBias :: Dimensions2 d d' => Word -> IO (Tensor d, Tensor d')
newLayerWithBias n = do
  (,) <$> uniform (-stdv) stdv
      <*> uniform (-stdv) stdv
  where
    stdv :: Double
    stdv = 1 / P.sqrt (fromIntegral n)
-}

-- | uniform random initialization
newLayerWithBias :: All Dimensions '[d,d'] => Word -> IO (Tensor d, Tensor d')
newLayerWithBias n = do
  g <- newRNG
  let Just pair = ord2Tuple (-stdv, stdv)
  manualSeed g 10
  (,) <$> uniform g pair
      <*> uniform g pair
  where
    stdv :: Double
    stdv = 1 / P.sqrt (fromIntegral n)

