-------------------------------------------------------------------------------
-- |
-- Module    :  Torch.Indef.Static.NN.Criterion
-- Copyright :  (c) Sam Stites 2017
-- License   :  BSD3
-- Maintainer:  sam@stites.io
-- Stability :  experimental
-- Portability: non-portable
-------------------------------------------------------------------------------
module Torch.Indef.Static.NN.Criterion where

import Torch.Indef.Types
import qualified Torch.Indef.Dynamic.NN as Dynamic

-- | absCriterion forward pass (updates the output tensor)
_absCriterion_updateOutput
  :: Tensor d     -- ^ input
  -> Tensor d'    -- ^ target
  -> Tensor d''   -- ^ output
  -> Bool    -- ^ size average
  -> Bool    -- ^ reduce
  -> IO ()
_absCriterion_updateOutput i t o = Dynamic._absCriterion_updateOutput (asDynamic i) (asDynamic t) (asDynamic o)

-- | absCriterion backward-update (updates the layer and bias tensors)
_absCriterion_updateGradInput
  :: Tensor d     -- ^ input
  -> Tensor d'    -- ^ target
  -> Tensor d''   -- ^ gradOutput
  -> Tensor d''   -- ^ gradInput
  -> Bool    -- ^ size average
  -> Bool    -- ^ reduce
  -> IO ()
_absCriterion_updateGradInput i t go gi = Dynamic._absCriterion_updateGradInput (asDynamic i) (asDynamic t) (asDynamic go) (asDynamic gi)

-- | bCECriterion forward pass (updates the output tensor)
_bCECriterion_updateOutput
  :: Tensor d     -- ^ input
  -> Tensor d'    -- ^ target
  -> Tensor d''   -- ^ output
  -> Bool    -- ^ sizeAverage
  -> Tensor d'''  -- ^ weights
  -> Bool    -- ^ reduce
  -> IO ()
_bCECriterion_updateOutput i t o b w = Dynamic._bCECriterion_updateOutput (asDynamic i) (asDynamic t) (asDynamic o) b (asDynamic w)

-- | bCECriterion backward-update (updates the layer and bias tensors)
_bCECriterion_updateGradInput
  :: Tensor d      -- ^ input
  -> Tensor d'     -- ^ target
  -> Tensor d''    -- ^ grad output
  -> Tensor d'''   -- ^ grad input
  -> Bool     -- ^  sizeAvreage
  -> Tensor d''''  -- ^ weights
  -> Bool     -- ^ reduce
  -> IO ()
_bCECriterion_updateGradInput i t go gi b w = Dynamic._bCECriterion_updateGradInput (asDynamic i) (asDynamic t) (asDynamic go) (asDynamic gi) b (asDynamic w)

-- | marginCriterion forward pass (updates the output tensor)
_marginCriterion_updateOutput :: Tensor d -> Tensor d -> Tensor d -> Bool -> Double -> IO ()
_marginCriterion_updateOutput t0 t1 t2 = Dynamic._marginCriterion_updateOutput (asDynamic t0) (asDynamic t1) (asDynamic t2)
-- | marginCriterion backward-update (updates the layer and bias tensors)
_marginCriterion_updateGradInput :: Tensor d -> Tensor d -> Tensor d -> Bool -> Double -> IO ()
_marginCriterion_updateGradInput t0 t1 t2 = Dynamic._marginCriterion_updateGradInput (asDynamic t0) (asDynamic t1) (asDynamic t2)

-- | softMarginCriterion forward pass (updates the output tensor)
_softMarginCriterion_updateOutput :: Tensor d -> Tensor d -> Tensor d -> Bool -> Bool -> IO ()
_softMarginCriterion_updateOutput t0 t1 t2 = Dynamic._softMarginCriterion_updateOutput (asDynamic t0) (asDynamic t1) (asDynamic t2)
-- | softMarginCriterion backward-update (updates the layer and bias tensors)
_softMarginCriterion_updateGradInput :: Tensor d -> Tensor d -> Tensor d -> Tensor d -> Bool -> Bool -> IO ()
_softMarginCriterion_updateGradInput t0 t1 t2 t3 = Dynamic._softMarginCriterion_updateGradInput (asDynamic t0) (asDynamic t1) (asDynamic t2) (asDynamic t3)

-- | mSECriterion forward pass (updates the output tensor)
_mSECriterion_updateOutput :: Tensor d -> Tensor d -> Tensor d -> Bool -> Bool -> IO ()
_mSECriterion_updateOutput t0 t1 t2 = Dynamic._mSECriterion_updateOutput (asDynamic t0) (asDynamic t1) (asDynamic t2)
-- | mSECriterion backward-update (updates the layer and bias tensors)
_mSECriterion_updateGradInput :: Tensor d -> Tensor d -> Tensor d -> Tensor d -> Bool -> Bool -> IO ()
_mSECriterion_updateGradInput t0 t1 t2 t3 = Dynamic._mSECriterion_updateGradInput (asDynamic t0) (asDynamic t1) (asDynamic t2) (asDynamic t3)

-- | distKLDivCriterion forward pass (updates the output tensor)
_distKLDivCriterion_updateOutput :: Tensor d -> Tensor d -> Tensor d -> Bool -> Bool -> IO ()
_distKLDivCriterion_updateOutput t0 t1 t2 = Dynamic._distKLDivCriterion_updateOutput (asDynamic t0) (asDynamic t1) (asDynamic t2)
-- | distKLDivCriterion backward-update (updates the layer and bias tensors)
_distKLDivCriterion_updateGradInput :: Tensor d -> Tensor d -> Tensor d -> Tensor d -> Bool -> Bool -> IO ()
_distKLDivCriterion_updateGradInput t0 t1 t2 t3 = Dynamic._distKLDivCriterion_updateGradInput (asDynamic t0) (asDynamic t1) (asDynamic t2) (asDynamic t3)

-- | smoothL1Criterion forward pass (updates the output tensor)
_smoothL1Criterion_updateOutput :: Tensor d -> Tensor d -> Tensor d -> Bool -> Bool -> IO ()
_smoothL1Criterion_updateOutput t0 t1 t2 = Dynamic._smoothL1Criterion_updateOutput (asDynamic t0) (asDynamic t1) (asDynamic t2)
-- | smoothL1Criterion backward-update (updates the layer and bias tensors)
_smoothL1Criterion_updateGradInput :: Tensor d -> Tensor d -> Tensor d -> Tensor d -> Bool -> Bool -> IO ()
_smoothL1Criterion_updateGradInput t0 t1 t2 t3 = Dynamic._smoothL1Criterion_updateGradInput (asDynamic t0) (asDynamic t1) (asDynamic t2) (asDynamic t3)

-- | l1Cost forward pass (updates the output tensor)
_l1Cost_updateOutput :: Tensor d -> Tensor d -> IO ()
_l1Cost_updateOutput t0 t1 = Dynamic._l1Cost_updateOutput (asDynamic t0) (asDynamic t1)
-- | l1Cost backward-update (updates the layer and bias tensors)
_l1Cost_updateGradInput :: Tensor d -> Tensor d -> Tensor d -> IO ()
_l1Cost_updateGradInput t0 t1 t2 = Dynamic._l1Cost_updateGradInput (asDynamic t0) (asDynamic t1) (asDynamic t2)

{-
c_ClassNLLCriterion_updateOutput :: Ptr CNNState -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CTensor -> CBool -> Ptr CTensor -> Ptr CTensor -> CLLong -> CBool -> IO ()
c_ClassNLLCriterion_updateGradInput :: Ptr CNNState -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CTensor -> Ptr CTensor -> CBool -> Ptr CTensor -> Ptr CTensor -> CLLong -> CBool -> IO ()
c_SpatialClassNLLCriterion_updateOutput :: Ptr CNNState -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CTensor -> CBool -> Ptr CTensor -> Ptr CTensor -> CLLong -> CBool -> IO ()
c_SpatialClassNLLCriterion_updateGradInput :: Ptr CNNState -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CTensor -> Ptr CTensor -> CBool -> Ptr CTensor -> Ptr CTensor -> CLLong -> CBool -> IO ()
c_MultiLabelMarginCriterion_updateOutput :: Ptr CNNState -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CTensor -> Ptr CTensor -> CBool -> CBool -> IO ()
c_MultiLabelMarginCriterion_updateGradInput :: Ptr CNNState -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CTensor -> Ptr CTensor -> Ptr CTensor -> CBool -> CBool -> IO ()
c_MultiMarginCriterion_updateOutput :: Ptr CNNState -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CTensor -> CBool -> CInt -> Ptr CTensor -> CDouble -> CBool -> IO ()
c_MultiMarginCriterion_updateGradInput :: Ptr CNNState -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CTensor -> Ptr CTensor -> CBool -> CInt -> Ptr CTensor -> CDouble -> CBool -> IO ()
-}

{-
c_LookupTable_renorm :: Ptr CNNState -> Ptr CIndexTensor -> Ptr CTensor -> CDouble -> CDouble -> IO ()
c_IndexLinear_updateOutput :: Ptr CNNState -> Ptr CIndexTensor -> CLLong -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CIndexTensor -> Ptr CTensor -> Ptr CTensor -> Ptr CTensor -> Ptr CTensor -> CInt -> IO ()
c_IndexLinear_accGradParameters :: Ptr CNNState -> Ptr CIndexTensor -> CLLong -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CIndexTensor -> Ptr CTensor -> Ptr CTensor -> Ptr CTensor -> Ptr CTensor -> Ptr CTensor -> Ptr CTensor -> CDouble -> CDouble -> IO ()
c_IndexLinear_accUpdateGradParameters :: Ptr CNNState -> Ptr CIndexTensor -> CLLong -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CIndexTensor -> Ptr CTensor -> Ptr CTensor -> Ptr CTensor -> CDouble -> CDouble -> IO ()
c_IndexLinear_updateParameters :: Ptr CNNState -> Ptr CTensor -> Ptr CTensor -> Ptr CTensor -> Ptr CTensor -> Ptr CIndexTensor -> Ptr CIndexTensor -> CLLong -> CDouble -> CDouble -> IO ()

-}
