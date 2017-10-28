import Control.Monad.State
import Futhark.Internalise
import Language.Futhark.TypeChecker
import Language.Futhark.Parser
import qualified Data.Text.IO as T
import Futhark.FreshNames
import Futhark.Representation.SOACS

testit :: FilePath -> IO ()
testit fpath = do
  Right x <- parseFuthark fpath <$> T.readFile fpath
  let Right (fmod, _, src) = checkProg False mempty blankNameSource fpath x
      Right prog = evalState (internaliseProg $ fileProg fmod) src
  putStrLn $ pretty prog
