module Cheat where 

import Data.Text (Text)
import Control.Monad (void)
import Data.List (intercalate)
import Data.Void
import Text.Megaparsec
import Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer as L 
import System.Environment 
        
    
-- Day 1
main :: IO () 
main = do 
    input <- readFile "Input.txt"
    let (Right xs) = runParser program "" input
        output = intercalate "\n" . map show . reverse $ xs
    writeFile "Input.f" output
    print xs
    putStrLn output



-- Parser
type Parser = Parsec Void String
        
sc :: Parser ()
sc = L.space space1 empty empty
    
lexeme :: Parser a -> Parser a
lexeme = L.lexeme sc
        
integer :: Parser Integer
integer = lexeme L.decimal
    
program :: Parser [Integer]
program = integer `sepBy` char ','
    