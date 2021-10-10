
-- https://wiki.haskell.org/WxHaskell/Quick_start
-- boxSizer: https://stackoverflow.com/questions/15001883/wxhaskell-initial-frame-size-too-small
-- http://www.gernot-heiser.org/~cs4132/lecture/wlta543.pdf
-- https://zims-en.kiwix.campusafrica.gos.orange.com/wikibooks_en_all_maxi/A/Haskell/GUI
-- Minimal example: https://gist.github.com/HeinrichApfelmus/1278515

-- cabal repl
-- :l app/Main.hs

module Main where

import Graphics.UI.WX
-- import Graphics.UI.WXCore

import qualified MyLib (someFunc)

main :: IO ()
main = do
  -- start initializes the GUI framework with the provided argument
  -- and starts the window event loop until the application quits or
  -- when all top-level windows are closed.
  start hello

hello :: IO ()
hello
  = do f    <- frame    [text := "Hello!"]
       quit <- button f [text := "Quit", on command := close f]
       set f [layout := margin 10 (column 5 [floatCentre (label "Hello")
                                            ,floatCentre (widget quit)
                                            ] )]

-- frame  ::             [Prop (Frame ())] -> IO (Frame ())
-- button :: Window a -> [Prop (Button ())] -> IO (Button ())
--
-- text   :: Attr (Window a) String
-- layout :: Attr (Frame a)  Layout
--
-- (:=)   :: Attr w a -> a -> Prop w
-- set    :: w -> [Prop w] -> IO ()
--
-- command:: Event (Control a) (IO ())
-- on     :: Event w a -> Attr w a
--
-- widget :: Window a -> Layout
