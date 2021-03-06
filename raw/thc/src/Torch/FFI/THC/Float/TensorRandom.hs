{-# LANGUAGE ForeignFunctionInterface #-}
module Torch.FFI.THC.Float.TensorRandom where

import Foreign
import Foreign.C.Types
import Data.Word
import Data.Int
import Torch.Types.TH
import Torch.Types.THC

-- | c_uniform :  state self a b -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_uniform"
  c_uniform :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> CDouble -> IO ()

-- | c_rand :  state r_ size -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_rand"
  c_rand :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THLongStorage -> IO ()

-- | c_randn :  state r_ size -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_randn"
  c_randn :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THLongStorage -> IO ()

-- | c_normal :  state self mean stdv -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_normal"
  c_normal :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> CDouble -> IO ()

-- | c_normal_means :  state self means stddev -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_normal_means"
  c_normal_means :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CDouble -> IO ()

-- | c_normal_stddevs :  state self mean stddevs -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_normal_stddevs"
  c_normal_stddevs :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> Ptr C'THCudaFloatTensor -> IO ()

-- | c_normal_means_stddevs :  state self means stddevs -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_normal_means_stddevs"
  c_normal_means_stddevs :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> IO ()

-- | c_logNormal :  state self mean stdv -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_logNormal"
  c_logNormal :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> CDouble -> IO ()

-- | c_exponential :  state self lambda -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_exponential"
  c_exponential :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> IO ()

-- | c_cauchy :  state self median sigma -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_cauchy"
  c_cauchy :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> CDouble -> IO ()

-- | c_multinomial :  state self prob_dist n_sample with_replacement -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_multinomial"
  c_multinomial :: Ptr C'THCState -> Ptr C'THCudaLongTensor -> Ptr C'THCudaFloatTensor -> CInt -> CInt -> IO ()

-- | c_multinomialAliasSetup :  state probs J q -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_multinomialAliasSetup"
  c_multinomialAliasSetup :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaLongTensor -> Ptr C'THCudaFloatTensor -> IO ()

-- | c_multinomialAliasDraw :  state self _J _q -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_multinomialAliasDraw"
  c_multinomialAliasDraw :: Ptr C'THCState -> Ptr C'THCudaLongTensor -> Ptr C'THCudaLongTensor -> Ptr C'THCudaFloatTensor -> IO ()

-- | c_random :  state self -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_random"
  c_random :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> IO ()

-- | c_clampedRandom :  state self min max -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_clampedRandom"
  c_clampedRandom :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CLLong -> CLLong -> IO ()

-- | c_cappedRandom :  state self max -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_cappedRandom"
  c_cappedRandom :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CLLong -> IO ()

-- | c_bernoulli :  state self p -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_bernoulli"
  c_bernoulli :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> IO ()

-- | c_bernoulli_DoubleTensor :  state self p -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_bernoulli_DoubleTensor"
  c_bernoulli_DoubleTensor :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaDoubleTensor -> IO ()

-- | c_geometric :  state self p -> void
foreign import ccall "THCTensorRandom.h THCudaFloatTensor_geometric"
  c_geometric :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> IO ()

-- | p_uniform : Pointer to function : state self a b -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_uniform"
  p_uniform :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> CDouble -> IO ())

-- | p_rand : Pointer to function : state r_ size -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_rand"
  p_rand :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THLongStorage -> IO ())

-- | p_randn : Pointer to function : state r_ size -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_randn"
  p_randn :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THLongStorage -> IO ())

-- | p_normal : Pointer to function : state self mean stdv -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_normal"
  p_normal :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> CDouble -> IO ())

-- | p_normal_means : Pointer to function : state self means stddev -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_normal_means"
  p_normal_means :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CDouble -> IO ())

-- | p_normal_stddevs : Pointer to function : state self mean stddevs -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_normal_stddevs"
  p_normal_stddevs :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> Ptr C'THCudaFloatTensor -> IO ())

-- | p_normal_means_stddevs : Pointer to function : state self means stddevs -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_normal_means_stddevs"
  p_normal_means_stddevs :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> IO ())

-- | p_logNormal : Pointer to function : state self mean stdv -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_logNormal"
  p_logNormal :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> CDouble -> IO ())

-- | p_exponential : Pointer to function : state self lambda -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_exponential"
  p_exponential :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> IO ())

-- | p_cauchy : Pointer to function : state self median sigma -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_cauchy"
  p_cauchy :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> CDouble -> IO ())

-- | p_multinomial : Pointer to function : state self prob_dist n_sample with_replacement -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_multinomial"
  p_multinomial :: FunPtr (Ptr C'THCState -> Ptr C'THCudaLongTensor -> Ptr C'THCudaFloatTensor -> CInt -> CInt -> IO ())

-- | p_multinomialAliasSetup : Pointer to function : state probs J q -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_multinomialAliasSetup"
  p_multinomialAliasSetup :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaLongTensor -> Ptr C'THCudaFloatTensor -> IO ())

-- | p_multinomialAliasDraw : Pointer to function : state self _J _q -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_multinomialAliasDraw"
  p_multinomialAliasDraw :: FunPtr (Ptr C'THCState -> Ptr C'THCudaLongTensor -> Ptr C'THCudaLongTensor -> Ptr C'THCudaFloatTensor -> IO ())

-- | p_random : Pointer to function : state self -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_random"
  p_random :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> IO ())

-- | p_clampedRandom : Pointer to function : state self min max -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_clampedRandom"
  p_clampedRandom :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CLLong -> CLLong -> IO ())

-- | p_cappedRandom : Pointer to function : state self max -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_cappedRandom"
  p_cappedRandom :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CLLong -> IO ())

-- | p_bernoulli : Pointer to function : state self p -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_bernoulli"
  p_bernoulli :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> IO ())

-- | p_bernoulli_DoubleTensor : Pointer to function : state self p -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_bernoulli_DoubleTensor"
  p_bernoulli_DoubleTensor :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaDoubleTensor -> IO ())

-- | p_geometric : Pointer to function : state self p -> void
foreign import ccall "THCTensorRandom.h &THCudaFloatTensor_geometric"
  p_geometric :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> CDouble -> IO ())