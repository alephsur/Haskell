{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_robot_simulator (
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
version = Version [3,2,0,8] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/alephsur/Documentos/Exercisim/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/bin"
libdir     = "/home/alephsur/Documentos/Exercisim/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/lib/x86_64-linux-ghc-9.0.2/robot-simulator-3.2.0.8-LMmXxrY0BMa2zjZSxSHJio-test"
dynlibdir  = "/home/alephsur/Documentos/Exercisim/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/alephsur/Documentos/Exercisim/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/share/x86_64-linux-ghc-9.0.2/robot-simulator-3.2.0.8"
libexecdir = "/home/alephsur/Documentos/Exercisim/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/libexec/x86_64-linux-ghc-9.0.2/robot-simulator-3.2.0.8"
sysconfdir = "/home/alephsur/Documentos/Exercisim/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/ac82ef71377822d60cdb5dccdc21e6ebc4f3a1466f7d189644bdbda56da2f6df/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "robot_simulator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "robot_simulator_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "robot_simulator_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "robot_simulator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "robot_simulator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "robot_simulator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)