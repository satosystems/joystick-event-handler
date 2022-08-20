{-# LANGUAGE PatternSynonyms #-}

module Lib
  ( start
  ) where

import           Control.Monad                  ( forever )
import           Data.Ord                       ( )
import qualified Graphics.UI.SDL.Events        as SE
import qualified Graphics.UI.SDL.General       as SG
import qualified Graphics.UI.SDL.Joystick      as SJ
import qualified Graphics.UI.SDL.Types         as ST
import qualified Graphics.UI.SDL.Video         as SV
import           System.Exit                    ( exitSuccess )

import qualified PlayStation2Controller        as PS2

start :: IO ()
start = SG.withInit [SG.InitVideo, SG.InitJoystick] $ do
  numJoysticks <- SJ.countAvailable
  putStrLn $ show numJoysticks ++ " joystick(s) available"
  js <- SJ.open 0

  _  <- SV.setVideoMode 320 240 24 [ST.SWSurface, ST.Resizable]

  _  <- forever $ do
    event <- SE.waitEvent
    case event of
      SE.JoyButtonDown dev button -> do
        let ps2Button = PS2.Button button
        print
          $  "Button pressed: "
          ++ show dev
          ++ " "
          ++ show button
          ++ " "
          ++ show ps2Button

      SE.Quit -> do
        SJ.close js
        exitSuccess

      _ -> return ()

  return ()
