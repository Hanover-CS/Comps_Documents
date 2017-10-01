import Data.Char (isNumber)
import System.FilePath
import Text.Pandoc.Definition
import Text.Pandoc.Walk
import Text.Pandoc.JSON

changeLinkInline :: Inline -> Inline
changeLinkInline (Str "ANSWERSPACE") = Space
changeLinkInline (Link attr xs (t, n)) = Link attr xs (fixLink t, fixLink n)
changeLinkInline x = x

isMarkdown :: String -> Bool
isMarkdown = (== ".md") . takeExtension

fixLink :: String -> String
fixLink s | isMarkdown s = replaceExtension s "html"
          | otherwise    = s

changeLinks :: Pandoc -> Pandoc
changeLinks = walk changeLinkInline

makeLink :: String -> Inline
makeLink num   = Span attrs link
   where attrs = ("", ["small"], [])
         link  = [Space, Str "(", Link attrs [Str "pdf"] (num ++ ".pdf", num), Str ")"]

addLink :: [Inline] -> [Inline]
addLink [Str num] | all isNumber num = [Str num, makeLink num]
                  | otherwise        = [Str num]
addLink (x : xs) = x : addLink xs
addLink [] = []

makePDFLink :: Block -> Block
makePDFLink (Header 1 attrs xs) = Header 1 attrs $ addLink xs
makePDFLink x = x

main :: IO ()
main = toJSONFilter changeLinks
