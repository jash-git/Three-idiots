set input=input.mp4
set segment_time=80
set output_prefix=output
set counter=0
set name=0

:loop
ffmpeg -i %input% -ss %counter% -t %segment_time% -vcodec copy -acodec copy %output_prefix%%name%.mp4
set /a counter+=%segment_time%
set /a name+=1

ffmpeg -i %input% -ss %counter% -t 1 -vcodec copy -acodec copy -f null - 2>nul
if %errorlevel% neq 0 goto end
goto loop

:end

pause