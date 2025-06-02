@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem
@rem SPDX-License-Identifier: Apache-2.0
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  eHKT-frontend startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and E_HKT_FRONTEND_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\jsr305-3.0.2.jar
set MODULE_PATH=%APP_HOME%\lib\eHKT-frontend-0.0.1-SNAPSHOT.jar;%APP_HOME%\lib\de.gematik.smartcards.net-0.1.7-SNAPSHOT.jar;%APP_HOME%\lib\de.gematik.smartcards.sicct-0.2.5-SNAPSHOT.jar;%APP_HOME%\lib\guava-annotations-r03-module.jar;%APP_HOME%\lib\de.gematik.smartcards.g2icc-0.3.5.jar;%APP_HOME%\lib\de.gematik.smartcards.pcsc-0.4.4.jar;%APP_HOME%\lib\de.gematik.smartcards.sdcom-0.5.4.jar;%APP_HOME%\lib\de.gematik.smartcards.crypto-0.6.4.jar;%APP_HOME%\lib\de.gematik.smartcards.tlv-0.7.4.jar;%APP_HOME%\lib\de.gematik.smartcards.utils-0.8.4.jar;%APP_HOME%\lib\spotbugs-annotations-4.9.3.jar;%APP_HOME%\lib\logback-classic-1.5.18.jar;%APP_HOME%\lib\slf4j-api-2.0.17.jar;%APP_HOME%\lib\logback-core-1.5.18.jar;%APP_HOME%\lib\jna-5.17.0.jar

@rem Execute eHKT-frontend
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %E_HKT_FRONTEND_OPTS%  -classpath "%CLASSPATH%" --module-path "%MODULE_PATH%" --module de.gematik.smartcards.ehkt.frontend/de.gematik.smartcards.ehkt.frontend.Gui %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable E_HKT_FRONTEND_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%E_HKT_FRONTEND_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
