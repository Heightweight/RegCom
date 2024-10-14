module Lib where

tokens :: [String]
tokens = ["add", "del", "clear", "copy", "jump", "continue", "new", "show", "dump"]

type Name = String
type Content = String

data Reg = Reg Name Content 
type Label = Maybe String  

data Command = Add Char Reg 
    | Del Reg
    | Clear Reg
    | Copy Reg Reg
    | Jump Label
    | JumpIf Reg Char Label
    | New Name Content 
    | Continue deriving(Show)

newtype Program = Program [(Label, Command)]

instance Show Reg where
    show (Reg name content) = name ++ ":" ++ content

newReg :: String -> String -> Reg 
newReg name content = Reg name content

r :: Reg
r = newReg "R" "1111"

someFunc :: IO ()
someFunc = putStrLn . show $ r 
