{-# LANGUAGE
    OverloadedStrings
  #-}
{-|
Module      : PLLabel
Copyright   : (c) Samuel A. Yallop, 2018
Maintainer  : syallop@gmail.com
Stability   : experimental

Labels are either `Descriptive`, in which case they fully describe the thing they label,
or they are `Enhancing`, in which case they enhance but do not replace somethings description.

This library currently only defines this very small type.

TODO:
  - Label arbitrary types by typeclass/ generics/ recursion schemes/ other.
  - Export functions for manipulating labels, primarily 'describe' which chains
  - together enhancing labels until the first descriptive label.
-}
module PLLabel
  ( Label (..)
  , LabelUse (..)
  , descriptiveLabel
  , enhancingLabel
  )
  where

import Data.Text
import PLPrinter

-- | A Label is some textual description of what a Parser expected at a point.
-- The LabelUse dictates whether the label is intended to be descriptive of the
-- entire Parse past this point or is used to enhance existing labels and Parser
-- descriptions.
--
-- When describing why a Parser failed, in general descriptions should stop at
-- the first Descriptive Label and otherwise chain Enhancing labels together.
-- For debugging purposes, one might still want to see all Labels regardless of
-- type.
data Label = Label
  { _labelText :: Text
  , _labelUse  :: LabelUse
  }
  deriving (Show, Eq, Ord)

-- | A descriptive label fully describes a thing. Further nested labels can be
-- ignored.
descriptiveLabel
  :: Text
  -> Label
descriptiveLabel
  txt = Label txt Descriptive

-- | An enhancing label adds information to a descriptive label.
enhancingLabel
  :: Text
  -> Label
enhancingLabel
  txt = Label txt Enhancing

data LabelUse
  = Descriptive
  | Enhancing
  deriving (Show, Eq, Ord)

instance Document Label where
  document (Label txt _) = text txt

