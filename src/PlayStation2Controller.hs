{-# LANGUAGE PatternSynonyms #-}

module PlayStation2Controller
  ( Button
    ( AnalogLeft
    , AnalogRight
    , Button
    , Circle
    , Cross
    , Down
    , L1
    , L2
    , Left
    , R1
    , R2
    , Right
    , Select
    , Square
    , Start
    , Triangle
    , Up
    )
  ) where

import           Data.Ord                       ( )
import           Data.Word                      ( Word8 )
import           Prelude                 hiding ( Left
                                                , Right
                                                )

newtype Button = Button Word8
  deriving (Bounded, Eq, Ord, Read)

pattern Triangle :: Button
pattern Triangle = Button 0

pattern Circle :: Button
pattern Circle = Button 1

pattern Cross :: Button
pattern Cross = Button 2

pattern Square :: Button
pattern Square = Button 3

pattern L2 :: Button
pattern L2 = Button 4

pattern R2 :: Button
pattern R2 = Button 5

pattern L1 :: Button
pattern L1 = Button 6

pattern R1 :: Button
pattern R1 = Button 7

pattern Start :: Button
pattern Start = Button 8

pattern Select :: Button
pattern Select = Button 9

pattern AnalogLeft :: Button
pattern AnalogLeft = Button 10

pattern AnalogRight :: Button
pattern AnalogRight = Button 11

pattern Up :: Button
pattern Up = Button 12

pattern Right :: Button
pattern Right = Button 13

pattern Down :: Button
pattern Down = Button 14

pattern Left :: Button
pattern Left = Button 15

instance Show Button where
  show Triangle    = "Triangle"
  show Circle      = "Circle"
  show Cross       = "Cross"
  show Square      = "Square"
  show L2          = "L2"
  show R2          = "R2"
  show L1          = "L1"
  show R1          = "R1"
  show Start       = "Start"
  show Select      = "Select"
  show AnalogLeft  = "AnalogLeft"
  show AnalogRight = "AnalogRight"
  show Up          = "Up"
  show Right       = "Right"
  show Down        = "Down"
  show Left        = "Left"
  show (Button n)  = "Button " ++ show n
