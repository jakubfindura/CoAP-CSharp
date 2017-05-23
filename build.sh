#!/bin/bash
set -ev

nuget restore $SLN -Verbosity=detailed

msbuild /p:Configuration=$VERSION $SLN

mono ./testrunner/NUnit.ConsoleRunner.3.5.0/tools/nunit3-console.exe ./CoAP.Test/bin/$VERSION/$TARGET/CoAP.Test.dll
