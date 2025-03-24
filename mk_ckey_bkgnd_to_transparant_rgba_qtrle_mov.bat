:: Batch File to convert video with Chromakey to RGBA wth transparent Alpha Channel

:: Define Source and Output
set "OVERLAY=D:\Images\Snipes\TEST_Nosey_Roku_Snipe_Jerry_Best.mov"
set OUTDIR=D:\Temp\Output

:: Define configs for each channel used in geq filter
:: https://ffmpeg.org/ffmpeg-filters.html#geq
:: Set saturated Green Pixels to Black with transparent Alpha, pass Red, Blue and non-saturated Green pixels as-is
set "RED=r='r(X,Y)'"
set "GREEN=g='if(lte(r(X,Y),5)*gte(g(X,Y),250)*lte(b(X,Y),5),0,g(X,Y)')"
set "BLUE=b='b(X,Y)'"
set "ALPHA=a='if(lte(r(X,Y),5)*gte(g(X,Y),250)*lte(b(X,Y),5),0,255)'"

:: Invoke ffmpeg to create Quicktime Run Length Encoded output with Alpha Channel
ffmpeg  -loglevel info -hide_banner -i %OVERLAY% -y ^
 -filter_complex "[0]format=rgba,geq=interpolation=nearest:%RED%:%GREEN%:%BLUE%:%ALPHA%[rgba]" ^
 -map 0:a -map [rgba] ^
 -c:v qtrle ^
 %OUTDIR%\rgba.mov

pause