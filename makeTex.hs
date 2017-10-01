import System.FilePath
import Text.Pandoc.Definition
import Text.Pandoc.Walk
import Text.Pandoc.JSON

fixAnswer :: Inline -> Inline
fixAnswer (Str "ANSWERSPACE") = RawInline (Format "latex") "\\makespace"
fixAnswer (Link attr xs (t, n)) = Link attr xs (fixLink t, fixLink n)
fixAnswer x = x

isMarkdown :: String -> Bool
isMarkdown = (== ".md") . takeExtension

fixLink :: String -> String
fixLink s | isMarkdown s = replaceExtension s "html"
          | otherwise    = s

fixAnswers :: Pandoc -> Pandoc
fixAnswers = walk fixAnswer

main :: IO ()
main = toJSONFilter fixAnswers
