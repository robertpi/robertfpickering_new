set commit_message=%1
IF [%1] == [] (
    set commit_message="something new"
)

echo %commit_message%

'C:\Program Files\hugo_extended_0.113.0_windows-amd64\hugo.exe' -b https://www.robertfpickering.me -d ..\robertfpickering.github.io

IF NOT %ERRORLEVEL == 0 (
    EXIT /B  42
)

git add .
git commit -m %commit_message%
git push origin master

pushd ..\robertfpickering.github.io
git add .
git commit -m %commit_message%
git push origin master
popd