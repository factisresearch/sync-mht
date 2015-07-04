import Control.Monad
import Data.List
import System.Environment
import System.IO

main :: IO ()
main =
    do gitCommitHash <- getEnv "GIT_COMMIT_HASH"
       gitDescribe <- getEnv "GIT_DESCRIBE"
       synopsisSection <- getSection "Synopsis"
       descriptionSection <- getSection "Description"
       let me = "Emin Karayel <me@eminkarayel.de>"
           packageUrl = "https://github.com/ekarayel/sync-mht"
       writeFile "sync-mht.cabal" $ unlines $
           [ "-- This .cabal file was generated by src/build/hs/CabalTemplate.hs"
           , "name: sync-mht"
           , "version: " ++ gitDescribe
           , "synopsis: "
           ] ++ synopsisSection ++
           [ "description: "
           ] ++ descriptionSection ++
           [ "license: MIT"
           , "license-file: LICENSE"
           , "author: " ++ me
           , "maintainer: " ++ me
           , "package-url: " ++ packageUrl
           , "category: Utility"
           , "build-type: Simple"
           , "cabal-version: >=1.10"
           , "source-repository head"
           , "    type: git"
           , "    location: " ++ packageUrl
           , "source-repository this"
           , "    type: git"
           , "    tag: " ++ gitCommitHash
           , "    location: " ++ packageUrl
           , "executable sync-mht"
           , "    main-is: Main.hs"
           , "    other-extensions: FlexibleInstances, StandaloneDeriving"
           , "    ghc-options: -Wall"
           , "    build-depends: "
           , "        base >=4.7 && <4.8"
           , "        , unix >=2.7 && <2.8"
           , "        , directory >=1.2 && <1.3"
           , "        , filepath >=1.3 && <1.4"
           , "        , process >=1.2 && <1.3"
           , "        , cryptohash >=0.11 && <0.12"
           , "        , byteable >=0.1 && <0.2"
           , "        , array >=0.5 && <0.6"
           , "        , containers >=0.5 && <0.6"
           , "        , text >=1.2 && <1.3"
           , "        , bytestring >=0.10 && <0.11"
           , "        , base64-bytestring >=1.0 && <1.1"
           , "        , base16-bytestring >=0.1 && <0.2"
           , "        , cereal >= 0.4"
           , "        , io-streams"
           , "        , transformers"
           , "    hs-source-dirs: src/main/hs"
           , "    default-language: Haskell2010"
           ]

getSection :: String -> IO [String]
getSection name =
    liftM
       ( map ("   " ++)
       . takeWhile (not . ("#" `isPrefixOf`))
       . drop 1
       . dropWhile (/= ("## " ++ name))
       . lines
       ) $ readFile "README.md"

