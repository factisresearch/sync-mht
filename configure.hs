#!/usr/bin/env runhaskell
import Configure.Helper
import System.FilePath

main :: IO ()
main =
    do let name = "sync-mht"
           buildDepends =
               [ "    build-depends: "
               , "        base >=4.7 && <4.8"
               , "        , unix >=2.7 && <2.8"
               , "        , directory >=1.2.3 && <1.3"
               , "        , filepath >=1.3 && <1.4"
               , "        , process == 1.2.3.0"
               , "        , cryptohash >=0.11 && <0.12"
               , "        , exceptions >=0.7 && <0.8"
               , "        , byteable >=0.1 && <0.2"
               , "        , array >=0.5 && <0.6"
               , "        , containers >=0.5 && <0.6"
               , "        , text >=1.1 && <1.2"
               , "        , bytestring >=0.10 && <0.11"
               , "        , base16-bytestring >=0.1 && <0.2"
               , "        , cereal >= 0.4 && < 0.5"
               , "        , io-streams >= 1.2 && <1.3"
               , "        , transformers >= 0.3 && < 0.4"
               , "        , regex-compat >= 0.95 && < 0.96"
               , "        , mtl >= 2.1 && < 2.2"
               , "        , zlib >= 0.6 && < 0.7"
               , "        , time >= 1.4 && < 1.5"
               , "        , random >= 1.0 && < 1.1"
               , "        , HUnit >= 1.2 && < 1.3"
               , "        , temporary >= 1.2 && < 1.3"
               ]
       gitHubDescription <- gitHubProject $ "https://github.com/ekarayel/" ++ name
       writeFile (name <.> "cabal") $ unlines $
           [ "-- This .cabal file was generated by configure.hs"
           , "name: " ++ name
           ] ++ mitLicense
           ++ authorAndMaintainer "Emin Karayel <me@eminkarayel.de>" ++
           [ "category: Utility"
           , "extra-doc-files: " ++ "README.md"
           , "cabal-version: >= 1.22"
           , "build-type: Simple"
           ] ++ gitHubDescription ++
           [ "test-suite main"
           , "    type: exitcode-stdio-1.0"
           , "    main-is: Test.hs"
           , "    other-modules:"
           , "        Sync.MerkleTree.Analyse"
           , "        Sync.MerkleTree.Client"
           , "        Sync.MerkleTree.CommTypes"
           , "        Sync.MerkleTree.Server"
           , "        Sync.MerkleTree.Sync"
           , "        Sync.MerkleTree.Run"
           , "        Sync.MerkleTree.Trie"
           , "        Sync.MerkleTree.Test"
           , "        Sync.MerkleTree.Types"
           , "        Sync.MerkleTree.Util.RequestMonad"
           ] ++ buildDepends ++
           [ "    hs-source-dirs: src"
           , "    default-language: Haskell2010"
           , "executable sync-mht"
           , "    main-is: Main.hs"
           , "    other-modules:"
           , "        Sync.MerkleTree.Analyse"
           , "        Sync.MerkleTree.Client"
           , "        Sync.MerkleTree.CommTypes"
           , "        Sync.MerkleTree.Server"
           , "        Sync.MerkleTree.Sync"
           , "        Sync.MerkleTree.Run"
           , "        Sync.MerkleTree.Trie"
           , "        Sync.MerkleTree.Types"
           , "        Sync.MerkleTree.Util.RequestMonad"
           , "    ghc-options: -Wall"
           ] ++ buildDepends ++
           [ "    hs-source-dirs: src"
           , "    default-language: Haskell2010"
           , "library"
           , "    exposed-modules:"
           , "        Sync.MerkleTree.Analyse"
           , "        Sync.MerkleTree.Client"
           , "        Sync.MerkleTree.CommTypes"
           , "        Sync.MerkleTree.Server"
           , "        Sync.MerkleTree.Sync"
           , "        Sync.MerkleTree.Run"
           , "        Sync.MerkleTree.Trie"
           , "        Sync.MerkleTree.Types"
           , "        Sync.MerkleTree.Util.RequestMonad"
           , "    ghc-options: -Wall"
           ] ++ buildDepends ++
           [ "    hs-source-dirs: src"
           , "    default-language: Haskell2010"
           ]
