{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_bob (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,4,0,10] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/alephsur/Documentos/Exercisim/haskell/bob/.stack-work/install/x86_64-linux-tinfo6/cb65c9e9a942a4dc42b82250be4e3f767e718bbf649aa2ba9613265a07511f43/8.8.4/bin"
libdir     = "/home/alephsur/Documentos/Exercisim/haskell/bob/.stack-work/install/x86_64-linux-tinfo6/cb65c9e9a942a4dc42b82250be4e3f767e718bbf649aa2ba9613265a07511f43/8.8.4/lib/x86_64-linux-ghc-8.8.4/bob-1.4.0.10-1CRHvkJtFOR8704CLkOmgx-test"
dynlibdir  = "/home/alephsur/Documentos/Exercisim/haskell/bob/.stack-work/install/x86_64-linux-tinfo6/cb65c9e9a942a4dc42b82250be4e3f767e718bbf649aa2ba9613265a07511f43/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/alephsur/Documentos/Exercisim/haskell/bob/.stack-work/install/x86_64-linux-tinfo6/cb65c9e9a942a4dc42b82250be4e3f767e718bbf649aa2ba9613265a07511f43/8.8.4/share/x86_64-linux-ghc-8.8.4/bob-1.4.0.10"
libexecdir = "/home/alephsur/Documentos/Exercisim/haskell/bob/.stack-work/install/x86_64-linux-tinfo6/cb65c9e9a942a4dc42b82250be4e3f767e718bbf649aa2ba9613265a07511f43/8.8.4/libexec/x86_64-linux-ghc-8.8.4/bob-1.4.0.10"
sysconfdir = "/home/alephsur/Documentos/Exercisim/haskell/bob/.stack-work/install/x86_64-linux-tinfo6/cb65c9e9a942a4dc42b82250be4e3f767e718bbf649aa2ba9613265a07511f43/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bob_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bob_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "bob_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "bob_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bob_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bob_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
